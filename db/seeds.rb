# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Type.create([
  { name: "History"},
  { name: "Politics"},
  { name: "Study Group"},
  { name: "Language Arts"},
  { name: "Mathematics"},
  { name: "Science"},
  { name: "Health"},
  { name: "Art"},
  { name: "Music"},
  { name: "Theater"},
  { name: "Languages"},
  { name: "Education"},
  { name: "Law"},
  { name: "Computer Science"}
])

Club.create([
  { name: "Matt's Test Club",
    description: "Lorem ipsum dolor sit amet, turpis tellus et facilisis, ac et. Wisi adipiscing et id orci fringilla, auctor luctus eu nonummy accumsan. Vivamus faucibus et pellentesque ut nec nunc. Sed potenti pellentesque risus sit, egestas dictum, vel mauris libero eu elit litora sed, voluptatibus feugiat turpis per odio, vitae donec nisl quis mi ultrices. Nec vitae, morbi netus blandit pellentesque, aliquam velit nisl accumsan ultricies non, mauris a ante iure in et at, nulla mattis eu adipiscing hac. Suspendisse odio aliquet, tristique mauris interdum aenean metus amet tellus, aenean lorem tristique suscipit.
Placerat condimentum. Ullamcorper mattis augue conubia dignissim imperdiet nunc, malesuada donec sed ut neque amet nonummy, sit et parturient euismod, rutrum donec ac vestibulum et erat. Eu mauris vel aliquam mauris neque dui, ut et ullamcorper ullamcorper massa quia augue, dictum donec mauris luctus eros risus, rutrum duis suspendisse vel adipiscing morbi, eu augue aliquam tempor. Non vestibulum neque eget fusce, fringilla magnis purus dapibus, morbi sint, porta quis libero ornare maecenas nullam. Fermentum ac luctus lectus, vel interdum praesent, ligula in gravida natoque dui in, praesent vitae dignissim ac, dolor scelerisque sollicitudin accusantium pellentesque nullam. Aliquam bibendum aliquet aenean quae risus, at arcu ipsum ultricies nisl ipsum fusce, sed mus elit eget, wisi interdum quisque facilisis in, tincidunt velit. Leo integer enim metus quam, eget fusce odio eget massa lorem, in nonummy est sed scelerisque, interdum posuere mattis augue sollicitudin maecenas, lectus habitasse sed viverra tellus fermentum pede. Dapibus felis velit euismod quis quam. Tortor excepturi etiam posuere tempor, at iaculis. Ut eu vestibulum varius erat, donec orci eligendi, erat nulla tristique vivamus rhoncus, eu etiam porttitor amet lorem laoreet, mi vitae diam sit consequat est nec. Tempus egestas. A curabitur ipsum ante tincidunt ac, erat donec.",
    member_number: 5,
    type_id: 3
  }
])
