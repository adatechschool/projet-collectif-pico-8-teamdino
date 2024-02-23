pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
function _init()
 p={x=10,y=175,speed=4}
 coeurs={}
 trex={}
end

function _update60()
 if btn(➡️) then
  if p.x<960 then
     p.x+=1
 end
end
 --eviter de sortir du champ a gauche
 if btn(⬅️) then
  if p.x>10  then
     p.x-=1
   
  end
 end
 if (btn(⬆️)) p.y-=1
 if (btn(⬇️)) p.y+=1
 if (btnp(❎)) shoot()
 update_coeurs()
 generer_trex()
 update_camera()
-- player_movement()
end
 
function _draw()
 cls(15)
 draw_map()
 
--maman dino
 spr(28,p.x,p.y,2,2)
 
--trex
for t in all (trex) do
 spr(35,t.x,t.y)
 end
--coeurs
for c in all(coeurs) do
 spr(26,c.x,c.y)
 end
end
-- affichage des grands sprites



-->8
--coeurs

function shoot()
 new_coeur={
  x=p.x,
  y=p.y,
  speed=2
 }
 add(coeurs,new_coeur)
end

function update_coeurs()
 for c in all (coeurs) do
  c.x+=c.speed
 end
end







-->8
--trex

function generer_trex()
 new_trex={
  x=60,
  y=-8,
  life=3
  }
  add (trex,new_trex)
end

function update_trex()
 for t in all(trex) do
  t.y=0.3
  if t.y<128 then
   del (trex,t)
  end
 end
end 
-->8
--map

function draw_map()
 map(0,40,10,50,128,64)
end


--permet de centrer la cam sur le player
 
function update_camera()
--1ere tentative de camera
-- camx=mid(0,p.x,127-63)
-- camy=mid(0,p.y,63-31)
 if p.x>60 then
  camx=p.x-60
 else
  camx=10 
 end
 camera(camx,90)
end
 

-->8
--player

--function player_movement()
-- newx=p.x
-- newy=p.y
 -- if (btnp(⬅️)) newx-=1
 -- if (btnp(➡️)) newx+=1
 -- if (btnp(⬆️)) newy-=1
 -- if (btnp(⬇️)) newy+=1
