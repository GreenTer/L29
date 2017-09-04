class CreateBarbers < ActiveRecord::Migration
  def change

  	create_table :barbers do |t|
  		t.text :name

  		t.timestamps # следит за оформлением/обновлении таблицы
  	end

  	Barber.create :name => 'Jessie Pinkman'
  	Barber.create :name => 'Walter White'
  	Barber.create :name => 'Gus Fring'  	

  end
end
