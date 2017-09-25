defmodule GrabCikgu.Account.Profile do
  use Ecto.Schema
  use Arc.Ecto.Model
  import Ecto.Changeset
  alias GrabCikgu.Document
  alias GrabCikgu.Account.Profile


  schema "account_profiles" do
    field :icno, :string
    field :name, :string
    field :gender, :string
    field :age, :integer
    field :job, :string
    field :status, :string
    field :state, :string
    field :city, :string
    field :license, :string

    field :qualification, :string
    field :achievement, :string
    field :experience, :string
    field :about, :string
    field :document, GrabCikgu.Document.Type

    field :teaching, :string
    field :area, :string
    field :tuitioncenter, :string

    belongs_to :user, GrabCikgu.User, foreign_key: :user_id
    timestamps()
  end

  @required_fields ~w()
  @optional_fields ~w(name icno gender age job status state city license 
                      qualification achievement experience about
                      teaching area tuitioncenter)

  @required_file_fields ~w()
  @optional_file_fields ~w(document)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields)
    |> cast_attachments(params, @required_file_fields, @optional_file_fields)
  end

end
