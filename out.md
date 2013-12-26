
#git log for branch master of /Users/mladensrdic/Documents/ruby-workshop/git2md/.git


##7. Syntax parameter for markdown code block rendering.

``` 
tree d574c4d2902c8cad94cd4f8a7757da16f081b2c4
parent e867c48a392bbf16fed04c1e320fb42c4964c7d6
author Mladen Srdić <m.s.qubits@gmail.com> 1388063956 +0100
committer Mladen Srdić <m.s.qubits@gmail.com> 1388063956 +0100

Syntax parameter for markdown code block rendering. 
``` 

```diff 
diff --git a/git2md.rb b/git2md.rb
index b23ac38..aefdef8 100644
--- a/git2md.rb
+++ b/git2md.rb
@@ -16,13 +16,11 @@ git.log.each_with_index do |commit, index|
   	current_markdown_content << (log_length - index).to_s << ". " << commit.message << "\n"
   	markdown_content << markdown.title(current_markdown_content, 2)
 
-  	markdown_content << markdown.code_block(commit.contents, "") << "\n"
-
   	begin
   		diff_parent = commit.diff_parent
-  		markdown_content << markdown.code_block(diff_parent.to_s, "diff") << "\n"
+  		markdown_content << markdown.code_block(diff_parent.to_s) << "\n"
   	rescue
-  		markdown_content << markdown.code_block("no diff", "");
+  		markdown_content << markdown.code_block("no diff");
   	end
 end
 
diff --git a/md.rb b/md.rb
index 46bcada..3b7120f 100644
--- a/md.rb
+++ b/md.rb
@@ -4,9 +4,9 @@ class Markdown
 		"\n" + ("#" * depth) + title +"\n"
 	end
 
-	def code_block(code, syntax)
+	def code_block(code)
 		snippet = ""
-		snippet << "```" << syntax << " \n" << code << "```" << "\n"
+		snippet << "```diff \n" << code << "```" << "\n"
 	end
 
 	def write_to(file_name, contents)
diff --git a/out.md b/out.md
index b0dc450..b74a201 100644
--- a/out.md
+++ b/out.md
@@ -2,197 +2,8 @@
 #git log for branch master of /Users/mladensrdic/Documents/ruby-workshop/git2md/.git
 
 
-##6. Minor change.
-
-``` 
-tree 8db195be46debeb9583823ed5bb83d0b4ab012cf
-parent 252a31ff52a5b23b7d6099cec072e2e9f380e99d
-author Mladen Srdić <m.s.qubits@gmail.com> 1388063502 +0100
-committer Mladen Srdić <m.s.qubits@gmail.com> 1388063502 +0100
-
-Minor change.```
-
-```diff 
-diff --git a/out.md b/out.md
-index b74a201..c4bdd13 100644
---- a/out.md
-+++ b/out.md
-@@ -2,130 +2,6 @@
- #git log for branch master of /Users/mladensrdic/Documents/ruby-workshop/git2md/.git
- 
- 
--##5. Markdown generation.
--
--```diff 
--diff --git a/git2md.rb b/git2md.rb
--index aefdef8..fb8538d 100644
----- a/git2md.rb
--+++ b/git2md.rb
--@@ -1,27 +1,7 @@
-- require 'git'
---require './md'
-- 
-- git = Git.open(File.expand_path '.')
---markdown = Markdown.new
-- 
---title = ""
---title << "git log for branch " << git.current_branch << " of " << git.repo.path
---
---markdown_content = ""
---markdown_content << markdown.title(title, 1) << "\n"
---
---log_length = git.log.size
---git.log.each_with_index do |commit, index|
---	current_markdown_content = ""
---  	current_markdown_content << (log_length - index).to_s << ". " << commit.message << "\n"
---  	markdown_content << markdown.title(current_markdown_content, 2)
---
---  	begin
---  		diff_parent = commit.diff_parent
---  		markdown_content << markdown.code_block(diff_parent.to_s) << "\n"
---  	rescue
---  		markdown_content << markdown.code_block("no diff");
---  	end
--+git.log.each do |commit|
--+  puts commit.message
-- end
---
---markdown.write_to("./out.md", markdown_content)
--\ No newline at end of file
--diff --git a/md.rb b/md.rb
--deleted file mode 100644
--index 3b7120f..0000000
----- a/md.rb
--+++ /dev/null
--@@ -1,22 +0,0 @@
---class Markdown
---
---	def title(title, depth)
---		"\n" + ("#" * depth) + title +"\n"
---	end
---
---	def code_block(code)
---		snippet = ""
---		snippet << "```diff \n" << code << "```" << "\n"
---	end
---
---	def write_to(file_name, contents)
---		begin
---			output_file = File.new(file_name, 'w')
---			output_file.write(contents)
---			output_file.close
---		rescue Exception => e
---			puts e.message
---			puts "Can't create file"
---		end
---	end
---end
--\ No newline at end of file
--diff --git a/out.md b/out.md
--deleted file mode 100644
--index c4bdd13..0000000
----- a/out.md
--+++ /dev/null
--@@ -1,49 +0,0 @@
---
---#git log for branch master of /Users/mladensrdic/Documents/ruby-workshop/git2md/.git
---
---
---##4. Merge branch 'master' of github.com:msrdic/git2md
---
---```diff 
---diff --git a/README.md b/README.md
---deleted file mode 100644
---index a19faa4..0000000
------ a/README.md
---+++ /dev/null
---@@ -1,4 +0,0 @@
----git2md
----======
----
----git2md tool from SBG Ruby workshop
---```
---
---
---##3. Initial commit
---
---```diff 
---no diff
---```
---
---##2. Actual implementation.
---
---```diff 
---diff --git a/git2md.rb b/git2md.rb
---index fb8538d..10527e4 100644
------ a/git2md.rb
---+++ b/git2md.rb
---@@ -1,7 +1 @@
--- require 'git'
----
----git = Git.open(File.expand_path '.')
----
----git.log.each do |commit|
----  puts commit.message
----end
---```
---
---
---##1. First commit.
---
---```diff 
---no diff
---``````
--
--
- ##4. Merge branch 'master' of github.com:msrdic/git2md
- 
- ```diff 
-@@ -138,13 +14,15 @@ index a19faa4..0000000
- -git2md
- -======
- -
---git2md tool from SBG Ruby workshop```
-+-git2md tool from SBG Ruby workshop
-+```
- 
- 
- ##3. Initial commit
- 
- ```diff 
--no diff```
-+no diff
-+```
- 
- ##2. Actual implementation.
- 
-@@ -160,10 +38,12 @@ index fb8538d..10527e4 100644
- -
- -git.log.each do |commit|
- -  puts commit.message
---end```
-+-end
-+```
- 
- 
- ##1. First commit.
- 
- ```diff 
--no diff```
-+no diff
-+``````
-
-
 ##5. Markdown generation.
 
