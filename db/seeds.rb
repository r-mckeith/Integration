# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Part.create([
              {
                name: 'Self',
                role: 'Self',
                description: 'Compassion, curiosity, clarity, creativity, calm, confidence, courage, and connectedness',
                protective: false,
                vulnerable: false,
                photo: 'https://media1.popsugar-assets.com/files/thumbor/cwtw83iwC-IWn2KoOo_lRi87pUQ/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2018/01/18/594/n/44242358/tmp_H4arPQ_856fec404822f855_pexels-photo-415380.jpeg',
                integrated: true
              },
              {
                name: 'Time Keeper',
                role: 'Manager',
                description: 'The Time Keeper likes to make sure all the trains run on time.',
                protective: true,
                vulnerable: false,
                photo: 'https://images.squarespace-cdn.com/content/v1/5dd5d482354a76685e11529e/1656325682235-BBWFJ1QB4Y38RVJOLW4H/unsplash-image-ufgOEVZuHgM.jpg',
                integrated: false
              },
              {
                name: 'The Caretaker',
                role: 'Manager',
                description: 'The caretaker likes to take care of everyone around them.',
                protective: true,
                vulnerable: false,
                photo: 'https://mommybites.com/wp-content/uploads/2021/03/tormenting-babysitter.jpg',
                integrated: false
              },
              {
                name: 'The Tough One',
                role: 'Firefighter',
                description: 'The Tough One likes to keep others away with power and force.',
                protective: true,
                vulnerable: false,
                photo: 'https://ca-times.brightspotcdn.com/dims4/default/87213b8/2147483647/strip/true/crop/3642x2068+0+0/resize/1200x681!/quality/80/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Ffd%2F4c%2Fb0bda4ec4a6c8052d2be45199fcf%2Fgettyimages-1195327712.jpg',
                integrated: false
              },
              {
                name: 'The Timid One',
                role: 'Exile',
                description: 'The Timid One is timid because is timid is timid.',
                protective: false,
                vulnerable: true,
                photo: 'https://i.pinimg.com/originals/24/cf/bd/24cfbd7c63f9983da979104c2d8e0ce2.jpg',
                integrated: false
              },
              {
                name: 'The Quiet One',
                role: 'Exile',
                description: 'The quiet one is quiet because quiet because scared.',
                protective: false,
                vulnerable: true,
                photo: 'https://t3.ftcdn.net/jpg/01/19/11/70/360_F_119117060_ayMpflR3LLQxO6Ry5xbRVVJZExWmIwci.jpg',
                integrated: false
              }
            ])
