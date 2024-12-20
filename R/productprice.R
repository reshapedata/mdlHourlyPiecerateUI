#' productprice 生成器界面
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
#' productpriceUI()
productpriceUI <- function(tabTitle ='订单核价单',
                             colTitles =c('操作区域','操作区域','显示区域'),
                             widthRates =c(6,6,12),
                             func_left = productpriceUI_left,
                             func_right =productpriceUI_right,
                             func_bottom = productpriceUI_bottom
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
#' productpriceUI_left()
productpriceUI_left <- function() {


  res <- tagList(

    shiny::actionButton(inputId = 'btn_productprice_get',label = '获取订单核价单数据'),
    tsui::mdl_download_button(id = 'dl_productprice_get',label = '下载订单核价单'),

    tsui::mdl_file(id = 'file_productprice',label = '请上传文件'),

    #shiny::actionButton(inputId = 'btn_productprice_pre',label = '预览文件内容'),

    shiny::actionButton(inputId = 'btn_productprice_upload',label = '上传文件')


  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' productpriceUI_bottom()
productpriceUI_right <- function() {
  res <- tagList(




    tsui::mdl_text2(id = 'text_productprice_FSpecification',label = '请输入需要查询的产品规格型号'),
    tsui::mdl_text2(id = 'text_productprice_FSpecification_delete',label = '请输入需要删除的产品规格型号'),


    shiny::actionButton(inputId = 'btn_productprice_view',label = '按产品规格型号查询'),

    shiny::actionButton(inputId = 'btn_productprice_delete',label = '删除数据'),

    tsui::mdl_download_button(id = 'dl_productprice',label = '下载数据')








  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' productpriceUI_bottom()
productpriceUI_bottom <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'dt_productprice'))

  )
  return(res)

}
