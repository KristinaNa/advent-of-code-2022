res_arr = []
sub_arr = []

file = File.open("input.rb").readlines.map do
  |z|

  if z =~ /\d/
    sub_arr.push(z.to_i)
  else
    res_arr.push(sub_arr)
    sub_arr = []
  end
end

p res_arr.map{|row| row.reduce(0, :+)}.max()

sorted_arr = res_arr.map{|row| row.reduce(0, :+)}.sort
amount_of_elements = res_arr.length

p sorted_arr[amount_of_elements-1] + sorted_arr[amount_of_elements-2] + sorted_arr[amount_of_elements-3]
