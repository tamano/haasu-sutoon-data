# represent version
module HaasuSutoonData
  VERSION = '0.1.0'

  def self.file_id
    "#{HaasuSutoonData::VERSION}/#{Time.now.strftime('%Y%m%d%H%M%S')}"
  end
end
