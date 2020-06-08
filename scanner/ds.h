#ifndef DS_H
#define DS_H

// Dynamic String

typedef struct ds DS;

DS *ds_create();
void ds_push_char(DS *ds, char c);
char *ds_cast_string(DS *ds);
void ds_destroy(DS *ds);
void ds_reset(DS *ds);


#endif
