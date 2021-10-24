Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0FD9438666
	for <lists+linux-next@lfdr.de>; Sun, 24 Oct 2021 04:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbhJXC6W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 23 Oct 2021 22:58:22 -0400
Received: from mail-pg1-f171.google.com ([209.85.215.171]:36701 "EHLO
        mail-pg1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbhJXC6W (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 23 Oct 2021 22:58:22 -0400
Received: by mail-pg1-f171.google.com with SMTP id 75so7270163pga.3;
        Sat, 23 Oct 2021 19:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=g2Rk3YDPTuYbL2gFB+QH8xxl7jPYpZtFgoHvTdHDfDA=;
        b=sM21s8Jm4DYpDmiGvO9Rl2/5U+/K9fU9ah1eDJaQ4ZpvhwrQBCJ51J34Yjl73ICCa/
         IqSI0R4Se9e61NZuGSeRl8qBOACT9kRkWyLrqQUbKeVSlBvbSGMaXOE3UrqlxnfDvcp0
         c2e3lh5jx6L/cL7Ev1fdTaVzkdk/JPqvvHL2/Zj8MzAWZxXOteul0/S9nPV0oc5osdGv
         0+RlI4KhVJhePVCbRLFcfYtmDiP5MYEg9A8U/A4UJ3LUQOIKd4ZBWcfdMGtQF86DV+rI
         cP45eeodcAq4pbXtfP5HRN8TPWPkaB7I9av0+OhfVDa15tVC5GD+VTZq955IzT+pGFs8
         4JFg==
X-Gm-Message-State: AOAM533oOP6wbL2ln1OfKvuAceVA1N/79YuJDtSnVGN+FbxVRulVC0HT
        QVv6NaFT2ZB2eXFQXw2wrVqoiTNUXrc=
X-Google-Smtp-Source: ABdhPJwSt48OED4S4IbjhKux968vwNO0aUaTmkICa54MJunsmDrEvj51/n0B7EDYM4uiKlIE/TwfTA==
X-Received: by 2002:aa7:88cb:0:b0:44d:4b3f:36c1 with SMTP id k11-20020aa788cb000000b0044d4b3f36c1mr9541392pff.76.1635044162284;
        Sat, 23 Oct 2021 19:56:02 -0700 (PDT)
Received: from ?IPV6:2601:647:4000:d7:5c9:2be7:90ec:788b? ([2601:647:4000:d7:5c9:2be7:90ec:788b])
        by smtp.gmail.com with ESMTPSA id t8sm13039432pgk.66.2021.10.23.19.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Oct 2021 19:56:01 -0700 (PDT)
Message-ID: <783db5c0-c5c5-eb10-512e-f78e6d7abaef@acm.org>
Date:   Sat, 23 Oct 2021 19:55:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Missing driver-specific sysfs attributes of scsi_device [was: Re:
 [PATCH v4 00/46] Register SCSI sysfs attributes earlier]
Content-Language: en-US
To:     Steffen Maier <maier@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     linux-scsi@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Benjamin Block <bblock@linux.ibm.com>
References: <20211012233558.4066756-1-bvanassche@acm.org>
 <163478764102.7011.9375895285870786953.b4-ty@oracle.com>
 <7c0af228-e098-5657-934e-d2bd2bff5ee3@linux.ibm.com>
 <604fad4c-4003-b413-b3c8-00abcd65341e@linux.ibm.com>
From:   Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <604fad4c-4003-b413-b3c8-00abcd65341e@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/23/21 17:39, Steffen Maier wrote:
> I tried to fix it by assigning the pointer of that new field to the groups
> field of sdev_gendev so the driver core gets our groups on devide_add().
> Just like scsi_host_alloc() was changed by the same commit,
> although scsi_host_alloc() already had assigned something to
> shost_dev.groups so the necessary change was more obvious there.

Thanks for having reported this early. We probably need something like this
(entirely untested):

--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@ -1583,7 +1583,7 @@ void scsi_sysfs_device_initialize(struct scsi_device *sdev)
  	scsi_enable_async_suspend(&sdev->sdev_gendev);
  	dev_set_name(&sdev->sdev_gendev, "%d:%d:%d:%llu",
  		     sdev->host->host_no, sdev->channel, sdev->id, sdev->lun);
-	sdev->gendev_attr_groups[j++] = &scsi_sdev_attr_group;
+	sdev->sdev_gendev.groups = sdev->gendev_attr_groups;
  	if (hostt->sdev_groups) {
  		for (i = 0; hostt->sdev_groups[i] &&
  			     j < ARRAY_SIZE(sdev->gendev_attr_groups);

Bart.
