# -*- coding:utf-8 -*-
################################################################################
##  mikutter_yome
##    https://github.com/Akkiesoft/yometab
##

Plugin.create :yometab do
  ytable = {
    'yome'		=> '嫁',
    'tsuma'		=> '妻',
    'musume'	=> '娘',
    'imouto'	=> '妹',
    'kanojo'	=> '彼女',
    'jis'		=> '〄'
  }

  def update_yometab(mode, box, picture, table, name, url, x, y)
    tab(:mikutter_yometab, "#{table[name]}タブ") do
      set_icon File.expand_path(File.join(File.dirname(__FILE__), "#{name}.png"))
      if mode then box.remove(picture) else expand end
      picture = Gtk::WebIcon.new(url, x, y)
      nativewidget box.closeup(picture)
    end
    return picture
  end

  hbox = Gtk::HBox.new(false, 0)

  yname = UserConfig[:yometab_name] || "yome"
  yurl = UserConfig[:yometab_url]
  yx = (UserConfig[:yometab_x] || "100").to_i
  yy = (UserConfig[:yometab_y] || "100").to_i
  picture = update_yometab(0, hbox, picture, ytable, yname, yurl, yx, yy)

  settings "嫁タブ" do
    fileselect '画像URL', :yometab_url
    input '画像Xサイズ', :yometab_x
    input '画像Yサイズ', :yometab_y
    select 'タブ名', :yometab_name, ytable
    apply = Gtk::Button.new('適用')
    apply.signal_connect('clicked') {
      yname = UserConfig[:yometab_name] || "yome"
      yurl = UserConfig[:yometab_url]
      yx = (UserConfig[:yometab_x] || "100").to_i
      yy = (UserConfig[:yometab_y] || "100").to_i
      picture = update_yometab(1, hbox, picture, ytable, yname, yurl, yx, yy)
    }
    closeup apply
  end
end