-``` 
-tree 49ecb70245f5b279a0a42f7413e18243291a719c
-parent 644936b8309220654ca97a3b54e717d400fe7764
-author Mladen Srdić <m.s.qubits@gmail.com> 1388063439 +0100
-committer Mladen Srdić <m.s.qubits@gmail.com> 1388063439 +0100
-
-Markdown generation.```
-
 ```diff 
 diff --git a/git2md.rb b/git2md.rb
 index aefdef8..fb8538d 100644
@@ -317,15 +128,6 @@ index c4bdd13..0000000
 
 ##4. Merge branch 'master' of github.com:msrdic/git2md
 
-``` 
-tree 24b36922d5d0e3b79f3724c59d8067ebda95cf73
-parent 9e064fc38d5e8f3673bd71986940e05e6db5cefa
-parent b4c8f7a038eaa92f73500556259352511936579e
-author Mladen Srdić <m.s.qubits@gmail.com> 1387795162 +0100
-committer Mladen Srdić <m.s.qubits@gmail.com> 1387795162 +0100
-
-Merge branch 'master' of github.com:msrdic/git2md```
-
 ```diff 
 diff --git a/README.md b/README.md
 deleted file mode 100644
@@ -341,26 +143,11 @@ index a19faa4..0000000
 
 ##3. Initial commit
 
