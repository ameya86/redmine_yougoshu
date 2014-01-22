module RedmineYougoshu
  class Yougoshu
    # 用語集情報を格納したYAMLファイル
    YOUGOSHU_YAML = "#{Rails.root}/plugins/redmine_yougoshu/config/yougoshu.yml"

    @@yougo_map = nil
    @@yougo_items = {}

    # 用語集を取得
    def self.map
      return @@yougo_map if @@yougo_map

      @@yougo_map =YAML.load_file(YOUGOSHU_YAML).with_indifferent_access
      return @@yougo_map
    end

    # 用語集サイトのURL
    def self.url
      return self.map[:url]
    end

    # 現在のページに対応した用語集
    def self.current_items(controller_name, action_name)
      # キャッシュがあれば使う
      return @@yougo_items[controller_name][action_name] if @@yougo_items[controller_name] && @@yougo_items[controller_name][action_name]

      yougo_map = self.map

      yougo = []
      # 
      yougo += yougo_map[:default] if yougo_map[:default]

      # コントローラに対応した用語
      controller_map = yougo_map[controller_name]
      if controller_map
        yougo += controller_map[:default] if controller_map[:default]
        # アクションに対応した用語
        yougo += controller_map[action_name] if controller_map[action_name]
      end

      # 重複を削除
      yougo = yougo.sort.uniq

      # キャッシュ
      @@yougo_items[controller_name] = {}
      @@yougo_items[controller_name][action_name] = yougo

      return yougo
    end
  end
end
