# Vowpal Wabbit docker container [![Image Version](https://images.microbadger.com/badges/version/actionml/vw.svg)](https://microbadger.com/images/actionml/vw)

Vowpal Wabbit is a machine learning system which pushes the frontier of machine learning with techniques such as online, hashing, allreduce, reductions, learning2search, active, and interactive learning. [http://hunch.net/~vw/](http://hunch.net/~vw/).

### Container flavours

## JNI flavour

JNI flavour builds **vw**  library for use with Java applications through the [JNI interface](https://en.wikipedia.org/wiki/Java_Native_Interface). This container is based on alpine with glibc support, for details refer to [stackfeed/alpine](https://hub.docker.com/r/stackfeed/alpine/).

**OpenJDK8 JRE** is built-in into this container. **Note** that the OpenJDK version customization is not intended functionality, since the actual version is defined by the upstream Alpine Linux version.

---

## License 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 

See [LICENSE](http://www.apache.org/licenses/LICENSE-2.0.txt) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.


## Trademarks

All other trademarks referenced herein are the property of their respective owners.


### Contributors

  * Denis Baryshev (<dennybaa@gmail.com>)
