module PagesHelper

  def journey_header
    str = "<center><h3><i>Journey of</i><b>HOPE</b></h3><p>"
    
    str << if english?
            "To Write Love on Her Arms is a non-profit movement dedicated to presenting
              hope and finding help for people struggling with depression, addiction, self-injury,
              and suicide. TWLOHA exists to encourage, inform, inspire, and also to
              invest directly into treatment and recovery."
          else
            "Journey of Hope atau \"Perjalanan Harapan\" adalah segala bentuk aktivasi gerakkan Gelang Harapan dalam menebarkan harapan. Journey of Hope dapat berbentuk aktivasi menyumbang langsung, aktivasi penggalangan dana dan semua bentuk \"Care Entertainment\" yang dilakukan para Founders dan Warriors of Hope, yaitu Gerakkan Peduli Entertainment, termasuk Concert of Hope dan Movie \"I AM HOPE\" maupun segala kegiatan yang semuanya bertujuan akhir untuk membantu pasien kanker yang tidak mampu dan keluarganya di seluruh Indonesia. Gerakkan Gelang Haparan percaya, bahwa di dalam setiap situasi dalam kehidupan, selalu ada Harapan. Di dalam tiap Journey of Hope, gerakkan gelang harapan mengharapkan uluran tangan dari semua Warrior of Hope untuk bersama-sama mendata pasien kanker, membantu mereka dan terus menebarkan Harapan. \n Dan inilah perjalanan-perjalanan kami"
          end

    str << "</p></center>"

    raw(str)
  end

  def people_header
    str = '<center><img class="flower img-responsive" src="'
    str << asset_path('img/people/flower.png')
    str << '">'
    str << "<h3><i>People Behind</i><b>HOPE</b></h3><p>"
    
    str << if english?
            "It all started with a dream and a 'little hope' of a couple of best friends who wants to create solidarity and the culture of giving amongst the people and to spread Hope in all aspects of life through selling bracelets. The bracelet is made from recycled materials taken from senior Indonesian designer Ghea Panggabean which is Kain Pelangi Jumputan. 'Jumputan' means Rainbow and therefore simbolyzes HOPE. That is how Bracelet of HOPE was created. For the kick off of the movement, we started by spreading HOPE and awareness about cancer for cancer patients and their families.\n In the years ahead, Bracelet of Hope is commited to spreading HOPE in all aspects of Life."
          else
            "Bermula dari mimpi dan suatu 'harapan' kecil dari beberapa sahabat di bulan Oktober 2014 yang ingin membangkitkan solidaritas dan budaya menyumbang diantara masyarakat dan menyebarkan harapan di segala aspek dalam kehidupan melalui sebuah gelang yang dibuat dari sisa kain designer senior kebanggaan Indonesia, Ghea Panggabean yaitu Kain Pelangi Jumputan, dan Pelangi adalag simbol dari Harapan. Terciptalah Gelang Harapan #BraceletofHOPE yang kemudian menjadi suatu 'Harapan Besar' dan Kenyataan karena energi positif dan sambutan dari semua relawan dan 'Warriors of Hope'(Pejuang Harapan).\nGerakkan @gelangharapan berkomitmen untuk terus menyebarkan \"Harapan\", berawal khususnya kepada pejuang kanker dan keluarganya, dan di tahun-tahun mendatang \"Harapan\" di segala aspek dalam Kehidupan."
          end
          
    str << "</p></center>"

    raw(str)
  end
  
  def people_quote(person)
    str = case person
          when :jenna
            str = "<h3><b>janna</b>soekasah joesoef</h3><p>"
            str << if english?
                    '"Hope is a way of making dreams into reality"'
                  else
                    '"Harapan adalah cara membuat mimpi menjadi kenyataan"'
                  end
            str << "</p>"
          when :wulan
            str = "<h3><b>Wulan</b>Guritno</h3><p>"
            str << if english?
                    '"Hold On, Pain Ends"'
                  else
                    '"Bertahanlah, Segala Kesusahan akan Berakhir"'
                  end
            str << "</p>"
          when :amanda
            str = "<h3><b>amanda</b>soekasah</h3><p>"
            str << if english?
                    "\"Once you choose Hope, Everything becomes Possible\".\n HOPE is a Legacy and the journey that defines me...\nAs long as I live, and as long as i could, I will dedicate my LIFE on spreading HOPE"
                  else
                    "\"Saat Engkau memilih Harapan, semua yang kamu pikir tidak mungkin menjadi mungkin.\n Hope adalah Legacy dan Perjalanan kami.  Selama saya hidup, saya akan terus berusaha untuk terus menyebarkan Harapan\""
                  end
            str << "</p>"
          end 
           
    raw(str)
  end
  
  def news_header
    str = '<center><img class="matahari img-responsive" src="'
    str << asset_path('img/health/matahari.png')
    str << '">'
    str << '<h3><i>Hope Health</i> <b>NEWS</b></h3><p>'
    str << if english?
            "Bracelet of Hope movement working together with RSCM..."
          else
            "Gerakkan Gelang Harapan bekerjasama dengan RSCM dan Ketua Komite Penanggulangan Kanker Nasional untuk dapat membantu dan memberikan info mengenai penyakit kanker dan masalah seputarnya.\n Semua Warrior of Hope mempunyai kesempatan untuk dapat langsung mengirimkan pertanyaan kepada Profesor Soehartati dan Team Dokter RSCM yang senantiasa mendedikasikan waktunya.\n\nBersama-sama dengan Profesor Soehartati, Team Dokter RSCM dan atas bantuan seluruh Warriors of Hope, di bulan Oktober 2015 ini akan dibuka \"Room of Hope\", yang merupakan ruang tunggu pertama bagi pasien BPJS dan keluarganya yang selain memberikan Harapan dan Kebahagiaan, juga memberikan keterampilan untuk menolong segi sosial dari para pasien dan keluarganya (lihat upcoming events untuk cerita selengkapnya).\n\n Profile\n Prof. DR. Dr. Soehartati Gondhowiardjo, Sp.Rad (K) Onk.Rad \n Jabatan: Ketua Komite Penanggulangan Kanker Nasional \n\n Untuk Q& A: kankerindonesia@gmail.com"
          end
    str << '</p></center>'
    
    raw(str)
  end
  
  def events_header
    str = '<center><h3><i>Upcoming</i> <b>E V E N T S</b></h3><p>'
    
    str << if english? 
              "We spread HOPE through all kinds of activation like free Mammografi, The Magic of HOPE for children with cancer and many more. 100% of the proceed of selling the bracelets are donated to cancer foundations in Indonesia and directly to cancer patients and their families through \"Journey of HOPE\"."
            else
              "Kami menyebarkan harapan/ hope melalui berbagai macam aktivasi seperti mamografi keliling, the 'magic of hope' untuk anak-anak dan banyak lagi. Hasil penjualan gelang kami salurkan setiap bulannya melaluu yayasan-yayasan kanker di Indonesia dan setiap 1-2 bulan kami turun langsung ke daerah-daerah untuk menyalurkan langsung melalui aktivasi yang kami sebut dengan Perjalanan Harapan (Journey of HOPE)."
            end
            
    str << '</p></center>'
    
    str << '<div class="row event__list">'
    str << '<div id="myCarousel" class="carousel slide" data-ride="carousel">'
    
    str << event_items
    str << control_str
    
		str << '</div></div>'
		
		raw(str)
	end
	
  def event_items
    str = '<div class="carousel-inner" role="listbox">'
    Event.active.order(:sort).each_with_index do |event, index|
      str << '<div class="item'
      str << ' active' if index == 0
      str << '">'
      str << image_tag(event.image.url, {class: "img-responsive"})
      str << '</div>'
    end
    str << '</div>'
    str
  end
  
  def bracelet_header
    str = '<center><h3><i>Bracelet of </i><b>HOPE</b></h3><p>'
    str << if english?
            "The proceed of the sales from bracelet of HOPE will be donated to cancer foundations in Indonesia as well as unfortunate cancer patients and their families."
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
    str << '<h3><b>#IamHope</b><i>Campaign</i></h3><p>'
    str << if english?
            "In this page, we feature our viral campaign #IamHOPE where prominent public figures, celebrities and our warriors of HOPE can make a 15 seconds video about their Hopes for cancer or any other aspects in life and spread it through social media.\n You can also send your Hopes and stories of HOPE and help us spread HOPE,become a Warrior of HOPE and get chance to be featured in our web."
          else
            "Page ini adalah kumpulan Viral campaign #IamHOPE dimana masyarakat/ public figure dan para pejuang Harapan dapat menyatakan harapannya di dalam video singkat 15 detik dan menyebarkannya di social media.\n Kirimkan juga harapan anda kepada kami di gelang harapan dengan #IamHOPE dan sebarkanlah harapan dan jadilah pejuang Harapan dan dapatkan kesempatan untuk ditampilkan di web kami."
            end
    str << '</p></center>'
    
    raw(str)
  end
  
  def journey_videos
  	str = '<div class="col-md-12 col-xs-12 col-sm-12 journey__video journey__video--mobile">'

    Video.active.order(:sort).each do |video|
      str << '<div class="col-md-12 col-xs-12">'
  		str << '<div class="col-md-6 col-xs-12 col-sm-6">'
      str << '<iframe class="embed-responsive-item" type="text/html" width="90%" height="285" src="'
      str << video.link_url 
      str << '" frameborder="0">'
      str << '</iframe>'
  
  		str << '</div>'
  		str << '<div class="col-md-6 wording__video col-xs-12 col-sm-6">'
      str << '<h3><i>Video of</i><b>HOPE</b></h3>'
      str << '<h4>'
      str << video.location
      str << '</h4><p>'
      str << (english? ? video.article_en : video.article_id)
      str << '</p>'
      str << '<a class="read__moore">.. Read More</a>'
      str << '</div>'
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
  
  def story_videos_static
    <<-EOF
    <div class="col-md-4 col-xs-6 col-sm-4 artis" style="padding:0px">
    <img class="img-responsive" data-target="#myModal" data-toggle="modal" src="#{asset_path 'img/Story/artis/wulan.jpg'}">
       <video  class="video-1" width="100%" height="240" controls>
      <source class="video-link1"  src="#{asset_path 'video/wulan.mp4'}" type="video/mp4">
      </video>
    </div>
    <div class="col-md-4 col-xs-6 col-sm-4 artis" style="padding:0px">
    <img class="img-responsive" data-target="#myModal" data-toggle="modal" src="#{asset_path 'img/Story/artis/1.jpg'}">
       <video class="video-1"  width="100%" height="240" controls>
      <source class="video-link1"   src="#{asset_path 'video/1.mp4'}" type="video/mp4">
      </video>
    </div>
    <div class="col-md-4 col-xs-6 col-sm-4 artis" style="padding:0px">
    <img class="img-responsive" data-target="#myModal" data-toggle="modal" src="#{asset_path 'img/Story/artis/2.jpg'}">
       <video class="video-1"  width="100%" height="240" controls>
      <source class="video-link1"   src="#{asset_path 'video/2.mp4'}" type="video/mp4">
      </video>
    </div>
    <div class="col-md-4 col-xs-6 col-sm-4 artis" style="padding:0px">
    <img class="img-responsive" data-target="#myModal" data-toggle="modal" src="#{asset_path 'img/Story/artis/3.jpg'}">
       <video class="video-1"  width="100%" height="240" controls>
      <source class="video-link1"   src="#{asset_path 'video/3.mp4'}" type="video/mp4">
      </video>
    </div>
    <div class="col-md-4 col-xs-6 col-sm-4 artis" style="padding:0px">
    <img class="img-responsive" data-target="#myModal" data-toggle="modal" src="#{asset_path 'img/Story/artis/4.jpg'}">
       <video class="video-1"  width="100%" height="240" controls>
      <source class="video-link1"   src="#{asset_path 'video/4.mp4'}" type="video/mp4">
      </video>
    </div>
    <div class="col-md-4 col-xs-6 col-sm-4 artis" style="padding:0px">
    <img class="img-responsive" data-target="#myModal" data-toggle="modal" src="#{asset_path 'img/Story/artis/5.jpg'}">
       <video class="video-1"  width="100%" height="240" controls>
      <source class="video-link1"   src="#{asset_path 'video/5.mp4'}" type="video/mp4">
      </video>
    </div>
    <div class="col-md-4 col-xs-6 col-sm-4 artis" style="padding:0px">
    <img class="img-responsive" data-target="#myModal" data-toggle="modal" src="#{asset_path 'img/Story/artis/6.jpg'}">
       <video class="video-1"  width="100%" height="240" controls>
      <source class="video-link1"   src="#{asset_path 'video/6.mp4'}" type="video/mp4">
      </video>
    </div>
    <div class="col-md-4 col-xs-6 col-sm-4 artis" style="padding:0px">
    <img class="img-responsive" data-target="#myModal" data-toggle="modal" src="#{asset_path 'img/Story/artis/7.jpg'}">
       <video class="video-1"  width="100%" height="240" controls>
      <source class="video-link1"   src="#{asset_path 'video/7.mp4'}" type="video/mp4">
      </video>
    </div>
    <div class="col-md-4 col-xs-6 col-sm-4 artis" style="padding:0px">
    <img class="img-responsive" data-target="#myModal" data-toggle="modal" src="#{asset_path 'img/Story/artis/8.jpg'}">
       <video class="video-1"  width="100%" height="240" controls>
      <source class="video-link1"   src="#{asset_path 'video/8.mp4'}" type="video/mp4">
      </video>
    </div>
    EOF
  end
  
  def bracelet_items
    str = '<div class="col-md-12 col-xs-12 col-sm-12 bracelet__list">'
    
    Product.all.active.each do |bracelet|
      str << '<div class="col-md-4 product col-xs-12 col-sm-4">'
      str << image_tag(bracelet.image.url, {class: " gelang__list img-responsive"})
      # str << '<h4><i>'
      # str << bracelet.name
      # str << '</i></h4>'
      str << '<h3>'
      str << money_value(bracelet.final_price)
      str << '</h3>'
      
      str << form_tag(pages_add_bracelet_url, method: :post)
      str << hidden_field_tag('bracelet[name]', bracelet.name)
      str << hidden_field_tag('bracelet[value]', bracelet.final_price)
      str << '<button>BUY</button>'
      str << '</form>'

      str << '</div>'
    end	
    
    str << '</div>'
    	
    raw(str)
  end
  
  def old_bracelet_items
    str = '<div class="col-md-12 col-xs-12 col-sm-12 bracelet__list">'
    
    bracelets.each do |bracelet|
      str << '<div class="col-md-4 product col-xs-12 col-sm-4">'
      str << image_tag(bracelet[:image_path], {class: " gelang__list img-responsive"})
      # str << '<h4><i>'
      # str << bracelet[:name]
      # str << '</i></h4>'
      str << '<h3>'
      str << bracelet[:price]
      str << '</h3>'
      
      str << form_tag(pages_add_bracelet_url, method: :post)
      str << hidden_field_tag('bracelet[name]', bracelet[:name])
      str << hidden_field_tag('bracelet[value]', bracelet[:value])
      str << '<button>BUY</button>'
      str << '</form>'

      str << '</div>'
    end	
    
    str << '</div>'
    	
    raw(str)
  end
  

  def bracelet_options(bracelet)
    Product.all.active.find {|item| item.name == bracelet['name']}
  end
  
  def old_bracelet_options(bracelet)
    bracelets.find {|item| item[:name] == bracelet['name']}
  end
  
  def bracelet_total_item_price(bracelet)
    total_price = bracelet['quantity'].to_i * bracelet['value'].to_i
    money_value(total_price)
  end
    
  protected
  
    def bracelets
      items = []
      items << {image_path: "img/bracelet/etnik.png", name: 'Etnik', price: 'Rp 100.000,00', value: '100000'}
      items << {image_path: "img/bracelet/kepang.png", name: 'Kepang', price: 'Rp 100.000,00', value: '100000'}
      items << {image_path: "img/bracelet/plat.png", name: 'Plat', price: 'Rp 100.000,00', value: '100000'}
      items
    end

    def control_str
      <<-STR
    		<!-- Controls -->
    		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    			<span class="sr-only">Previous</span>
    		</a>
    		<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    			<span class="sr-only">Next</span>
    		</a>
      STR
    end
    
    def pretty_print_price
      {
        '100000' => 'Rp 100.000,00',
        '200000' => 'Rp 200.000,00',
        '300000' => 'Rp 300.000,00',
        '400000' => 'Rp 400.000,00',
        '500000' => 'Rp 500.000,00',
        '600000' => 'Rp 600.000,00',
        '700000' => 'Rp 700.000,00',
        '800000' => 'Rp 800.000,00',
        '900000' => 'Rp 900.000,00',
        '1000000' => 'Rp 1.000.000,00'
      }
    end
end

