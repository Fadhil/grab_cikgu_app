defmodule GrabCikgu.Web.ClassView do
  use GrabCikgu.Web, :view
  import GrabCikgu.Web.RequestView, only: [teaching_rate: 1, teaching_area: 1, subject_name: 1, user_from: 1, student_name: 1]
end
