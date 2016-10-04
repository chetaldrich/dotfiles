#!/usr/bin/env ruby

# A script for cleaning out the bundles, if necessary. 

require 'fileutils'
require 'open-uri'

FileUtils.mkdir_p 'bundle/'

# Finds the directory used for the bundles, in this case "bundle"
bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "Cleaning Bundles....(lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

