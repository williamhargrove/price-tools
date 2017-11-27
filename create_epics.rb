#!/usr/bin/ruby

# Take a list of FTSE 350 stock epics in stockopedia format and convert them 
# into Yahoo! finance format to be used in a quot lookup for historical prices.
# 
# Special cases:
# BT.L -> BT-A.L

require 'csv'

CSV.foreach("ftse-350.csv", headers: true) do |r|
 fields = r.to_s.split(",")
 epic = fields[0].chomp
 case epic
  when 'BT.A'
   epic = 'BT-A'
  else
 end
 symbol = epic.tr('.','').chomp + ".L"
 company = fields[1].chomp
 puts "#{symbol},#{company}"
end

# The following line is for Vim users - please don't delete it.
# vim: set filetype=ruby expandtab tabstop=2 shiftwidth=2:
