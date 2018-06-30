# load image support
using FileIO, Images

# load our julia function
include("julia.jl")

# create a 1000x500 Array for our picture
h = 800
w = 1600
plane = Array{Complex{Float64}}(h, w)
maxiteration = 255

palette = diverging_palette(200.0, 30.0, maxiteration + 1, mid = 0.3)[1:maxiteration]

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

# for every pixel calcuate the complex number it represents
for y = 1:h
    # translate numbers indexes -> -2:2 + -1:1 im
    plane[y, :] = linspace(complex(-w/h, (y-h/2)/(h/2)), complex(w/h, (y-h/2)/(h/2)), w)
end

# create an image from the plane
img = map(c -> colour_from_palette(palette, julia(c, maxiteration)), plane)

tStop = time()

save("image.png", img)

print("done. took ", tStop - tStart, " seconds\n");
