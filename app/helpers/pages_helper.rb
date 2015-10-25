module PagesHelper

  def journey_header
    str = "<center><h3><i>Journey of</i><b>HOPE</b></h3><p>"
    
    str << if english?
            "To Write Love on Her Arms is a non-profit movement dedicated to presenting
              hope and finding help for people struggling with depression, addiction, self-injury,
              and suicide. TWLOHA exists to encourage, inform, inspire, and also to
              invest directly into treatment and recovery."
          else
            "Untuk Menulis ..."
          end

    str << "</p></center>"

    raw(str)
  end

  def people_header
    str = '<center><img class="flower img-responsive" src="/assets/img/people/flower.png">'
    str << "<h3><i>People Behind</i><b>HOPE</b></h3><p>"
    
    str << if english?
            "It all started with a dream and small hope..."
          else
            "Bermula dari mimpi dan suatu 'harapan' kecil dari beberapa sahabat di bulan Oktober 2014 yang ingin membangkitkan solidaritas dan budaya menyumbang diantara masyarakat dan menyebarkan harapan di segala aspek dalam kehidupan melalui sebuah gelang yang dibuat dari sisa kain designer senior kebanggaan Indonesia, Ghea Panggabean yaitu Kain Pelangi Jumputan, dan Pelangi adalah simbol dari Harapan. Terciptalah Gelang Harapan #BraceletofHOPE yang kemudian menjadi suatu 'Harapan Besar' dan Kenyataan karena energi positif dan sambutan dari semua relawan dan 'Warriors of Hope'(Pejuang Harapan).Gerakkan @gelangharapan berkomitmen untuk terus menyebarkan \"Harapan\", berawal khususnya kepada pejuang kanker dan keluarganya, dan di tahun-tahun mendatang \"Harapan\" di segala aspek dalam Kehidupan."
          end
          
    str << "</p></center>"

    raw(str)
  end
  
  def people_quote(person)
    str = case person
          when :jenna
            str = "<h3><b>janna</b>soekasah joesoef</h3><p>"
            str << if english?
                    '"Hope is making dream comes true"'
                  else
                    '"Harapan adalah cara membuat mimpi menjadi kenyataan"'
                  end
            str << "</p>"
          when :wulan
            str = "<h3><b>Wulan</b>Guritno</h3><p>"
            str << if english?
                    '"Patience, All tribulation will come to end"'
                  else
                    '"Bertahanlah, Segala Kesusahan akan Berakhir"'
                  end
            str << "</p>"
          when :amanda
            str = "<h3><b>amanda</b>soekasah</h3><p>"
            str << if english?
                    '"When you choose hope, everything..."'
                  else
                    '"Saat Engkau memilih Harapan, semua yang kamu pikir tidak mungkin menjadi mungkin.<br>Hope adalah Legacy dan Perjalanan kami.  Selama saya hidup, saya akan terus berusaha untuk terus menyebarkan Harapan"'
                  end
            str << "</p>"
          end 
           
    raw(str)
  end
  
  def news_header
    str = '<center><img class="matahari img-responsive" src="/assets/img/health/matahari.png">'
    str << '<h3><i>Hope Health</i> <b>NEWS</b></h3><p>'
    str << if english?
            "Bracelet of Hope movement working together with RSCM..."
          else
            "Gerakkan Gelang Harapan bekerjasama dengan RSCM dan Ketua Komite Penanggulangan Kanker Nasional untuk dapat membantu dan memberikan info mengenai penyakit kanker dan masalah seputarnya. Semua Warrior of Hope mempunyai kesempatan untuk dapat langsung mengirimkan pertanyaan kepada Profesor Soehartati dan Team Dokter RSCM yang senantiasa mendedikasikan waktunya. Bersama-sama dengan Profesor Soehartati, Team Dokter RSCM dan atas bantuan seluruh Warriors of Hope, di bulan Oktober 2015 ini akan dibuka \"Room of Hope\", yang merupakan ruang tunggu pertama bagi pasien BPJS dan keluarganya yang selain memberikan Harapan dan Kebahagiaan, juga memberikan keterampilan untuk menolong segi sosial dari para pasien dan keluarganya (lihat upcoming events untuk cerita selengkapnya)."
          end
    str << '</p></center>'
    
    raw(str)
  end
  
  def events_header
    str = '<center><h3><i>Upcoming</i> <b>E V E N T S</b></h3><p>'
    
    str << if english? 
              "We spread hope through..."
            else
              "Kami menyebarkan harapan/ hope melalui berbagai macam aktivasi seperti mamografi keliling, the 'magic of hope' untuk anak-anak dan banyak lagi. Hasil penjualan gelang kami salurkan setiap bulannya melaluu yayasan-yayasan kanker di Indonesia dan setiap 1-2 bulan kami turun langsung ke daerah-daerah untuk menyalurkan langsung melalui aktivasi yang kami sebut dengan Perjalanan Harapan (Journey of HOPE)."
            end
            
    str << '</p></center>'
    
    str << '<div class="row event__list">'
    
    Event.active.order(:sort).each do |event|
      str << '<div class="col-md-6 col-sm-6">'
      str << image_tag(event.image.url, {class: 'img-responsive'})
      str << '</div>'
    end

		str << '</div>'
		
		raw(str)
	end
	
  def bracelet_header
    str = '<center><h3><i>Bracelets of </i><b>HOPE</b></h3><p>'
    str << if english?
            "All sale will go towards Cancer Assocation..."
          else
            "Hasil penjualan gelang akan disalurkan ke Yayasan-Yayasan Kanker Di Indonesia dan langsung kepada orang- orang yang menderita kanker dan keluarganya melalui aktivasi-aktivasi kami."
          end
          
    str << '</p>'
    
    str << bracelet_items
    
    str << '</center>'
    
    raw(str)
  end
  
  def story_header
    str = '<center><div class="balon"></div>'
    str << '<h3><i>Share your Story of</i><b> HOPE</b></h3><p>'
    str << if english?
            "This page contains a collection of viral campaign #IamHOPE, where..."
          else
            "Page ini adalah kumpulan Viral campaign #IamHOPE dimana masyarakat/ public figure dan para pejuang Harapan dapat menyatakan harapannya di dalam video singkat 15 detik dan menyebarkannya di social media. Kirimkan juga harapan anda kepada kami di gelang harapan dengan #IamHOPE dan sebarkanlah harapan dan jadilah pejuang Harapan dan dapatkan kesempatan untuk ditampilkan di web kami."
            end
    str << '</p></center>'
    
    raw(str)
  end
  
  def journey_videos
  	str = '<div class="col-md-12 col-xs-12 col-sm-12 journey__video journey__video--mobile">'

    Video.active.order(:sort).each do |video|
      str << '<div class="col-md-12 col-xs-12">'
  		str << '<div class="col-md-6  col-xs-12 col-sm-6">'
      str << '<iframe class="embed-responsive-item" type="text/html" width="90%" height="285" src="'
      str << video.link_url 
      str << '" frameborder="0">'
      str << '</iframe>'
  
  		str << '</div>'
  		str << '<div class="col-md-6  col-xs-12 col-sm-6">'
      str << '<h3><i>Video of</i><b>HOPE</b></h3>'
      str << '<h4>'
      str << video.location
      str << '</h4><p>'
      str << (english? ? video.article_en : video.article_id)
      str << '</p></div>'
    end

    str << '</div>'
    
    raw(str)
  end
  
  def story_videos
    str = '<div class="col-md-12 col-xs-12" style="padding:0px">'
    
    Story.active.order(:sort).each do |story|
      str << '<div class="col-md-4 col-xs-6 col-sm-4 artis" style="padding:0px">'
      str << image_tag(story.image.url, {class: 'img-responsive', 'data-target' => '#myModal', 'data-toggle' => 'modal'})
      str << '<video class="video-1" width="100%" height="240" controls>'
      str << '<source class="video-link1" src="'
      str << story.video_url
      str << '" type="video/mp4">'
      str << '</video>'
      str << '</div>'
    end

    str << '</div>'
    
    raw(str)
  end
  
  def bracelet_items
    str = '<div class="col-md-12 col-xs-12 col-sm-12 bracelet__list">'
    
    bracelets.each do |bracelet|
      str << '<div class="col-md-4  col-xs-12 col-sm-4">'
      str << image_tag(bracelet[:image_path], {class: "img-responsive"})
      str << '<h4><i>'
      str << bracelet[:name]
      str << '</i></h4>'
      str << '<h3>'
      str << bracelet[:price]
      str << '</h3>'
      str << '</div>'
    end	
    
    str << '</div>'
    	
    raw(str)
  end
  
  def bracelets
    items = []
    items << {image_path: "img/bracelet/plat.png", name: 'Plat', price: 'Rp 100.000,00'}
    items << {image_path: "img/bracelet/botega.png", name: 'Botega', price: 'Rp 100.000,00'}
    items << {image_path: "img/bracelet/etnik.png", name: 'Etnik', price: 'Rp 100.000,00'}
    items
  end
end

