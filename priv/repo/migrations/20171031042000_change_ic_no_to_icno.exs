defmodule GrabCikgu.Repo.Migrations.ChangeIcNoToIcno do
  use Ecto.Migration

  def change do
    rename table(:account_student_profiles), :ic_no, to: :icno
  end
end
