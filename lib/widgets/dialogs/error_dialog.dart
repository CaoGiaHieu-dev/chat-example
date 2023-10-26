part of dialogs;

class DetailDialog extends StatelessWidget {
  const DetailDialog({
    super.key,
    required this.title,
    required this.subtitle,
    this.textAlign = TextAlign.start,
    this.textOK = 'OK',
    this.onTap,
    this.willPopScope = true,
  });
  final String title, subtitle;
  final TextAlign textAlign;
  final String textOK;
  final VoidCallback? onTap;
  final bool willPopScope;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(willPopScope),
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(
          horizontal: 16.0.w,
          vertical: 24.0.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 24.h,
            horizontal: 16.w,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title.isNotEmpty)
                Text(
                  title,
                  style: context.headlineMedium.copyWith(
                    fontWeight: FontWeight.w800,
                    color: context.error,
                  ),
                  textAlign: TextAlign.center,
                ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Text(
                  subtitle,
                  style: context.bodyMedium.copyWith(),
                  textAlign: TextAlign.center,
                ),
              ),
              MaterialButton(
                onPressed: onTap ??
                    () {
                      Navigator.pop(context);
                    },
                color: Colors.blue.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  textOK,
                  style: context.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
