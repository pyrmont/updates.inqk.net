# frozen_string_literal: true

module CommonMarker
  module Plugin
    module Mentions
      def self.call(doc)
        doc.walk do |node|
          next unless node.type == :text && node.parent.type == :paragraph

          before = node

          while m = /@(\w\S*?)([:@])(\w\w*(?:[.]\w+))/.match(before.string_content) do
            domain = "https://" + m[3]
            prefix = m[2] == "@" ? "@" : ""
            username = m[1]

            before.string_content = m.pre_match

            mention_text = CommonMarker::Node.new(:text)
            mention_text.string_content = "@#{username}"

            mention_link = CommonMarker::Node.new(:link)
            mention_link.url = "#{domain}/#{prefix}#{username}"
            mention_link.append_child mention_text
            before.insert_after mention_link

            after = CommonMarker::Node.new(:text)
            after.string_content = m.post_match
            mention_link.insert_after after

            before = after
          end
        end
      end
    end
  end
end
