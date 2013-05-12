def test_image_file
  File.join(Rails.root, "test", "support", "image.jpg")
end

def test_image_rack_upload
  Rack::Test::UploadedFile.new(test_image_file, "image/jpeg")
end
