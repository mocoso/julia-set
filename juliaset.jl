# load image support
using FileIO, Images

# load our julia function
include("julia.jl")

# create a 1000x500 Array for our picture
h = 800
w = 1600
img = Array{RGB}(h, w)
maxiteration = 255

palette = diverging_palette(200.0, 30.0, maxiteration + 1, mid=0.3)[1:maxiteration]

function colour_from_palette(palette, n)
    if n == maxiteration
        RGB(0,0,0)
    else
        palette[n + 1]
    end
end

# time measurements
print("starting...\n")
tStart=time()

# for every pixel
for y=1:h, x=1:w
    # translate numbers [1:w, 1:h] -> -2:2 + -1:1 im
    c = complex((x-w/2)/(h/2), (y-h/2)/(h/2))
    # call our julia function
    iterations = UInt8(julia(c, maxiteration))
    # translate to a colour
    img[y,x] = colour_from_palette(palette, iterations)
end

tStop = time()

save("image.png", img)

print("done. took ", tStop-tStart, " seconds\n");
