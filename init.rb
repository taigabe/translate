require 'translate'

I18n::Backend::Simple.send(:include, I18n::Backend::I18nTranslateBackend)

config.after_initialize do
  Translate::Storage.mode = if defined?(Ubiquo::Settings) && Ubiquo::Settings.option_exists?(:translate_mode)
    Ubiquo::Settings.get(:translate_mode)
  else
    :application
  end

  def I18n.supported_locales
    if defined?(Ubiquo::Settings) && Ubiquo::Settings.option_exists?(:supported_locales)
      Ubiquo::Settings.get(:supported_locales)
    else
      I18n.available_locales
    end
  end 
end
