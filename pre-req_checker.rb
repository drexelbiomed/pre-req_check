require 'csv'
require './known_courses.rb'

def pre_req_check(input)

  def form_input(input)

    course_code = input.split(" ")[0].upcase
    course_number = input.split(" ")[1]
    upcased_input = "#{course_code} #{course_number}"

    if $known_courses.include? upcased_input
      upcased_input
    else
      return "Course not found or not entered correctly. e.g. Name Number. (MATH 200, HIST 101)"
    end

  end

  course = form_input(input)

  def csv_info_extract(course)
    all_data = []
    pre_requisite_data = []
    post_requisite_data = []

    CSV.foreach('data/STU-Course Catalog_201915.csv', headers: true) do |header|
      
      # Gathers pre-req info
      if header["Cat Course"] == course
        prereqs = Hash.new
        prereqs["Sequence Number"] = header["Cat Preq Seqno"]
        prereqs["Connector"] = header["Cat Preq Connector"]
        prereqs["Connector Description"] = header["Cat Preq Conn Desc"]
        prereqs["Left Parenthesis"] = header["Cat Preq Lparen"]
        prereqs["pre-requisite"] = header["Cat Preq Course"]
        prereqs["Concurrency Indicator"] = header["Cat Preq Concurrency Ind"]
        prereqs["Right Parenthesis"] = header["Cat Preq Rparen"]
      end
      pre_requisite_data << prereqs
  
      
      # Gathers post-req info
      if header["Cat Preq Course"] == course
        postreqs = Hash.new
        postreqs["postreq"] = header["Cat Course"]
        postreqs["Concurrency Indicator"] = header["Cat Preq Concurrency Ind"]
        postreqs["Concurrency Course"] = header["Cat Course"]
      end
      post_requisite_data << postreqs
      
    end
    
    all_data << pre_requisite_data
    all_data << post_requisite_data
  end
  csv_info_extract(course)

  



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

p pre_req_check("MaTH 122")