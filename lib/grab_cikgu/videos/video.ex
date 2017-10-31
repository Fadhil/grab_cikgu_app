defmodule GrabCikgu.Videos.Video do
  use Ecto.Schema
  import Ecto.Changeset
  alias GrabCikgu.Videos.Video


  schema "videos_videos" do

    timestamps()
  end

  @doc false
  def changeset(%Video{} = video, attrs) do
    video
    |> cast(attrs, [])
    |> validate_required([])
  end
end
