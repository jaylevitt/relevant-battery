#!/usr/bin/env ruby
require 'rubygems'
require 'plist'

path = "/Users/jay/Library/Preferences/com.apple.systemuiserver.plist"
list = Plist::parse_xml(path)
list["menuExtras"].reject!{|i| i =~ /Battery.menu/}
list.save_plist(path)
