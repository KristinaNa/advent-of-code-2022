file = File.open("input.rb")
file_data = file.readlines.map(&:chomp)

# p file_data

def build_sprite(x)
    str = "." * 40
    str[x-1] = '#'
    str[x] = '#'
    str[x+1] = '#'

    str
end

def build_crt(x, cycle)
    sprite = build_sprite(x)

    if cycle < 40
        return sprite[cycle]
    else
        index = cycle % 40

        return sprite[index]
    end
end

cycles_count = 0
x = 1

final_string = ""

for operation in file_data do
    final_string += build_crt(x, cycles_count)

    if operation == 'noop'
        cycles_count += 1
    else
        value = operation.match(/-?\d+/)[0].to_i

        cycles_count += 1

        final_string += build_crt(x, cycles_count)

        cycles_count += 1
        x += value
    end
end

puts final_string.chars.each_slice(40).map(&:join)