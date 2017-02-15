module CampsHelper
  def camp_photo(camp)
    if camp.photo
      cl_image_path camp.photo
    else
      " "
    end
  end
end
