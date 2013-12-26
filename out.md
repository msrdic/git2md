
#git log for branch master of /Users/mladensrdic/Documents/ruby-workshop/git2md/.git


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
-git2md tool from SBG Ruby workshop
```


##3. Initial commit

```diff 
no diff
```

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
-end
```


##1. First commit.

```diff 
no diff
```
