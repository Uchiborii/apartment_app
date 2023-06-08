class Station < ApplicationRecord
  belongs_to :apartment, inverse_of: :stations, optional: true
end
