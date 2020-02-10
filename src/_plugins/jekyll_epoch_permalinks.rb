module Jekyll
  module Drops
    class UrlDrop < Drop
      def epoch
        @obj.date.strftime("%s")
      end
    end
  end
end
