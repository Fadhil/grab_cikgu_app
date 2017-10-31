defmodule GrabCikgu.Video do
  use GrabCikgu.Web, :model

  schema "videos" do
    field :url, :string
    field :title, :string
    field :description, :string
    belongs_to :user, GrabCikgu.Account.User, foreign_key: :user_id

    timestamps()
  end

  @required_fields ~w(url title description)
  @optional_fields ~w()

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

end