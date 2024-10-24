#######################################################################################

#    饿了么集合
#  
#   
#    本脚本为中央控制脚本，需要设置环境使用方法如下：
#        1.将elm_env.js和你的饿了么脚本一并放入elm文件夹，自行下方的脚本名称。
#        2.请在elm_env.js中修改你的环境变量的名称。

#    本脚本全部为gpt书写..........

#######################################################################################



# 删除历史缓存ck文件
rm -f elm_list.json

# 账号检测续期
# node ./elm/ele_check_zm.js

# 生成环境变量存储文件
node ./elm/elm_env.js || { echo "环境变量文件生成失败！"; exit 1; }

# 检查 list 文件是否存在
if [ ! -f elm_list.json ]; then
   echo "缓存环境变量文件不存在！"
   exit 1
fi

# 读取 list 文件中的每一行
while IFS= read -r elmck; do
    # 设置环境变量
    export elmck

    # 执行脚本
    echo "
=============================================
遍历缓存ck，依次执行脚本......
============================================="

# 执行各类脚本
    node ./elm/ele_sqqd.js || { echo "执行 ele_sqqd.js 失败！"; exit 1; }
    node ./elm/ele_lyb_bak.js || { echo "执行 ele_lyb_bak.js 失败！"; exit 1; }
    node ./elm/ele_lyb.js || { echo "执行 ele_lyb.js 失败！"; exit 1; }
    python ./elm/ele_lyb.py || { echo "执行 ele_lyb.py 失败！"; exit 1; }
    node ./elm/ele_wydzc.js || { echo "执行 ele_wydzc.js 失败！"; exit 1; }
    node ./elm/ele_tjcs_other.js || { echo "执行 ele_tjcs_other.js 失败！"; exit 1; }
    node ./elm/ele_tjcs.js || { echo "执行 ele_tjcs.js 失败！"; exit 1; }
    node ./elm/ele_femf.js || { echo "执行 ele_femf.js 失败！"; exit 1; }
    node ./elm/ele_llk.js || { echo "执行 ele_llk.js 失败！"; exit 1; }
    python ./elm/ele_tcs.py || { echo "执行 ele_tcs.py 失败！"; exit 1; }
    node ./elm/ele_sskz.js || { echo "执行 ele_sskz.js 失败！"; exit 1; }
    node ./elm/ele_2048.js || { echo "执行 ele_2048.js 失败！"; exit 1; }
    node ./elm/ele_elge.js || { echo "执行 ele_elge.js 失败！"; exit 1; }
    python ./elm/ele_chd.py || { echo "执行 ele_chd.py 失败！"; exit 1; }
    node ./elm/ele_hctmm.js || { echo "执行 ele_hctmm.js 失败！"; exit 1; }
    python ./elm/ele_kpblxcc.py || { echo "执行 ele_kpblxcc.py 失败！"; exit 1; }
    python ./elm/ele_lgqs.py || { echo "执行 ele_lgqs.py 失败！"; exit 1; }
    node ./elm/ele_mhxy.js || { echo "执行 ele_mhxy.js 失败！"; exit 1; }
    node ./elm/ele_mst_bak.js || { echo "执行 ele_mst_bak.js 失败！"; exit 1; }
    node ./elm/ele_mst.js || { echo "执行 ele_mst.js 失败！"; exit 1; }
    python ./elm/ele_tyt.py || { echo "执行 ele_tyt.py 失败！"; exit 1; }
    node ./elm/ele_assest.js || { echo "执行 ele_assest.js 失败！"; exit 1; }
    node ./elm/ele_xydb.js || { echo "执行 ele_xydb.js 失败！"; exit 1; }
    node ./elm/ele_xydb_bak.js || { echo "执行 ele_xydb_bak.js 失败！"; exit 1; }
    python ./elm/ele_guoyuan.py || { echo "执行 ele_guoyuan.py 失败！"; exit 1; }
    
# 结束
done < elm_list.json

# 清理缓存
rm -f elm_list.json

echo "
=============================================
清理缓存，所有CK任务执行完成...
============================================="
