require_relative('./models/movie')
require_relative('./models/casting')
require_relative('./models/star')

require('pry')

Movie.delete_all()
Star.delete_all()

@movie1 = Movie.new({
    "title" => "The Seven Samurai",
    "genre" => "War"
})
@movie1_id = @movie1.save

# John Wayne films
@movie2 = Movie.new({
    "title" => "Stagecoach",
    "genre" => "Western"
})
@movie2_id = @movie2.save
@movie3 = Movie.new({
    "title" => "The Longest Day",
    "genre" => "Western"
})
@movie3_id = @movie3.save


@star1 = Star.new({
    "first_name" => "John",
    "last_name" => "Wayne"
})

@star1.save()

binding.pry
nil