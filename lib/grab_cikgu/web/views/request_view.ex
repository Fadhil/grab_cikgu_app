defmodule GrabCikgu.Web.RequestView do
  use GrabCikgu.Web, :view

  def teaching_rate(tutor) do
    (tutor.teaching_subjects |> List.first).rate
  end

  def teaching_area(tutor) do
    tutor.profile.area
  end
  
  def subject_name(subjects) do
    teaching_subject = subjects |> List.last
    subject = teaching_subject.subject
    "#{subject.name} - #{subject.grade}"
  end
end
