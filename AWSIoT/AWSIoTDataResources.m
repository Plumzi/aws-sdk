//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSIoTDataResources.h"
#import <AWSCore/AWSLogging.h>

@interface AWSIoTDataResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSIoTDataResources

+ (instancetype)sharedInstance {
    static AWSIoTDataResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSIoTDataResources new];
    });

    return _sharedResources;
}
- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
  return @" \
{ \
  \"version\":\"2.0\", \
  \"metadata\":{ \
    \"apiVersion\":\"2015-05-28\", \
    \"endpointPrefix\":\"data.iot\", \
    \"serviceFullName\":\"AWS IoT Data Plane\", \
    \"signatureVersion\":\"v4\", \
    \"signingName\":\"iotdata\", \
    \"protocol\":\"rest-json\" \
  }, \
  \"documentation\":\"<fullname>AWS IoT (Beta)</fullname> <p><b>AWS IoT is considered a beta service as defined in the Service Terms</b></p> <p>AWS IoT-Data enables secure, bi-directional communication between Internet-connected things (such as sensors, actuators, embedded devices, or smart appliances) and the AWS cloud. It implements a broker for applications and things to publish messages over HTTP (Publish) and retrieve, update, and delete thing shadows. A thing shadow is a persistent representation of your things and their state in the AWS cloud.</p>\", \
  \"operations\":{ \
    \"DeleteThingShadow\":{ \
      \"name\":\"DeleteThingShadow\", \
      \"http\":{ \
        \"method\":\"DELETE\", \
        \"requestUri\":\"/things/{thingName}/shadow\" \
      }, \
      \"input\":{ \
        \"shape\":\"DeleteThingShadowRequest\", \
        \"documentation\":\"<p>The input for the DeleteThingShadow operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"DeleteThingShadowResponse\", \
        \"documentation\":\"<p>The output from the DeleteThingShadow operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        }, \
        { \
          \"shape\":\"MethodNotAllowedException\", \
          \"error\":{\"httpStatusCode\":405}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified combination of HTTP verb and URI is not supported.</p>\" \
        }, \
        { \
          \"shape\":\"UnsupportedDocumentEncodingException\", \
          \"error\":{\"httpStatusCode\":415}, \
          \"exception\":true, \
          \"documentation\":\"<p>The document encoding is not supported.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Deletes the thing shadow for the specified thing.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/iot/latest/developerguide/API_DeleteThingShadow.html\\\">DeleteThingShadow</a> in the <i>AWS IoT Developer Guide</i>.</p>\" \
    }, \
    \"GetThingShadow\":{ \
      \"name\":\"GetThingShadow\", \
      \"http\":{ \
        \"method\":\"GET\", \
        \"requestUri\":\"/things/{thingName}/shadow\" \
      }, \
      \"input\":{ \
        \"shape\":\"GetThingShadowRequest\", \
        \"documentation\":\"<p>The input for the GetThingShadow operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"GetThingShadowResponse\", \
        \"documentation\":\"<p>The output from the GetThingShadow operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        }, \
        { \
          \"shape\":\"MethodNotAllowedException\", \
          \"error\":{\"httpStatusCode\":405}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified combination of HTTP verb and URI is not supported.</p>\" \
        }, \
        { \
          \"shape\":\"UnsupportedDocumentEncodingException\", \
          \"error\":{\"httpStatusCode\":415}, \
          \"exception\":true, \
          \"documentation\":\"<p>The document encoding is not supported.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Gets the thing shadow for the specified thing.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/iot/latest/developerguide/API_GetThingShadow.html\\\">GetThingShadow</a> in the <i>AWS IoT Developer Guide</i>.</p>\" \
    }, \
    \"Publish\":{ \
      \"name\":\"Publish\", \
      \"http\":{ \
        \"method\":\"POST\", \
        \"requestUri\":\"/topics/{topic}\" \
      }, \
      \"input\":{ \
        \"shape\":\"PublishRequest\", \
        \"documentation\":\"<p>The input for the Publish operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"MethodNotAllowedException\", \
          \"error\":{\"httpStatusCode\":405}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified combination of HTTP verb and URI is not supported.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Publishes state information.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/iot/latest/developerguide/protocols.html#http\\\">HTTP Protocol</a> in the <i>AWS IoT Developer Guide</i>.</p>\" \
    }, \
    \"UpdateThingShadow\":{ \
      \"name\":\"UpdateThingShadow\", \
      \"http\":{ \
        \"method\":\"POST\", \
        \"requestUri\":\"/things/{thingName}/shadow\" \
      }, \
      \"input\":{ \
        \"shape\":\"UpdateThingShadowRequest\", \
        \"documentation\":\"<p>The input for the UpdateThingShadow operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"UpdateThingShadowResponse\", \
        \"documentation\":\"<p>The output from the UpdateThingShadow operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"ConflictException\", \
          \"error\":{\"httpStatusCode\":409}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified version does not match the version of the document.</p>\" \
        }, \
        { \
          \"shape\":\"RequestEntityTooLargeException\", \
          \"error\":{\"httpStatusCode\":413}, \
          \"exception\":true, \
          \"documentation\":\"<p>The payload exceeds the maximum size allowed.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        }, \
        { \
          \"shape\":\"MethodNotAllowedException\", \
          \"error\":{\"httpStatusCode\":405}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified combination of HTTP verb and URI is not supported.</p>\" \
        }, \
        { \
          \"shape\":\"UnsupportedDocumentEncodingException\", \
          \"error\":{\"httpStatusCode\":415}, \
          \"exception\":true, \
          \"documentation\":\"<p>The document encoding is not supported.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Updates the thing shadow for the specified thing.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/iot/latest/developerguide/API_UpdateThingShadow.html\\\">UpdateThingShadow</a> in the <i>AWS IoT Developer Guide</i>.</p>\" \
    } \
  }, \
  \"shapes\":{ \
    \"ConflictException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"ErrorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":409}, \
      \"exception\":true, \
      \"documentation\":\"<p>The specified version does not match the version of the document.</p>\" \
    }, \
    \"DeleteThingShadowRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[\"thingName\"], \
      \"members\":{ \
        \"thingName\":{ \
          \"shape\":\"ThingName\", \
          \"location\":\"uri\", \
          \"locationName\":\"thingName\", \
          \"documentation\":\"<p>The name of the thing.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the DeleteThingShadow operation.</p>\" \
    }, \
    \"DeleteThingShadowResponse\":{ \
      \"type\":\"structure\", \
      \"required\":[\"payload\"], \
      \"members\":{ \
        \"payload\":{ \
          \"shape\":\"JsonDocument\", \
          \"documentation\":\"<p>The state information, in JSON format.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output from the DeleteThingShadow operation.</p>\", \
      \"payload\":\"payload\" \
    }, \
    \"ErrorMessage\":{\"type\":\"string\"}, \
    \"GetThingShadowRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[\"thingName\"], \
      \"members\":{ \
        \"thingName\":{ \
          \"shape\":\"ThingName\", \
          \"location\":\"uri\", \
          \"locationName\":\"thingName\", \
          \"documentation\":\"<p>The name of the thing.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the GetThingShadow operation.</p>\" \
    }, \
    \"GetThingShadowResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"payload\":{ \
          \"shape\":\"JsonDocument\", \
          \"documentation\":\"<p>The state information, in JSON format.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output from the GetThingShadow operation.</p>\", \
      \"payload\":\"payload\" \
    }, \
    \"InternalFailureException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":500}, \
      \"exception\":true, \
      \"fault\":true, \
      \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
    }, \
    \"InvalidRequestException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":400}, \
      \"exception\":true, \
      \"documentation\":\"<p>The request is not valid.</p>\" \
    }, \
    \"JsonDocument\":{\"type\":\"blob\"}, \
    \"MethodNotAllowedException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"ErrorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":405}, \
      \"exception\":true, \
      \"documentation\":\"<p>The specified combination of HTTP verb and URI is not supported.</p>\" \
    }, \
    \"Payload\":{\"type\":\"blob\"}, \
    \"PublishRequest\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"topic\":{ \
          \"shape\":\"Topic\", \
          \"location\":\"uri\", \
          \"locationName\":\"topic\", \
          \"documentation\":\"<p>The name of the MQTT topic.</p>\" \
        }, \
        \"qos\":{ \
          \"shape\":\"Qos\", \
          \"location\":\"querystring\", \
          \"locationName\":\"qos\", \
          \"documentation\":\"<p>The Quality of Service (QoS) level.</p>\" \
        }, \
        \"payload\":{ \
          \"shape\":\"Payload\", \
          \"documentation\":\"<p>The state information, in JSON format.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the Publish operation.</p>\", \
      \"required\":[\"topic\"], \
      \"payload\":\"payload\" \
    }, \
    \"Qos\":{ \
      \"type\":\"integer\", \
      \"min\":0, \
      \"max\":1 \
    }, \
    \"RequestEntityTooLargeException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"ErrorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":413}, \
      \"exception\":true, \
      \"documentation\":\"<p>The payload exceeds the maximum size allowed.</p>\" \
    }, \
    \"ResourceNotFoundException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":404}, \
      \"exception\":true, \
      \"documentation\":\"<p>The specified resource does not exist.</p>\" \
    }, \
    \"ServiceUnavailableException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":503}, \
      \"exception\":true, \
      \"fault\":true, \
      \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
    }, \
    \"ThingName\":{ \
      \"type\":\"string\", \
      \"min\":1, \
      \"max\":128, \
      \"pattern\":\"[a-zA-Z0-9_-]+\" \
    }, \
    \"ThrottlingException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":429}, \
      \"exception\":true, \
      \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
    }, \
    \"Topic\":{\"type\":\"string\"}, \
    \"UnauthorizedException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":401}, \
      \"exception\":true, \
      \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
    }, \
    \"UnsupportedDocumentEncodingException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":415}, \
      \"exception\":true, \
      \"documentation\":\"<p>The document encoding is not supported.</p>\" \
    }, \
    \"UpdateThingShadowRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"thingName\", \
        \"payload\" \
      ], \
      \"members\":{ \
        \"thingName\":{ \
          \"shape\":\"ThingName\", \
          \"location\":\"uri\", \
          \"locationName\":\"thingName\", \
          \"documentation\":\"<p>The name of the thing.</p>\" \
        }, \
        \"payload\":{ \
          \"shape\":\"JsonDocument\", \
          \"documentation\":\"<p>The state information, in JSON format.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the UpdateThingShadow operation.</p>\", \
      \"payload\":\"payload\" \
    }, \
    \"UpdateThingShadowResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"payload\":{ \
          \"shape\":\"JsonDocument\", \
          \"documentation\":\"<p>The state information, in JSON format.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output from the UpdateThingShadow operation.</p>\", \
      \"payload\":\"payload\" \
    }, \
    \"errorMessage\":{\"type\":\"string\"} \
  }, \
  \"examples\":{ \
  } \
} \
 \
";
}

@end
