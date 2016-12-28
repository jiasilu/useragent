class UserAgent
  module Browsers
    class BlurBrowser < Base
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product =~ /Blur/i }
      end

      def browser
        'Blur Browser'
      end

      def version
        blur = detect_product("Blur")
        Version.new(blur.version)
      end

      def platform
        return unless application

        if application.comment[0] =~ /iPhone/
          'iPhone'
        elsif application.comment.any? { |c| c =~ /Android/ }
          'Android'
        else
          application.comment[0]
        end
      end

      def os
        return unless application

        if application.comment[0] =~ /Windows NT/
          OperatingSystems.normalize_os(application.comment[0])
        elsif application.comment[2].nil?
          OperatingSystems.normalize_os(application.comment[1])
        elsif application.comment[1] =~ /Android/
          OperatingSystems.normalize_os(application.comment[1])
        else
          OperatingSystems.normalize_os(application.comment[2])
        end
      end
    end
  end
end