require_relative('./models/movie')
require_relative('./models/casting')
require_relative('./models/star')

require('pry')

Casting.delete_all()
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
@star1_id = @star1.save()

# in longest day
@star2 = Star.new({
    "first_name" => "Peter",
    "last_name" => "van Eyck"
})
@star2_id = @star2.save()

# in stagecoach
@star3 = Star.new({
    "first_name" => "Claire",
    "last_name" => "Trevor"
})
@star3_id = @star3.save()
@star4 = Star.new({
    "first_name" => "Andy",
    "last_name" => "Devine"
})
@star4_id = @star4.save()

##########

# John Wayne in Stagecoach
r = Casting.new({
    "movie_id" => @movie2_id,
    "star_id" => @star1_id,
    "fee" => 100
})
r.save

# John Wayne in Longest day
Casting.new({
    "movie_id" => @movie3_id,
    "star_id" => @star1_id,
    "fee" => 500
}).save

# Van Eyck in Longest day
Casting.new({
    "movie_id" => @movie3_id,
    "star_id" => @star2_id,
    "fee" => 10
}).save

# Clare Trevor in Stagecoach
Casting.new({
    "movie_id" => @movie2_id,
    "star_id" => @star3_id,
    "fee" => 10
}).save
# Andy Devine in Stagecoach
Casting.new({
    "movie_id" => @movie2_id,
    "star_id" => @star4_id,
    "fee" => 4
}).save

puts Casting.all

binding.pry
nil