require_relative "room"

class Hotel
  def initialize(name, capacities)
    @name = name
    @rooms = {}
    capacities.each do |room_name, capacity|
        @rooms[room_name] = Room.new(capacity)
    end
  end

  def name
    @name.split(" ").map { |word| word.capitalize}.join(" ")
  end   

  def rooms
    @rooms
  end  

  def room_exists?(room_name)
    if @rooms[room_name]
        return true
    end
    false
  end

  def check_in(guest_name, room_name)
    if !self.room_exists?(room_name)
        return puts "sorry, room does not exist"
    else
        if @rooms[room_name].add_occupant(guest_name)
            puts "check in successful"
        else
            puts "sorry, room is full"
        end
    end
   end
   
   def has_vacancy? 
        @rooms.values.any? { |room| room.available_space > 0 }
   end

   def list_rooms
    @rooms.each do |room_name, room|
        puts "#{room_name} : #{room.available_space}"
    end
   end



end
