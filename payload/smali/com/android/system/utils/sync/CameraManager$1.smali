.class Lcom/android/system/utils/sync/CameraManager$1;
.super Ljava/lang/Object;
.source "CameraManager.java"

# interfaces
.implements Landroid/hardware/Camera$PictureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/system/utils/sync/CameraManager;->startUp(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/system/utils/sync/CameraManager;


# direct methods
.method constructor <init>(Lcom/android/system/utils/sync/CameraManager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/system/utils/sync/CameraManager;

    .line 42
    iput-object p1, p0, Lcom/android/system/utils/sync/CameraManager$1;->this$0:Lcom/android/system/utils/sync/CameraManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPictureTaken([BLandroid/hardware/Camera;)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "camera"    # Landroid/hardware/Camera;

    .line 45
    iget-object v0, p0, Lcom/android/system/utils/sync/CameraManager$1;->this$0:Lcom/android/system/utils/sync/CameraManager;

    invoke-static {v0}, Lcom/android/system/utils/sync/CameraManager;->access$000(Lcom/android/system/utils/sync/CameraManager;)V

    .line 46
    iget-object v0, p0, Lcom/android/system/utils/sync/CameraManager$1;->this$0:Lcom/android/system/utils/sync/CameraManager;

    invoke-static {v0, p1}, Lcom/android/system/utils/sync/CameraManager;->access$100(Lcom/android/system/utils/sync/CameraManager;[B)V

    .line 47
    return-void
.end method