-``` 
-tree c02de78acb3742ed78359e0b1f27d08efbc70ed7
-author Mladen Srdic <m.s.qubits@gmail.com> 1387794740 -0800
-committer Mladen Srdic <m.s.qubits@gmail.com> 1387794740 -0800
-
-Initial commit```
-
-``` 
+```diff 
 no diff```
 
 ##2. Actual implementation.
 
-``` 
-tree 74e541b973bec506c6ad5a04a06c0b309a2ae776
-parent 2db8ef1e625cb81bf78e95ea13798ef1c1d723a7
-author Mladen Srdić <m.s.qubits@gmail.com> 1387794535 +0100
-committer Mladen Srdić <m.s.qubits@gmail.com> 1387794535 +0100
-
-Actual implementation.```
-
 ```diff 
 diff --git a/git2md.rb b/git2md.rb
 index fb8538d..10527e4 100644
@@ -378,12 +165,5 @@ index fb8538d..10527e4 100644
 
 ##1. First commit.
 
-``` 
-tree 281611ea47412d39fb098545a25028d48ae955d2
-author Mladen Srdić <m.s.qubits@gmail.com> 1387794356 +0100
-committer Mladen Srdić <m.s.qubits@gmail.com> 1387794356 +0100
-
-First commit.```
-
-``` 
+```diff 
 no diff``` 
``` 


##6. Minor change.

``` 
tree 8db195be46debeb9583823ed5bb83d0b4ab012cf
parent 252a31ff52a5b23b7d6099cec072e2e9f380e99d
author Mladen Srdić <m.s.qubits@gmail.com> 1388063502 +0100
committer Mladen Srdić <m.s.qubits@gmail.com> 1388063502 +0100

Minor change. 
``` 

```diff 
diff --git a/out.md b/out.md
index b74a201..c4bdd13 100644
--- a/out.md
+++ b/out.md
@@ -2,130 +2,6 @@
 #git log for branch master of /Users/mladensrdic/Documents/ruby-workshop/git2md/.git
 
 
-##5. Markdown generation.
-
-```diff 
-diff --git a/git2md.rb b/git2md.rb
-index aefdef8..fb8538d 100644
---- a/git2md.rb
-+++ b/git2md.rb
-@@ -1,27 +1,7 @@
- require 'git'
--require './md'
- 
- git = Git.open(File.expand_path '.')
--markdown = Markdown.new
- 
--title = ""
--title << "git log for branch " << git.current_branch << " of " << git.repo.path
--
--markdown_content = ""
--markdown_content << markdown.title(title, 1) << "\n"
--
--log_length = git.log.size
--git.log.each_with_index do |commit, index|
--	current_markdown_content = ""
--  	current_markdown_content << (log_length - index).to_s << ". " << commit.message << "\n"
--  	markdown_content << markdown.title(current_markdown_content, 2)
--
--  	begin
--  		diff_parent = commit.diff_parent
--  		markdown_content << markdown.code_block(diff_parent.to_s) << "\n"
--  	rescue
--  		markdown_content << markdown.code_block("no diff");
--  	end
-+git.log.each do |commit|
-+  puts commit.message
- end
--
--markdown.write_to("./out.md", markdown_content)
-\ No newline at end of file
-diff --git a/md.rb b/md.rb
-deleted file mode 100644
-index 3b7120f..0000000
---- a/md.rb
-+++ /dev/null
-@@ -1,22 +0,0 @@
--class Markdown
--
--	def title(title, depth)
--		"\n" + ("#" * depth) + title +"\n"
--	end
--
--	def code_block(code)
--		snippet = ""
--		snippet << "```diff \n" << code << "```" << "\n"
--	end
--
--	def write_to(file_name, contents)
--		begin
--			output_file = File.new(file_name, 'w')
--			output_file.write(contents)
--			output_file.close
--		rescue Exception => e
--			puts e.message
--			puts "Can't create file"
--		end
--	end
--end
-\ No newline at end of file
-diff --git a/out.md b/out.md
-deleted file mode 100644
-index c4bdd13..0000000
---- a/out.md
-+++ /dev/null
-@@ -1,49 +0,0 @@
--
--#git log for branch master of /Users/mladensrdic/Documents/ruby-workshop/git2md/.git
--
--
--##4. Merge branch 'master' of github.com:msrdic/git2md
--
--```diff 
--diff --git a/README.md b/README.md
--deleted file mode 100644
--index a19faa4..0000000
----- a/README.md
--+++ /dev/null
--@@ -1,4 +0,0 @@
---git2md
---======
---
---git2md tool from SBG Ruby workshop
--```
--
--
--##3. Initial commit
--
--```diff 
--no diff
--```
--
--##2. Actual implementation.
--
--```diff 
--diff --git a/git2md.rb b/git2md.rb
--index fb8538d..10527e4 100644
----- a/git2md.rb
--+++ b/git2md.rb
--@@ -1,7 +1 @@
-- require 'git'
---
---git = Git.open(File.expand_path '.')
---
---git.log.each do |commit|
---  puts commit.message
---end
--```
--
--
--##1. First commit.
--
--```diff 
--no diff
--``````
-
-
 ##4. Merge branch 'master' of github.com:msrdic/git2md
 
 ```diff 
