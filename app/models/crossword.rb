require 'utility_helper'

class Crossword < ActiveRecord::Base  
  belongs_to :author, :class_name => "User"
 
  has_attached_file :picture, :path => ":rails_root/public/system/:attachment/:id/:style/:server_file_name",
                              :url => "/system/:attachment/:id/:style/:server_file_name"
  validates_attachment_size :picture, :less_than => 1.megabyte, :message => "size should be less then 1Mb" 
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png', 'image/gif'], 
                                    :message => "file should be of supported type (jpeg, png, gif)"  
  
  Paperclip.interpolates :server_file_name do |attachment, style|
    attachment.instance.server_file_name
  end
  
  after_save :set_puzzle_data
  
  serialize :data
  
  def server_file_name
    self.picture_file_name.gsub(/\s+/, '_') 
  end
  
  private
  def set_puzzle_data
    return unless self.data.blank?
    
    image = MiniMagick::Image.open self.picture.path
    width, height = image["dimensions"]
    
    self.block_height = self.block_width*height/width if (5..50).include? self.block_width
    self.block_height, self.block_width = set_proportional_measures *[width, height].sort unless (5..50).include? self.block_height
    self.block_height, self.block_width = self.block_width, self.block_height if width > height
        
    data = get_image_data image, block_width, block_height
    self.update_attributes :data => data, :block_width => self.block_width, :block_height => self.block_height
    MiniMagick::Image.new(self.picture.path).resize "#{self.block_width*5}x#{self.block_height*5}"
  end
  
  def set_proportional_measures small_side, large_side 
    large = (5..50).edge_value(large_side > 150 ? large_side/5 : 30)
    small = (5..50).edge_value(large * small_side / large_side)
    return large, small
  end
  
  def get_image_data image, width, height
    image.combine_options do |c|
      c.resize "#{width}x#{height}"
      c << '+dither'
      c.colorspace "gray"
      c.colors 2
      c.normalize
    end
    (image.run_command "convert", image.escaped_path, "txt:-").split("\n")[1..-1].inject([[]]) do |res, elem|
      val = elem =~ /#0/ ? 1 : 0
      res.last.length < width ? res.last.push(val) : res.push([val])
      res
    end
  end

end
