import { ElMessage } from 'element-plus'
import router from '../router'
import config from "/config";
import axios from "axios";
import { useUserStore } from "@/stores/user";

const request = axios.create({
    baseURL: `http://${config.serverUrl}`,
    timeout: 5000  // Setting the timeout period of the background interface
})

// request interceptor
// You can do some processing on the request before it is sent
// For example, a unified token is added to encrypt request parameters
request.interceptors.request.use(config => {
    config.headers['Content-Type'] = 'application/json;charset=utf-8';
    config.headers['Authorization'] = useUserStore().getBearerToken;
    return config
}, error => {
    return Promise.reject(error)
});

// response interceptor
// The result can be uniformly processed after the interface responds
request.interceptors.response.use(
    response => {
        let res = response.data;
        // If it is a returned file
        if (response.config.responseType === 'blob') {
            return res
        }
        // Compatible string data returned by the server
        if (typeof res === 'string') {
            res = res ? JSON.parse(res) : res
        }
        // Gives a prompt when permission verification fails
        if (res.code === '401') {
            // ElMessage.error(res.msg);
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
