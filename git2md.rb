require 'git'

git = Git.open(File.expand_path '.')

git.log.each do |commit|
  puts commit.message
end
