#!/usr/bin/env ruby

# A script for managing vim bundles from the vim site
# and from GitHub. Essentially trashes the bundles and
# performs a reinstall of the packages listed in the
# bundle lists below. 

# Insert bundles from GitHub here. Make sure to 
# use a full URL!
git_bundles = [ 
  "git://github.com/vim-ruby/vim-ruby.git",
  "git://github.com/tpope/vim-surround.git",
  "git://github.com/jiangmiao/auto-pairs.git",
  "https://github.com/scrooloose/nerdtree.git",
  "https://github.com/derekwyatt/vim-scala",
  "https://github.com/wting/rust.vim.git",
  "https://github.com/reedes/vim-pencil",
  "https://github.com/terryma/vim-multiple-cursors",
]

# Insert bundles from Vim.org. Place the name of
# the plugin in the first entry, the number of the
# plugin in the URL on the page in the second, and 
# the script type (which can be found on the page)
# in the third entry. 
vim_org_scripts = [
   ["jquery",        "12107", "syntax"],
]

require 'fileutils'
require 'open-uri'

FileUtils.mkdir_p 'bundle/'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "Trashing Bundles....(lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

vim_org_scripts.each do |name, script_id, script_type|
  puts "Downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.vim")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
end
