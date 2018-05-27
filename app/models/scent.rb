class Scent < ApplicationRecord
  belongs_to :brand, touch: true
  has_many :scent_notes, dependent: :destroy
  has_many :notes, through: :scent_notes
  default_scope { order(name_sort: :asc) }
  scope :indexed, -> { where('notes_count > 0') }
  scope :to_index, -> { where('notes_count = 0') }

  enum decision: [ :unknown, :uninterested, :want, :undecided, :love, :ok, :dislike ]

  after_touch :set_notes_count
  
  def self.has_note(note)
    Note.find_by!(name: name).scents
  end

  def self.note_counts
    Note.select('notes.*, count(scent_notes.note_id) as count').joins(:scent_notes).group('scent_notes.note_id')
  end

  def note_list
    notes.map(&:name).join(', ')
  end

  def note_list=(names)
    self.notes = names.split(',').map do |n|
      Note.where(name: n.strip).first_or_create!
    end
  end

  def set_name_sort
    sort_name = self.name.gsub(/^(A |An |The |L'|La |Le |Les )/,'')
    write_attribute(:name_sort, sort_name)
    save
  end
  
  def set_notes_count
    nc = self.notes.count
    write_attribute(:notes_count, nc)
    save
  end
  

end
