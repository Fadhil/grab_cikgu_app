defmodule GrabCikgu.Account.Profile do
  use Ecto.Schema
  import Ecto.Changeset
  alias GrabCikgu.Account.Profile


  schema "account_profiles" do
    field :icno, :string
    field :name, :string
    field :gender, :string
    field :age, :integer
    field :job, :string
    field :status, :string
    field :city, :string
    field :license, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Profile{} = profile, attrs) do
    profile
    |> cast(attrs, [:name, :icno, :gender, :age, :job, :status, :city, :license])
    |> validate_required([:name, :icno, :gender, :age, :job, :status, :city, :license])
  end
end
