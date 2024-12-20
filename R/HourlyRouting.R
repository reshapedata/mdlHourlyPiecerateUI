#' HourlyRouting 生成器界面
#'
#' @param colTitles  主页标题
#' @param widthRates 左右比例
#' @param func_left 左函数
#' @param func_right 右函数
#' @param tabTitle 标题
#' @param func_bottom  下面一栏
#'
#' @return 返回值
#' @import tsui
#' @export
#'
#' @examples
#' HourlyRoutingUI()
HourlyRoutingUI <- function(tabTitle ='工艺路线',
                          colTitles =c('操作区域','操作区域','显示区域'),
                          widthRates =c(6,6,12),
                          func_left = HourlyRoutingUI_left,
                          func_right =HourlyRoutingUI_right,
                          func_bottom = HourlyRoutingUI_bottom
) {

  #三栏式设置，可以复制
  res = tsui::uiGen3(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right,func_bottom = func_bottom )
  return(res)

}





#' 请输入文件
#'
#' @return 返回值
#' @export
#'
#' @examples
#' HourlyRoutingUI_left()
HourlyRoutingUI_left <- function() {


  res <- tagList(
    tsui::uiTemplate(templateName = '工艺路线模板'),
    tsui::mdl_file(id = 'file_HourlyRouting',label = '请上传文件'),

    #shiny::actionButton(inputId = 'btn_HourlyRouting_pre',label = '预览文件内容'),

    shiny::actionButton(inputId = 'btn_HourlyRouting_upload',label = '上传文件')


  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' HourlyRoutingUI_bottom()
HourlyRoutingUI_right <- function() {
  res <- tagList(
    tsui::mdl_text2(id = 'text_HourlyRouting_FRoutingNumber',label = '请输入需要查询的工艺路线编码'),
    tsui::mdl_text2(id = 'text_HourlyRouting_FRoutingNumber_delete',label = '请输入需要删除的工艺路线编码'),


    shiny::actionButton(inputId = 'btn_HourlyRouting_view',label = '按工艺路线查询'),

    shiny::actionButton(inputId = 'btn_HourlyRouting_delete',label = '删除数据'),

    # shiny::actionButton(inputId = 'btn_HourlyRouting_download',label = '下载数据'),
    tsui::mdl_download_button(id = 'dl_HourlyRouting',label = '下载数据')








  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' HourlyRoutingUI_bottom()
HourlyRoutingUI_bottom <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'dt_HourlyRouting'))

  )
  return(res)

}
