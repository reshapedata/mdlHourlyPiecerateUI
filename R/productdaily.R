#' productdaily 生成器界面
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
#' productdailyUI()
productdailyUI <- function(tabTitle ='工序生产日报',
                           colTitles =c('操作区域','操作区域','显示区域'),
                           widthRates =c(6,6,12),
                           func_left = productdailyUI_left,
                           func_right =productdailyUI_right,
                           func_bottom = productdailyUI_bottom
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
#' productdailyUI_left()
productdailyUI_left <- function() {


  res <- tagList(
    tsui::mdl_text2(id = 'text_productdaily_FYEAR',label = '请输入年份'),
    tsui::mdl_text2(id = 'text_productdaily_FMONTH',label = '请输入月份'),

    shiny::actionButton(inputId = 'btn_productdaily_erpsync',label = '按年月同步erp数据至中台'),


    shiny::actionButton(inputId = 'btn_productdaily_get',label = '获取工序生产数据'),
    tsui::mdl_download_button(id = 'dl_productdaily_get',label = '下载工序生产数据'),

    tsui::mdl_file(id = 'file_productdaily',label = '请上传文件'),

    #shiny::actionButton(inputId = 'btn_productdaily_pre',label = '预览文件内容'),

    shiny::actionButton(inputId = 'btn_productdaily_upload',label = '上传文件')


  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' productdailyUI_bottom()
productdailyUI_right <- function() {
  res <- tagList(




    tsui::mdl_text2(id = 'text_productdaily_FProductLots',label = '请输入需要查询的流水号'),
    tsui::mdl_text2(id = 'text_productdaily_FProductLots_delete',label = '请输入需要删除的流水号'),


    shiny::actionButton(inputId = 'btn_productdaily_view',label = '按流水号查询'),

    shiny::actionButton(inputId = 'btn_productdaily_delete',label = '删除数据'),

    tsui::mdl_download_button(id = 'dl_productdaily',label = '下载数据')








  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' productdailyUI_bottom()
productdailyUI_bottom <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'dt_productdaily'))

  )
  return(res)

}
