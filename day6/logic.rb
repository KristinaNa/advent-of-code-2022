file = File.open("input.rb").readlines
buffer = file.map(&:chomp)[0].split('')

min = 4 # 14 for second star
result = 0

def build_arr(buffer, i, count)
    result = []

    count.times { |k| result.push(buffer[i-k]) }

    result
end

buffer.each_with_index do |char, i|
    arr = []

    if i < 3
        next
    end

    marker_to_check = build_arr(buffer, i, min)

    if marker_to_check.uniq.length == marker_to_check.length
        result = i+1
        break
    end
end

p result