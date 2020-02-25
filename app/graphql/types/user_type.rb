module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :votes, [VoteType], null: false
    field :votes_count, Integer, null: false, method: :itself
    field :links, [LinkType], null: false
    field :links_count, Integer, null: false, method: :itself

    def votes_count
      object.votes.count
    end

    def links_count
      object.links.count
    end
  end
end
