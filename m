Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 195B243923C
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 11:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbhJYJ0h (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 05:26:37 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4486 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230010AbhJYJ0h (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Oct 2021 05:26:37 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19P759RG012696;
        Mon, 25 Oct 2021 05:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=PO340YsaGcgMAYBxeHlAvJJ6UIEJH6wkWIABAKDcBrU=;
 b=sQqs6hZLy7dG32cryjBeBBsTMyImmAn0C+ZDjk3qW5+0ktTT35n3egjtiP8ng1E63MPl
 qGj7Faw+rEnQ1fm4Cx9IR0ciZrnrST8HXiflYGo1Res4pOQA2jeSRBg2qODY4x/xkb7p
 b5mfBYV7ZQkyZs82uGd9an+Az8QhFqElicFqSU1aFik/ZdhekJp0T/lW7mFumInG4fY3
 0NH6QT0xITSiooFSalyWOj8vhCVz4cGUlvlyeo7OKMsZx+jneDQd0mg+qVNMgZvboVnZ
 VJI8Or+0FbL0g0oa/xVDXyoLXE1sBD+MDe58CVkDl+M137Y6v6mQfjcVU3ZmIHqZFkV5 og== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3bvych5qhe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 25 Oct 2021 05:24:00 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19P9MNdt025706;
        Mon, 25 Oct 2021 09:23:58 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
        by ppma04fra.de.ibm.com with ESMTP id 3bva1a2gw8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 25 Oct 2021 09:23:58 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 19P9NsfW64029074
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Oct 2021 09:23:54 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B51FAAE051;
        Mon, 25 Oct 2021 09:23:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 51907AE045;
        Mon, 25 Oct 2021 09:23:54 +0000 (GMT)
Received: from [9.171.63.35] (unknown [9.171.63.35])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Mon, 25 Oct 2021 09:23:54 +0000 (GMT)
Message-ID: <2f5e5d18-7ba9-10f6-1855-84546172b473@linux.ibm.com>
Date:   Mon, 25 Oct 2021 11:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] scsi: core: Fix early registration of sysfs attributes
 for scsi_device
Content-Language: en-US
To:     Steffen Maier <maier@linux.ibm.com>, bvanassche@acm.org,
        martin.petersen@oracle.com, jejb@linux.ibm.com,
        linux-scsi@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, bblock@linux.ibm.com,
        linux-next@vger.kernel.org, linux-s390@vger.kernel.org
References: <b5e69621-e2ee-750a-e542-a27aaa9293e5@acm.org>
 <20211024221620.760160-1-maier@linux.ibm.com>
From:   Julian Wiedmann <jwi@linux.ibm.com>
In-Reply-To: <20211024221620.760160-1-maier@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Mt8gxOf6GMmN8eB5xKwqDNJbvrliUWxZ
X-Proofpoint-GUID: Mt8gxOf6GMmN8eB5xKwqDNJbvrliUWxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_03,2021-10-25_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110250054
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 25.10.21 00:16, Steffen Maier wrote:
> v4.17 commit 86b87cde0b55 ("scsi: core: host template attribute groups")
> introduced explicit sysfs_create_groups() in scsi_sysfs_add_sdev()
> and sysfs_remove_groups() in __scsi_remove_device(), both for sdev_gendev,
> based on a new field const struct attribute_group **sdev_groups
> of struct scsi_host_template.
> 

...

> Signed-off-by: Steffen Maier <maier@linux.ibm.com>
> Fixes: 92c4b58b15c5 ("scsi: core: Register sysfs attributes earlier")
> ---
> 
> Changes in v2:
> * integrated Bart's feedback of updating the comment for
>   the gendev_attr_groups declaration to match the code change
> * in that spirit also adapted the vector size of that field
> * eliminated the now unnecessary second loop counter 'j'
> 
>  drivers/scsi/scsi_sysfs.c  | 12 ++++++------
>  include/scsi/scsi_device.h |  7 +++----
>  2 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
> index c26f0e29e8cd..d73e84e1cb37 100644
> --- a/drivers/scsi/scsi_sysfs.c
> +++ b/drivers/scsi/scsi_sysfs.c
> @@ -1571,7 +1571,7 @@ static struct device_type scsi_dev_type = {
>  
>  void scsi_sysfs_device_initialize(struct scsi_device *sdev)
>  {
> -	int i, j = 0;
> +	int i = 0;
>  	unsigned long flags;
>  	struct Scsi_Host *shost = sdev->host;
>  	struct scsi_host_template *hostt = shost->hostt;
> @@ -1583,15 +1583,15 @@ void scsi_sysfs_device_initialize(struct scsi_device *sdev)
>  	scsi_enable_async_suspend(&sdev->sdev_gendev);
>  	dev_set_name(&sdev->sdev_gendev, "%d:%d:%d:%llu",
>  		     sdev->host->host_no, sdev->channel, sdev->id, sdev->lun);
> -	sdev->gendev_attr_groups[j++] = &scsi_sdev_attr_group;
> +	sdev->sdev_gendev.groups = sdev->gendev_attr_groups;
>  	if (hostt->sdev_groups) {
>  		for (i = 0; hostt->sdev_groups[i] &&
> -			     j < ARRAY_SIZE(sdev->gendev_attr_groups);
> -		     i++, j++) {
> -			sdev->gendev_attr_groups[j] = hostt->sdev_groups[i];
> +			     i < ARRAY_SIZE(sdev->gendev_attr_groups);
> +		     i++) {
> +			sdev->gendev_attr_groups[i] = hostt->sdev_groups[i];
>  		}
>  	}
> -	WARN_ON_ONCE(j >= ARRAY_SIZE(sdev->gendev_attr_groups));
> +	WARN_ON_ONCE(i >= ARRAY_SIZE(sdev->gendev_attr_groups));
>  

Can't we simply assign the hostt->sdev_groups now, without the additional
indirection?

sdev->sdev_gendev.groups = hostt->sdev_groups;


>  	device_initialize(&sdev->sdev_dev);
>  	sdev->sdev_dev.parent = get_device(&sdev->sdev_gendev);
> diff --git a/include/scsi/scsi_device.h b/include/scsi/scsi_device.h
> index b1e9b3bd3a60..b6f0d031217e 100644
> --- a/include/scsi/scsi_device.h
> +++ b/include/scsi/scsi_device.h
> @@ -226,11 +226,10 @@ struct scsi_device {
>  	struct device		sdev_gendev,
>  				sdev_dev;
>  	/*
> -	 * The array size 6 provides space for one attribute group for the
> -	 * SCSI core, four attribute groups defined by SCSI LLDs and one
> -	 * terminating NULL pointer.
> +	 * The array size 5 provides space for four attribute groups
> +	 * defined by SCSI LLDs and one terminating NULL pointer.
>  	 */
> -	const struct attribute_group *gendev_attr_groups[6];
> +	const struct attribute_group *gendev_attr_groups[5];
>  
>  	struct execute_work	ew; /* used to get process context on put */
>  	struct work_struct	requeue_work;
> 

