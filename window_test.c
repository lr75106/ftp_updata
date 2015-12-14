#include <gtk/gtk.h>


int test( int argc, char *argv[])
{
 
  GtkWidget *window;
  GtkWidget *table;
  GtkWidget *button;
  int list_len;
  list_len=16;
  char *values[100] = { 
  	"VDI_1","VDI_2","VDI_3","VDI_4",
  	"VDI_5","VDI_6","VDI_7","VDI_8",
  	"VDI_9","VDI_10","VDI_11","VDI_12",
  	"VDI_13","VDI_14","VDI_15","VDI_16"
  };
  //char *values[16]={"123","0"};
  gtk_init(&argc, &argv);
 
  window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_window_set_position(GTK_WINDOW(window), GTK_WIN_POS_CENTER);
  gtk_window_set_default_size(GTK_WINDOW(window), 800, 800);
  gtk_window_set_title(GTK_WINDOW(window), "VDI_LIST");
 
  gtk_container_set_border_width(GTK_CONTAINER(window), 5);

  table = gtk_table_new(11, 10, TRUE);
  gtk_table_set_row_spacings(GTK_TABLE(table), 2);
  gtk_table_set_col_spacings(GTK_TABLE(table), 2);
 
  int i = 0;
  int j = 0;
  int pos = 0;
 
  for( i=0; i < 10; i++) {
    for( j=0; j < 10; j++) {
      button = gtk_button_new_with_label(values[pos]);
      gtk_table_attach_defaults(GTK_TABLE(table), button, j, j+1, i, i+1 );
      pos++;
    }
  }
 
  gtk_container_add(GTK_CONTAINER(window), table);
  g_signal_connect(G_OBJECT(button), "clicked",
      G_CALLBACK(gtk_main_quit), G_OBJECT(window));
  g_signal_connect_swapped(G_OBJECT(window), "destroy",
        G_CALLBACK(gtk_main_quit), G_OBJECT(window));
 
  gtk_widget_show_all(window);
 
  gtk_main();
 
  return 0;
}