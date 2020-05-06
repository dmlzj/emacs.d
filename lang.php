<?php
$param_arr = getopt('f:');
$file_dir = $param_arr['f'];
// 读取当前文件
$source_file = file($file_dir);

// 对比文件路径
$target_file_name = '/Users/dmlzj/www/weex/OneOne/src/js/config/lang/zh.js';


foreach($source_file as $line => $content){
    // echo 'line '.($line + 1).':'.$content;
    $pattern = "/lang\(\'(.*)\'\)/";
    $num = preg_match($pattern, $content, $return);
    if ($num) {
        // print_r($return[1]);
        $content = $return[1];
        $flag = false;
        // 对比的文件
        $target_file = file($target_file_name);
        foreach($target_file as $t_l => $t_c) {
            $str_arr = explode(':', $t_c);
            // print_r($str_arr);
            $pattern = "/\'?" . $content . "\'?/";
            if (preg_match($pattern, $str_arr[0])) {
                $flag = true;
            }
        }
        $target_file_length = count($target_file);

        if (!$flag) {
            $str = "    '" . $content . "': '" . $content . "',\n";
            // print_r($str);exit();
            insert($target_file_name, $target_file_length - 2, $str);
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
    echo '已经将' . $txt . '写入文档' . $file;
}
