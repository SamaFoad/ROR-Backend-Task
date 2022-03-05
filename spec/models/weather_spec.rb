# == Schema Information
#
# Table name: pattern_matchers
#
#  id           :bigint           not null, primary key
#  is_enabled   :boolean
#  pattern      :text
#  replace_with :text
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Weather, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
