defmodule GrabCikgu.Repo.Migrations.CreateGrabCikgu.Account.Video do
  use Ecto.Migration

  def change do
    create table(:account_videos) do
      add :url, :string
      add :title, :string
      add :description, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:account_videos, [:user_id])
  end
end