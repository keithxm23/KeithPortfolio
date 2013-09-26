""" try later
require 'vienna'
run Vienna
"""
"""
use Rack::Static, 
  :urls => ["/images", "/font", "/js", "/css", "/ico", "/dark-skin", 
    "/project1.html", "/project2.html", "/project3.html", "/resume.pdf"],
  :root => "public"

run lambda { |env|
  [
    200, 
    {
      'Content-Type'  => 'text/html', 
      'Cache-Control' => 'public, max-age=86400' 
    },
    File.open('public/index.html', File::RDONLY)
  ]
}
"""
use Rack::TryStatic, 
    root: "public",  # static files root dir
    urls: %w[/],     # match all requests 
    try: ['.html', 'index.html', '/index.html'] # try these postfixes sequentially

# otherwise 404 NotFound
run lambda { [404, {'Content-Type' => 'text/html'}, ['whoops! Not Found']]}