import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsDetailsPage extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String content;
  final String author;
  final String publishedAt;

  const NewsDetailsPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.content,
    required this.author,
    required this.publishedAt,
  }) : super(key: key);

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  Future<void> _refresh() async {
    // Implement your refresh logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: CustomScrollView(
          slivers: [
            _buildSliverAppBar(),
            _buildContentSection(),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      pinned: true,
      title: Text(
        widget.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Padding(
        padding: EdgeInsets.all(8),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black,
            child: Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
          ),
        ),
      ),
      centerTitle: true,
      expandedHeight: 300,
      flexibleSpace: _buildFlexibleSpace(),
      actions: [
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildFlexibleSpace() {
    return Stack(
      children: [
        FlexibleSpaceBar(
          background: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.black38, Colors.black],
              begin: Alignment.center,
              end: Alignment.bottomCenter,
            ).createShader(bounds),
            blendMode: BlendMode.darken,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          right: 40,
          top: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.newspaper_sharp,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    widget.author,
                    //maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Icon(Icons.calendar_month_outlined, color: Colors.white),
                  Text(
                    DateFormat('dd MMM')
                        .format(DateTime.parse(widget.publishedAt)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  SliverToBoxAdapter _buildContentSection() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(left: 20, top: 40, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "News Content",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.content,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
