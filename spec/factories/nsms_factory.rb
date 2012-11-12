
FactoryGirl.define do

  # FK_Tablename

  #Guard
  factory :generic_guard, class: Guard do
    guard_id "1"
    fk_staff__info factory: :generic_guard_s
  end

  #Manager
  factory :generic_manager, class: Manager do
    generic_manager_id "1"
    staff_info factory: :generic_manager_s
  end

  #Staff
  factory :staff do
    factory :generic_guard_s do
      name "Mat Guard"
      staff_code "G01987"
      address "12, Jalan Twelve, Kuala Lumpur"
      birthdate {25.years.ago}
    end
    factory :generic_manager_s do
      name "Boss Mama"
      staff_code "B01957"
      address "27, Jalan College, Kuala Lumpur"
      birthdate {40.years.ago}
    end
  end

  #Location
  factory :location do
    factory :greenhouse_lane do
      name "Greenhouse Lane"
      code "LOC0001"
    end
    factory :bluehouse_lane do
      name "Bluehouse Lane"
      code "LOC0002"
    end
  end

  #Checkpoint
  factory :checkpoint_report do
    time_reported {3.hours.ago}
    guard factory: :generic_guard
  end

  factory :checkpoint do
    nfc_uid "89120912"
    location factory: :greenhouse_lane
  end

  #Report
  #uses ko leh buat few forms
  #cam leh pecah
  factory :report do

    comments "Lorem ipsum etc reportm"
    fk_guard__reportedby factory: :generic_guard
    #report_type semua ada gak

    #attendance report
    factory :attendance_in_report do
      report_type "attendance"
      attendance_in 1
    end
    #incident report
    factory :incident_report do
      report_type "incident"
      fk_report_media__attachment factory
    end
    #periodic report
    factory :periodic_report do
      report_type "periodic"
    end
    #visitor report
    factory :visitor_report do
      report_type "visitor"
      fk_report_media__attachment
    end
  end

  #Bulletin
  factory :bulletin do
    factory :generic_guard_bulletin do
      staff :generic_guard_s
      bubble "This iz a test for zee vulletins"

    end
  end

  #Visitor
  factory :visitor do
    factory :generic_visitor  do
      reported_by factory: :generic_guard
      identification_no "870101-14-5555"
      plate_no "WNU8571"
      vehicle_type "Car" #buat button like google maps(walk/bus/train)
      comments  "Lorem ipsum dolor sit amet...."
    end
  end

  #ReportMedia
  #If ada same name increment (1)
  factory :report_media do
    factory :report_video do
      filename "20130130-RumahDatinRoziah.mp4" #Format yyyymmdd-name.ext
      filepath "/filepath/"

    end
    factory :report_audio do
      filename "20130131-BunyiBerat.mp3"
      filepath "/filepath/"
    end
    factory :report_gambar do
      filename "20130129-WNU8571-locationname.jpg" #keta terus kasi
    end
  end

end
