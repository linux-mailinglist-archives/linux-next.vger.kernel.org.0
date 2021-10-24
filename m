Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11835438C17
	for <lists+linux-next@lfdr.de>; Sun, 24 Oct 2021 23:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbhJXV1w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 17:27:52 -0400
Received: from mail-pg1-f169.google.com ([209.85.215.169]:35809 "EHLO
        mail-pg1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhJXV1u (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Oct 2021 17:27:50 -0400
Received: by mail-pg1-f169.google.com with SMTP id q187so8973538pgq.2;
        Sun, 24 Oct 2021 14:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pJDD/v04sfjRKB3/TxhJ7E4ItPwl7Sfp4PT/SwwRXYc=;
        b=ZW0kS8TF6eHWYKeF2JmFkwZfsaOnfmQiJGcoZ5O8NXTlPLjU/FLoGYKP4GLYt2eR5w
         i8YQF+lUFnJEJ+YD8tq/dw0SnHqCSXlYyVrumVMxRloWKdL2iPzS4OId/YPURNcWlDJb
         dxv5EXIWzIWXrPjYyW5AdRP0DG6zgdEqZVq566aZot0QBawl1JtriJVZ5NRejffszRGr
         x/VWkUm1vDyHJLnWy8O87BQM3dqYoIPX26X8qi1CXmIdCTJerK2McG98g3Plyh6+snE8
         aNv2Ay/h4BmPjraAS3jBTioy8QrqMVGhJ2xCach9ISDg8IDtYmPFyiwGt4RbGGE2SmPa
         4dSg==
X-Gm-Message-State: AOAM533Ti9g+AU+kLa+RXIabcOIK6Myr6UwPOJ/CRzGseuBF3ZxSGvb6
        rc2dRQhidyKyqKUS/JVDY5c=
X-Google-Smtp-Source: ABdhPJy+yXD9hVkMWN+x+U/QsZKU7cRsNCHsc1497wj0Nhbn1GVaJiVKvQ0wBDoWUSEHNHWR/s4/rw==
X-Received: by 2002:a63:790b:: with SMTP id u11mr10364809pgc.71.1635110728627;
        Sun, 24 Oct 2021 14:25:28 -0700 (PDT)
Received: from ?IPV6:2601:647:4000:d7:1d23:4f1f:253d:c1e1? ([2601:647:4000:d7:1d23:4f1f:253d:c1e1])
        by smtp.gmail.com with ESMTPSA id c12sm16558663pfc.161.2021.10.24.14.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Oct 2021 14:25:28 -0700 (PDT)
Message-ID: <b5e69621-e2ee-750a-e542-a27aaa9293e5@acm.org>
Date:   Sun, 24 Oct 2021 14:25:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] scsi: core: Fix early registration of sysfs attributes
 for scsi_device
Content-Language: en-US
To:     Steffen Maier <maier@linux.ibm.com>, martin.petersen@oracle.com,
        jejb@linux.ibm.com, linux-scsi@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, bblock@linux.ibm.com,
        linux-next@vger.kernel.org, linux-s390@vger.kernel.org
References: <604fad4c-4003-b413-b3c8-00abcd65341e@linux.ibm.com>
 <20211024111815.556995-1-maier@linux.ibm.com>
From:   Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20211024111815.556995-1-maier@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/24/21 04:18, Steffen Maier wrote:
> diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
> index c26f0e29e8cd..a3e37d3728df 100644
> --- a/drivers/scsi/scsi_sysfs.c
> +++ b/drivers/scsi/scsi_sysfs.c
> @@ -1583,7 +1583,7 @@ void scsi_sysfs_device_initialize(struct scsi_device *sdev)
>   	scsi_enable_async_suspend(&sdev->sdev_gendev);
>   	dev_set_name(&sdev->sdev_gendev, "%d:%d:%d:%llu",
>   		     sdev->host->host_no, sdev->channel, sdev->id, sdev->lun);
> -	sdev->gendev_attr_groups[j++] = &scsi_sdev_attr_group;
> +	sdev->sdev_gendev.groups = sdev->gendev_attr_groups;
>   	if (hostt->sdev_groups) {
>   		for (i = 0; hostt->sdev_groups[i] &&
>   			     j < ARRAY_SIZE(sdev->gendev_attr_groups);

How about also updating the comment above the gendev_attr_groups
declaration since the above change makes that comment incorrect?

Thanks,

Bart.


