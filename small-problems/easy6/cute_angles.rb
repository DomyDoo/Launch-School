DEGREE = "\xC2\xB0"

def dms(dec_degree)
  d = dec_degree.to_i
  m = ((dec_degree - d) * 60).round(5)
  s = ((m - m.to_i) * 60).round(5)
  
  format(%(#{d}#{DEGREE}%02d'%02d"), m.to_i, s.to_i)
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")