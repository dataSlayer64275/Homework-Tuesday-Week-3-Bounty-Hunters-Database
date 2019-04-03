require('pg')

class Bounty

  attr_reader :id
  attr_accessor :name, :bounty_value, :danger_level, :homeworld

  def initialize(attributes)
    @name = attributes['name']
    @bounty_value = attributes['bounty_value']
    @danger_level = attributes['danger_level']
    @homeworld = attributes['homeworld']
    @id = attributes['id'].to_i if attributes['id']
  end

  def save
    db = PG.connect ({dbname: 'bounty_table', host: 'localhost'})
    sql = 'INSERT INTO bounty_table
          (
            name,
            bounty_value,
            danger_level,
            homeworld
          )
          VALUES ($1, $2, $3, $4)
          RETURNING id
          '
    values = [@name,@bounty_value,@danger_level,@homeworld]
    db.prepare('save',sql)
    @id = db.exec_prepared('save', values)[0]['id'].to_i #What is this part?
    db.close
  end

  def Bounty.all
    db = PG.connect ({dbname: 'bounty_table', host: 'localhost'})
    sql = 'SELECT * FROM bounty_table'
    db.prepare('all',sql)
    bounties = db.exec_prepared('all')
    db.close
    return bounties.map {|bounty| Bounty.new(bounty)}
  end

  def Bounty.delete_all
    db = PG.connect ({dbname: 'bounty_table', host: 'localhost'})
    sql = 'DELETE * FROM bounty_table'
    db.prepare('de;ete_all',sql)
    orders = db.exec_prepared('delete_all')
    db.close
  end

  def delete
    db = PG.connect ({dbname: 'bounty_table', host: 'localhost'})
    sql = 'DELETE FROM bounty_table WHERE id = $1'
    values = [@id]
    db.prepare('delete',sql)
    orders = db.exec_prepared('delete',values)
    db.close
  end

  def update
    db = PG.connect ({dbname: 'bounty_table', host: 'localhost'})
    sql = "UPDATE bounty_table
          SET (
          name,
          bounty_value,
          danger_level,
          homeworld
          ) =
          (
            $1, $2, $3, $4
          )
          WHERE id = $5
          "
    values = [@name,@bounty_value,@danger_level,@homeworld,@id]
    db.prepare('update_one',sql)
    db.exec_prepared('update_one',values)
    db.close
  end
end
