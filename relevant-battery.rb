#!/usr/bin/env ruby
require 'rubygems'
require 'plist'

suis = "/Users/jay/Library/Preferences/com.apple.systemuiserver.plist"

if `file #{suis}` =~ /Apple binary property list/
  `plutil -convert xml1 #{suis}`
end

list = Plist::parse_xml(suis)
list["menuExtras"].reject!{|i| i =~ /Battery.menu/}
list.save_plist(suis)

`killall SystemUIServer`