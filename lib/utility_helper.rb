require 'tempfile'
##workaround for filesize checking in Windows for attachment_fu
#class Tempfile
#  def size
#    if @tmpfile
#      @tmpfile.fsync
#      @tmpfile.flush
#      @tmpfile.stat.size
#    else
#      0
#    end
#  end
#end

class Range
  def edge_value num, default=0
    return num if self === num
    return self.first if num < self.first
    return self.last if num > self.last
    default
  end
end
