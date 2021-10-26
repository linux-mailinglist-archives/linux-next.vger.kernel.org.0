Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEDA43BCA5
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 23:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239687AbhJZVvi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 17:51:38 -0400
Received: from mail-pl1-f173.google.com ([209.85.214.173]:37547 "EHLO
        mail-pl1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237419AbhJZVvW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 17:51:22 -0400
Received: by mail-pl1-f173.google.com with SMTP id n11so527643plf.4;
        Tue, 26 Oct 2021 14:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PTfDtU9ITgZgQpCYO9Pe8JKDuiPUT22FD3M2pisYMu4=;
        b=AChTEHmBek/hSb6aXZvPNVQ+r6H8QErwP4hTF+ZIvCcc9CRFxiMPZpGYl0PfSNU0D9
         Ed5amRDpFtX6NuTT02AWGRoNODLwURl2wHgfCIj/sXaroi+ezzjJq4eqB0XbKlOFxzZP
         EyOGJa7ftNKRkUNxbaUTONBF+KeXj3eAxFJHpDIoyky/n+h5/Qi28ke/cnHXc+rx0fen
         3TWEC22vfPFdMi7yU7oquXaB/vc0kGXT4R/AI5q92xmF1e5yTOsq63MSxwqo/Th6iRwk
         9PIJUmsqu14r+91KH6LswzdvCYMFLicUA5oGUSuvVJLAAlX5OH13JtAYVz7CtEiYmY5a
         Y3ig==
X-Gm-Message-State: AOAM531A0wKSnCZNuDZwQyuD7JEAhq2bTIY5Sw0gwIsED+3DTNc58KRp
        rGVpTguV7WjXOtUxXK4dRKkkbRgJfoMNmQ==
X-Google-Smtp-Source: ABdhPJzlF/fGJS5G4v9d3WlqG0vlxAB2D6rFvKigGkGrF+U3YfMmwWlFd3DkaUSRjD+23M0+ozwxyw==
X-Received: by 2002:a17:90a:784a:: with SMTP id y10mr1476356pjl.211.1635284937199;
        Tue, 26 Oct 2021 14:48:57 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com ([2620:15c:211:201:d40:ea48:4805:9a5e])
        by smtp.gmail.com with ESMTPSA id p3sm23113031pfb.205.2021.10.26.14.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 14:48:56 -0700 (PDT)
Subject: Re: [PATCH v3] scsi: core: Fix early registration of sysfs attributes
 for scsi_device
To:     Benjamin Block <bblock@linux.ibm.com>,
        Steffen Maier <maier@linux.ibm.com>
Cc:     jwi@linux.ibm.com, martin.petersen@oracle.com, jejb@linux.ibm.com,
        linux-scsi@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-next@vger.kernel.org, linux-s390@vger.kernel.org
References: <2f5e5d18-7ba9-10f6-1855-84546172b473@linux.ibm.com>
 <20211026014240.4098365-1-maier@linux.ibm.com>
 <YXfRvxKu/xXVubF8@t480-pf1aa2c2.linux.ibm.com>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <ab1a9bfd-c1d2-e101-a9f3-f969ed3d1cad@acm.org>
Date:   Tue, 26 Oct 2021 14:48:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXfRvxKu/xXVubF8@t480-pf1aa2c2.linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/26/21 3:00 AM, Benjamin Block wrote:
> Hmm, maybe this is out of scope for this fix, but couldn't we
> essentially do the same thing for the host attributes. Have the
> `shost_class` take the `scsi_shost_attr_group` as default attributes for
> the shost class, and then assign the `shost_groups` from the LLDD
> template to `shost_dev.groups` as optional attributes?
> 
> Then we get rid of the indirection loop in `hosts.c` as well, that was
> introduce with he original patch by Bart.
> 
> Just a shot in the dark, I don't know whether the `struct class` behaves
> the same in this case as `struct device_type`.

Is something like this what you have in mind?

Thanks,

Bart.


Subject: [PATCH] scsi: core: Remove Scsi_Host.shost_dev_attr_groups

Suggested-by: Benjamin Block <bblock@linux.ibm.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
  drivers/scsi/hosts.c      | 15 +++------------
  drivers/scsi/scsi_priv.h  |  2 +-
  drivers/scsi/scsi_sysfs.c |  7 ++++++-
  include/scsi/scsi_host.h  |  6 ------
  4 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/scsi/hosts.c b/drivers/scsi/hosts.c
index 17aef936bc90..f88e7ed77dbb 100644
--- a/drivers/scsi/hosts.c
+++ b/drivers/scsi/hosts.c
@@ -61,6 +61,7 @@ static void scsi_host_cls_release(struct device *dev)
  static struct class shost_class = {
  	.name		= "scsi_host",
  	.dev_release	= scsi_host_cls_release,
+	.dev_groups	= scsi_shost_groups,
  };

  /**
@@ -376,7 +377,7 @@ static struct device_type scsi_host_type = {
  struct Scsi_Host *scsi_host_alloc(struct scsi_host_template *sht, int privsize)
  {
  	struct Scsi_Host *shost;
-	int index, i, j = 0;
+	int index;

  	shost = kzalloc(sizeof(struct Scsi_Host) + privsize, GFP_KERNEL);
  	if (!shost)
@@ -481,17 +482,7 @@ struct Scsi_Host *scsi_host_alloc(struct scsi_host_template *sht, int privsize)
  	shost->shost_dev.parent = &shost->shost_gendev;
  	shost->shost_dev.class = &shost_class;
  	dev_set_name(&shost->shost_dev, "host%d", shost->host_no);
-	shost->shost_dev.groups = shost->shost_dev_attr_groups;
-	shost->shost_dev_attr_groups[j++] = &scsi_shost_attr_group;
-	if (sht->shost_groups) {
-		for (i = 0; sht->shost_groups[i] &&
-			     j < ARRAY_SIZE(shost->shost_dev_attr_groups);
-		     i++, j++) {
-			shost->shost_dev_attr_groups[j] =
-				sht->shost_groups[i];
-		}
-	}
-	WARN_ON_ONCE(j >= ARRAY_SIZE(shost->shost_dev_attr_groups));
+	shost->shost_dev.groups = sht->shost_groups;

  	shost->ehandler = kthread_run(scsi_error_handler, shost,
  			"scsi_eh_%d", shost->host_no);
diff --git a/drivers/scsi/scsi_priv.h b/drivers/scsi/scsi_priv.h
index a278fc8948f4..0f5743f4769b 100644
--- a/drivers/scsi/scsi_priv.h
+++ b/drivers/scsi/scsi_priv.h
@@ -144,7 +144,7 @@ extern struct scsi_transport_template blank_transport_template;
  extern void __scsi_remove_device(struct scsi_device *);

  extern struct bus_type scsi_bus_type;
-extern const struct attribute_group scsi_shost_attr_group;
+extern const struct attribute_group *scsi_shost_groups[];

  /* scsi_netlink.c */
  #ifdef CONFIG_SCSI_NETLINK
diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
index c26f0e29e8cd..f360154b5241 100644
--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@ -424,10 +424,15 @@ static struct attribute *scsi_sysfs_shost_attrs[] = {
  	NULL
  };

-const struct attribute_group scsi_shost_attr_group = {
+static const struct attribute_group scsi_shost_attr_group = {
  	.attrs =	scsi_sysfs_shost_attrs,
  };

+const struct attribute_group *scsi_shost_groups[] = {
+	&scsi_shost_attr_group,
+	NULL
+};
+
  static void scsi_device_cls_release(struct device *class_dev)
  {
  	struct scsi_device *sdev;
diff --git a/include/scsi/scsi_host.h b/include/scsi/scsi_host.h
index ae715959f886..97cdad14de56 100644
--- a/include/scsi/scsi_host.h
+++ b/include/scsi/scsi_host.h
@@ -690,12 +690,6 @@ struct Scsi_Host {

  	/* ldm bits */
  	struct device		shost_gendev, shost_dev;
-	/*
-	 * The array size 3 provides space for one attribute group defined by
-	 * the SCSI core, one attribute group defined by the SCSI LLD and one
-	 * terminating NULL pointer.
-	 */
-	const struct attribute_group *shost_dev_attr_groups[3];

  	/*
  	 * Points to the transport data (if any) which is allocated
