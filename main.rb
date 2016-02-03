case
when ARGV[0]==ARGV[2] && ARGV[1]==ARGV[3]
     puts "Точка найдена!"
when ARGV[0]==ARGV[2] && ARGV[1]!=ARGV[3]
     puts "х координата верна, y нет"
when ARGV[0]!=ARGV[2] &&  ARGV[1]==ARGV[3]
     puts "y координата верна, x нет"
when ARGV[0]!=ARGV[2] &&  ARGV[1]!=ARGV[3]
     puts "Близко, но нет"
end

