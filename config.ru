""" try later
require 'vienna'
run Vienna
"""

use Rack::Static, 
  :urls => ["/images", "/font", "/js", "/css", "/ico", "/dark-skin", 
    "/projet1.html", "/projet2.html", "/projet3.html", "/resume.pdf"],
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
