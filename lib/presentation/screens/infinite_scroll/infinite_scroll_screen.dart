import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScroll extends StatefulWidget {

  static const name = 'infinite_screen';

  const InfiniteScroll({super.key});

  @override
  State<InfiniteScroll> createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {

  final ScrollController scrollControlerView = ScrollController();
  bool isLoading = false;
  bool isMounted = true;
  

  List<int> imagesIds = [1,2,3,4,5];


  @override
  void initState() {
    super.initState();
    
    scrollControlerView.addListener(() {
      
      if( (scrollControlerView.position.pixels + 500) >= scrollControlerView.position.maxScrollExtent){
        //load next page

        loadNextPage();
      }

    });

  }

  Future<void> onRefresh() async {
    
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));

    if(!isMounted) return;
    
    isLoading = false;

    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {});

  }
  Future loadNextPage() async{
    if( isLoading == true){
      return;
    }

    isLoading = true;

    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;

    if (!isMounted) return;

    setState(() {});
    moveScrollToBottom();
  }

  @override
  void dispose() {
    scrollControlerView.dispose();
    isMounted = false;
    super.dispose();
  }


  void moveScrollToBottom(){
    if(scrollControlerView.position.pixels + 150 <= scrollControlerView.position.maxScrollExtent) return;

    scrollControlerView.animateTo(
      scrollControlerView.position.pixels + 120, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );

  }


  void addFiveImages(){
    final lastId = imagesIds.last;

    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
    );

  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollControlerView,
            physics: const BouncingScrollPhysics(),
            itemCount: imagesIds.length,
            itemBuilder: (context,index){
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300')
              );
            } 
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(),
          child:
            !isLoading? const Icon(Icons.arrow_back_ios_new_rounded):SpinPerfect(infinite: true, child: const Icon(Icons.refresh_rounded))
        ),
      ),
    );
  }
}