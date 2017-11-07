defmodule GrabCikgu.Tutorial.TeachingSubject do
  use GrabCikgu.Web, :model

  alias GrabCikgu.Tutorial.TeachingSubject

  schema "teaching_subjects" do
    field :rate, :float
    field :rate_in_cents, :integer
    belongs_to :subject, GrabCikgu.Tutorial.Subject
    # belongs_to :tutor, GrabCikgu.Tutorial.Tutor, foreign_key: :user_id
    belongs_to :user, GrabCikgu.Account.User
  end

  @all_fields ~w(rate subject_id)a
  @required_fields @all_fields
  @doc false
  def changeset(%TeachingSubject{} = teaching_subject, attrs) do
    teaching_subject
    |> cast(attrs, @all_fields)
    |> validate_required(@required_fields)
  end
end
