class QuoteModel{
  String? author;
  String? quote;
  String? image;

  QuoteModel ({this.author,this.quote,this.image});

  List<QuoteModel> quoteModelList = [];

  factory QuoteModel.fromQuote(Map m1){
    return QuoteModel(author: m1['author'],quote: m1['quote'],image: m1['image'] );
  }

  QuoteModel.toList(List l1)
  {
    for(int i=0; i<l1.length;i++)
    {
      quoteModelList.add(QuoteModel.fromQuote(l1[i]));
    }
  }
}