""" try later
require 'vienna'
run Vienna
"""
use Rack::Static, 
  :urls => ["/images", "/font", "/js", "/css", "/ico", "/dark-skin", "/resume.pdf"],
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

map "/resume.pdf" do
  run Rack::File.new("resume.pdf")
end