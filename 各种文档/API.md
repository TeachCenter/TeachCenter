

==========================主站==========================

1. Index

   请求URL:Ajax/Index_Handler.ashx

   后台返回数据

   ```
   //banner轮播图
   data{
     "Picture_id" : "1"
     "Picture_path" : "/BackStage/image/20170512103827.jpg" 
   }
   ```

   后台返回数据

   ```
   //教学发展
   data{
     "Develop_id" : "1"
     "Develop_path":"/BackStage/image/20170512103827.jpg"
     "Develop_title":"这个是一个标题"
     "Develop_href":"xxxx.html"
   }
   ```

   后台返回数据

   ```
   //工作动态
   data{
     "ActivitySummary_id" : "1"
     "ActivitySummary_cover":"/BackStage/image/20170512103827.jpg"
     "ActivitySummary_title":"这个是一个标题"
     "ActivitySummary_href":"xxxx.html"
   }
   ```

   后台返回数据

   ```
   //通知公告
   data{
     "noticeTitle":"这个是一个标题"
     "noticeHref":"xxx.html"
   }
   ```

2. Introduction

   请求URL:Ajax/Introduction_Handler.ashx

   后台返回数据

   ```
   data{
     "Introduction_content":"简介"
   }
   ```

   备注:无发布时间发布人和浏览数

3. Project

   请求URL:Ajax/ProjectList_Handler.ashx

    后台返回数据

   ```
   data{
     "project_id" : "1"
     "name":"这个是一个标题"
   }
   //标题a标签<a>跳转URL为xxx.html?id=1(developID)
   ```

4. ProjectContent

   请求URL:Ajax/ProjectList_Handler.ashx

   略略略

5. Service

   这个页面用绑代码

6. EducateSourceList

   请求URL:Ajax/EducateSourceList_Handler.ashx

   后台返回数据

   ```
   data{
     "id" : "1"
     "title" : "这是一个标题"
     "body" : "文章内容"
     "publisher":"发布者"
     "publish_time":"发布时间"
     "view_times":"12"
   }
   //标题a标签<a>跳转URL为xxx.html?id=1(id)
   ```

7. EducateSourceContent

   请求URL:Ajax/EducateSourceContent_Handler.ashx

   返回给后台的参数		id

   后台返回数据

   ```
   data{
     "title" : "这是一个标题"
     "body" : "文章内容"
     "publisher":"发布者"
     "publish_time":"发布时间"
     "view_times":"12"
   }
   ```

8. ActivityList

   请求URL:Ajax/ActivityList_Handler.ashx

   参数  ActivityCategory_id

   后台返回数据

   ```
   //侧边导航栏部分
   data{
     "ActivityCategory_id" : "1"
     "ActivityCategory_name" :"活动分类"
     "ActivityCategory_href":"xxxx.html"
   }

   ```

   后台返回数据

   ```
   //中间列表部分  普通活动
   data{
     "Activity_id":"1"
     "Activity_title" : "这是一个标题"
     "Activity_content" : "文章内容"
     "Activity_author":"发布者"
     "Activity_time":"发布时间"
     "Activity_hit":"12"
     "Activity_href":"xxxx.html"
   }
   ```

   后台返回数据

   ```ActivityList
   //中间列表部分  活动总结
   data{
     "ActivitySummary_id":"1"
     "ActivitySummary_title" : "这是一个标题"
     "ActivitySummary_content" : "文章内容"
     "ActivitySummary_author":"发布者"
     "ActivitySummary_time":"2017-09-18 15:26:09.000"
     "ActivitySummary_hit":"12"
     ""ActivitySummary_href":"xxxx.html"
   }
   ```

