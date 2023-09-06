require 'open3'

MINGW_DIR = 'C:\MinGW\bin'

def mingw_bash_emulator
  puts "GWBash - A MinGW bash emulator written with Ruby"
  puts "Written by B. Chabiene, licensed with GNU GPL v3"
  loop do
    print "GWBash $ "
    command = gets.chomp

    break if command == 'exit'

    full_command = "cd #{MINGW_DIR} && #{command}"
    stdin, stdout, stderr, wait_thr = Open3.popen3(full_command)

    output = stdout.read
    error = stderr.read

    puts output unless output.empty?
    puts error unless error.empty?
  end
end

mingw_bash_emulator
