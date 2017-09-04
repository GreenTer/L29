class CreateBarbers < ActiveRecord::Migration[4.2]
  def change

  	create_table :barbers do |t|
  		t.text :name

  		t.timestamps
  	end

  	Barber.create :name => 'Александр Евгеньевич'
  	Barber.create :name => 'Лев Александрович'
  	Barber.create :name => 'Дарья Олеговна'
   	Barber.create :name => 'Елена Георгиевна'
    Barber.create :name => 'Олег Евгеньевич'
    
  end
end