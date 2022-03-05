# :id Integer This is a primary key
# :name String [1, 20] characters
# :age Integer
# :address String [1, 25] characters.
# :salary Integer

class Employee < ApplicationRecord
    validates :name, length: { in: 1..20 }
    validates :address, length: { in: 1..25 }

    self.primary_key = 'id'
end
