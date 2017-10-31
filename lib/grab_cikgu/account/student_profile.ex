defmodule GrabCikgu.Account.StudentProfile do
  use Ecto.Schema
  import Ecto.Changeset
  alias GrabCikgu.Account.StudentProfile


  schema "account_student_profiles" do
    field :age, :integer
    field :gender, :string
    field :grade, :string
    field :icno, :string
    field :name, :string
    field :school, :string
    belongs_to :user, GrabCikgu.Account.User, foreign_key: :user_id

    timestamps()
  end

  @doc false
  def changeset(%StudentProfile{} = student_profile, attrs) do
    student_profile
    |> cast(attrs, [:name, :icno, :gender, :age, :grade, :school])
  end
end
