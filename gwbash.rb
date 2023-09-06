require 'open3'

MINGW_DIR = 'C:\MinGW\bin' # Update this with your MinGW installation path

def mingw_bash_emulator
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
