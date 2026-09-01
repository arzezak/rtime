require "time"

def rtime(timestamp : Int64) : String
  diff = (Time.utc - Time.unix(timestamp)).total_seconds.to_i64
  return "in the future" if diff < 0

  v, unit = case diff
            when 0...60                 then {diff, "second"}
            when 60...3600              then {diff // 60, "minute"}
            when 3600...86_400          then {diff // 3600, "hour"}
            when 86_400...604_800       then {diff // 86_400, "day"}
            when 604_800...2_592_000    then {diff // 604_800, "week"}
            when 2_592_000...31_536_000 then {diff // 2_592_000, "month"}
            else                             {diff // 31_536_000, "year"}
            end

  "#{v} #{unit}#{v == 1 ? "" : "s"} ago"
end
