// 使用 promisified fs，用于文件操作
const fs = require('fs/promises');

async function main() {
    try {
        // 获取环境变量
        const env = process.env;

        // 过滤出名为 lybck 的环境变量
        const ckVars = Object.keys(env).filter(key => key.startsWith('lybck'));

        // 拼接环境变量
        const concatenated = ckVars.map(key => env[key]).join('~');

        // 将结果写入文件
        await fs.writeFile('elm_list.json', concatenated);
        console.log('缓存ck文件创建成功......');

        // 读取文件内容
        let data = await fs.readFile('elm_list.json', 'utf8');

        // 在最后添加换行符
        const updatedData = data + '\n';

        // 写回文件
        await fs.writeFile('elm_list.json', updatedData, 'utf8');
        console.log('换行符添加完成...');

        // 等待2秒，防止过快，文件读写报错
        console.log("等待2秒，防止文件读写过快报错");
        await delay(2000);

        // 再次读取文件内容
        data = await fs.readFile('elm_list.json', 'utf8');

        // 用换行符替换&符号
        const newData = data.replace(/&/g, '\n');

        // 将修改后的内容写回到 elm_list.json 文件中
        await fs.writeFile('elm_list.json', newData, 'utf8');
        console.log('替换完成！');

    } catch (err) {
        console.error('发生错误:', err);
    }
}

// 延时函数
function delay(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

// 调用 main 函数
main();
