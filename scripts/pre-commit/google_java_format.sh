#!/usr/bin/env sh
# Copyright 2020 The SQLFlow Authors. All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

changed_java_files=$(git diff --cached --name-only --diff-filter=ACMR | grep ".*java$" )
if [[ $changed_java_files == "" ]]; then
    exit 0
fi
java -jar /usr/local/bin/google-java-format-1.6-all-deps.jar --replace $changed_java_files

java -jar /usr/local/bin/checkstyle-8.29-all.jar -c /usr/local/bin/google_checks.xml $changed_java_files