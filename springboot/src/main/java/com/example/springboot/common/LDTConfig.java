package com.example.springboot.common;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneOffset;

public class LDTConfig {


    public static class CmzLdtSerializer extends JsonSerializer<LocalDateTime> {

        @Override
        public void serialize(LocalDateTime value, JsonGenerator gen,
                              SerializerProvider serializers) throws IOException {
            gen.writeNumber(value.toInstant(ZoneOffset.ofHours(8)).toEpochMilli());
        }
    }

    public static class CmzLdtDeSerializer extends JsonDeserializer<LocalDateTime> {

        @Override
        public LocalDateTime deserialize(JsonParser p,
                                         DeserializationContext ctxt) throws IOException {
            long timestamp = p.getLongValue();
            return LocalDateTime.ofEpochSecond(timestamp / 1000, 0, ZoneOffset.ofHours(8));
        }
    }
}
