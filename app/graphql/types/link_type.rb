module Types
  class LinkType < Types::BaseObject
    field :id, ID, null: false
    field :url, String, null: false
    field :description, String, null: false
    field :posted_by, UserType, null: true, method: :user
    field :votes, [Types::VoteType], null: false
    field :vote_count, Integer, null: false, method: :itself # pass-through the underlying object using method: :itself

    def vote_count
      object.votes.count
    end
  end
end
