# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.create(name: "NV Medicaid", gem_home: "/home/rt/.rvm/gems/ruby-1.9.3-p392@nv_medicaid_mri")
Project.create(name: "NV Medicare", gem_home: "/home/rt/.rvm/gems/ruby-1.9.3-p374@nv_medicare_mri")
Project.create(name: "Well Portal", gem_home: "/home/rt/.rvm/gems/ruby-1.9.3-p392@WellPortal_mri")
Project.create(name: "Trackers", gem_home: "/home/rt/.rvm/gems/jruby-1.7.0.RC1@Trackers")
Project.create(name: "Cardholder", gem_home: "/home/rt/.rvm/gems/jruby-1.7.3@Cardholder")
Project.create(name: "CATS", gem_home: "/home/rt/.rvm/gems/jruby-1.7.0.RC1@CATS")
Project.create(name: "Cheetah Cub", gem_home: "/home/rt/.rvm/gems/ruby-1.9.3-p392@cheetah_cub")
Project.create(name: "PatientManager Engine", gem_home: "/home/rt/.rvm/gems/jruby-1.7.0.RC1@rails_engines")
