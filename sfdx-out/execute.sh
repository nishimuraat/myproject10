#!/bin/sh

# 本番(エイリアス名: abc)からデータをエクスポート
sfdx force:data:tree:export -u abc \
--query "SELECT Id, Name, custom_text__c FROM test_custom_obj__c" \
--prefix export-demo \
--outputdir sfdx-out --plan

# スクラッチ組織(エイリアス名: myproject10)にインポート
sfdx force:data:tree:import -u myproject10 \
--plan sfdx-out/export-demo-test_custom_obj__c-plan.json