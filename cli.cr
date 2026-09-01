require "./rtime"

if ARGV.empty?
  STDERR.puts "Usage: rtime <timestamp> [<timestamp> ...]"
  exit 1
end

status = 0

ARGV.each do |arg|
  begin
    puts rtime(arg.to_i64)
  rescue ArgumentError | OverflowError
    STDERR.puts "Invalid timestamp: #{arg}"
    status = 1
  end
end

exit status
