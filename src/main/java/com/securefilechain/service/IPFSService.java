package com.securefilechain.service;

import io.ipfs.api.IPFS;
import io.ipfs.api.MerkleNode;
import io.ipfs.api.NamedStreamable;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileWriter;

@Service
public class IPFSService {

    private final IPFS ipfs = new IPFS("/ip4/127.0.0.1/tcp/5001");

    public String uploadEncryptedData(String content) throws Exception {
        File tempFile = File.createTempFile("enc", ".txt");
        FileWriter writer = new FileWriter(tempFile);
        writer.write(content);
        writer.close();

        NamedStreamable.FileWrapper file = new NamedStreamable.FileWrapper(tempFile);
        MerkleNode response = ipfs.add(file).get(0);
        return response.hash.toBase58();
    }
}
