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
    result = sel.execute(id).next
    pkmn = Pokemon.new(id: result[0], name: result[1], type: result[2], db: db) if !result.empty?
  end
end