9. ActivityContent

   请求URL:Ajax/ActivityContent_Handler.ashx

   参数 Activity_id

   后台返回数据

   ```ActivityContent
   //中间列表部分  活动总结
   data{
     "Activity_id":"1"
     "Activity_title" : "这是一个标题"
     "Activity_content" : "文章内容"
     "Activity_author":"发布者"
     "Activity_time":"2017-09-18 15:26:09.000"
     "Activity_place":"活动举办地方"
     "Activity_nowcount":"1"//当前参与活动人数
     "Activity_limitcount":"12"//活动限制人数
     "Activity_category":"活动类型"
     "Activity_hit":"12"//阅览量
   }
   ```

10. ActivitySummaryContent

   请求URL:Ajax/ActivitySummaryContent_Handler.ashx

   参数 ActivitySummary_id

   后台返回数据

   ```
   //中间列表部分  活动总结
   data{
     "ActivitySummary_id":"1"
     "ActivitySummary_title" : "这是一个标题"
     "ActivitySummary_content" : "文章内容"
     "ActivitySummary_author":"发布者"
     "ActivitySummary_time":"2017-09-18 15:26:09.000"
     "ActivitySummary_hit":"12"//阅览量
   }
   ```

   ​

==========================个人中心==========================

1. Center

   请求URL:Ajax/Center_Handler.ashx

   后台返回数据

   ```
   data{
     "name":"姓名"
     "image":"/BackStage/image/20170512103827.jpg"
     "gender":"1"
     "number":"a123423"
     "phone_number":"12345678901"
     "email":"12345@qq.com"
     "department":"信息科学与工程学院"
     "rank":"高级教师"
     "is_judge":"1"
   }
   //gender 1为男性 0为女性，is_judge  1为评审 0为教师
   ```

2. EditorInformation

   请求URL:Ajax/EditorInformation_Handler.ashx

   后台返回数据

   ```
   data{
     "name":"姓名"
     "image":"/BackStage/image/20170512103827.jpg"
     "gender":"1"
     "number":"a123423"
     "phone_number":"12345678901"
     "email":"12345@qq.com"
     "department":"信息科学与工程学院"
     "rank":"高级教师"
     "is_judge":"1"
   }
   //gender 1为男性 0为女性，is_judge  1为评审 0为教师
   ```

   前台提交内容

   ```
   data{
     "name":"姓名"
     "image":"/BackStage/image/20170512103827.jpg"
     "gender":"1"
     "number":"a123423"
     "phone_number":"12345678901"
     "email":"12345@qq.com"
     "department":"信息科学与工程学院"
     "rank":"高级教师"
     "is_judge":"1"
   }
   //gender 1为男性 0为女性，is_judge  1为评审 0为教师
   ```

3. Project

4. MyServiceList

   请求URL:Ajax/MyServiceList_Handler.ashx

   后台返回数据

   ```
   data{
     "Service_id":"1"
     "Service_author":"发布者"
     "Service_time":"2017-09-18 15:26:09.000"
     "Service_isdeleted":"1"
   }
   //Service_isdeleted为1显示已处理，0未处理
   //每条数据有增加 “编辑” “删除” 按钮
   //编辑
   ```
   请求URL:Ajax/MyServiceDelete_Handler.ashx

   参数: Service_id

5. MyServiceContent

   请求URL:Ajax/MyServiceContent_Handler.ashx

   参数 Service_id

   后台返回数据

   ```
   data{
     "Service_author":"发布者"
     "Service_time":"2017-09-18 15:26:09.000"
     "Service_phone":"12345678910"
     "Service_remarks":"备注"
     "Service_isdeleted":"1"
   }
   ```

6. MyAcitivityList

   请求URL:Ajax/MyAcitivityList_Handler.ashx

   后台返回数据

   ```
   data{
     "Activity_id":"1"
     "Activity_title":"活动标题"
     "Activity_time":"2017-09-18 15:26:09.000"
     "Activity_place":"活动地点"
     "Activity_content":"活动内容"
   }
   //活动内容跳页活动内容页URL为xxx.html?id=1(Activity_id)
   ```

7. ​