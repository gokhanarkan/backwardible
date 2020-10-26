require 'csv'

table = CSV.parse(File.read('data.csv'), headers: true)

CSV.open('clean_data.csv', 'w') do |csv|
  table.each do |row|
    row['description'] = row['description'].split(' &hellip;')[0]
    csv << row
  end
end
