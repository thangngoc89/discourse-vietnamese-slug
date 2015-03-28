# name: discourse-vietnamese-slug
# about: A Discourse plugin to generate Vietnamese slug
# version: 0.1
# authors: Khoa Nguyen, @eviltrout, @riking
# url: https://github.com/thangngoc89/discourse-vietnamese-slug

after_initialize do
  module ::Slug

    def self.for(string)

      # For Vietnamese slug
      vietnamese   = "àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐêùà"
      replacements = "aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyydAAAAAAAAAAAAAAAAAEEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOOOUUUUUUUUUUUYYYYYDeua"
      string = string.tr(vietnamese, replacements)
      # End Vietnamese slug

      slug = string.gsub("'", "").parameterize
      slug.gsub!("_", "-")
      # TODO review if ja should use this
      # ko asked for it to be removed
      if ['zh_CN', 'ja'].include?(SiteSetting.default_locale)
        unless defined? Stringex
          require 'stringex_lite'
        end
        slug = string.to_url
      end
      slug =~ /[^\d]/ ? slug : '' # Reject slugs that only contain numbers, because they would be indistinguishable from id's.
    end

  end
  
  module ::UserNameSuggester
    
    def self.sanitize_username(name)
      
      # For Vietnamese slug
      vietnamese   = "àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐêùà"
      replacements = "aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyydAAAAAAAAAAAAAAAAAEEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOOOUUUUUUUUUUUYYYYYDeua"
      name = name.tr(vietnamese, replacements)
      # End Vietnamese slug
      
      name = ActiveSupport::Inflector.transliterate(name)
      name = name.gsub(/^[^[:alnum:]]+|\W+$/, "")
                 .gsub(/\W+/, "_")
                 .gsub(/^\_+/, '')
      name
    end
  
  end

end
