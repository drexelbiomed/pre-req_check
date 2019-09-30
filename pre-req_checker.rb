require 'csv'



def pre_req_check(course)
  pre_requisite = []
  concurrent = []
  
  post_requisite = []

  def pre_requisite(course)

  end

  def concurrent_requirement(course)

  end

  def co_requisite(course)

  end

  CSV.foreach('data/STU-Course Catalog_201915.csv', headers: true) do |header|
    if header["Cat Course"] == course
      if header["Cat Preq Concurrency Ind"] == "Y"
        concurrent << header["Cat Preq Course"]
      else
        pre_requisite << header["Cat Preq Course"]
      end
    end
  end
  p pre_requisite
end

pre_req_check("BMES 326")