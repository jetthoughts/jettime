class Task
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  field :billable, :type => Boolean
  field :rate, :type => Float
end
