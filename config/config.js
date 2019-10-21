module.exports = {
  environment: 'dev',
  database: {
    dbName: 'smile_blog',
    host: process.env.NODE_ENV === 'production' || process.env.DATABASE === 'remote' ? '47.100.162.132' : 'localhost',
    port: 3306,
    user: 'root',
    password: '123456',
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
  ufile: {
    publicKey: "uHBkkDR_XaZVsTDjl_aBVWur5i8vD3rzAp9V",
    privateKey: "i7ESIZ7AXtYaHhCRT-s7ik2rj-MMxJSs1XUE3Pit2-IUzgH5PpEzb4c3hRDA5-vm",
    domain: ".hk.ufileos.com",
    bucket: "charbo",
    protocol: "https"
  }
}
