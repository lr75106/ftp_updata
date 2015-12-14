/*************************************************************************
	> File Name: common_func.h
	> Author: 
	> Mail: 
	> Created Time: 2015年12月14日 星期一 15时15分30秒
 ************************************************************************/
 
#ifndef _COMMON_FUNC_H
#define _COMMON_FUNC_H
    
#include <gtk/gtk.h>
GdkPixbuf *create_pixbuf(const gchar * filename);
void toggle_display(GtkWidget *widget, gpointer oneofwidget);

#endif // __COMMON_FUNC_H__
