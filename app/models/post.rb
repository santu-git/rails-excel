require 'creek'
class Post < ApplicationRecord
  has_one_attached :featured_image

  # def self.import(file)
  #   spreadsheet = open_spreadsheet(file)
  #   header = spreadsheet.row(1)
  #   p spreadsheet
  #   (2..spreadsheet.last_row).each do |i|
  #     row = Hash[[header, spreadsheet.row(i)].transpose]
  #     p row
  #     #product = find_by_id(row["id"]) || new
  #     #product.attributes = row.to_hash
  #     #product.save!
  #   end
  # end
  
  # def self.open_spreadsheet(file)
  #   case File.extname(file.original_filename)
  #     when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
  #     when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
  #     when ".xlsx" then Roo::Excelx.new(file.path)
  #     else raise "Unknown file type: #{file.original_filename}"
  #   end
  # end

  def self.import(file)
    creek = Creek::Book.new file.path, with_headers: true
    sheet = creek.sheets[0]
    sheet.with_images.rows.each do |row|
      p row["T2"].first.read unless row["T2"].nil?
    end
  end
  
end

