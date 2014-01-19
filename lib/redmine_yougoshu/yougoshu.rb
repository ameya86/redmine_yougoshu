module RedmineYougoshu
  class Yougoshu
    YOUGOSHU_YAML = "#{Rails.root}/plugins/redmine_yougoshu/config/yougoshu.yml"

    @@yougo_map = nil

    def self.map
      return @@yougo_map if @@yougo_map

      @@yougo_map =YAML.load_file(YOUGOSHU_YAML).with_indifferent_access
      return @@yougo_map
    end
  end
end
