 class Star
    attr_accessor :first_name, :last_name
    
        def initialize( options )
            @id = options['id'].to_i if options['id']
            @first_name = options['first_name']
            @last_name = options['last_name']
        end
  
        def save()
            sql = "INSERT INTO stars
            (
                first_name,
                last_name
            )
            VALUES
            (
                $1, $2
            )
            RETURNING id"
            values = [@first_name, @last_name]
            star = SqlRunner.run( sql, values ).first
            @id = star['id'].to_i
        end

        def delete()
            sql = "DELETE FROM stars WHERE id = $1"
            values = [@id]
            SqlRunner.run(sql, values)
        end
    
        def Star.all()
            sql = "SELECT * FROM stars"
            stars = SqlRunner.run(sql)
            return Star.map_items(stars)
        end
    
        def Star.delete_all()
            sql = "DELETE FROM stars"
            stars = SqlRunner.run(sql)
        end
    
        def Star.map_items(array)
            return array.map{ |options| Star.new(options) }
        end
 end
