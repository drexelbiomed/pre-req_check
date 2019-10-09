require 'csv'

def pre_req_check(course)
  pre_requisites = []

  CSV.foreach('data/STU-Course Catalog_201915.csv', headers: true) do |header|
    
    if header["Cat Course"] == course
      sequence = Hash.new
      sequence["Sequence Number"] = header["Cat Preq Seqno"]
      sequence["Connector"] = header["Cat Preq Connector"]
      sequence["Connector Description"] = header["Cat Preq Conn Desc"]
      sequence["Left Parenthesis"] = header["Cat Preq Lparen"]
      sequence["pre-requisite"] = header["Cat Preq Course"]
      sequence["Concurrency Indicator"] = header["Cat Preq Concurrency Ind"]
      sequence["Right Parenthesis"] = header["Cat Preq Rparen"]
    end
    pre_requisites << sequence
  end
  pre_requisites.compact.uniq
end

puts pre_req_check("MATH 300")