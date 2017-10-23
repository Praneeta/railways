class TrainSchedule < ApplicationRecord
  belongs_to :train
  serialize :days,Array
end
