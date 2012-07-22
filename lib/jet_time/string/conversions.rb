module JetTime
  module String
    module Conversions
      def to_hours
        s = self.dup
        s.strip!
        if s =~ %r{^(\d+([.,]\d+)?)h?$}
          s = $1
        else
          s.gsub!(%r{^(\d+):(\d+)$}) { $1.to_i + $2.to_i / 60.0 }
          s.gsub!(%r{^((\d+)\s*(h|hours?))?\s*((\d+)\s*(m|min)?)?$}) { |m| ($1 || $4) ? ($2.to_i + $5.to_i / 60.0) : m[0] }
        end
        s.gsub!(',', '.')
        begin; Kernel.Float(s)
        rescue; nil
        end
      end
    end
  end
end