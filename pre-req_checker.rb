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
      end
      post_requisite_data << postreqs
      
    end
    
    all_data << pre_requisite_data
    all_data << post_requisite_data
  end
  
  extracted_info = csv_info_extract(course)
  pre_req_extract = extracted_info[0]
  post_req_extract = extracted_info[-1]

  def info_cleanup(pre_req_extract,post_req_extract)
    clean_info = []
    # pre-req cleanup
    clean_pre_req = []
    pre_req_extract = pre_req_extract.compact.uniq
    
    pre_req_extract.each do |pre_req|
      clean_pre_req << pre_req["Connector Description"]
      clean_pre_req << pre_req["Left Parenthesis"]
      clean_pre_req << pre_req["pre-requisite"]
      clean_pre_req << pre_req["Concurrency Indicator"]
      clean_pre_req << pre_req["Right Parenthesis"]
    end
    clean_pre_req = clean_pre_req.compact.map { |item| item == "Y" ? item = "- can be taken concurrently" : item }.join(" ")

    clean_info << clean_pre_req

    # pre-req cleanup
    clean_post_req = []
    post_req_extract = post_req_extract.compact.uniq

    post_req_extract.each do |post_req|

      if post_req["Concurrency Indicator"]
        clean_post_req << "#{post_req["postreq"]} - can be taken concurrently"
      else
        clean_post_req << post_req["postreq"]
      end

    end

    clean_info << clean_post_req.join(", ")
  end

  csv_results = info_cleanup(pre_req_extract,post_req_extract)

  def query_results(csv_results)

    if csv_results[0] == "" || csv_results[0] == " "
      csv_results[0] = "None Found."
    end

    if csv_results[0] == "" || csv_results[0] == " "
      csv_results[-1] = "None Found."
    end

    csv_results
  end

  query_results(csv_results)

end

p pre_req_check("BMES 302")