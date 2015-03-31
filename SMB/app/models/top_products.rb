class TopProducts

  def self.getTop10Products

    data = HTTParty.get("http://svcs.ebay.com/MerchandisingService?OPERATION-NAME=getTopSellingProducts&SERVICE-NAME=MerchandisingService&SERVICE-VERSION=1.1.0&X-EBAY-SOA-GLOBAL-ID=EBAY-IN&CONSUMER-ID=YourAppID&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&maxResults=10")
    products =  data["getTopSellingProductsResponse"]["productRecommendations"]["product"]
    @top10Products = []
    products.each do |product|
      @top10Products << {:imageURL => product["imageURL"], :name => product["title"]}
    end

    return @top10Products
  end
end
