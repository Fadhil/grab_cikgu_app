defmodule GrabCikgu.Repo.Migrations.CreateGrabCikgu.Videos.Category do
  use Ecto.Migration

  def change do
    create table(:video_categories) do
      add :name, :string

      timestamps()
    end

  end
end
