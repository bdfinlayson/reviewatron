DATA_REPO = File.join('lib', 'data')

#create core values
seed = Rails.root.join(DATA_REPO, 'core_values.yml')
config = YAML::load_file(seed)
config['core_values'].each do |name|
  CoreValue.create(name: name)
end

#create qualities
seed = Rails.root.join('lib', 'data', 'qualities.yml')
config = YAML::load_file(seed)
config.each do |qualities|
  name = qualities.shift
  value = CoreValue.find_by(name: name)
  qualities.first.each do |quality|
    value.qualities.push Quality.create(assertion: quality['assertion'], question: quality['question'])
  end
end
