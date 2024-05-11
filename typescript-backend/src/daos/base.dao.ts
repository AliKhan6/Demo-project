export default class BaseDao<ModelOutput> {
  constructor(private readonly model: any) {}

  async getOne() {}

  async getAll() {}

  async create() {}

  async update() {}

  async delete() {}
}
