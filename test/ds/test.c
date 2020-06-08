#include "../../scanner/ds.h"
#include <stdio.h>

int main()
{
  DS *ds = ds_create();

  for (int i=0; i<100; i++) {
    ds_push_char(ds, 'c');
    printf("%s\n", ds_cast_string(ds));
  }

  ds_reset(ds);
    
  for (int i=0; i<100; i++) {
    ds_push_char(ds, 'c');
    printf("%s\n", ds_cast_string(ds));
  }
  
  return 0;
}
