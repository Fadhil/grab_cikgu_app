defmodule GrabCikgu.Account.Profile do
  use Ecto.Schema
  import Ecto.Changeset
  alias GrabCikgu.Account.Profile


  schema "account_profiles" do
    field :icno, :string
    field :name, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Profile{} = profile, attrs) do
    profile
    |> cast(attrs, [:name, :icno])
    |> validate_required([:name, :icno])
  end
end
