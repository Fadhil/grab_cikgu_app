defmodule GrabCikgu.Repo.Migrations.CreateGrabCikgu.Account.Profile do
  use Ecto.Migration

  def change do
    create table(:account_profiles) do
      add :name, :string
      add :icno, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:account_profiles, [:user_id])
  end
end
