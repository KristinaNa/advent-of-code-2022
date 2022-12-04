file = File.open("input.rb")
file_data = file.readlines.map(&:chomp)
file_data = file_data.map{|row| row.split(",")}

counter1 = 0
counter2 = 0

for sections in file_data do
    elf1 = sections[0].split('-')
    elf2 = sections[1].split('-')

    arr1 =*(elf1[0].to_i..elf1[1].to_i)
    arr2 =*(elf2[0].to_i..elf2[1].to_i)

    if((arr1 - arr2).empty? || (arr2 - arr1).empty?)
        counter1 += 1
    end

    intersection = arr1.intersection(arr2) 

    if !intersection.empty?
        counter2 += 1
    end
end

p "First star answer #{counter1}"
p "Second star answer #{counter2}"