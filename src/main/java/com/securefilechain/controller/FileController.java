package com.securefilechain.controller;

import com.securefilechain.service.CryptoUtils;
import com.securefilechain.service.IPFSService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;

@RestController
@RequestMapping("/api/files")
public class FileController {

    @Resource
    private IPFSService ipfsService;

    @PostMapping("/upload")
    public String uploadFile(@RequestBody String plainText) throws Exception {
        SecretKey aesKey = CryptoUtils.generateAESKey();
        IvParameterSpec iv = CryptoUtils.generateIV();

        String encrypted = CryptoUtils.encryptAES(plainText, aesKey, iv);
        String ipfsHash = ipfsService.uploadEncryptedData(encrypted);

        return "✅ Uploaded to IPFS with Hash: " + ipfsHash;
    }
}
