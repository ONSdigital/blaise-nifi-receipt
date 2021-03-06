Feature: Receipts
  Scenario: Successful receipts update the status as "in_arc"
    Given A receipt is published to pubsub by NiFi with a message:
      """
      {
        "files": [
          {
            "md5sum": "905c84562a9f24933a48bb7763152fe1",
            "relativePath": ".\\",
            "scanFileSize": 69017170,
            "scanID": "70e84fc0372e45ea9db276f4d4441e73",
            "scanTime": 283,
            "scanMD5": "905c84562a9f24933a48bb7763152fe1",
            "name": "dd_OPN2101A_10032021_113048.zip",
            "scanSHA1": "3d63468c67d22b18163838f7c68656d4437503af",
            "scanFileUploadTime": "2021-03-18T11:45:17.907+00:00",
            "scanFileType": "application/zip",
            "sizeBytes": 69017170,
            "scanSHA256": "829a92db54b97a5bf6e500b9e3023bd6e14afc078f22779740d3b399c89ca7e7"
          }
        ],
        "dataset": "*blaise_dde",
        "schemaVersion": 1,
        "manifestCreated": "2021-03-18T11:45:04.069Z",
        "iterationL4": "OPN2101A",
        "iterationL3": "OPN",
        "sensitivity": "High",
        "iterationL1": "SYSTEMS",
        "sourceName": "gcp_blaise_dev",
        "description": "Data Delivery files uploaded to GCP bucket from Blaise5",
        "iterationL2": "BL5-dev",
        "version": 3,
        "tdzComplete": "2021-03-18T11:46:37+0000"
      }
      """
    When The receipt is processed
    Then I update the data delivery status service with the state of "in_arc" for file "dd_OPN2101A_10032021_113048.zip"

  Scenario: Errored receipts update the status as "errored"
    Given A receipt is published to pubsub by NiFi with a message:
      """
      {
        "iterationL3": "OPN",
        "iterationL4": "OPN2004A",
        "agent": "td-collect-01",
        "invokehttp.tx.id": "9a9e5d43-bd7e-4d33-865a-774701445945",
        "canonical-value-lookup-cache-size": "100",
        "iterationL1": "SYSTEMS",
        "scanTime": "3",
        "scanID": "cb3a4f9e1eac40239d3a1f5cb3c2cf7f",
        "iterationL2": "BL5-dev",
        "scanMD5": "cce08666fbd655f71700534d9e356dfd",
        "gcs.update.time": "1616067579938",
        "CDHType": "111",
        "spField": "IngestStatus",
        "uuid": "c2849cd2-20da-4a59-a5eb-91b83f95b816",
        "scanFileType": "application/zip",
        "hash.value": "5ba55e122b2c6d463b14f057fd520a86",
        "path": "./",
        "gcp.pubsub.attributesCount": "0",
        "fullSizeMegabytes": "0.000790",
        "md5sum": "cce08666fbd655f71700534d9e356dfd",
        "wait.counter.total": "4",
        "gcs.etag": "CLKno/Dgue8CEAE=",
        "gcs.create.time": "1616067579938",
        "flow": "express-v2",
        "targetPath": "C:\\symlinks\\replicaarc-p-01_ark\\for_core",
        "errorTimeMilli": "1616067596517",
        "mime.type": "application/octet-stream",
        "gcs.crc32c": "+tUvMw==",
        "routeToCDH": "true",
        "original.md5sum": "5ba55e122b2c6d463b14f057fd520a86",
        "sleepuntil": "1616067593264",
        "version": "3",
        "errorOutput": "Failed to write \\gcp_blaise_dev\\test\\blaise_dde\\SYSTEMS\\BL5-dev\\OPN\\OPN2004A/.\\/dd_OPN2004A_22042020_160500.zip to ARC - File already exists on destination filesystem",
        "bucket": "ons-blaise-v2-dev-nifi",
        "filename": "fe835ee8-94ef-4732-b5e0-39c3ca033d02-1616067596517.content",
        "abort": "True",
        "s2s.host": "ReplicaARC-P-01.Ons.Statistics.gov.uk",
        "name": "dd_OPN2004A_22042020_160500.zip",
        "sensitivity": "High",
        "manifestID": "fe835ee8-94ef-4732-b5e0-39c3ca033d02",
        "manifestCreated": "2021-03-18T11:39:39.938Z",
        "RouteOnAttribute.Route": "express-v2",
        "gcp.pubsub.messageId": "2146850285891364",
        "gcs.bucket": "ons-blaise-v2-dev-nifi",
        "gcs.metageneration": "1",
        "original.sizeBytes": "790",
        "scanFileSize": "202",
        "gcp.pubsub.publishTime": "1616067585",
        "origin": "blaise5",
        "UpdateAttribute.matchedRule": "topPath=basePath2 (non datasets)",
        "description": "Data Delivery files uploaded to GCP bucket from Blaise5",
        "spResult": "Ingest aborted",
        "scanSHA1": "06a5ab7a3f32d04ad1c9164053ac3b86aceda891",
        "gcs.generation": "1616067579925426",
        "mdscanresult": "{\"data_id\":\"cb3a4f9e1eac40239d3a1f5cb3c2cf7f\",\"dlp_info\":{},\"extracted_files\":{\"files_extracted_count\":1,\"files_in_archive\":[{\"data_id\":\"fe46a4f08995482fa80cb117589eae8a\",\"detected_by\":0,\"display_name\":\"OPN2004A.csv\",\"file_size\":92,\"file_type\":\"text/plain\",\"file_type_description\":\"Comma-separated values\",\"process_info\":{\"blocked_reason\":\"\",\"progress_percentage\":100,\"result\":\"Allowed\",\"verdicts\":[\"No Threat Detected\"]},\"progress_percentage\":100,\"scan_all_result_a\":\"No Threat Detected\",\"scan_all_result_i\":0,\"scanned_with\":13,\"type_category\":[\"T\"]}],\"first_index\":0,\"page_size\":50,\"total_extracted_files\":1,\"worst_data_id\":\"fe46a4f08995482fa80cb117589eae8a\"},\"extraction_info\":{},\"file_info\":{\"display_name\":\"\",\"file_size\":202,\"file_type\":\"application/zip\",\"file_type_description\":\"ZIP Archive\",\"md5\":\"cce08666fbd655f71700534d9e356dfd\",\"sha1\":\"06a5ab7a3f32d04ad1c9164053ac3b86aceda891\",\"sha256\":\"d66d98dae06f3f9c93722dcd9609c792333321888b576a3683164e10ebf88fb7\",\"type_category\":[\"A\"],\"upload_timestamp\":\"2021-03-18T11:39:48.125Z\"},\"process_info\":{\"blocked_reason\":\"\",\"file_type_skipped_scan\":false,\"post_processing\":{\"actions_failed\":\"\",\"actions_ran\":\"\",\"converted_destination\":\"\",\"converted_to\":\"\",\"copy_move_destination\":\"\"},\"processing_time\":234,\"profile\":\"Large Allowed\",\"progress_percentage\":100,\"queue_time\":0,\"result\":\"Allowed\",\"user_agent\":\"\",\"username\":\"\",\"verdicts\":[\"No Threat Detected\"]},\"scan_results\":{\"data_id\":\"cb3a4f9e1eac40239d3a1f5cb3c2cf7f\",\"last_file_scanned\":\"OPN2004A.csv\",\"progress_percentage\":100,\"scan_all_result_a\":\"No Threat Detected\",\"scan_all_result_i\":0,\"scan_details\":{\"Ahnlab\":{\"def_time\":\"2021-03-18T00:00:00.000Z\",\"eng_id\":\"ahnlab_1_windows\",\"location\":\"local\",\"scan_result_i\":0,\"scan_time\":16,\"threat_found\":\"\",\"wait_time\":31},\"Avira\":{\"def_time\":\"2021-03-17T14:55:00.000Z\",\"eng_id\":\"avira_1_windows\",\"location\":\"local\",\"scan_result_i\":0,\"scan_time\":1,\"threat_found\":\"\",\"wait_time\":46},\"BitDefender\":{\"def_time\":\"2021-03-17T12:18:00.000Z\",\"eng_id\":\"bitdefender_1_windows\",\"location\":\"local\",\"scan_result_i\":0,\"scan_time\":2,\"threat_found\":\"\",\"wait_time\":45},\"ClamAV\":{\"def_time\":\"2021-03-17T11:08:39.000Z\",\"eng_id\":\"clamav_1_windows\",\"location\":\"local\",\"scan_result_i\":0,\"scan_time\":4,\"threat_found\":\"\",\"wait_time\":43},\"Cyren\":{\"def_time\":\"2021-03-17T14:48:00.000Z\",\"eng_id\":\"cyren_1_windows\",\"location\":\"local\",\"scan_result_i\":0,\"scan_time\":16,\"threat_found\":\"\",\"wait_time\":46},\"ESET\":{\"def_time\":\"2021-03-17T00:00:00.000Z\",\"eng_id\":\"eset_1_windows\",\"location\":\"local\",\"scan_result_i\":0,\"scan_time\":0,\"threat_found\":\"\",\"wait_time\":62},\"Emsisoft\":{\"def_time\":\"2021-03-17T03:53:00.000Z\",\"eng_id\":\"emsisoft_1_windows\",\"location\":\"local\",\"scan_result_i\":0,\"scan_time\":26,\"threat_found\":\"\",\"wait_time\":36},\"Ikarus\":{\"def_time\":\"2021-03-17T13:15:07.000Z\",\"eng_id\":\"ikarus_1_windows\",\"location\":\"local\",\"scan_result_i\":0,\"scan_time\":0,\"threat_found\":\"\",\"wait_time\":62},\"K7\":{\"def_time\":\"2021-03-17T07:02:00.000Z\",\"eng_id\":\"k7_1_windows\",\"location\":\"local\",\"scan_result_i\":0,\"scan_time\":0,\"threat_found\":\"\",\"wait_time\":62},\"Quick Heal\":{\"def_time\":\"2021-03-17T10:16:00.000Z\",\"eng_id\":\"quickheal_1_windows\",\"location\":\"local\",\"scan_result_i\":0,\"scan_time\":0,\"threat_found\":\"\",\"wait_time\":62},\"TACHYON\":{\"def_time\":\"2021-03-17T00:00:00.000Z\",\"eng_id\":\"nprotect_1_windows\",\"location\":\"local\",\"scan_result_i\":0,\"scan_time\":3,\"threat_found\":\"\",\"wait_time\":59},\"Total Defense\":{\"def_time\":\"1970-01-01T00:00:00.000Z\",\"eng_id\":\"totaldefense_1_windows\",\"location\":\"local\",\"scan_result_i\":10,\"scan_time\":0,\"threat_found\":\"Unavailable (production)\",\"wait_time\":0},\"Vir.IT eXplorer\":{\"def_time\":\"2021-03-17T12:43:00.000Z\",\"eng_id\":\"viritexplorer_1_windows\",\"location\":\"local\",\"scan_result_i\":0,\"scan_time\":7,\"threat_found\":\"\",\"wait_time\":55}},\"start_time\":\"2021-03-18T11:39:48.125Z\",\"total_avs\":13,\"total_time\":234},\"vulnerability_info\":{},\"yara_info\":{}}",
        "filesize": "202",
        "gcs.media.link": "https://www.googleapis.com/download/storage/v1/b/ons-blaise-v2-dev-nifi/o/dd_OPN2004A_22042020_160500.zip?generation=1616067579925426&alt=media",
        "scanFileUploadTime": "2021-03-18T11:39:48.125+00:00",
        "invokehttp.request.url": "https://multiav.ons.statistics.gov.uk:8443/file/cb3a4f9e1eac40239d3a1f5cb3c2cf7f",
        "absolute.path": "c:\\\\symlinks\\\\td-inscan-p-01_quarantine\\fe835ee8-94ef-4732-b5e0-39c3ca033d02\\",
        "errorTime": "Thu Mar 18 11:39:56 GMT 2021",
        "gcpFilename": "dd_OPN2004A_22042020_160500.zip",
        "gcp.pubsub.ackId": "BCEhPjA-RVNEUAYWLF1GSFE3GQhoUQ5PXiM_NSAoRRIJCBQFfH1yU1l1XjN1B1ENGXN6aXFvWBEHBBcCdF9RGx9ZXH5VBVAJH3p4YXdiXxsIA0ZVenf97vqbz4WXNEsxIcC1ncdcesbLurpgZhs9XxJLLD5-PT9FQV5AEkw2CkRJUytDCypYEU4",
        "gcp.pubsub.messageSize": "761",
        "data_id": "cb3a4f9e1eac40239d3a1f5cb3c2cf7f",
        "relativePath": ".\\",
        "gcs.md5": "W6VeEissbUY7FPBX/VIKhg==",
        "triggerSource": "gcppubsub",
        "projectID": "ons-blaise-v2-dev",
        "schemaVersion": "1",
        "gcs.size": "790",
        "s2s.address": "ReplicaARC-P-01.Ons.Statistics.gov.uk:49632",
        "invokehttp.status.code": "200",
        "notified": "true",
        "gcs.uri": "https://www.googleapis.com/storage/v1/b/ons-blaise-v2-dev-nifi/o/dd_OPN2004A_22042020_160500.zip",
        "transport": "dmzMinifi",
        "file.size": "202",
        "decrypted": "2",
        "sizeBytes": "202",
        "mdresponse": "{\"data_id\":\"cb3a4f9e1eac40239d3a1f5cb3c2cf7f\"}",
        "scanSHA256": "d66d98dae06f3f9c93722dcd9609c792333321888b576a3683164e10ebf88fb7",
        "mockData": "true",
        "writeFailure": "File already exists on destination filesystem",
        "gcs.key": "dd_OPN2004A_22042020_160500.zip",
        "stage": "3",
        "scanFileTypeDescription": "ZIP Archive",
        "wait.counter.gatesig": "4",
        "destPath": "\\gcp_blaise_dev\\test\\blaise_dde\\SYSTEMS\\BL5-dev\\OPN\\OPN2004A",
        "gcs.generated.id": "ons-blaise-v2-dev-nifi/dd_OPN2004A_22042020_160500.zip/1616067579925426",
        "triggerType": "consumepubsub",
        "sourceName": "gcp_blaise_dev",
        "originalPath": ".//dd_OPN2004A_22042020_160500.zip",
        "invokehttp.status.message": "OK",
        "dataset": "*blaise_dde"
      }
      """
    When The receipt is processed
    Then I update the data delivery status service with
      | filename                        | state   | error_info                                                                                                                                                             |
      | dd_OPN2004A_22042020_160500.zip | errored | Failed to write \gcp_blaise_dev\test\blaise_dde\SYSTEMS\BL5-dev\OPN\OPN2004A/.\/dd_OPN2004A_22042020_160500.zip to ARC - File already exists on destination filesystem |
