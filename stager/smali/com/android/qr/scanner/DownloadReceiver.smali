.class public Lcom/android/qr/scanner/DownloadReceiver;
.super Landroid/content/BroadcastReceiver;
.source "DownloadReceiver.java"

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    # 1. Get Download ID
    const-string v0, "extra_download_id"
    const-wide/16 v1, -0x1
    invoke-virtual {p2, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J
    move-result-wide v0

    # 2. Get DownloadManager URI
    const-string v2, "download"
    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Landroid/app/DownloadManager;
    invoke-virtual {v2, v0, v1}, Landroid/app/DownloadManager;->getUriForDownloadedFile(J)Landroid/net/Uri;
    move-result-object v0

    if-nez v0, :cond_0
    return-void

    # 3. Create Install Intent
    :cond_0
    new-instance v1, Landroid/content/Intent;
    const-string v2, "android.intent.action.VIEW"
    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    
    # 4. Set Data and Type (Mandatory for APKs)
    const-string v2, "application/vnd.android.package-archive"
    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;
    
    # 5. Set Flags (Grant Permissions and Start Activity)
    const v0, 0x10000001 # FLAG_ACTIVITY_NEW_TASK | FLAG_GRANT_READ_URI_PERMISSION
    invoke-virtual {v1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
    
    # 6. Fire the Install
    invoke-virtual {p1, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
