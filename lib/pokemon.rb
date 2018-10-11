class Pokemon

  attr_reader :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)

  end

  def self.save(name, type, db)
    ins = db.prepare('INSERT INTO pokemon (name, type) VALUES (?, ?)')
    ins.execute(name, type)
  end

  def self.find(id)

  end
end
