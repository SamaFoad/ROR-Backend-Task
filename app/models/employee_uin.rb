class EmployeeUin < ApplicationRecord
    # belongs_to :employee

    validates :uin, uniqueness: true
    self.primary_key = 'id'
end
