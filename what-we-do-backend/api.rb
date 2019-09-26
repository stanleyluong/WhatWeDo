
# https://tastedive.com/api/similar?q=eminem%2C+pulp+fiction

# https://tastedive.com/api/similar?k=346710-BrittanF-PHC42GKW&q=dark+crystal%2C+labyrinth&type=movies%2C+shows&verbose=1&limit=20
def search
    url = 'https://tastedive.com/api/similar?k=346710-BrittanF-PHC42GKW&q='+query+type
    response = RestClient.get(url)
    $parsed_response = JSON.parse(response)
end

def translator(array)
  array.map! do |search| 
    if search != array[-1] then
      search = search.split(" ")
      search.map! do |word|
        word != search[-1] ? word+"+" : word+"%2C+"
      end
    else
      search = search.split(" ")
        search.map! do |word|
        word!= search[-1] ? word+"+" : word
      end
    end
  end
  array = array.flatten.join("")
end

def makeUrl(query, type)
  key = '346710-BrittanF-PHC42GKW'
  url = "https://tastedive.com/api/similar?k=#{key}&q="+translator(query)+"&type="+translator(type)
end

query = ['red hot chili peppers','pulp fiction','burger king', "dark crystal","labyrinth"]
type = ['movies','shows']
makeUrl(query,type)