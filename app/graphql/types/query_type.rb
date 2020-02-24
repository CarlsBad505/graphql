module Types
  class QueryType < Types::BaseObject
    field :all_links, [LinkType], null: false
    field :all_users, [UserType], null: false

    def all_links
      Link.all
    end

    def all_users
      User.all
    end
  end
end
