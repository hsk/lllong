  #include <stdio.h>
  #include <stdlib.h>
  
  typedef struct NODE{
    int mark; // マーク&スイープ用の領域
    void* end; // サイズ
    struct NODE* next; // 次のノード
    void* data;
  
  } Node;
  
  static Node* object_list;
  static void** stack_bottom;
  
  void gc_init() {
    // とにかくメモリを用意する
    object_list = NULL;
    // 開始スタック位置を保存
    int a;
  
    stack_bottom = (void**)&a;
  }
  // gcアロケーションする
  
  // 印を付ける
  static void mark(void* ptr) {
    if(ptr==NULL) return;
    if(object_list==NULL) return;
    Node* obj = object_list;
    do {
      // printf("mark %p %p %p \n", ptr, &obj->data, obj->end);
      if((void*)&obj->data <= ptr && ptr < obj->end ) {
        if(obj->mark == 0) {
          void** p;
          //printf("*mark %p\n", obj);
          obj->mark = 1;
          for(p = (void**)&obj->data; p < (void**)(obj->end - sizeof(void*)); p++) {
            mark(*p);
          }
        }
        break;
      }
    } while(obj = obj->next);
  }
  
  
  // 解放する
  static void sweep() {
  
    Node *obj = object_list;
    Node n;
    if (obj) {
      n.next = obj;
      obj = &n;
    }
  
    // ループして解放
    while (obj && obj->next) {
      if (obj->next->mark == 0) {
        Node* next = obj->next->next;
        printf("free %p\n", obj->next);
        free(obj->next);
        obj->next = next;
        continue;
      } else {
        obj->next->mark = 0;
      }
      obj = obj->next;
    }
    if(obj == &n && obj->next == NULL) {
      object_list = NULL;
    }
  
  }
  
  // gcを実行する
  void gc() {
    printf("start gc\n");
    void** ptr;
    if(object_list != NULL) {
      void** stack_top = (void**)&ptr ;
      printf("stack_top %p stack_bottom %p\n", stack_top, stack_bottom);
      for(ptr = stack_top; ptr < stack_bottom; ptr++) {
        mark(*ptr);
      }
      sweep();
    }
    printf("gc end\n");
  }
  
  void* newobj(long size) {
    printf("newobj %ld\n", size);
    void *ptr = malloc(sizeof(Node)+size-1);
    if(ptr == NULL) {
      gc();
      ptr = malloc(sizeof(Node)+size - 1);
      if(ptr == NULL) {
        printf("alloc error\n");
        exit(-1);
      }
    }
    printf("newobj %p\n", ptr);
    
    Node* old = object_list;
    object_list = ptr;
    object_list->next = old;
    object_list->end = &object_list->data + size;
    object_list->mark = 0;
  
    return ptr + sizeof(Node)-sizeof(old->data);
  }
  