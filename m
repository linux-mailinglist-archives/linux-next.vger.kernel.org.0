Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 262FB439B07
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 18:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233216AbhJYQCd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 12:02:33 -0400
Received: from mail-pl1-f179.google.com ([209.85.214.179]:44898 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbhJYQCc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 12:02:32 -0400
Received: by mail-pl1-f179.google.com with SMTP id t11so8229405plq.11;
        Mon, 25 Oct 2021 09:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0u8W/iYUBoL/HAmKfloyvmKN5Wzvk8aMyu1vdRl20Ig=;
        b=l6+r0KjEOWZ5S9PWNzV1lqo1XJl8yhNk2ALQNAAntroFHPzrZWDuBUyQlJed420hJK
         ipLfemsh0NBOZT5n5jfOX9J7ExzY4F90CZUf2ArM0WTfnGKXQCP8YhCvbwIb8QvaoK8a
         nnQx5+5qarJGSIgaV3v5k6lD6VVH7uTelaD06eVg5J/HYFvGGQD1xIbqDjUEl+apArA+
         PkjRYdzdof6SjuaGq5TJVVcYRFUJb27dau3PBfmDJC99eaDYUcks+O2SEPK6LmDAYaQm
         3bZJFHZyEY/8SYGVrk6ypub3wNOs8iFH5DSszNvR9ovmALHCGMmvvVmq4L7mV13cuY3F
         hJbA==
X-Gm-Message-State: AOAM533msCKduQVBeRREy+AML4cKNonkRkklKbPx4j7mWi4IWKZgSHmL
        8JgfFk+Qi9ZUmvpq4WMqO5WxklRndOiXTg==
X-Google-Smtp-Source: ABdhPJwTQYXbQvR9Jcn0daCHQvVLuzkh/0+OpFLt1PZ0b42pfMnghUC8JClcjh+S9pQ6jm3McyOzsA==
X-Received: by 2002:a17:90b:4a4d:: with SMTP id lb13mr36265214pjb.122.1635177607387;
        Mon, 25 Oct 2021 09:00:07 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com ([2620:15c:211:201:f863:1daa:afe1:156])
        by smtp.gmail.com with ESMTPSA id 23sm21888090pjc.37.2021.10.25.09.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 09:00:06 -0700 (PDT)
Subject: Re: [PATCH v2] scsi: core: Fix early registration of sysfs attributes
 for scsi_device
To:     Julian Wiedmann <jwi@linux.ibm.com>,
        Steffen Maier <maier@linux.ibm.com>,
        martin.petersen@oracle.com, jejb@linux.ibm.com,
        linux-scsi@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, bblock@linux.ibm.com,
        linux-next@vger.kernel.org, linux-s390@vger.kernel.org
References: <b5e69621-e2ee-750a-e542-a27aaa9293e5@acm.org>
 <20211024221620.760160-1-maier@linux.ibm.com>
 <2f5e5d18-7ba9-10f6-1855-84546172b473@linux.ibm.com>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <eaa30030-120a-8e72-82d9-873e992007fd@acm.org>
Date:   Mon, 25 Oct 2021 09:00:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2f5e5d18-7ba9-10f6-1855-84546172b473@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/25/21 2:23 AM, Julian Wiedmann wrote:
> On 25.10.21 00:16, Steffen Maier wrote:
>>   void scsi_sysfs_device_initialize(struct scsi_device *sdev)
>>   {
>> -	int i, j = 0;
>> +	int i = 0;
>>   	unsigned long flags;
>>   	struct Scsi_Host *shost = sdev->host;
>>   	struct scsi_host_template *hostt = shost->hostt;
>> @@ -1583,15 +1583,15 @@ void scsi_sysfs_device_initialize(struct scsi_device *sdev)
>>   	scsi_enable_async_suspend(&sdev->sdev_gendev);
>>   	dev_set_name(&sdev->sdev_gendev, "%d:%d:%d:%llu",
>>   		     sdev->host->host_no, sdev->channel, sdev->id, sdev->lun);
>> -	sdev->gendev_attr_groups[j++] = &scsi_sdev_attr_group;
>> +	sdev->sdev_gendev.groups = sdev->gendev_attr_groups;
>>   	if (hostt->sdev_groups) {
>>   		for (i = 0; hostt->sdev_groups[i] &&
>> -			     j < ARRAY_SIZE(sdev->gendev_attr_groups);
>> -		     i++, j++) {
>> -			sdev->gendev_attr_groups[j] = hostt->sdev_groups[i];
>> +			     i < ARRAY_SIZE(sdev->gendev_attr_groups);
>> +		     i++) {
>> +			sdev->gendev_attr_groups[i] = hostt->sdev_groups[i];
>>   		}
>>   	}
>> -	WARN_ON_ONCE(j >= ARRAY_SIZE(sdev->gendev_attr_groups));
>> +	WARN_ON_ONCE(i >= ARRAY_SIZE(sdev->gendev_attr_groups));
>>   
> 
> Can't we simply assign the hostt->sdev_groups now, without the additional
> indirection?
> 
> sdev->sdev_gendev.groups = hostt->sdev_groups;

Hi Steffen,

Please let me know if you wouldn't have the time to integrate the 
approach mentioned above in a new version of your patch.

Thanks,

Bart.
