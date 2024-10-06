// 实现IDataSource接口的对象，用于瀑布流组件加载数据
export class WaterFlowDataSource implements IDataSource {
  private dataArr: number[] = []
  private listeners: DataChangeListener[] = []

  constructor() {
    for (let i = 0; i < 100; i++) {
      this.dataArr.push(i)
    }
  }

  // 获取数据总数
  totalCount(): number {
    return this.dataArr.length
  }

  // 获取索引对应的数据
  getData(index: number): number {
    return this.dataArr[index]
  }

  // 注册数据改变的监听器
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener)
    }
  }

  // 注销数据改变的监听器
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener)
    if (pos >= 0) {
      this.listeners.splice(pos, 1)
    }
  }

  // 通知控制器数据重新加载
  notifyDataReloaded() {
    this.listeners.forEach(item => {
      item.onDataReloaded()
    })
  }

  // 通知组件index的位置有数据添加。添加数据完成后调用
  notifyDataAdd(index: number) {
    this.listeners.forEach(item => {
      item.onDataAdd(index)
    })
  }

  // 通知组件index的位置有数据有变化。改变数据完成后调用。
  notifyDataChange(index: number) {
    this.listeners.forEach(item => {
      item.onDataChange(index)
    })
  }

  // 通知组件删除index位置的数据并刷新LazyForEach的展示内容。删除数据完成后调用。
  notifyDataDelete(index: number) {
    this.listeners.forEach(item => {
      item.onDataDelete(index)
    })
  }

  // 通知组件数据有移动。将from和to位置的数据进行交换。数据移动起始位置与数据移动目标位置交换完成后调用。
  notifyDataMove(from: number, to: number) {
    this.listeners.forEach(item => {
      item.onDataMove(from, to)
    })
  }

  // 进行批量的数据处理，该接口不可与上述接口混用。批量数据处理后调用。
  notifyDatasetChange(operations: DataOperation[]) {
    this.listeners.forEach(item => {
      item.onDatasetChange(operations)
    })
  }

  // 增加数据
  public add1stItem(): void {
    this.dataArr.splice(0, 0, this.dataArr.length)
    this.notifyDataAdd(0)
  }

  // 在数据尾部增加一个元素
  public addLastItem(): void {
    this.dataArr.splice(this.dataArr.length, 0, this.dataArr.length)
    this.notifyDataAdd(this.dataArr.length - 1)
  }

  // 在指定索引位置增加一个元素
  public addItem(index: number): void {
    this.dataArr.splice(index, 0, this.dataArr.length)
    this.notifyDataAdd(index)
  }

  // 删除第一个元素
  public delete1stItem(): void {
    this.dataArr.splice(0, 1)
    this.notifyDataDelete(0)
  }

  // 删除第二个元素
  public delete2ndItem(): void {
    this.dataArr.splice(1, 1)
    this.notifyDataDelete(1)
  }

  // 删除最后一个元素
  public deleteLastItem(): void {
    this.dataArr.splice(-1, 1)
    this.notifyDataDelete(this.dataArr.length)
  }

  // 在指定索引位置删除一个元素
  public deleteItem(index: number): void {
    this.dataArr.splice(index, 1)
    this.notifyDataDelete(index)
  }

  // 重新加载数据
  public reload(): void {
    this.dataArr.splice(1, 1)
    this.dataArr.splice(3, 2)
    this.notifyDataReloaded()
  }
}