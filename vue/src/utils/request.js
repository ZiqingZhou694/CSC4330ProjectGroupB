import { ElMessage } from 'element-plus'
import router from '../router'
import config from "/config";
import axios from "axios";
import { useUserStore } from "@/stores/user";

const request = axios.create({
    baseURL: `http://${config.serverUrl}`,
    timeout: 5000
})

request.interceptors.request.use(config => {
    config.headers['Content-Type'] = 'application/json;charset=utf-8';
    config.headers['Authorization'] = useUserStore().getBearerToken;  // 设置请求头
    return config
}, error => {
    return Promise.reject(error)
});

request.interceptors.response.use(
    response => {
        let res = response.data;
        if (response.config.responseType === 'blob') {
            return res
        }

        if (typeof res === 'string') {
            res = res ? JSON.parse(res) : res
        }

        if (res.code === '401') {
            router.push("/login")
        }
        return res;
    },
    error => {
        console.log('err' + error) // for debug
        return Promise.reject(error)
    }
)


export default request