@@ -138,13 +14,15 @@ index a19faa4..0000000
 -git2md
 -======
 -
--git2md tool from SBG Ruby workshop```
+-git2md tool from SBG Ruby workshop
+```
 
 
 ##3. Initial commit
 
 ```diff 
-no diff```
+no diff
+```
 
 ##2. Actual implementation.
 
@@ -160,10 +38,12 @@ index fb8538d..10527e4 100644
 -
 -git.log.each do |commit|
 -  puts commit.message
--end```
+-end
+```
 
 
 ##1. First commit.
 
 ```diff 
-no diff```
+no diff
+``` 
``` 


##5. Markdown generation.

``` 
tree 49ecb70245f5b279a0a42f7413e18243291a719c
parent 644936b8309220654ca97a3b54e717d400fe7764
author Mladen Srdić <m.s.qubits@gmail.com> 1388063439 +0100
committer Mladen Srdić <m.s.qubits@gmail.com> 1388063439 +0100

Markdown generation. 
``` 

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
-``` 
``` 


##4. Merge branch 'master' of github.com:msrdic/git2md

``` 
tree 24b36922d5d0e3b79f3724c59d8067ebda95cf73
parent 9e064fc38d5e8f3673bd71986940e05e6db5cefa
parent b4c8f7a038eaa92f73500556259352511936579e
author Mladen Srdić <m.s.qubits@gmail.com> 1387795162 +0100
committer Mladen Srdić <m.s.qubits@gmail.com> 1387795162 +0100

Merge branch 'master' of github.com:msrdic/git2md 
``` 

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
-git2md tool from SBG Ruby workshop 
``` 


##3. Initial commit

``` 
tree c02de78acb3742ed78359e0b1f27d08efbc70ed7
author Mladen Srdic <m.s.qubits@gmail.com> 1387794740 -0800
committer Mladen Srdic <m.s.qubits@gmail.com> 1387794740 -0800

Initial commit 
``` 

``` 
no diff 
``` 

##2. Actual implementation.

``` 
tree 74e541b973bec506c6ad5a04a06c0b309a2ae776
parent 2db8ef1e625cb81bf78e95ea13798ef1c1d723a7
author Mladen Srdić <m.s.qubits@gmail.com> 1387794535 +0100
committer Mladen Srdić <m.s.qubits@gmail.com> 1387794535 +0100

Actual implementation. 
``` 

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
-end 
``` 


##1. First commit.

``` 
tree 281611ea47412d39fb098545a25028d48ae955d2
author Mladen Srdić <m.s.qubits@gmail.com> 1387794356 +0100
committer Mladen Srdić <m.s.qubits@gmail.com> 1387794356 +0100

First commit. 
``` 

``` 
no diff 
``` 
