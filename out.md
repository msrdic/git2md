
#git log for branch master of /Users/mladensrdic/Documents/ruby-workshop/git2md/.git


##5. Markdown generation.

```diff 
diff --git a/git2md.rb b/git2md.rb
index aefdef8..fb8538d 100644
--- a/git2md.rb
+++ b/git2md.rb
@@ -1,27 +1,7 @@
 require 'git'
-require './md'
 
 git = Git.open(File.expand_path '.')
-markdown = Markdown.new
 
-title = ""
-title << "git log for branch " << git.current_branch << " of " << git.repo.path
-
-markdown_content = ""
-markdown_content << markdown.title(title, 1) << "\n"
-
-log_length = git.log.size
-git.log.each_with_index do |commit, index|
-	current_markdown_content = ""
-  	current_markdown_content << (log_length - index).to_s << ". " << commit.message << "\n"
-  	markdown_content << markdown.title(current_markdown_content, 2)
-
-  	begin
-  		diff_parent = commit.diff_parent
-  		markdown_content << markdown.code_block(diff_parent.to_s) << "\n"
-  	rescue
-  		markdown_content << markdown.code_block("no diff");
-  	end
+git.log.each do |commit|
+  puts commit.message
 end
-
-markdown.write_to("./out.md", markdown_content)
\ No newline at end of file
diff --git a/md.rb b/md.rb
deleted file mode 100644
index 3b7120f..0000000
--- a/md.rb
+++ /dev/null
@@ -1,22 +0,0 @@
-class Markdown
-
-	def title(title, depth)
-		"\n" + ("#" * depth) + title +"\n"
-	end
-
-	def code_block(code)
-		snippet = ""
-		snippet << "```diff \n" << code << "```" << "\n"
-	end
-
-	def write_to(file_name, contents)
-		begin
-			output_file = File.new(file_name, 'w')
-			output_file.write(contents)
-			output_file.close
-		rescue Exception => e
-			puts e.message
-			puts "Can't create file"
-		end
-	end
-end
\ No newline at end of file
diff --git a/out.md b/out.md
deleted file mode 100644
index c4bdd13..0000000
--- a/out.md
+++ /dev/null
@@ -1,49 +0,0 @@
-
-#git log for branch master of /Users/mladensrdic/Documents/ruby-workshop/git2md/.git
-
-
-##4. Merge branch 'master' of github.com:msrdic/git2md
-
-```diff 
-diff --git a/README.md b/README.md
-deleted file mode 100644
-index a19faa4..0000000
---- a/README.md
-+++ /dev/null
-@@ -1,4 +0,0 @@
--git2md
--======
--
--git2md tool from SBG Ruby workshop
-```
-
-
-##3. Initial commit
-
-```diff 
-no diff
-```
-
-##2. Actual implementation.
-
-```diff 
-diff --git a/git2md.rb b/git2md.rb
-index fb8538d..10527e4 100644
---- a/git2md.rb
-+++ b/git2md.rb
-@@ -1,7 +1 @@
- require 'git'
--
--git = Git.open(File.expand_path '.')
--
--git.log.each do |commit|
--  puts commit.message
--end
-```
-
-
-##1. First commit.
-
-```diff 
-no diff
-``````


##4. Merge branch 'master' of github.com:msrdic/git2md

```diff 
diff --git a/README.md b/README.md
deleted file mode 100644
index a19faa4..0000000
--- a/README.md
+++ /dev/null
@@ -1,4 +0,0 @@
-git2md
-======
-
-git2md tool from SBG Ruby workshop```


##3. Initial commit

```diff 
no diff```

##2. Actual implementation.

```diff 
diff --git a/git2md.rb b/git2md.rb
index fb8538d..10527e4 100644
--- a/git2md.rb
+++ b/git2md.rb
@@ -1,7 +1 @@
 require 'git'
-
-git = Git.open(File.expand_path '.')
-
-git.log.each do |commit|
-  puts commit.message
-end```


##1. First commit.

```diff 
no diff```
