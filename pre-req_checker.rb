require 'csv'



def pre_req_check(course)
  pre_requisite = []
  concurrent = []
  post_requisite = []


    CSV.foreach('data/STU-Course Catalog_201915.csv', headers: true) do |header|

      # identifies post-requisites
      if header["Cat Preq Course"] == course
        post_requisite << header["Cat Course"]
      end

      # identifies concurrent courses
      if header["Cat Course"] == course && header["Cat Preq Concurrency Ind"] == "Y"
        concurrent << header["Cat Preq Course"]
      end

      # TODO identifies pre-requisites
      if header["Cat Course"] == course 
        if header["Cat Preq Conn Desc"]
          pre_requisite << header["Cat Preq Course"]
        end
      end

    end
    concurrent
end

p pre_req_check("BIO 202")