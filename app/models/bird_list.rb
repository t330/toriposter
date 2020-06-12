class BirdList < ActiveHash::Base
  self.data = [
    {id: 1, name: 'アオバト'}, {id: 2, name: 'アカガシラカラスバト'}, {id: 3, name: 'オガサワラカラスバト'},
    {id: 4, name: 'カラスバト'}, {id: 5, name: 'カワラバト(ドバト)'}, {id: 6, name: 'キジバト'},
    {id: 7, name: 'キンバト'}, {id: 8, name: 'クロアゴヒメアオバト'}, {id: 9, name: 'シラコバト'},
    {id: 10, name: 'ズアカアオバト'}, {id: 11, name: 'チュウダイズアカアオバト'}, {id: 12, name: 'ヒメモリバト'},
    {id: 13, name: 'ベニバト'}, {id: 14, name: 'ヨナグニカラスバト'}, {id: 15, name: 'リュウキュウカラスバト'},
    {id: 16, name: 'リュウキュウキジバト'}, {id: 17, name: 'その他'}
  ]
end