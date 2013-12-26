class Markdown

	def title(title, depth)
		"\n" + ("#" * depth) + title +"\n"
	end

	def code_block(code, syntax)
		snippet = ""
		snippet << "```" << syntax << " \n" << code << "```" << "\n"
	end

	def write_to(file_name, contents)
		begin
			output_file = File.new(file_name, 'w')
			output_file.write(contents)
			output_file.close
		rescue Exception => e
			puts e.message
			puts "Can't create file"
		end
	end
end