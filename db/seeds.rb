# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
unless Cmsimple::Page.where(is_root: true).first
  page = Cmsimple::Page.create is_root: true, title: 'Home', template: 'default'
  page.publish!
end

{ 'Founder'         => 'bulb',
  'Growth'          => 'Graph',
  'Design'          => 'pen',
  'Product'          => 'pen',
  'Developer'       => 'markup',
  'Maker'           => 'factory',
  'Headline Events' => 'bulb',
  'Basecamp'        => 'logo',
  'Social Events'   => 'social' }.each do |track_name, icon|
  t = Track.where(name: track_name).first_or_initialize
  t.icon = icon
  t.save!
end
