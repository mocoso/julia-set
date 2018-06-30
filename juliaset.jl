# load image support
using FileIO, Images

# load our julia function
include("julia.jl")

# create a 1000x500 Array for our picture
h = 800
w = 1600
m = Array{Float64,2}(h, w)
maxiteration = 256

# time measurements
print("starting...\n")
tStart=time()

# for every pixel
for y=1:h, x=1:w
    # translate numbers [1:w, 1:h] -> -2:2 + -1:1 im
    c = complex((x-w/2)/(h/2), (y-h/2)/(h/2))
    # call our julia function
    m[y,x] = julia(c, maxiteration) / maxiteration
end

tStop = time()

save("image.png", m)

print("done. took ", tStop-tStart, " seconds\n");
