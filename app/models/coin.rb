class Coin < ApplicationRecord
  belongs_to :mining_type #, optional: true --> optional: true, não é necessário criar o campo mining_type_id na tabela coins
end
