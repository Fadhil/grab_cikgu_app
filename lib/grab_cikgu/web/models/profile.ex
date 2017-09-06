defmodule GrabCikgu.Profile do
  use GrabCikgu.Web, :model

  schema "profiles" do
    field :name, :string
    field :icno, :string
    field :gender, :string
    field :age, :integer
    field :job, :string
    field :status, :string
    field :city, :string
    field :license, :string
  
    belongs_to :user, GrabCikgu.User, foreign_key: :user_id

    timestamps()
  end

  @required_fields ~w()
  @optional_fields ~w(name icno gender age job status city license)

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

end