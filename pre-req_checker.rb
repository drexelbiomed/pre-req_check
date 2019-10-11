require 'csv'

def pre_req_check(course)

  course_code = course.split(" ")[0].upcase
  course_number = course.split(" ")[1]

  course = "#{course_code} #{course_number}"

  pre_requisite_data = []

  CSV.foreach('data/STU-Course Catalog_201915.csv', headers: true) do |header|
    
    if header["Cat Course"] == course.upcase
      sequence = Hash.new
      sequence["Sequence Number"] = header["Cat Preq Seqno"]
      sequence["Connector"] = header["Cat Preq Connector"]
      sequence["Connector Description"] = header["Cat Preq Conn Desc"]
      sequence["Left Parenthesis"] = header["Cat Preq Lparen"]
      sequence["pre-requisite"] = header["Cat Preq Course"]
      sequence["Concurrency Indicator"] = header["Cat Preq Concurrency Ind"]
      sequence["Right Parenthesis"] = header["Cat Preq Rparen"]
    end
    pre_requisite_data << sequence
  end
  pre_requisites = pre_requisite_data.compact.uniq.sort_by { |k| k["Sequence Number"]}

  result = []
  pre_requisites.each do |pre_req|
    result << pre_req["Connector Description"]
    result << pre_req["Left Parenthesis"]
    result << pre_req["pre-requisite"]
    result << pre_req["Concurrency Indicator"]
    result << pre_req["Right Parenthesis"]
  end

  result.compact.join(" ")
end

p pre_req_check("wut")