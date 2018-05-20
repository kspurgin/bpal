# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'pp'

def create_brand_object_hash(scentbase)
  brand_lookup = {}
  scentbase.values_at('Brand').uniq.flatten.each do |bname|
    brand_lookup[bname] = Brand.where(name: bname).first
  end
  brand_lookup
end

def populate_brand
  brand_list = [
    ['Black Phoenix', 'https://blackphoenixalchemylab.com/about-black-phoenix-alchemy-lab/'],
    ['Deconstructing Eden', 'http://deconstructingeden.com/'],
    ['Enchanticals', 'https://www.etsy.com/shop/EnchanticalsPerfume'],
    ['For Strange Women', 'https://www.forstrangewomen.com/'],
    ['Goest', 'http://www.goest.us/'],
    ['Nocturne Alchemy', 'https://nocturnealchemy.com/'],
    ['Traveling Vardo', 'https://www.etsy.com/shop/TravelingVardo']
  ]

  brand_list.each do | bname, url |
    Brand.create( name: bname, url: url )
  end
end


def populate_scent
  uniqscents = {}
  scentbase = CSV.read('lib/data/scents.csv', :headers => true)
  brand_lookup = create_brand_object_hash(scentbase)

  scentbase.each do |r|
    name = r.field('Name')
    desc = r.field('Description')
    bname = r.field('Brand')
    uname = "#{bname}/#{name}"

    if uniqscents.has_key?(uname)
      next
    else
      brand_object = brand_lookup[r.field('Brand')]
      Scent.create( name: r.field('Name'),
                    description: r.field('Description'),
                    brand: brand_object )
    end
    
    uniqscents[uname] = 1
  end
end

def populate_note
  notebase = CSV.read('lib/data/notes.csv', :headers => true)
  note_vocab = notebase.values_at('Note').flatten
  note_syns = note_vocab.select { |e| e.include?(' USE ') }
  notes = note_vocab - note_syns

  notes.each do |n|
    Note.create( name: n )
  end
end

def populate_scent_note
  scentbase = CSV.read('lib/data/scents.csv', :headers => true)
  snbase = CSV.read('lib/data/scentnotes.csv', :headers => true)
  brand_lookup = create_brand_object_hash(scentbase)
  note_lookup = {}
  scent_lookup = {}
  snbase.each do |sn|
    note = sn.field('note name')
    scent = sn.field('oil')
    brand = sn.field('Brand')

    brand_object = brand_lookup[brand]

    if note_lookup.has_key?(note)
      note_object = note_lookup[note]
    else
      note_object = Note.where(name: note).first
      note_lookup[note] = note_object
    end

    if scent_lookup.has_key?(scent)
      scent_object = scent_lookup[scent]
    else
      scent_object = Scent.where(name: scent, brand: brand_object).first
      scent_lookup[scent] = scent_object
    end

    ScentNote.create(scent: scent_object, note: note_object)
  end
end

populate_brand
populate_scent
populate_note
populate_scent_note
