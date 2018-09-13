class Application
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if item = @@items.detect{|i| i.name == item_name}
        resp.write item.price
      else 
        resp.status = 400
        resp.write "Route not found"
      end
     else  
      resp.finish
  end
end