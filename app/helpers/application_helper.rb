module ApplicationHelper

  def logo
    logo = image_tag("NM Logo.png", :att => "Nick & Ming")
  end
  
  def liberty2
    liberty2 = image_tag("liberty 2.jpg", :att => "New York")
  end
  
  def opera
    opera = image_tag("opera.png", :att => "Sydney")
  end
  
  def plus
    plus = image_tag("plus.png", :att => "Plus")
  end
  
  def sept29
    sept29 = image_tag("sept29.png", :att => "September 29")
  end

  def sept30
    sept30 = image_tag("sept30.png", :att => "September 30")
  end
  
  def inlove
    inlove = image_tag("in-love.png", :att => "In Love")
  end
  
  def signature
    signature = image_tag("signature.png", :att => "Signature")
  end
  
  def timeline
    timeline = image_tag("timeline.png", :att => "Our Story")
  end
  
  def aloha
    aloha = image_tag("aloha.jpg", :att => "Aloha")
  end
  
  def nickming
    nickming = image_tag("NM.png", :att => "Dating")
  end
  
  def jpm
    jpm = image_tag("jpm.jpeg", :att => "JPM")
  end
  
  def shesaidyes
    shesaidyes = image_tag("shesaidyes.jpeg", :att => "She Said Yes")
  end
  
  def hishers
    hishers = image_tag("HisHers.png", :att => "His Version Her Version")
  end
  
  def front_ribbon
    front_ribbon = image_tag("front-ribbon.png", :att => "NYC Sydney")
  end
  
  def love_note
    love_note = image_tag("love-note.png", :att => "Guestbook")
  end
  
  def zank_you
    zank_you = image_tag("zankyou.jpeg", :att => "Zankyou")
  end
  
  def black_sand_beach
    black_sand_beach = image_tag("black-sand-beach.jpg", :att => "Black Sand")
  end
  
  def coffee_plantation
    coffee_plantation = image_tag("coffee-plantation.jpg", :att => "Coffee Plantation")
  end
  
  def kona_volcano
    kona_volcano = image_tag("kona-volcano.jpg", :att => "Kona Volcano")
  end
  
  def mauna_kea
    mauna_kea = image_tag("mauna-kea.jpg", :att => "Mauna Kea")
  end
  
  def orchids
    orchids = image_tag("orchids.jpg", :att => "Orchids")
  end
  
  def ziplining
    ziplining = image_tag("ziplining.jpg", :att => "Ziplining")
  end
  
  def hana
    hana = image_tag("HanaHighway.jpg", :att => "Hana Highway")
  end
  
  def kaihalulu
    kaihalulu = image_tag("kaihalulu.jpg", :att => "Kaihalulu")
  end
  
  def lanai
    lanai = image_tag("lanai.jpg", :att => "Ferry to Lanai")
  end
  
  def laua
    laua = image_tag("laua.jpg", :att => "Laua")
  end
  
  def sunrise
    sunrise = image_tag("sunrise.jpg", :att => "Sunrise Maui")
  end
  
  def surfing
    surfing = image_tag("surfing.jpg", :att => "Surfing")
  end
  
  def waikiki
    waikiki = image_tag("waikiki.jpg", :att => "Waikiki")
  end
  
  def cliff
    cliff = image_tag("cliff.jpeg", :att => "Cliff")
  end
  
  def pearl_harbor
    pearl_harbor = image_tag("pearl-harbor.jpg", :att => "Pearl Harbor")
  end
  
  def food
    food = image_tag("food.jpg", :att => "Food Oahu")
  end
  
  def farid
    farid = image_tag("Farid.jpg", :att => "Farid")
  end
  
  def charlie
    charlie = image_tag("Charlie.jpg", :att => "Charlie")
  end
  
  def margery
    margery = image_tag("Margery.jpg", :att => "Margery")
  end
  
  def rosita
    rosita = image_tag("Rosita.jpg", :att => "Rosita")
  end
  
  def north_shore
    north_shore = image_tag("North-Shore.jpg", :att => "North Shore")
  end
  
  class BootstrapLinkRenderer < ::WillPaginate::ActionView::LinkRenderer
    protected

    def html_container(html)
      tag :div, tag(:ul, html), container_attributes
    end

    def page_number(page)
      tag :li, link(page, page, :rel => rel_value(page)), :class => ('active' if page == current_page)
    end

    def gap
      tag :li, link(super, '#'), :class => 'disabled'
    end

    def previous_or_next_page(page, text, classname)
      tag :li, link(text, page || '#'), :class => [classname[0..3], classname, ('disabled' unless page)].join(' ')
    end
  end

  def page_navigation_links(pages, anchor)
    will_paginate(pages, :params => {:anchor => anchor }, :class => 'pagination', :inner_window => 2, :outer_window => 0, :renderer => BootstrapLinkRenderer, :previous_label => '&larr;'.html_safe, :next_label => '&rarr;'.html_safe)
  end

end
