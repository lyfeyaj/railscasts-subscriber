module RailsCasts
  class Spider
    RAILSCASTS_URI = 'http://railscasts.com/'
    
    def scrap
      pages = get_pages
      pages.map do |page|
        Logger.info "Fetch Page #{page} Start"
        arr = fetch_episodes_for_current page
        Logger.info "Fetch Page #{page} Complete"
        arr
      end.flatten
    end
    
    def get_pages
      doc = html_parser(RAILSCASTS_URI)
      pagination = doc.css(".pagination")
      if pagination.present?
        arr = pagination.children.map do |item|
          item.text.to_i
        end.flatten.uniq.keep_if{|a| a>0}
        pages = (arr.min..arr.max).to_a
      else
        Logger.info "No such class on #{RAILSCASTS_URI}"
        []
      end
    end
    
    def fetch_episodes_for_current(page)
      uri = RAILSCASTS_URI + '?page=' + page.to_s
      doc = html_parser(uri)
      doc.css('.episodes .episode').map do |episode|
        id = episode.attr('id').scan(/[0-9]+/).first.to_i
        type = episode.css('.main .watch a').attr('href').text == '/pro' ? "Pro" : "Normal"
        name = episode.css('.main h2 a').attr('href').text.split('/').last
        published_at = episode.css('.main .info .published_at').text
        {
          'id' => id,
          'type'=> type,
          'name'=> parse_name(name),
          'published_at'=> published_at
        }
      end
    end
    
    def html_parser(uri)
      Nokogiri::HTML(open(uri))
    end
    
    def parse_name(name)
      parts = name.split('-')
      snumber = parts.shift
      if snumber.length < 3
        snumber = '0'*(3 - snumber.length) + snumber
      end
      parts.unshift snumber
      parts.join('-')
    end
  end
end