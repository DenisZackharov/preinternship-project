task start: :environment do
  puts "Run rails server in the another tab..."
  system("osascript \ -e 'tell application \"System Events\" to tell process \"iTerm\" to keystroke \"t\" using command down' \
    -e 'tell application \"System Events\" to tell process \"iTerm\" to keystroke \"rails s\"' \
    -e 'tell application \"System Events\" to tell process \"iTerm\" to key code 52'")
  puts "Run rails console..."
  system("bin/rails c")
end
