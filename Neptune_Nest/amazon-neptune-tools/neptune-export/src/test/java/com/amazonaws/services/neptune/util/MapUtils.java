/*
Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
Licensed under the Apache License, Version 2.0 (the "License").
You may not use this file except in compliance with the License.
A copy of the License is located at
    http://www.apache.org/licenses/LICENSE-2.0
or in the "license" file accompanying this file. This file is distributed
on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
express or implied. See the License for the specific language governing
permissions and limitations under the License.
*/

package com.amazonaws.services.neptune.util;

import java.util.HashMap;
import java.util.Map;

public class MapUtils {

    public static Map<?, ?> map(Entry... entries) {
        HashMap<Object, Object> map = new HashMap<>();
        for (Entry entry : entries) {
            map.put(entry.key(), entry.value());
        }
        return map;
    }

    public static Entry entry(String key, Object value) {
        return new Entry(key, value);
    }

    public static class Entry {

        private final String key;
        private final Object value;

        private Entry(String key, Object value) {
            this.key = key;
            this.value = value;
        }

        public String key() {
            return key;
        }

        public Object value() {
            return value;
        }
    }
}
