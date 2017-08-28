defmodule GrabCikgu.Web.Video do
  use Ecto.Schema
  import Ecto.Changeset
  alias GrabCikgu.Web.Video


  schema "web_videos" do
    field :description, :string
    field :title, :string
    field :url, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Video{} = video, attrs) do
    video
    |> cast(attrs, [:url, :title, :description])
    |> validate_required([:url, :title, :description])
  end
end
