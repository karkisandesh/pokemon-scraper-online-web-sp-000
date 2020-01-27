class Pokemon
  
<<<<<<< HEAD
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    statement = db.prepare("INSERT INTO pokemon (name, type) VALUES (?,?)")
    statement.execute(name,type)
  end

  def self.find(id, db)
    statement = db.prepare("SELECT * FROM pokemon WHERE id = ?")
    result_set = statement.execute(id)

    results = result_set.collect do |row|
      pokemon = Pokemon.new(name: row[1], type: row[2], db: db, id: id)
      pokemon.hp = row[3]
      pokemon
    end
    results[0]
  end

  def alter_hp(hp, db)
    statement = db.prepare("UPDATE pokemon SET hp=? WHERE id=?")
    statement.execute(hp,self.id)
=======
  attr_accessor :id, :name, :type, :db
  
   def initialize(keywords)

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(num, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", [num])
    new_pokemon = self.new(pokemon)
    new_pokemon.id = pokemon[0][0]
    new_pokemon.name = pokemon[0][1]
    new_pokemon.type = pokemon[0][2]
    new_pokemon.db = pokemon[0][3]
    return new_pokemon
  end
  
  def alter_hp(num, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [num], [self.id])
    self.hp = num
>>>>>>> 03eec918b72de8bce420372fbd79280829e74506
  end
end
