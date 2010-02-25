class CreateContracts < ActiveRecord::Migration
  def self.up
    create_table :contracts do |t|
      t.string :name
      t.date :date_registry
      t.string :document

      t.timestamps
    end
  end

  def self.down
    drop_table :contracts
  end
end
