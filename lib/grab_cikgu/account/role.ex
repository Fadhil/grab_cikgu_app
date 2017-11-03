defmodule GrabCikgu.Account.Role do
  use Ecto.Schema
  import Ecto.Query
  import Ecto.Changeset
  alias GrabCikgu.Account.Role

  schema "roles" do
    field :name, :string
    has_many :users, GrabCikgu.Account.User
    has_many :profiles, GrabCikgu.Account.Profile
    timestamps()
  end

  @doc false
  def changeset(%Role{} = role, attrs) do
    role
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end

  def alphabetical(query) do
    from r in query, order_by: r.name
  end

  def names_and_ids(query) do
    from r in query, select: {r.name, r.id}
  end
end
