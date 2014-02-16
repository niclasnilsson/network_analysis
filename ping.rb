require 'net/ping'
 
def ping(ip)
  icmp = Net::Ping::ICMP.new(ip)
  loop do
    start = Time.now
    duration_format, duration = icmp.ping ? ['%0.3f', icmp.duration * 1000] : ['%s', 'timeout']
    puts sprintf "%s, #{duration_format}, %s", icmp.host, duration, Time.now
    STDOUT.flush

    took = Time.now - start
    left = 1 - took

    if left > 0
      sleep left
    end
  end
end

ping ARGV[0]
