refs = Hash.new{|h,k| h[k] = []}
ARGF.each_line.each do |line|
  mo = line.match(/undefined reference to `(.+?)'/)
  if mo
    mo2 = line.match(/([\w\d_]+)\.[oc]/)
    if mo2
      refs[mo[1]] << mo2[0]
    else
      refs[mo[1]] << '?'
    end
  end
end

puts refs.sort_by{|k,v| v.size}.map{|k,v| "#{v.size}\t#{k}\t#{v.sort.uniq.join(',')}" }

