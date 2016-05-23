namespace :feed do
  desc "import all feeds to the db"
  task import: :environment do
    Feed.all.each do |feed|
      importer = GenericImporter.new(feed)
      importer.import
    end
  end

end
