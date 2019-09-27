
abstract class IPresenter {
  
  void initState();
  
  void didChangeDependencies();
  
  void didUpdateWidgets<W>(W oldWidget);
  
  void deactivate();
  
  void dispose();
}