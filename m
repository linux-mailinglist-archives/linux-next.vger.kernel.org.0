Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E130644018D
	for <lists+linux-next@lfdr.de>; Fri, 29 Oct 2021 19:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbhJ2R6W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Oct 2021 13:58:22 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46964 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229489AbhJ2R6V (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 Oct 2021 13:58:21 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19TGgaQQ004359;
        Fri, 29 Oct 2021 17:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to : sender :
 content-transfer-encoding : mime-version; s=pp1;
 bh=r72HrRoVqYIpZr41XCJNnas5nJdDFOgZ/LjOXjH8yTo=;
 b=Eq7kJoix+ZfWIUWzQEdIJbdfRoKGoWPkna5bc4hdS7dtqgAsVvL+mRBDhpsSgd/GKhr6
 E8VpKSPx5Cf0Lv1eQrAJS4sg+q5qyl83jKsbl/MS8y5nCrk+bvrjAo3Y4Hl7M38M/1YE
 L9SpUWzTRPwQPDIh57b6YIk3IBaUpbczZx/usGkV8CR7ZE1S6ZmOsaAibOVrdlUGxji4
 mszsWi57jqnSFspqU8DhkWx0sqYi7bKAEZmgneTQh//vKRnQ4izwv3WwSX3K12A3JkhG
 4IowSBJSJnO0GD5i+kzLNtUgW28KgmjG+qqQLNYobOn65/dvDsbPnjlcUdlx+cn5wLGx dw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3c0mqd9cd6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 29 Oct 2021 17:55:47 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19THldng022196;
        Fri, 29 Oct 2021 17:55:44 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma04fra.de.ibm.com with ESMTP id 3bx4f8b9em-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 29 Oct 2021 17:55:44 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 19THtfwh60621120
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 29 Oct 2021 17:55:41 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1ADCA5204F;
        Fri, 29 Oct 2021 17:55:41 +0000 (GMT)
Received: from t480-pf1aa2c2 (unknown [9.145.18.93])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 084F35204E;
        Fri, 29 Oct 2021 17:55:41 +0000 (GMT)
Received: from bblock by t480-pf1aa2c2 with local (Exim 4.94.2)
        (envelope-from <bblock@linux.ibm.com>)
        id 1mgW6O-002nP7-EA; Fri, 29 Oct 2021 19:55:40 +0200
Date:   Fri, 29 Oct 2021 19:55:40 +0200
From:   Benjamin Block <bblock@linux.ibm.com>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     Steffen Maier <maier@linux.ibm.com>, jwi@linux.ibm.com,
        martin.petersen@oracle.com, jejb@linux.ibm.com,
        linux-scsi@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-next@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v3] scsi: core: Fix early registration of sysfs
 attributes for scsi_device
Message-ID: <YXw1nMzFwE9Ud7ch@t480-pf1aa2c2.linux.ibm.com>
References: <2f5e5d18-7ba9-10f6-1855-84546172b473@linux.ibm.com>
 <20211026014240.4098365-1-maier@linux.ibm.com>
 <YXfRvxKu/xXVubF8@t480-pf1aa2c2.linux.ibm.com>
 <ab1a9bfd-c1d2-e101-a9f3-f969ed3d1cad@acm.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <ab1a9bfd-c1d2-e101-a9f3-f969ed3d1cad@acm.org>
Sender: Benjamin Block <bblock@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DZ_B9ZtTCPkiNYSP_FqVph9Ghb57oovZ
X-Proofpoint-GUID: DZ_B9ZtTCPkiNYSP_FqVph9Ghb57oovZ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-29_04,2021-10-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2110290096
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 26, 2021 at 02:48:55PM -0700, Bart Van Assche wrote:
> On 10/26/21 3:00 AM, Benjamin Block wrote:
> > Hmm, maybe this is out of scope for this fix, but couldn't we
> > essentially do the same thing for the host attributes. Have the
> > `shost_class` take the `scsi_shost_attr_group` as default attributes for
> > the shost class, and then assign the `shost_groups` from the LLDD
> > template to `shost_dev.groups` as optional attributes?
> > 
> > Then we get rid of the indirection loop in `hosts.c` as well, that was
> > introduce with he original patch by Bart.
> > 
> > Just a shot in the dark, I don't know whether the `struct class` behaves
> > the same in this case as `struct device_type`.
> 
> Is something like this what you have in mind?

Yes, exactly. That's what I meant. That make host and dev similar again.

I just wasn't really sure whether `.dev_groups` in class behaves the
same as with what Steffen did. From the documentation it does though.

