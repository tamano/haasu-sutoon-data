require 'net/http'
require 'json'

# get json file from Hearthstonejson.com and generate output_file
module HaasuSutoonData
  def self.generate_file(file_path)
    File.open(file_path, 'w') do |f|
      f.write "console.log('card data version: #{HaasuSutoonData.file_id}');\n"
      f.write "var CardList = [\n"
      translate_cards_list.each do |card|
        id = card['id']
        en_name = card['en_name'].gsub("'", "\\\\'")
        ja_name = card['ja_name'].gsub("'", "\\\\'")
        f.write "{'id':'#{id}','en_name':'#{en_name}','ja_name':'#{ja_name}'},\n"
      end
      f.write "]\n"
    end
  end

  def self.translate_cards_list
    en_cards = JSON.parse(fetch_card_list('enUS'))
    ja_cards = JSON.parse(fetch_card_list('jaJP'))

    create_dictonary(en_cards, ja_cards)
  end

  def self.fetch_card_list(lang)
    puts "Starting #{lang} card data download."

    # jaJP => https://hearthstonejson.com/json/AllSets.jaJP.json
    # enUS => https://hearthstonejson.com/json/AllSets.json
    target_lang = (lang == 'enUS') ? '' : ('.' + lang)
    target_uri = URI("https://hearthstonejson.com/json/AllSets#{target_lang}.json")

    Net::HTTP.get(target_uri)
  end

  def self.create_dictonary(from_cards, to_cards)
    puts 'Starting creating card dictonary.'

    from_list = create_id_name_hash(from_cards)
    to_list = create_id_name_hash(to_cards)

    result = []

    from_list.each do |id, en_name|
      result << { 'id' => id, 'en_name' => en_name, 'ja_name' => to_list[id] }
    end

    result.sort { |a, b| a['id'] <=> b['id'] }
  end

  def self.create_id_name_hash(json)
    hash_list = {}

    json.each do |_expantion, cards|
      hash_list.merge! Hash[*cards.map { |c| [c['id'], c['name']] }.flatten]
    end

    hash_list
  end
end
