require 'open-uri'
require 'nokogiri'


flickr_id = '129372876@N04'
 
Dashing.scheduler.every '1m', first_in: 1.second.since do |job|
  public_photos = photo_urls "public", flickr_id
  favourite_photos = photo_urls "faves", flickr_id
  Dashing.send_event('flickr_public', photos: public_photos)
  Dashing.send_event('flickr_faves', photos: favourite_photos)
end
 
def photo_urls(type, flickr_id)
      doc=Nokogiri::HTML(open("https://api.flickr.com/services/feeds/photos_public.gne?id=#{flickr_id}"))
      photos = Array.new;
      doc.css('entry link').each do |link|
        if (link.attr('rel') == 'enclosure')
          photos.push(link.attr('href'))
        end
      end
      photos
end