import { readFileSync } from 'fs';
import babel from 'rollup-plugin-babel';
import nodeResolve from 'rollup-plugin-node-resolve';
import commonjs from 'rollup-plugin-commonjs';
import replace from 'rollup-plugin-replace';

const pkg = JSON.parse( readFileSync( 'package.json', 'utf-8' ) );

let banner = `/*
 Dandelion By@${pkg.author}
 ${new Date()}
 */`;

export default {
    entry: 'src/js/index.js',
    plugins: [
        babel({
            exclude: 'node_modules/**',
            presets: 'es2015-rollup',
            babelrc: false
        }),

        // 默认情况，第三方的Node风格模块无法在Rollup中正确加载。
        // 使用 nodeResolve 解决
        // jsnext, main, browser 为依赖模块的 jsnext:main, main browser 字段，即优先获取这几个字段对应的文件
        nodeResolve({
            jsnext: true,
            main: true,
            browser: true,
        }),

        // 将CommonJS模块转换成ES6，防止他们在Rollup中失效。
        // 没有 jsnext 字段文件，main 字段又是 CommandJS 风格模块时，使用 commonjs 进行转换到 ES6
        commonjs(),

        // replace({
        //     exclude: 'node_modules/**',
        //     sourceMap: true,
        //     ...
        //     values: {
        //         '<@VERSION@>': pkg.version,
        //         'process.env.NODE_ENV': JSON.stringify(process.env.NODE_ENV || 'development')
        //     }
        // })
        replace({
            '<@author@>': pkg.author
        })
    ],
    external: [
        'fs',
        'path'
    ],
    banner: banner,
    sourceMap: false,
    moduleName: 'kq',
    indent: true,
    targets: [
        { dest: '../themes/kq/source/js/kq.js', format: 'iife' }
    ]
};
