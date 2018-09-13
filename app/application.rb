class Application
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path == /items/
      @@items.each do |item|
        resp.write "#{item.price}\n"
      end
        elsif req.path !~ (/items/)
         resp.write "Route not found"
         resp.status = 404
       else 
      end
      resp.finish
  end
end