
def customer_interface
  quit=nil
  while quit !='n'
    puts "Which client has come into the shelter?"
    list_clients
    current_customer = gets.chomp  #This may need #'s to select from?
    validate_customer(current_customer)  #checks to see that selected customer in is in the list
    puts "what does #{shelter_1.clients[current_customer-1].name} want to do today?"
    puts "(A)dopt a pet?"
    puts "(G)ive up a pet?"
    puts "(V)isit with the animals at the shelter?"
    puts "(L)ist HappiTrails other clients?"
    action = gets.chomp
    action = action_validator(action)
    case action
    when 'G'
      custom_gives_up_pet(shelter_1.clients[current_customer+1])
    when 'A'
      customer_adopts_pet(shelter_1.clients[current_customer+1])
    when 'V'
      shelter_1.list_animals
    when 'L'
      shelter_1.list_clients
    end
    puts "Are there any more customers to take care of today?  (Y)es, (N)o"
    quit =gets.chomp.downcase!
  end
end


def validate_customer(current_customer)
  while current_customer > shelter_1.clients.length
    puts "Please selecr a valid customer #"
    current_customer = gets.chomp.to_i
  end
end


def custom_gives_up_pet(customer)
  while true
    puts "Which pet are you giving up #{client name}"#fix client name
    customer.list_pets
    pet_index = gets.chomp.to_i - 1
    pet = customer.pets[pet_index]
    if pet_index < 0 || pet_index > customer.pets.length - 1 # Index out of bounds
      puts "Invalid animal choice."
      next
    end
    customer.give_animal(shelter_1, pet)
    break
  end
end



def custom_gives_up_pet(client)
  puts "Which pet are you giving up #{client name}"#fix client name
  (current_customer).list_pets#this needs to be fixed so that (current_custom)
  #client object.  aslo client class need function, list_pets
  #with #'s?
  pet_index = gets.chomp,to_i
  validat_pet_index(pet_index, current_customer_as_object)#fix customer object, same as above
  current_customer_as_object.give_animal(shelter_1, animal_as_objeect)

  def customer_adopts_pet(customer)
    while true
      puts "Which pet would you like to adopt?"
      shelter_1.list_animals #TODO implement feature that lists numbers with names in shelter class. list_animals_with_numbers
      animal_index = gets.chomp.to_i - 1
      if pet_index < 0 || pet_index > shelter_1.animals.length - 1
        puts "Invalid animal choice"
      end
      customer.adopt_animal(shelter_1, shelter_1.animals[animal_index])
      break
    end
  end
  def list_clients
    shelter_1.list_clients
  end

  def action_validator(action)
    while !(action =='A' || action =='G' || action =='V' || action =='L')
      action.upcase!
      puts "Please enter (A)dopt, (G)ive, (V)isit, or (L)ist"
      action = gets.chomp
    end
    action
  end



