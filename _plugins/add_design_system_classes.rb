module Jekyll
  class ListClassAdder < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /^\.md$/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      add_class_to_lists(content)
    end

    private

    def add_class_to_lists(content)
      # Add classes to paragraphs and lists
      content = content.gsub('<p>', '<p class="city-body">')
      content = content.gsub('<ul>', '<ul class="city-body">')
      content = content.gsub('<ol>', '<ol class="city-body">')

      # Correctly add classes to headings
      content = content.gsub(/<h1(.*?)>/, '<h1\1 class="city-heading-l">')
      content = content.gsub(/<h2(.*?)>/, '<h2\1 class="city-heading-m">')
      content = content.gsub(/<h3(.*?)>/, '<h3\1 class="city-heading-s">')
      content = content.gsub(/<h4(.*?)>/, '<h4\1 class="city-heading-s">')
      content = content.gsub(/<h5(.*?)>/, '<h5\1 class="city-heading-s">')
      content = content.gsub(/<h6(.*?)>/, '<h6\1 class="city-heading-s">')
    end
  end
end

# module Jekyll
#   class AddDesignSystemClasses < Generator
#     safe true
#     priority :lowest

#     def generate(site)
#       puts "------------------"
#       site.pages.each do |page|
#         next unless page.output_ext == '.html'

#         unless page.output.nil?
#           page.output = add_classes(page.output)
#         end
#       end
#     end

#     def add_classes(content)
      
#       # Add classes to paragraphs and lists
#       content = content.gsub('<p>', '<p class="city-body">')
#       content = content.gsub('<ul>', '<ul class="city-body">')
#       content = content.gsub('<ol>', '<ol class="city-body">')

#       # Correctly add classes to headings
#       content = content.gsub('<h1>', '<h1 class="city-heading-l">')
#       content = content.gsub('<h2>', '<h2 class="city-heading-m">')
#       content = content.gsub('<h3>', '<h3 class="city-heading-s">')
#       content = content.gsub('<h4>', '<h4 class="city-heading-s">')
#       content = content.gsub('<h5>', '<h5 class="city-heading-s">')
#       content = content.gsub('<h6>', '<h6 class="city-heading-s">')

#       content
#     end
#   end
# end