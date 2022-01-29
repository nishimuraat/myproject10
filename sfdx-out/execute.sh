#!/bin/sh

# 本番(エイリアス名: abc)からデータをエクスポート
sfdx force:data:tree:export \
 -u abc \
 -q "SELECT Id, Name, custom_text__c FROM test_custom_obj__c"  \
 --prefix export --outputdir sfdx-out

# スクラッチ組織(エイリアス名: myproject10)にインポート
sfdx force:data:tree:import -u myproject10 \
-f sfdx-out/export-test_custom_obj__c.json