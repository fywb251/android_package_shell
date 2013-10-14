count=$#;
if [ $count -lt 1 ] ;then
     echo '缺少参数';
else
     echo '参数正确';
     appName=$1'11';
     
     #echo $appName;
     echo '删除原有的工程';
     #rm -rf ./appName;

     echo '开始复制目录'
     cp -Rif $1 $appName
     if [ $? -eq 0 ] ;then
            echo '进入工程目录'
            cd $appName;
            #拷贝icon，背景图片 TODO
            echo '修改工程名'
            find . -type f -name ".project"|xargs perl -pi -e 's/CubeAndroid/$appName/g';
            echo '查找并替换应用名称'
            find . -type f -name "strings.xml"|xargs perl -pi -e 's/变色龙2.0/南航移动应用/g';
            #修改变色龙移动平台名称
            echo '查找并替换变色龙移动平台'
            find . -type f -name "strings.xml"|xargs perl -pi -e 's/变色龙移动平台/南航移动应用/g';
            echo '查找并替换变色龙的描述'
            find . -type f -name "strings.xml"|xargs perl -pi -e 's/变色龙/南航移动应用/g';
            echo '查找并替换包名'
            find . -type f -name "AndroidManifest.xml"|xargs perl -pi -e 's/package=\"com.foreveross.chameleon\"/package=\"com.csair.impc\"/g';
            echo '查找并替换引用文件R.java的路径'
            find . -type f -name "*.java" |xargs perl -pi -e 's/com.foreveross.chameleon.R/com.csair.impc.R/g';
            #find . -type f -name "*.xml" |xargs perl -pi -e 's/com.foreveross.chameleon/com.csair.impc/g';
            #find . -type f -name "*.properties" |xargs perl -pi -e 's/com.foreveross.chameleon/com.csair.impc/g';
            #find . -type f -name "*.txt" |xargs perl -pi -e 's/com.foreveross.chameleon/com.csair.impc/g';
            #find . -type f -name "*.json" |xargs perl -pi -e 's/com.foreveross.chameleon/com.csair.impc/g';
            find . -type f -name "AndroidManifest.xml"|xargs perl -pi -e 's/android:name=\"\./android:name=\"com.foreveross.chameleon\./g';
            
           # echo '修改目录下的文件夹名称'
           # path=$PWD;
           # mv $path"/src/com/foreveross" $path"/src/com/csair";
           # if [ $? -eq 0 ] ;then
           #   echo '修改foreveross 成功';
           # else 
           #   echo '修改foreveross 失败';
           # fi
            #echo '修改chameleon为新的名称'
            #mv $path"/src/com/csair/chameleon" $path"/src/com/csair/impc";
            #if [ $? -eq 0 ] ;then
             #  echo '修改chameleon 成功';
           #else 
            #   echo '修改chameleon 失败';
            #fi
            
            echo '去掉CubeApplication中用户南航业务的代码注释'
            find . -type f -name "CubeApplication.java" |xargs perl -pi -e 's/\/\*<!--//g';
            find . -type f -name "CubeApplication.java" |xargs perl -pi -e 's/-->\*\///g';
            find . -type f -name "CubeLoginPlugin.java" |xargs perl -pi -e 's/\/\*<!--//g';
            find . -type f -name "CubeLoginPlugin.java" |xargs perl -pi -e 's/-->\*\///g';
            echo '释放DownloadUpdateActivity中的南航业务代码'
            find . -type f -name "DownloadUpdateActivity.java" |xargs perl -pi -e 's/\/\*<!--//g';
            find . -type f -name "DownloadUpdateActivity.java" |xargs perl -pi -e 's/-->\*\///g';
            find . -type f -name "Application.java" |xargs perl -pi -e 's/\/\*<!--//g';
            find . -type f -name "Application.java" |xargs perl -pi -e 's/-->\*\///g';
            find . -type f -name "CubeModuleOperatorPlugin.java" |xargs perl -pi -e 's/\/\*<!--//g';
            find . -type f -name "CubeModuleOperatorPlugin.java" |xargs perl -pi -e 's/-->\*\///g';
            find . -type f -name "CubeAndroid.java" |xargs perl -pi -e 's/\/\*<!--//g';
            find . -type f -name "CubeAndroid.java" |xargs perl -pi -e 's/-->\*\///g';
            
            
            echo '去掉main.js中注释的南航的业务代码'
            find . -type f -name "main.js" |xargs perl -pi -e 's/\/\*<!--//g';
            find . -type f -name "main.js" |xargs perl -pi -e 's/-->\*\///g';
            echo '屏蔽主干分支中的业务逻辑'
            find . -type f -name "main.js" |xargs perl -pi -e 's/\/\/<!--/\/\*/g';
            find . -type f -name "main.js" |xargs perl -pi -e 's/\/\/-->/\*\//g';


            #find . \( -name "bin" -prune \) -o \( -name 'gen' -prune \) -o \( -name ".svn" -prune \) -o \( -name 'foreveross' \) -type d -exec mv $path{} $path"/src/com/csair" \; #|xargs echo {};
            #if [ $? -eq 0 ] ;then
            #  echo '修改foreveross 成功'
            #else
            #  echo '修改foreveross 失败'
            #fi
            #find . -type d -name "chameleon"|xargs -I mv {} impc;
            #if [ $? -eq 0 ] ;then
            #  echo '修改chameleon 成功'
            #else
            #  echo '修改chameleon 失败'
            #fi
            echo '修改MinaMobileClient下连接的包名'
            find . -type f -name "MinaMobileClient.java"|xargs perl -pi -e 's/"com.csair.impc"/"com.foreveross.chameleon"/g';
            
            echo '删除 gen 目录'
            find . -type d -name "gen" -print0 |xargs -0 rm -rf;

            echo '修改URL中的BASE_WS'
            find . -type f -name "cube.properties"|xargs perl -pi -e 's/10.108.1.217:18860/192.168.11.18:18860/g';
            echo '修改BASE-WEB';
            find . -type f -name "cube.properties"|xargs perl -pi -e 's/10.108.1.217:8080/192.168.11.18:18860/g';
            echo '修改MUC_BASE'
            find . -type f -name "cube.properties"|xargs perl -pi -e 's/115.28.0.60:8081/192.168.11.18:9000/g';
            find . -type f -name "cube.properties"|xargs perl -pi -e 's/b5131a6065ba2e980f5b2180f5238385/c7342d0390ac6be8da4bdae0fcde5edf/g';
            echo '修改登陆的接口';
            find . -type f -name "URL.java"|xargs perl -pi -e 's/system\/api\/system\/mobile\/accounts\/login/csair-extension\/api\/accounts\/login/g';
            find . -type f -name "Application.java"|xargs perl -pi -e 's/system\/api\/system\/mobile\/accounts\/login/csair-extension\/api\/accounts\/login/g';
            echo '替换开机画面'
            cp ./打包/cube_impc/welcome.jpg  ./res/drawable
            echo '修改主界面的变色龙为南航移动应用'
            find . -type f -name "index.html"|xargs perl -pi -e 's/变色龙/南航移动应用/g';
            find . -type f -name "main.js"|xargs perl -pi -e 's/变色龙/南航移动应用/g';
            
            #echo '修改DOWNLOADURL的参数'
            #find . -type f -name "URL.java"|xargs perl -pi -e 's/files\//update\/appcount\/Android\//g';
            #echo '修改ANNOUNCE'
            #find . -type f -name "URL.java"|xargs perl -pi -e 's/com.foreveross.chameleon.R/115.28.0.60:8081/g’;
            echo '查找并替换mina的配置文件'
            find . -type f -name "cube.properties"|xargs perl -pi -e 's/serverIp=10.108.1.217/serverIp=192.168.11.18/g';
            #find . -type f -name "cube.properties"|xargs perl -pi -e 's/serverPort=18567/serverPort=18567/g';
            echo '修改数据的版本'
            find . -type f -name "cube.properties"|xargs perl -pi -e 's/STORE_DB_VERSION=1/STORE_DB_VERSION=5/g';
            echo '查找并替换即时通讯的服务器地址'
            find . -type f -name "cube.properties"|xargs perl -pi -e 's/xmppHost=115.28.0.60/xmppHost=10.108.68.99/g';
            echo '查找并替换即时通讯的服务器的端口'
            #find . -type f -name "cube.properties"|xargs perl -pi -e 's/xmppPort=5222/xmppPort=5222/g';
            echo '修改MUC的serviceName'
            find . -type f -name "cube.properties"|xargs perl -pi -e 's/conference.snda-192-168-2-32/conference.mobile.app/g';
            find . -type f -name "XmppManager.java"|xargs perl -pi -e 's/snda-192-168-2-32/mobile.app/g';


            echo '修改cube.json文件中的identifier'
            find . -type f -name "Cube.json"|xargs perl -pi -e 's/com.fosseveross.chameleon/com.csair.impc/g';
            echo '替换应用的appkey'
            find . -type f -name "Cube.json"|xargs perl -pi -e 's/b5131a6065ba2e980f5b2180f5238385/c7342d0390ac6be8da4bdae0fcde5edf/g';
            echo '-------------------------------success------------------------------------';

            
     fi
     
fi
