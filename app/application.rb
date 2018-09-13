class Application
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      @@items.each do |item|
        resp.write "#{item.price}\n"
        
      end
        elsif req.path !~ (/items/)
         resp.write "Route not found"
         resp.status = 404
      end
      resp.finish
  end
end