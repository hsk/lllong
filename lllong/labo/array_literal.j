.source                  array_literal.java
.class                   array_literal
.super                   java/lang/Object


.method                  <init>()V
   .limit stack          1
   .limit locals         1
   .line                 1
   aload_0               
   invokespecial         java/lang/Object/<init>()V
   return                
.end method              

.method                  public color(II)V
   .limit stack          4
   .limit locals         4
   .line                 3
   iconst_2              
   newarray              int
   dup                   
   iconst_0              
   iload_1               
   iastore               
   dup                   
   iconst_1              
   iload_2               
   iastore               
   astore_3              
   .line                 4
   getstatic             java/lang/System/out Ljava/io/PrintStream;
   aload_3               
   iconst_0              
   iaload                
   invokevirtual         java/io/PrintStream/println(I)V
   .line                 5
   return                
.end method              

