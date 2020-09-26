class ItemStatus {
  final String name;
  const ItemStatus(this.name);
}

List<ItemStatus> itemStatus = <ItemStatus>[
  const ItemStatus('Open'),
  const ItemStatus('Todo'),
  const ItemStatus('Doing'),
  const ItemStatus('Done'),
  const ItemStatus('Issue'),
  const ItemStatus('Fixed'),
];