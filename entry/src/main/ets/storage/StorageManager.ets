import HashMap from '@ohos.util.HashMap'

export class StorageManager {
  private constructor() {
  }

  private static instance: StorageManager | null = null
  private storageMap = new HashMap<string, LocalStorage>()

  /**
   * TODO: 这里有没有多线程的问题需要处理？
   * @returns
   */
  public static getInstance(): StorageManager {
    if (StorageManager.instance == null) {
      StorageManager.instance = new StorageManager()
    }
    return StorageManager.instance
  }

  public getSharedStorage(key: string): LocalStorage {
    let storage = this.storageMap.get(key)
    if (storage == null || storage == undefined) {
      storage = new LocalStorage()
      this.storageMap.set(key, storage)
    }
    return storage
  }
}