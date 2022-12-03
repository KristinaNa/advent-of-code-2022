file = File.open("input.rb")
file_data = file.readlines.map(&:chomp)
file_data = file_data.each_slice(3).to_a

alphabet_array = ('a'..'z').to_a + ('A'..'Z').to_a
sum = 0

for rucksack in file_data do
    s1 = rucksack[0].chars
    s2 = rucksack[1].chars
    s3 = rucksack[2].chars

    intersection = s1.intersection(s2, s3) 

    sum += alphabet_array.find_index(intersection[0])+1
end

p sum