--end  
__gfx__
0000000000000000ffffffffff3333fffffffffffffffffffffffffffffffffffffffffffffffffffffff33bfffffffffffffffffff34333fffaafff00000000
0000000000000000fffffffff333333fffffffffffffffffffffffffffffffffff73ffffffffffffffff33b3fff3f3fff3f3f3f3ffff3434ff9aa9ff00000000
0070070000000000ffffbbcff333333ffffffffffffffffffffffffffffffffff3334ffffffffffffff33b33ff33b33ff43333343334f343444444cc00000000
0007700000000000fffffbbbff3333fffffffffffffffffffffffffffff5fffff88334f3ffffffffff33b33ff333b3b3f34333434343ff9f44444cc400000000
0007700000000000fbfbfbfffff44fffff333fffffffffffffffffff7f855ffffff3333f44444cc4f33b33fff3b3bb33ff34343f3433f94f4444ccc400000000
0070070000000000ffbbbbfffff44ffff33533ff3333333333fff333f775555ff43f333f44464cc4f3b33fffff3bb33ffff343fff4ff9f4f444ccc4400000000
0000000000000000ffbffbfffff44fff3533333f4444644444ccc445f5f55555fffff3ff46444cc6f333fffffff3b3ffffff4ffff999ff4f44ccc44400000000
0000000000000000fffffffffff44ffff33353ff4644446454ccc544fff5fff5fffff4ff44464cc43fffffffffffbfffffff4ffff4ffff4f4cc4444400000000
4444444400000000ffffffffffffffffffbabbffffffffffffffffccffffffccffffffcc4444444400000000ffffffff00000000000000000000000000000000
4444444400000000fff444fffffffffffbbbabbffffffffffffffcccfffffcccffffcccc4444444400000000ffffffff00000000000000000000000000000000
4444444400000000fff444ffffffaffffbbbb31fffffffffffffcccfffffccccffffcccf4444444408808800ffffffff000000000bb000000000000000000000
4444444406600000ff44444ffffa9afff13b331ffffffffffffcccfffffcccfffffcccff444444448ee8ee80ffffffff00000000bbbbee000000000000000000
4477444466560000f4444444ffffafffff1111ffffffffffffccccffffcccfffffcccfff444444448eeeee80ffffffff00000000bbbbee000000000bb0000000
47f7744455666000f4444444fafffffffff22ffffffffffffcccfffffcccfffffcccffff4444444408eee800ffffffff000000000bbbbbbb0000bbbbb0000000
ff77f7445556660044444444a9afffffff2442ffffffffffcccfffffccccffffccccffff44444444008e8000ffffffff000000000bbbbbbb0000ccbbb0000000
ffff77745555656044444444fafffffff144442fffffffffccffffffccffffffccffffff4444444400080000ffffffff00000000bbb0000000bbccbbbb000000
0000000044444444000000000000000000000000ffffffffffffffff66ffffffffffffff00000000000000000000000000000000bbb0000000bbbbbbbb000000
0070070044444444000000000000000000000000ffffffffff88ffff6668fffffff88fff000000000000000000000000bb0bb0000bb00000000000bbb0000000
0007700044444444000000000000000000000000ffffff866f8888888668fff88f888fff000000000000000000000000bb0bb0bb0bb00000000000bbb0000000
0007700044444444000000000000007733000000ffffff86666888888f66f9988668ffff00000000000000000000000000bbbbbbbbb00000000000bbbbb0bb00
0070070044444444000000000003337333000000fffffff88666fff88f6669966668ffff00000666660000000000000000bbbbbbbbb00000000000bbbbbbbb00
0000000044444444000000000003333333300000fffffff88f66ff9988f668666888ffff00066656550000000000000000bbbbbbbbb00000000000bbbbbbb000
0000000044444444000000000008888883300000ffffffffffff669988ff886688ffffff00666666550000000000000000bb00000bb00000000000bb00bbbb00
0000000044444444000000000000003333300003ffffffffffff668899999fffffffffff66655666666600000000000000bb00000bb00000000000bb0000bb00
0000000000000000000000000000003333333003ffffffffffff4444999994ffffffffff55555556566500000000000000000000000000000000000000000000
0000000000000000000000000000333333333330fffffffffff884944444448fffffffff55555556666666000000000000000000000000000000000000000000
0000000000000000000000000000300333333330ffffffffff8884944444448fffffffff55555556666666600000000000000000000000000000000000000000
0000000000000000000000000000000333333330ffffffffff8849984444444fffffffff55555555666556560000000000000000000000000000000000000000
0000000000000000000000000000000003333300ffffffffff444998444448488fffffff55555555556556660000000000000000000000000000000000000000
0000000000000000000000000000000000033300fffffffff4499a88444aa4488fffffff55555555555555660000000000000000000000000000000000000000
0000000000000000000000000000000000003300fffffffff8899a8444444444488fffff55555555555555560000000000000000000000000000000000000000
0000000000000000000000000000000000044400ffffffff4884444444444444888fffff55555555566555660000000000000000000000000000000000000000
00000000ccccccccccccccccffffffff00000000ffffffff88844444444444448888ffff4444cccccccccccc0000065666666000000000000000000000000000
00000000ccccccccccccccccffffffff00000000fffffff488844444444444448848ffff4444ccccccccccc40000666666655566000000000000000000000000
00000000ccccccccccccccccffffffff00000000fffffff448444944444449488844ffff4444cccccccccc440000665555555665000000000000000000000000
00000000ccccccccccccccccffffffff00000000fffffff44844499444444988844488ff44444ccccccccc440066665555555555000000000000000000000000
00000000ccccccccccccccc4ffffffff00000000ffffff488844488944448888848888ff44444ccccccccc440665665555555555000000000000000000000000
000000004cccccccccccccc4ffffffff00000000ffff44488844488944488888444488ff444444cccccccc446666665555555555000000000000000000000000
000000004cccccccccccccc4ffffffff00000000ffff448884448884444888444444488f444444ccccccccc46666666655555555000000000000000000000000
0000000044ccccccccccccc4ffffffff00000000ffff44888444888444488a444444488f4444444cccccccc46656656555555555000000000000000000000000
0000000044cccccccccccc440000000000000000fff444884444aa44448884444444488f4444444cccccccc46666666555555555000000000000000000000000
0000000044cccccccccccc440000000000000000fff448884444444448888444444448884444444ccccccc446666665555555555000000000000000000000000
0000000044ccccccccccc4440000000000000000fff4488844444444888844444444488844444444cccccc446666666666555555000000000000000000000000
0000000044444cccccccc4440000000000000000ff44888444444448888444444444488844444444cccccc445666566665555555000000000000000000000000
0000000044444ccccccccc440000000000000000ff44888444444448884444444444888444444444ccccccc46666666666655555000000000000000000000000
00000000444444ccccccccc400000000000000004448884444444488844444488888888444444444ccccccc46665666656655555000000000000000000000000
00000000444444ccccccccc40000000000000000448888444444448884444488888888444444444444cccc446566665555555555000000000000000000000000
00000000444444ccccccccc40000000000000000448884444444448844444888844444444444444444ccccc46666665555555555000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
515151515151515151515151515151515151515151515151515151515151515151515151c0515151513151515151515151515151515151515151515151515151
515151d0d0515151515151515151515151515151d051c0515151d0d0d0d0d0d0d0c0c05151d0d0d0d0d0c0c0515151c051515151d05151515151515151515151
51515151515151515151515151515151515151515151c0515151515151515151515151c0c0515151513131313131313131515151515151515151515151515151
51515151d05151404040404040515151515151d0d051c05151515151515151515151c0c05151515151d0d0d0c05151c0c0d0d0d0d0515151c051515151515151
51515151515151515151515151515151515151515151c0515151515151515151515151c051515151515131315151515131313131515151515151515151515151
5151515151d040405151515140405151515151d05151c0c0c0515151c0c0c0c0515151c0c051515151515151c0d05151c0c0515151515151c051515151515151
5151515151c0515151515151515151515151515151c051515151303030305151515151c051515151515131315151515151515131315151515151515151515151
515151515151d0d0d0405151514051515151d0d051515151c0c0c0c0c05151c0c0515151c0c0515151515151c0d0d05151c0c05151515151c051515151515151
5151515151c0c05151303030305151515151515151c0515151303051513030515151c05151515151515151315151515151515151313151515151515151515151
5151515151514051d0d0d0d0d0d0d0d0d0d0515151c0c0c05151515151515151c051515151c05151515151c0c051d0d05151c0c0c0c0c0c05151515151515151
515151515151c051303051513030515151515151c0c0515130305151515151303051c05151515151515151313151313131313151513151515151515151515151
5151515151514051405140405140405151515151515151c0c0c0c0c0c0c0c0c0c05151515151c0515151c0c0515151d0d0515151515151515151515151515151
51515151515151c0305151515130305151515151c051513030515151515151513051c05151515151515151313131315151313151513151515151515151515151
5151515151514051404040404040515151515151515151515151515151515151515151515151c0c0c0c0515151515151d0515151515151515151515151515151
51515151515130c0c051515151513030305151c0c0513030515151515151515130c0303030515151515151313131313131315151513131315151515151515151
51515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151
5151515130305151c0c0515151515151303030c030305151515151515151515151c0515151515151515151515151515151515151515131315151515151515151
51515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151
515151303051515151c0515151515151515151c051515151515151515151515151c0515151515151515151515151515151515151515151515151515151515151
51515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151
515151305151515151c0c051515151515151c0c051515151515151515151515151c0515151515151515151515151515151515151515151515151515151515151
51515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151
515151515151515151515151515151515151515151515151515151515151515151c0515151515151515151515151515151515151515151515151515151515151
51515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151
51515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151
51515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151
51515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151
51515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151
51515151515151515151515151513151515151515151515151515151515151515151515151515151515151515151515151515151513051515151515151515151
51515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151
51515151515151526272825151515151515151515151515151515151515151515130515151b0515151515151b051515151515151305151515151515152627282
52627282515151d051515151515151515151515151515151515151515151515151515151515151515151515151515151515151d051515151315141515151d051
515151b0b0b051536373833030305151405151313131315151415151515130515151515151b0514051515140b051514051515130513051515151514053637383
5363738340515151d0d0c051c051c051d0d0d0d0515151515141315131515151515151b0b03030515130b05151305151d0d05151d051513141313141d0513051
514151b0b0b05154647484513030b05140514031313131514151414151305130303051b051b0b05140514040b040405151415151305130515151514054647484
5464748440d051c0d0c0d0c0d0c0d0d0515151515151413151315131513151404051b0b0b051b030b030b0513051303030d030d051d0314041314141d0d05151
3051315151513155657585513030514051404031313131415141514130513030305130b0b0b0b0b0b0b040404040404041414130303030305130404055657585
556575854051c0d0c0c051c0c0c0c051d0d0d05141514151415141513151405140b0b0b0b0b0b0b0b0b0b0b030b03030303030d0d0d0404131413141c0413030
5151515151515151515151515151515151515151515151515151515151b151515151515151515151515151515151515151515151515151b15151515151515151
51515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151
515151515151515151515151515151515151515151515151515151b1b1b15151515151515151515151515151515151515151515151b1b1b15151515151515151
51515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151
c151515151515151515151515151515151515151515151515151b1b1515151515151515151515151515151515151515151515151b1b151515151515151515151
51515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151
5151515151515151515151515151515151515151515151515151b1515151515151515151515151515151515151515151515151b1b15151515151515151515151
51515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151
51515151515151515151515151515151515151515151515151b1b15151515151515151515151515151515151515151515151b1b1515151515151515151515151
51515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151e1f151b1b151
515151515151515192a25151515151515151515151515151b1b1515151515151515151515151515151b151515151515151b1b151515151515151515151515151
515151515151515151515151515151515151515151515151515151515151515192a2515151515151515151515151515151515151515151515151e2f2b1b1b151
505050505050505093a3505050505050505050505050503434505050505050505050505050505050505050505050505050343450505050505050505050505050
505050505050505050505050505050505050505050505050343450505050505093a3505050505050505050505050505050505050505050505050b4c450505050
12121212121212121212121212121212121212121212121424121212121212121212121212121212121212121212121212142412121212121212121212121212
12121212121212121212121212121212121212121212121214241212121212121212121212121212121212121212121212121212121212121212b5c512121212
12121212121212121212121212121212121212121212121525121212121212121212121212121212121212121212121212152512121212121212121212121212
12121212121212121212121212121212121212121212121215251212121212121212121212121212121212121212121212121212121212121212121212121212
121212121212121212121212121212121212121212121294a412121212121212121212121212121212121212121212121294a412121212121212121212121212
12121212121212121212121212121212121212121212121294a41212121212121212121212121212121212121212121212121212121212121212121212121212
121212121212121212121212121212121212121212121295a512121212121212121212121212121212121212121212121295a512121212121212121212121212
12121212121212121212121212121212121212121212121295a51212121212121212121212121212121212121212121212121212121212121212121212121212
12121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212
12121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212
12121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212
12121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212
__gff__
0000000101010100000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000000000000000010101000000000000000101000000000101000000000000000001010000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1b15151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515150d0d0d0d0d0d0d150d0d0d0d0d0d15150d151515151515151515151515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515150d15150d15151515151515151515151515151515150d0c0d0d0c0d0d150d1515151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515150d15150d0d151515151515151515151515151515150c1515150c0c0c150d0d0d151515151515151515151515
151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515151515150d151515151515151515151515151515150d1515150d150c0c0c0c15151515151515151515150c15151515150c1515150d151515151515151515151515
1515151515151515151515151515151515151515151515151515151515151515151515150c1515151515151515151515151515151515151515151515151515151515150d151515151515151515151515151515150d150c0c0d0d0c1515150c150d0d0d0d0d151515150c0c151515150c1515150d0d1515150c15151515151515
__sfx__
00010000173601836018360193600b36020360263602b3602e36031360343602086035360363603637036370333702c37029370263700e3700c3700d370000700007000070000700007000070000700007000070
0016000000030000501d050158601a8701d8502182025850288502a8501c050190501605012050220500f0500f0500f05010050150501b0501d0501e0501e0501b05015050100500b0500a0500d0501105000000
__music__
00 41424344
04 01020304

