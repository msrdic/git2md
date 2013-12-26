require 'git'
require './md'

git = Git.open(File.expand_path '.')
markdown = Markdown.new

title = ""
title << "git log for branch " << git.current_branch << " of " << git.repo.path

markdown_content = ""
markdown_content << markdown.title(title, 1) << "\n"

log_length = git.log.size
git.log.each_with_index do |commit, index|
	current_markdown_content = ""
  	current_markdown_content << (log_length - index).to_s << ". " << commit.message << "\n"
  	markdown_content << markdown.title(current_markdown_content, 2)

  	begin
  		diff_parent = commit.diff_parent
  		markdown_content << markdown.code_block(diff_parent.to_s) << "\n"
  	rescue
  		markdown_content << markdown.code_block("no diff");
  	end
end

markdown.write_to("./out.md", markdown_content)