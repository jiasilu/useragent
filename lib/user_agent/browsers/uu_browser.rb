class UserAgent
  module Browsers
    class UUBrowser < Base
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product =~ /UU/i }
      end

      def browser
        'UU Browser'
      end

      def version
        blur = detect_product("UU")
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
