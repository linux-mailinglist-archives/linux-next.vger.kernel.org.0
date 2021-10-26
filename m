Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1B0043B9A1
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 20:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238322AbhJZSeD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 14:34:03 -0400
Received: from mail-pj1-f53.google.com ([209.85.216.53]:43914 "EHLO
        mail-pj1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236171AbhJZSdy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 14:33:54 -0400
Received: by mail-pj1-f53.google.com with SMTP id k2-20020a17090ac50200b001a218b956aaso182004pjt.2;
        Tue, 26 Oct 2021 11:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uopvb2qp8VpwzAYgXBeb+ewVZo7WAA32gjRIR84G0wU=;
        b=BTVV6d3NnLUwSFmMkXiKSaRQ6UUysYTs88FVC4xZC1qcRHUZmgFPbhwqjbMf5ZxCP9
         cR2fGr5XS8Krr7hh2uag4FvK8004kETYr3F88puWBiSgXgad8veiQFXtCKumvVTtoHER
         w7D7c91qqfXevkefdkKWQ+c9mdbW7P8bG+s5lj4mjzBvDtu8LH2J/Ei7doT0UeJtyY64
         wY1bwXVZr7hgjVG5pKXfTy8Mz2IUf1fDcncnPgHsQoyzwTxxT0eGC1ZjLr9u/giwnFEM
         hzk1bNwNQD1Rqo0uMOr/h3aA/FgYUtBNeZXy6mbchhdKtt8Lt4muSDykYdIZlG7qGGxf
         Sb7g==
X-Gm-Message-State: AOAM530o3ydGC14Y8N5JeF3WQdlYy8tgKxOjRHKrB5KcuQufOEQVWERv
        V9Tv0HQGY30D8VuSh8xDu3oFHZLKwjWNaQ==
X-Google-Smtp-Source: ABdhPJwIBY9eQePiQquBgu8ef6u3xdUlwf1y8/xhypVAxNK/Dt9TMM4HXHBa57YhxnWdZ05ZncjkDg==
X-Received: by 2002:a17:90a:4e42:: with SMTP id t2mr461259pjl.108.1635273089765;
        Tue, 26 Oct 2021 11:31:29 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com ([2620:15c:211:201:26a4:3b5f:3c4f:53f5])
        by smtp.gmail.com with ESMTPSA id b6sm26555566pfv.171.2021.10.26.11.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 11:31:29 -0700 (PDT)
Subject: Re: [PATCH v3] scsi: core: Fix early registration of sysfs attributes
 for scsi_device
To:     Steffen Maier <maier@linux.ibm.com>, jwi@linux.ibm.com,
        martin.petersen@oracle.com, jejb@linux.ibm.com,
        linux-scsi@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, bblock@linux.ibm.com,
        linux-next@vger.kernel.org, linux-s390@vger.kernel.org
References: <2f5e5d18-7ba9-10f6-1855-84546172b473@linux.ibm.com>
 <20211026014240.4098365-1-maier@linux.ibm.com>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <9a2535ec-7380-f948-d132-763d3d2140c5@acm.org>
Date:   Tue, 26 Oct 2021 11:31:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211026014240.4098365-1-maier@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/25/21 6:42 PM, Steffen Maier wrote:
> diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
> index c26f0e29e8cd..fa064bf9a55c 100644
> --- a/drivers/scsi/scsi_sysfs.c
> +++ b/drivers/scsi/scsi_sysfs.c
> @@ -1571,7 +1571,6 @@ static struct device_type scsi_dev_type = {
>   
>   void scsi_sysfs_device_initialize(struct scsi_device *sdev)
>   {
> -	int i, j = 0;
>   	unsigned long flags;
>   	struct Scsi_Host *shost = sdev->host;
>   	struct scsi_host_template *hostt = shost->hostt;
> @@ -1583,15 +1582,7 @@ void scsi_sysfs_device_initialize(struct scsi_device *sdev)
>   	scsi_enable_async_suspend(&sdev->sdev_gendev);
>   	dev_set_name(&sdev->sdev_gendev, "%d:%d:%d:%llu",
>   		     sdev->host->host_no, sdev->channel, sdev->id, sdev->lun);
> -	sdev->gendev_attr_groups[j++] = &scsi_sdev_attr_group;
> -	if (hostt->sdev_groups) {
> -		for (i = 0; hostt->sdev_groups[i] &&
> -			     j < ARRAY_SIZE(sdev->gendev_attr_groups);
> -		     i++, j++) {
> -			sdev->gendev_attr_groups[j] = hostt->sdev_groups[i];
> -		}
> -	}
> -	WARN_ON_ONCE(j >= ARRAY_SIZE(sdev->gendev_attr_groups));
> +	sdev->sdev_gendev.groups = hostt->sdev_groups;
>   
>   	device_initialize(&sdev->sdev_dev);
>   	sdev->sdev_dev.parent = get_device(&sdev->sdev_gendev);
> diff --git a/include/scsi/scsi_device.h b/include/scsi/scsi_device.h
> index b1e9b3bd3a60..b97e142a7ca9 100644
> --- a/include/scsi/scsi_device.h
> +++ b/include/scsi/scsi_device.h
> @@ -225,12 +225,6 @@ struct scsi_device {
>   
>   	struct device		sdev_gendev,
>   				sdev_dev;
> -	/*
> -	 * The array size 6 provides space for one attribute group for the
> -	 * SCSI core, four attribute groups defined by SCSI LLDs and one
> -	 * terminating NULL pointer.
> -	 */
> -	const struct attribute_group *gendev_attr_groups[6];
>   
>   	struct execute_work	ew; /* used to get process context on put */
>   	struct work_struct	requeue_work;

Thanks!

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
