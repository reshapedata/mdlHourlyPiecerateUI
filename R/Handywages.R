#' Handywages生成器界面
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
#' HandywagesUI()
HandywagesUI <- function(tabTitle ='杂工工资计算',
                          colTitles =c('操作区域','操作区域','显示区域'),
                          widthRates =c(6,6,12),
                          func_left = HandywagesUI_left,
                          func_right =HandywagesUI_right,
                          func_bottom = HandywagesUI_bottom
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
#' HandywagesUI_left()
HandywagesUI_left <- function() {


  res <- tagList(
    tsui::layout_2C(x= tsui::mdl_text2(id = 'text_Handywages_FYEAR',label = '请输入年份'),
                    y=  tsui::mdl_text2(id = 'text_Handywages_FMONTH',label = '请输入月份')),
    tsui::layout_2C(x=tsui::mdl_text2(id = 'text_Handywages_FNAME',label = '请输入员工姓名'),
                    y=tsui::mdl_text2(id = 'text_Handywages_BASEWAGES',label = '基础工资')),

    tsui::layout_2C(x=tsui::mdl_text2(id = 'text_Handywages_FattendanceDays',label = '出勤天数'),
                    y=tsui::mdl_text2(id = 'text_Handywages_FleaveDays',label = '请假天数')),

    shiny::actionButton(inputId = 'btn_Handywages_upload',label = '上传员工出勤信息'),






  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' HandywagesUI_bottom()
HandywagesUI_right <- function() {
  res <- tagList(
    tsui::mdl_text2(id = 'text_Handywages_fname_view',label = '输入员工姓名'),

    shiny::actionButton(inputId = 'btn_Handywages_view',label = '查询工资表'),
    tsui::mdl_download_button(id = 'dl_Handywages',label = '下载工资表'),


    tsui::mdl_text2(id = 'text_Handywages_FID_delete',label = '输入需要删除工资表编号'),

    shiny::actionButton(inputId = 'btn_Handywages_delete',label = '删除工资信息'),


    # shiny::actionButton(inputId = 'btn_Handywages_download',label = '下载数据'),









  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' HandywagesUI_bottom()
HandywagesUI_bottom <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'dt_Handywages'))

  )
  return(res)

}
