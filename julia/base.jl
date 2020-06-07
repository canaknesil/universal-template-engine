function print_hex_string(hexstr)
    len = length(hexstr)
    @assert(len % 2 == 0)
    for i in 0:floor(Int, len/2)-1
        print(Char(parse(Int, hexstr[2*i+1:2*i+2], base=16)))
    end
end
