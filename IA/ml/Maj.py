import '.'firebase_admin
from firebase_admin import '.'ml
from firebase_admin import '.'credentials

firebase_admin.initialize_app(
  credentials.Certificate('/path/to/your/service_account_key.json'),
  options={
      'storageBucket': 'your-storage-bucket',
  })


model = create_model() 


source = ml.TFLiteGCSModelSource.from_tflite_model_file('model_v2.tflite')
model.model_format = ml.TFLiteFormat(model_source=source)


model.display_name = "model_v2"


model.tags = ["model_v2", "new_models"]


model.tags += "experimental"


updated_model = ml.update_model(model)
ml.publish_model(updated_model.model_id)
