class Seeder
  DATA_REPO = File.join('lib', 'data')

  def self.populate
    # create core values
    seed = Rails.root.join(DATA_REPO, 'core_values.yml')
    config = YAML::load_file(seed)
    config['core_values'].each do |name|
      CoreValue.create(name: name)
    end

    # create qualities
    seed = Rails.root.join(DATA_REPO, 'qualities.yml')
    config = YAML::load_file(seed)
    config.each do |qualities|
      name = qualities.shift
      value = CoreValue.find_by(name: name)
      qualities.first.each do |quality|
        value.qualities.push Quality.create(assertion: quality['assertion'], question: quality['question'])
      end
    end

    # create test user
    user = User.create(email: 'test@test.com', password: 'password')

    # create acts
    3.times do
      e = Act.new(user: user, description: FFaker::Lorem.paragraph)
      e.qualities.push([Quality.all.sample])
      e.save
    end

    # create problems
    Act.all.each do |act|
      act.problems.push Problem.create(description: FFaker::Lorem.paragraph)
    end

    # create solutions
    Problem.all.each do |problem|
      problem.solutions << Solution.new(description: FFaker::Lorem.paragraph)
      problem.save
    end

    # create benefits
    Act.all.each do |act|
      act.benefits.push [Benefit.new(description: FFaker::Lorem.paragraph), Benefit.new(description: FFaker::Lorem.paragraph)]
    end
  end
end
