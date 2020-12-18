class Expert < User
  has_many :campaigns, foreign_key: 'user_id'
end
