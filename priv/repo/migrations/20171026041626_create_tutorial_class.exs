defmodule GrabCikgu.Repo.Migrations.CreateGrabCikgu.Tutorial.Class do
  use Ecto.Migration

  def change do
    create table(:tutorial_classes) do
      add :subject, :string

      timestamps()
    end

  end
end
