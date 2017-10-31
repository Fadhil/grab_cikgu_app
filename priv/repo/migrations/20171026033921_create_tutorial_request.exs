defmodule GrabCikgu.Repo.Migrations.CreateGrabCikgu.Tutorial.Request do
  use Ecto.Migration

  def change do
    create table(:tutorial_requests) do
      add :rate, :string
      add :subject, :string
      add :area, :string
      add :time, :string
      add :startdate, :string
      add :period, :string
      add :remark, :string

      timestamps()
    end

  end
end
