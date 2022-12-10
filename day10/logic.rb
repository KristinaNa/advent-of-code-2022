file = File.open("input.rb")
file_data = file.readlines.map(&:chomp)

def build_arr
    arr = []
    x = 20
    end_loop = 100000

    while x < end_loop
        arr.push(x)

        x += 40
    end

    arr
end

def check_cycle(arr, cycles_count, x)
    if arr.include? cycles_count
        cycles_count * x
    end
end

x = 1
cycles_count = 0
signal_strength_sum = 0

arr = build_arr()

for operation in file_data do
    if operation == 'noop'
        cycles_count += 1
        signal = check_cycle(arr, cycles_count, x)
        signal_strength_sum += signal ? signal : 0
    else
        value = operation.match(/-?\d+/)[0].to_i

        cycles_count += 1

        signal = check_cycle(arr, cycles_count, x)
        signal_strength_sum += signal ? signal : 0

        cycles_count += 1
        signal = check_cycle(arr, cycles_count, x)
        signal_strength_sum += signal ? signal : 0
        
        x += value
    end
end

p "Signal strength sum: #{signal_strength_sum}"