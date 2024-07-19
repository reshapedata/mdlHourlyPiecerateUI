#' HourlyPiece生成器界面
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
#' HourlyPieceUI()
HourlyPieceUI <- function(tabTitle ='计时计件工资模板',
                                colTitles =c('操作区域','操作区域','显示区域'),
                                widthRates =c(6,6,12),
                                func_left = HourlyPieceUI_left,
                                func_right =HourlyPieceUI_right,
                                func_bottom = HourlyPieceUI_bottom
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
#' HourlyPieceUI_left()
HourlyPieceUI_left <- function() {


  res <- tagList(
    tsui::uiTemplate(templateName = '博宇翔鹰计时计件工资模板表'),
    tsui::mdl_file(id = 'file_HourlyPiece',label = '请上传文件'),

    shiny::actionButton(inputId = 'btn_HourlyPiece_pre',label = '预览文件内容'),

    shiny::actionButton(inputId = 'btn_HourlyPiece_upload',label = '上传文件')


  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' HourlyPieceUI_bottom()
HourlyPieceUI_right <- function() {
  res <- tagList(
    tsui::mdl_text2(id = 'text_HourlyPiece_FProductionNumber',label = '请输入需要查询的生产批号'),
    tsui::mdl_text2(id = 'text_HourlyPiece_FProductionNumber_delete',label = '请输入需要删除的生产批号'),


    shiny::actionButton(inputId = 'btn_HourlyPiece_view',label = '按生产批号查询'),

    shiny::actionButton(inputId = 'btn_HourlyPiece_delete',label = '删除数据'),

   # shiny::actionButton(inputId = 'btn_HourlyPiece_download',label = '下载数据'),
    tsui::mdl_download_button(id = 'dl_HourlyPiece',label = '下载数据')








  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' HourlyPieceUI_bottom()
HourlyPieceUI_bottom <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'dt_HourlyPiece'))

  )
  return(res)

}
