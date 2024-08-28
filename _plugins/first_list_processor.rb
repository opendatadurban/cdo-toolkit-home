module Jekyll
  class FirstListProcessor < Generator
    safe true
    priority :lowest

    def generate(site)
      site.pages.each do |page|
        content = page.content
        first_list_items = []
        list_found = false

        # Regular expression to match the first numbered list
        content.each_line do |line|
          if line =~ /^\d+\.\s+(.+)/
            list_text = line.strip.gsub(/^\d+\.\s*/, '')

            # Extract the link text and URL if present
            if list_text =~ /\[([^\]]+)\]\(([^)]+)\)/
              link_text = $1
              link_url = $2
              first_list_items << { "text" => link_text, "url" => link_url }
            else
              first_list_items << { "text" => list_text, "url" => nil }
            end

            list_found = true
          elsif list_found && line.strip.empty?
            # Stop if we've found a list and then hit a blank line
            break
          elsif list_found && line !~ /^\d+\./
            # Stop if we've found a list and then hit a non-list item
            break
          end
        end

        # Assign the list items to the page data if any items were found
        page.data['first_list_items'] = first_list_items unless first_list_items.empty?
      end
    end
  end
end