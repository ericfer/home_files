require "irb/completion"         # activate default completion

COLORS = {
  :default => "\033[0m",
  :green   => "\033[0;32m",
  :yellow  => "\033[0;33m",
  :red     => "\033[0;31m",
  :blue    => "\033[1;34m"
}

def puts_color(color, message)
  puts "#{COLORS[color]}#{message}#{COLORS[:default]}"
end

# save history using built-in options
require 'irb/ext/save-history'   # activate default history
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
puts_color :green, "History configured"

# auto-indent
IRB.conf[:AUTO_INDENT]=true
puts_color :green, "Auto-indent on"

# try to load rubygems
begin
  require "rubygems"
  puts_color :green, "Rubygems loaded"
rescue LoadError => e
  puts_color :red, "Seems you don't have Rubygems installed: #{e}"
end

# let there be colors
# just use Wirble for colors, since some enviroments dont have
# rubygems and wirble installed
begin
  require "wirble"
  Wirble.init(:skip_prompt=>true,:skip_history=>true)
  Wirble.colorize
  puts_color :green, "Wirble loaded - Now you have colors !!!"
rescue LoadError => e
  puts_color :red, "Seems you don't have Wirble installed: #{e}"
end

# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
  puts_color :green, "Now logging to STDOUT"
end

# configure vim
require "tempfile"   # used for Vim integration 
@irb_temp_code = nil

def vim(file=nil)
  file = file || @irb_temp_code || Tempfile.new("irb_tempfile").path+".rb"
  system("vim #{file}")
  if(File.exists?(file) && File.size(file)>0)
    Object.class_eval(File.read(file))
    @irb_temp_code = file
    puts_color :green, "File loaded from Vim"
  else
    puts_color :yellow, "No file loaded"
  end
rescue => e
  puts_color :red, "Error on vim: #{e}"
end  

# Aliases
alias q exit

puts_color :yellow, "\n*** IRB ready to rock !!! ***\n\n"