defmodule WebSite.Course do
  defstruct [:id, :title, :teacher, :status, :eap, :teaching_semester, :course_code, :image_path]
end

defmodule WebSite.Courses do
  def list_courses do
    [
      %WebSite.Course{
        id: 1,
        title: "Programming in C#",
        teacher: "Andres Käver",
        status: "in progress",
        eap: 6,
        teaching_semester: "autumn",
        course_code: "ICD0008",
        image_path: "/images/c_sharp.png"
      },
      %WebSite.Course{
        id: 2,
        title: "JavaScript",
        teacher: "Andres Käver",
        status: "backlog",
        eap: 6,
        teaching_semester: "spring",
        course_code: "ICD0006",
        image_path: "/images/javascript.png"
      },
      %WebSite.Course{
        id: 3,
        title: "Java",
        teacher: "Märt Kalmo",
        status: "done",
        eap: 6,
        teaching_semester: "spring",
        course_code: "ICD0019",
        image_path: "/images/java.svg"
      }
    ]
  end
end
