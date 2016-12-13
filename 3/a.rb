i = 0

$stdin.read.scan(/(\d+)\s+(\d+)\s+(\d+)/).each do |t|
  i += 1 if t.map(&:to_i).permutation.all? { |x| x[0]+x[1] > x[2] }
end

puts i
