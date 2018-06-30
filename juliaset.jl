# load image support
include("myimage.jl")

# load our julia function
include("julia.jl")
  
# create a 1000x500 Array for our picture
h = 500
w = 1000
m = Array(Int64, h, w)
  
# time measurements
print("starting...\n")
tStart=time()
  
# for every pixel
for y=1:h, x=1:w
    # translate numbers [1:w, 1:h] -> -2:2 + -1:1 im
    c = complex((x-w/2)/(h/2), (y-h/2)/(h/2))
    # call our julia function
    m[y,x] = julia(c, 256)
end
  
tStop = time()
  
# write the ppm-file
myppmwrite(m, "julia.ppm")
  
print("done. took ", tStop-tStart, " seconds\n");
