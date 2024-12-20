% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Handywages.R
\name{HandywagesUI}
\alias{HandywagesUI}
\title{Handywages生成器界面}
\usage{
HandywagesUI(
  tabTitle = "杂工工资计算",
  colTitles = c("操作区域", "操作区域", "显示区域"),
  widthRates = c(6, 6, 12),
  func_left = HandywagesUI_left,
  func_right = HandywagesUI_right,
  func_bottom = HandywagesUI_bottom
)
}
\arguments{
\item{tabTitle}{标题}

\item{colTitles}{主页标题}

\item{widthRates}{左右比例}

\item{func_left}{左函数}

\item{func_right}{右函数}

\item{func_bottom}{下面一栏}
}
\value{
返回值
}
\description{
Handywages生成器界面
}
\examples{
HandywagesUI()
}