> 
> Thanks,
> 
> Bart.
> 
> 
> Subject: [PATCH] scsi: core: Remove Scsi_Host.shost_dev_attr_groups
> 
> Suggested-by: Benjamin Block <bblock@linux.ibm.com>
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  drivers/scsi/hosts.c      | 15 +++------------
>  drivers/scsi/scsi_priv.h  |  2 +-
>  drivers/scsi/scsi_sysfs.c |  7 ++++++-
>  include/scsi/scsi_host.h  |  6 ------
>  4 files changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/scsi/hosts.c b/drivers/scsi/hosts.c
> index 17aef936bc90..f88e7ed77dbb 100644
> --- a/drivers/scsi/hosts.c
> +++ b/drivers/scsi/hosts.c
> @@ -61,6 +61,7 @@ static void scsi_host_cls_release(struct device *dev)
>  static struct class shost_class = {
>  	.name		= "scsi_host",
>  	.dev_release	= scsi_host_cls_release,
> +	.dev_groups	= scsi_shost_groups,
>  };
> 
>  /**
> @@ -376,7 +377,7 @@ static struct device_type scsi_host_type = {
>  struct Scsi_Host *scsi_host_alloc(struct scsi_host_template *sht, int privsize)
>  {
>  	struct Scsi_Host *shost;
> -	int index, i, j = 0;
> +	int index;
> 
>  	shost = kzalloc(sizeof(struct Scsi_Host) + privsize, GFP_KERNEL);
>  	if (!shost)
> @@ -481,17 +482,7 @@ struct Scsi_Host *scsi_host_alloc(struct scsi_host_template *sht, int privsize)
>  	shost->shost_dev.parent = &shost->shost_gendev;
>  	shost->shost_dev.class = &shost_class;
>  	dev_set_name(&shost->shost_dev, "host%d", shost->host_no);
> -	shost->shost_dev.groups = shost->shost_dev_attr_groups;
> -	shost->shost_dev_attr_groups[j++] = &scsi_shost_attr_group;
> -	if (sht->shost_groups) {
> -		for (i = 0; sht->shost_groups[i] &&
> -			     j < ARRAY_SIZE(shost->shost_dev_attr_groups);
> -		     i++, j++) {
> -			shost->shost_dev_attr_groups[j] =
> -				sht->shost_groups[i];
> -		}
> -	}
> -	WARN_ON_ONCE(j >= ARRAY_SIZE(shost->shost_dev_attr_groups));
> +	shost->shost_dev.groups = sht->shost_groups;
> 
>  	shost->ehandler = kthread_run(scsi_error_handler, shost,
>  			"scsi_eh_%d", shost->host_no);
> diff --git a/drivers/scsi/scsi_priv.h b/drivers/scsi/scsi_priv.h
> index a278fc8948f4..0f5743f4769b 100644
> --- a/drivers/scsi/scsi_priv.h
> +++ b/drivers/scsi/scsi_priv.h
> @@ -144,7 +144,7 @@ extern struct scsi_transport_template blank_transport_template;
>  extern void __scsi_remove_device(struct scsi_device *);
> 
>  extern struct bus_type scsi_bus_type;
> -extern const struct attribute_group scsi_shost_attr_group;
> +extern const struct attribute_group *scsi_shost_groups[];
> 
>  /* scsi_netlink.c */
>  #ifdef CONFIG_SCSI_NETLINK
> diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
> index c26f0e29e8cd..f360154b5241 100644
> --- a/drivers/scsi/scsi_sysfs.c
> +++ b/drivers/scsi/scsi_sysfs.c
> @@ -424,10 +424,15 @@ static struct attribute *scsi_sysfs_shost_attrs[] = {
>  	NULL
>  };
> 
> -const struct attribute_group scsi_shost_attr_group = {
> +static const struct attribute_group scsi_shost_attr_group = {
>  	.attrs =	scsi_sysfs_shost_attrs,
>  };
> 
> +const struct attribute_group *scsi_shost_groups[] = {
> +	&scsi_shost_attr_group,
> +	NULL
> +};
> +
>  static void scsi_device_cls_release(struct device *class_dev)
>  {
>  	struct scsi_device *sdev;
> diff --git a/include/scsi/scsi_host.h b/include/scsi/scsi_host.h
> index ae715959f886..97cdad14de56 100644
> --- a/include/scsi/scsi_host.h
> +++ b/include/scsi/scsi_host.h
> @@ -690,12 +690,6 @@ struct Scsi_Host {
> 
>  	/* ldm bits */
>  	struct device		shost_gendev, shost_dev;
> -	/*
> -	 * The array size 3 provides space for one attribute group defined by
> -	 * the SCSI core, one attribute group defined by the SCSI LLD and one
> -	 * terminating NULL pointer.
> -	 */
> -	const struct attribute_group *shost_dev_attr_groups[3];
> 
>  	/*
>  	 * Points to the transport data (if any) which is allocated

Reviewed-by: Benjamin Block <bblock@linux.ibm.com>

-- 
Best Regards, Benjamin Block  / Linux on IBM Z Kernel Development / IBM Systems
IBM Deutschland Research & Development GmbH    /    https://www.ibm.com/privacy
Vorsitz. AufsR.: Gregor Pillen         /        Geschäftsführung: Dirk Wittkopp
Sitz der Gesellschaft: Böblingen / Registergericht: AmtsG Stuttgart, HRB 243294
