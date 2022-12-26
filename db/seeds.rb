if Person.count == 0
  path = File.join(File.dirname(__FILE__), 'data.json')
  records = JSON.parse(File.read(path))
  records.each do |record|
    Person.create(name: record[0], times: record[1])
  end
  puts 'Data seeded'
end
