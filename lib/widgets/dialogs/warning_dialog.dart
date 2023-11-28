part of dialogs;

class WarningDialog extends StatelessWidget {
  const WarningDialog({
    super.key,
    required this.title,
    required this.subtitle,
    this.textAlign = TextAlign.center,
    this.onCancel,
    this.onAccept,
    this.accept = 'Yes',
    this.cancel = 'Cancel',
    this.willPopScope = true,
    this.isDefaultCancelPop = true,
  });
  final String title, subtitle, accept, cancel;
  final TextAlign textAlign;
  final VoidCallback? onCancel;
  final VoidCallback? onAccept;
  final bool willPopScope;
  final bool isDefaultCancelPop;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: willPopScope,
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        child: SizedBox(
          width: 343.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: context.bodyLarge.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: textAlign,
                ),
                SizedBox(height: 8.h),
                Text(
                  subtitle,
                  style: context.bodyMedium.copyWith(
                    color: const Color(0xff475467),
                  ),
                  textAlign: textAlign,
                ),
                SizedBox(height: 24.h),
                // Row(
                //   children: [
                // Expanded(
                //   child: AppButton(
                //     height: 44,
                //     text: cancel,
                //     color: context.surface,
                //     textColor: Colors.black,
                //     onPressed: () {
                //       if (isDefaultCancelPop) Navigator.pop(context);
                //       onCancel?.call();
                //     },
                //   ),
                // ),
                // SizedBox(width: 12.w),
                // Expanded(
                //   child: AppButton(
                //     text: accept,
                //     height: 44,
                //     textColor: Colors.white,
                //     onPressed: () {
                //       Navigator.pop(context);
                //       onAccept?.call();
                //     },
                //   ),
                // ),
                // ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
