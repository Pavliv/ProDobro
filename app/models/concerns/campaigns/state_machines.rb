module Campaigns
  module StateMachines
    extend ActiveSupport::Concern

    included do
      include AASM

      aasm do
        state :new, initial: true
        state :published, :on_hold, :closed

        event :publish do
          transitions from: %i[new on_hold], to: :published
        end

        event :hold do
          transitions from: :published, to: :on_hold
        end

        event :close do
          transitions from: %i[published on_hold], to: :closed
        end
      end
    end
  end
end
