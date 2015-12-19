class HaasuSutoonData::CLI < Thor
  desc \
    'generate {out_file}',
    'Access to Hearthstonejson.com and output English-Japanese cards list in JS Hash style named CardList.'
  def export(out_file)
    #error_message = MboxHeaderScraper::Scraper.check_in_file(in_file)
    if error_message
      puts "input file error: #{error_message}"
      exit 1
    end

    #error_message = MboxHeaderScraper::Scraper.check_out_file(out_file)
    if error_message
      puts "output file error: #{error_message}"
      exit 1
    end

  end
end
