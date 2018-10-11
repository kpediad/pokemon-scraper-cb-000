class Pokemon

  attr_reader :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    self
  end

  def self.save(name, type, db)
    ins = db.prepare('INSERT INTO pokemon (name, type) VALUES (?, ?)')
    ins.execute(name, type)
  end

  def self.find(id, db)
    sel = db.prepare('SELECT * FROM pokemon WHERE pokemon.id = ?')
    result = sel.execute(id)
    puts sel.inspect
    puts result.inspect
    puts result[0]['id']
    puts result[0]['name']
    puts result[0]['type']
    pkmn = Pokemon.new(id: result[0], name: result[1], type: result[2], db: db) if !result
  end
end
