require 'csv'
require './known_courses.rb'

def pre_req_check(course)

  def form_input(course)
    include KnownCourses
  end

  form_input(course)

  # course_code = course.split(" ")[0].upcase
  # course_number = course.split(" ")[1]

  # course = "#{course_code} #{course_number}"

  # pre_requisite_data = []
  # post_requisite_data = []

  # CSV.foreach('data/STU-Course Catalog_201915.csv', headers: true) do |header|
    
  #   if header["Cat Course"] == course
  #     sequence = Hash.new
  #     sequence["Sequence Number"] = header["Cat Preq Seqno"]
  #     sequence["Connector"] = header["Cat Preq Connector"]
  #     sequence["Connector Description"] = header["Cat Preq Conn Desc"]
  #     sequence["Left Parenthesis"] = header["Cat Preq Lparen"]
  #     sequence["pre-requisite"] = header["Cat Preq Course"]
  #     sequence["Concurrency Indicator"] = header["Cat Preq Concurrency Ind"]
  #     sequence["Right Parenthesis"] = header["Cat Preq Rparen"]
  #   end
  #   pre_requisite_data << sequence

    

  #   if header["Cat Preq Course"] == course
  #     postreqs = Hash.new
  #     postreqs["postreq"] = header["Cat Course"]
  #     postreqs["Concurrency Indicator"] = header["Cat Preq Concurrency Ind"]
  #     postreqs["Concurrency Course"] = header["Cat Course"]

      
  #   end

  #   post_requisite_data << postreqs
    
  # end

  # post_requisite = post_requisite_data.compact.uniq
  # post_requisite.delete_if { |postreq| postreq["Concurrency Indicator"] != "Y" }

  # pre_requisites = pre_requisite_data.compact.uniq

  # result = []
  # # pre-req cleanup
  # pre_requisites.each do |pre_req|
  #   result << pre_req["Connector Description"]
  #   result << pre_req["Left Parenthesis"]
  #   result << pre_req["pre-requisite"]
  #   result << pre_req["Concurrency Indicator"]
  #   result << pre_req["Right Parenthesis"]
  # end

  # result

  # if result == []
  #   "That course was not found. Please try another course."
  # elsif result.compact == [" "]
  #   "This course does not have any pre-requisites."
  # else
  #   if result.include? "Y"
  #     concurrency = []
  #     result.compact.each do |item|
  #       if item == "Y"
  #         concurrency << "- can be taken concurrently"
  #       else
  #         concurrency << item
  #       end
  #     end
  #     concurrency.join(" ")
  #   else
  #     result.compact.join(" ")
  #   end
  # end
end

p pre_req_check("MATH 121")