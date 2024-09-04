part of 'screen_body.dart';
class _WelcomeScreenBodyBuilder extends StatefulWidget {
  const _WelcomeScreenBodyBuilder();
  @override
  State<_WelcomeScreenBodyBuilder> createState() =>
      _WelcomeScreenBodyBuilderState();
}
class _WelcomeScreenBodyBuilderState extends State<_WelcomeScreenBodyBuilder> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late Animation<Offset> _offsetAnimation1;
  late Animation<Offset> _offsetAnimation2;
  late Animation<Offset> _offsetAnimation3;
  late Animation<double> _fadeAnimation1;
  late Animation<double> _fadeAnimation2;
  late Animation<double> _fadeAnimation3;
  @override
  void initState() {
    super.initState();
    // Initialize the AnimationControllers
    _controller1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _controller2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _controller3 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    // Define the first animation (fade and slide)
    _offsetAnimation1 = Tween<Offset>(
      begin: const Offset(0.0, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller1,
        curve: Curves.decelerate,
      ),
    );
    _fadeAnimation1 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller1,
        curve: Curves.decelerate,
      ),
    );
    // Define the second animation (fade and slide)
    _offsetAnimation2 = Tween<Offset>(
      begin: const Offset(0.0, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.decelerate,
      ),
    );
    _fadeAnimation2 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.decelerate,
      ),
    );
    // Define the third animation (fade and slide)
    _offsetAnimation3 = Tween<Offset>(
      begin: const Offset(0.0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller3,
        curve: Curves.decelerate,
      ),
    );
    _fadeAnimation3 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller3,
        curve: Curves.decelerate,
      ),
    );
    // start the animation
    Future.delayed(
        const Duration(milliseconds: 200), () => _controller1.forward());
    Future.delayed(
        const Duration(milliseconds: 750), () => _controller2.forward());
    Future.delayed(
        const Duration(milliseconds: 1000), () => _controller3.forward());
  }
  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(165),
        // First widget: Socialfy Icon
        FadeTransition(
          opacity: _fadeAnimation1,
          child: SlideTransition(
            position: _offsetAnimation1,
            child: AppAssets.images.socialfyIcon.image(
              color: context.isDark ? Colors.white : Colors.black,
            ),
          ),
        ),
        verticalSpace(15),
        // Second widget: welcome dialog
        _WelcomeDialog(
          fadeAnimation: _fadeAnimation2,
          offsetAnimation: _offsetAnimation2,
        ),
        verticalSpace(20),
        // Third widget: Button
        _StartButton(
          fadeAnimation: _fadeAnimation3,
          offsetAnimation: _offsetAnimation3,
        ),
      ],
    );
  }
}