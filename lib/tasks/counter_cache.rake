desc 'Counter cache for scent has many notes'

task note_counter: :environment do
  Scent.reset_column_information
  Scent.find_each do |s|
    s.set_notes_count
  end
end
