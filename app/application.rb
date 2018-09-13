class Application
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path == /items/
      @@items.each do |item|
        resp.write "#{item.price}\n"
        elsif req.path 
         resp.status = 404
      end
      resp.finish
    end  
  end
end