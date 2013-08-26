# -*- coding:utf-8 -*-
################################################################################
##  mikutter_yome
##    https://github.com/Akkiesoft/mikutter_yome
##

Plugin.create :mikuttre_yometab do

  yometab_table = {
    	'yome'		=> '嫁',
	   	'tsuma'		=> '妻',
    	'musume'	=> '娘',
    	'imouto'	=> '妹',
    	'kanojo'	=> '彼女',
    	'jis'		=> '〄'
  }

  yometab_name = UserConfig[:yometab_name]
  if yometab_name == nil then yometab_name = "yome" end
  yome_url = UserConfig[:yometab_url]
  yome_x = UserConfig[:yometab_x]
  if yome_x.to_i == 0 then yome_x = "100" end
  yome_y = UserConfig[:yometab_y]
  if yome_y.to_i == 0 then yome_y = "100" end
  
  tab(:mikutter_yometab, "#{yometab_table[yometab_name]}タブ") do
    icon = File.expand_path(File.join(File.dirname(__FILE__), "#{yometab_name}.png"))
    set_icon icon
    expand
    if yome_url != nil then
      picture = Gtk::WebIcon.new(yome_url, yome_x.to_i, yome_y.to_i)
      nativewidget Gtk::HBox.new(false, 0).closeup(picture)
    end
  end

  settings "嫁タブ" do
    input '画像URL', :yometab_url
    input '画像Xサイズ', :yometab_x
    input '画像Yサイズ', :yometab_y
    select 'タブ名', :yometab_name, yometab_table
    closeup apply = ::Gtk::Button.new('適用')
    apply.signal_connect("clicked") {
      # ここに処理が入る
      Gtk::Dialog.Alert("test")
    }
  end
end
