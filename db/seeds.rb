# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "csv"


CSV.foreach('db/curriculum.csv', headers: true) do |row|
    Curriculum.create(
    # id: row['id'],
    curriculums: row['sizetype'],
    created_at: row['created_at'],
    updated_at: row['updated_at'],
    ancestry: row['ancestry'],
    image: row['image']
  )
end