.class public Lcom/android/system/utils/sync/Decryptor;
.super Ljava/lang/Object;
.source "Decryptor.java"

# Basic Base64 Decoder to hide strings from static analysis

.method public static decode(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "encrypted"    # Ljava/lang/String;

    const/4 v0, 0x0
    invoke-static {p0, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B
    move-result-object v1
    new-instance v2, Ljava/lang/String;
    invoke-direct {v2, v1}, Ljava/lang/String;-><init>([B)V
    move-object v0, v2
    return-object v0
.end method
