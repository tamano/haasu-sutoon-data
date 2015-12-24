# command-line interface class
class HaasuSutoonData::CLI < Thor
  desc \
    'generate {out_file}',
    'Access to Hearthstonejson.com and output English-Japanese cards list in JS Hash style named CardList.'
  def generate(out_file)
    if File.exist?(out_file)
      puts "#{out_file} already exists"
      exit 1
    end

    HaasuSutoonData.generate_file(out_file)
  end
end
