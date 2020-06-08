#include "ds.h"

#include <string.h>
#include <stdlib.h>

#define MIN_ARR_SIZE 16
#define GROW_RATE 2

typedef struct ds {
  char *arr;
  int arr_size;
  int str_size;
} DS;


static void ds_init(DS *ds)
{
  int arr_size = MIN_ARR_SIZE;
  
  ds->arr = malloc(arr_size);
  ds->arr[0] = '\0';
  ds->arr_size = arr_size;
  ds->str_size = 0;
}

static void ds_fini(DS *ds)
{
  free(ds->arr);
  ds->arr = NULL;
  ds->arr_size = 0;
  ds->str_size = 0;
}

DS *ds_create()
{
  DS *ds;
  
  ds = malloc(sizeof(struct ds));
  ds_init(ds);

  return ds;
}

void ds_push_char(DS *ds, char c)
{
  // Grow array
  if (ds->str_size + 2 > ds->arr_size) {
    int new_arr_size = ds->arr_size * GROW_RATE;
    char *new_arr = malloc(new_arr_size);
    strcpy(new_arr, ds->arr);
    free(ds->arr);
    ds->arr = new_arr;
    ds->arr_size = new_arr_size;
  }

  // Push char
  ds->arr[ds->str_size] = c;
  ds->arr[ds->str_size + 1] = '\0';
  ds->str_size++;
}

char *ds_cast_string(DS *ds)
{
  return ds->arr;
}

void ds_destroy(DS *ds)
{
  ds_fini(ds);
  free(ds);
}

void ds_reset(DS *ds)
{
  ds_fini(ds);
  ds_init(ds);
}
