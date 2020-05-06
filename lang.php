<?php
$param_arr = getopt('f:');
$file_dir = $param_arr['f'];
// 读取当前文件
$source_file = file($file_dir);

// 对比文件路径
$target_file_name = '/Users/dmlzj/www/weex/OneOne/src/js/config/lang/zh.js';

$is_have = false;
foreach($source_file as $line => $content){
    // echo 'line '.($line + 1).':'.$content;
    $pattern = "/lang\(\'(.*)\'/U";
    $num = preg_match_all($pattern, $content, $return, PREG_PATTERN_ORDER);
    if ($num) {
        // print_r($return[1]);
        foreach($return[1] as $v) {
            $content = $v;
            $flag = false;
            // 对比的文件
            $target_file = file($target_file_name);
            foreach($target_file as $t_l => $t_c) {
                $str_arr = explode(':', $t_c);
                // print_r($str_arr);
                $pattern = "/\'" . $content . "\'/";
                if (isset($str_arr[1]) && preg_match($pattern, $str_arr[1])) {
                    $flag = true;
                }
            }
            $target_file_length = count($target_file);

            if (!$flag) {
                if (!$is_have) {
                    // 插入文件地址
                    $str = '    // '. $file_dir . "\n";
                    insert($target_file_name, $target_file_length - 2, $str);
                    $is_have = true;
                }
                $str = "    '" . $content . "': '" . $content . "',\n";
                // print_r($str);exit();
                insert($target_file_name, $target_file_length - 2, $str);
            }
        }
        
    }
    // print_r($num . '------------------' . $content);
    
}

function insert($file,$line,$txt){
    if(!$fileContent = @file($file)) exit('文件不存在');
    $lines = count($fileContent);
    if($line >= $lines) $line = $lines;
    $fileContent[$line].=$txt;
    $newContent = '';
    foreach($fileContent as $v){
        $newContent.= $v;
    }
    if(!file_put_contents($file,$newContent)) exit('无法写入数据');
    echo '已经将' . $txt . '写入文档' . $file . "\n";
}
