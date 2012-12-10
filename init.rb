require 'wikipedia'
require 'cgi'
require 'htmlentities'

## Extraction / Sanitize

page = Wikipedia.find("Paris")
decoder = HTMLEntities.new

# Processing simplification
raw_data = page.sanitized_content

# No more html
raw_data.gsub!(/\<\/?\w+\>/, "")
 
tab = raw_data.split(/\n/)
tab.reject! do |txt| 
	(txt =~ /^=+.+=+$/) || (txt.size < 8) || (txt =~ /^:/) || (txt =~ /(\||\{|\*)/) || (txt =~ /^Category/) || (txt =~ /^\w+(\-?\w*)+:/)
end

