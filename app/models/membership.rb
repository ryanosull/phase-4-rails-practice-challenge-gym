class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validate :join_gym_once

  def join_gym_once
    if Membership.find_by(gym: self.gym, client: self.client)
      self.errors.add(:client, "can't join this gym more than once!")
    end
  end













  #
end
