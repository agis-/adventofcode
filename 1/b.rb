MAPPINGS = { N: { "L" => :W, "R" => :E },
             W: { "L" => :S, "R" => :N },
             E: { "L" => :N, "R" => :S },
             S: { "L" => :E, "R" => :W } }

OPPOSING = { N: :S,
             S: :N,
             E: :W,
             W: :E }

$facing = :N
$far = Hash.new(0)
$history = {}

def move(dir, blocks)
  $facing = MAPPINGS[$facing][dir]

  blocks.to_i.times do
    x = $far[OPPOSING[$facing]]

    if x > 0
      $far[OPPOSING[$facing]] -= 1
    elsif x == 0
      $far[$facing] += 1
    end

    if $history[$far]
      raise $far.values.inject(:+).to_s
    else
      $history[$far] = true
      false
    end
  end
end

begin
  STDIN.read.scan(/\w\d+/).each { |i| move(i.slice!(0, 1), i) }
  puts $far.values.inject(:+)
rescue => e
  puts e.message
end

