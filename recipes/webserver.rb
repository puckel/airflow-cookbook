# Copyright 2015 Sergey Bahchissaraitsev

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

template "/etc/init/airflow-webserver.conf" do
  source "airflow-webserver-upstart.erb"
  owner "root"
  group "root"
  mode "0644"
  variables({
    :config => node["airflow"]["config"],
    :user => node["airflow"]["user"], 
    :group => node["airflow"]["group"],
    :service => node["airflow"]["service"],
    :log_path => node["airflow"]["log_path"],
    :run_path => node["airflow"]["run_path"]
  })
end

service "airflow-webserver" do
  action [:enable, :start]
end