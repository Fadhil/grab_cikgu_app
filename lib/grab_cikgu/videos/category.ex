defmodule GrabCikgu.Videos.Category do
  use Ecto.Schema
  import Ecto.Changeset
  alias GrabCikgu.Videos.Category


  schema "video_categories" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Category{} = category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
