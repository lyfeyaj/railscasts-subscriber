module RailsCasts
  class Spider
    RAILSCASTS_URI = 'http://railscasts.com/'

    def scrap
      pages = page_info
      episodes = pages.map do |page|
        arr = fetch_episodes_for_current page
        Logger.notice "Fetch page #{page}'s episodes info", 'done!'
        arr
      end.flatten
      Logger.info 'Successfully fetch all episodes info.'
      episodes
    end

    def multi_threads_scrap
      pages = page_info
      episodes = []
      mutex = Mutex.new
      pages.map do |page|
        Thread.new {
          arr = fetch_episodes_for_current page
          mutex.synchronize do
            Logger.notice "Fetch page #{page}'s episodes info", 'done!'
          end
          episodes << arr
        }
      end.each {|t| t.join}
      Logger.info 'Successfully fetch all episodes info.'
      episodes.flatten.sort_by{|episode| episode['id']}
    end

    def page_info
      Logger.info "Try to fetch total page number"
      pages = get_pages
      Logger.info "Total Page Number: #{pages.max}"
      pages
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
        type = episode.css('.main .watch a').attr('href').text == '/pro' ? 'Pro' : 'Normal'
        name = episode.css('.main h2 a').attr('href').text.split('/').last
        published_at = episode.css('.main .info .published_at').text
        {
          'id' => id,
          'type' => type,
          'name' => parse_name(name),
          'published_at' => published_at
        }
      end
    end

    def html_parser(uri)
      Nokogiri::HTML(open(uri))
    end

    def parse_name(name)
      parts = name.split('-')
      snumber = parts.shift
      snumber = '0' * (3 - snumber.length) + snumber if snumber.length < 3
      parts.unshift snumber
      parts.join('-')
    end
  end
end
