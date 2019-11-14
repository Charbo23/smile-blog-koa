module.exports = {
  environment: 'dev',
  database: {
    dbName: 'smile_blog',
    host: process.env.NODE_ENV === 'production' || process.env.DATABASE === 'remote' ? process.env.DATABASE_HOST : 'localhost',
    port: 3306,
    user: process.env.DATABASE_USER,
    password: process.env.DATABASE_PASSWORD,
    logging: false,
    timezone: '+08:00'
  },
  paginate: {
    pageDefault: 0,     // 默认页码
    countDefault: 10    // 默认一页的数量
  },
  // JWT
  security: {
    // secretKey 需要比较复杂的字符串
    secretKey: 'secretKey',
    accessExp: 60 * 60,  // 1h
    // accessExp: 20,  // 20s 测试令牌过期
    // refreshExp 设置refresh_token的过期时间，默认一个月
    refreshExp: 60 * 60 * 24 * 30,
  },
  // 文件上传
  file: {
    singleLimit: 1024 * 1024 * 2, // 单个文件大小限制
    totalLimit: 1024 * 1024 * 20, // 多个文件大小限制
    count: 10,                    // 单次最大上传数量
    exclude: []                   // 禁止上传格式
    // include:[]
  },
  qiniu: {
    accessKey: process.env.QINIU_ACCESS_KEY,
    secretKey: process.env.QINIU_SECRECT_KEY,
    bucket: process.env.QINIU_BUCKET,
    siteDomain: process.env.QINIU_SITE_DOMAIN
  },
  ufile: {
    publicKey: process.env.UFILE_PUBLIC_KEY,
    privateKey: process.env.UFILE_PRIVATE_KEY,
    domain: process.env.UFILE_DOMAIN,
    bucket: process.env.UFILE_BUCKET,
    protocol: process.env.UFILE_PROTOCOL
  }
}
