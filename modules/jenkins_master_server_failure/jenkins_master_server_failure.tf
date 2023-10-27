resource "shoreline_notebook" "jenkins_master_server_failure" {
  name       = "jenkins_master_server_failure"
  data       = file("${path.module}/data/jenkins_master_server_failure.json")
  depends_on = [shoreline_action.invoke_delete_pod]
}

resource "shoreline_file" "delete_pod" {
  name             = "delete_pod"
  input_file       = "${path.module}/data/delete_pod.sh"
  md5              = filemd5("${path.module}/data/delete_pod.sh")
  description      = "Restart the Jenkins server to see if it's a temporary issue."
  destination_path = "/tmp/delete_pod.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_delete_pod" {
  name        = "invoke_delete_pod"
  description = "Restart the Jenkins server to see if it's a temporary issue."
  command     = "`chmod +x /tmp/delete_pod.sh && /tmp/delete_pod.sh`"
  params      = ["POD_NAME","NAMESPACE"]
  file_deps   = ["delete_pod"]
  enabled     = true
  depends_on  = [shoreline_file.delete_pod]
}

