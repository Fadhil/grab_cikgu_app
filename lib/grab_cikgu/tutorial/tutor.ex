defmodule GrabCikgu.Tutorial.Tutor do
  use GrabCikgu.Web, :model

  schema "users" do
    field :name, :string
    field :username, :string
    has_one :profile, GrabCikgu.Account.Profile
    belongs_to :role, GrabCikgu.Account.Role, on_replace: :nilify
  end
end
