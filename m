Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD709440194
	for <lists+linux-next@lfdr.de>; Fri, 29 Oct 2021 19:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbhJ2R7S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Oct 2021 13:59:18 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17306 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229772AbhJ2R7R (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 Oct 2021 13:59:17 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19TH8sv1015338;
        Fri, 29 Oct 2021 17:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to : sender :
 content-transfer-encoding : mime-version; s=pp1;
 bh=4krAmARgnLRosvktWU6DZ8WfmFTLSO8sj1l6kKW90Qo=;
 b=BbnTuCuIf9xx3c5MfMK9FAxscPWz9hH0BA3DQTpaC4bmcjBliZinA3hrZKZtxL4xB35R
 Se/cnW0fgRkIEoxlB97trsVsATNQRYjFux1yyyVEmw0y4Xfi73vyc6HnXUb4cJp4JMa3
 zFUUeT4yQNzj/0fCKuHuULmw7YeBZVA6wKnj+1Il+YIqb1MEKtSY7iJNaz3fYkoIjOjh
 Q1TJHbzsA1JbcfNxnWwLgPJx3R40i6aRdoTrXIF+5t/0gznY7+o+muWpPqiOBJD6EH2O
 U531vp+R7tI3y58e/OyAGEPfWZ1hw0di6g4kXUliQCuaPzvFCuL9NJXRgHxjevvMj4yM Wg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3c0k3fuf44-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 29 Oct 2021 17:56:36 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
        by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19THmGZR003722;
        Fri, 29 Oct 2021 17:56:34 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
        by ppma06fra.de.ibm.com with ESMTP id 3bx4ejk863-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 29 Oct 2021 17:56:33 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 19THuUAr42992018
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 29 Oct 2021 17:56:30 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 585074C046;
        Fri, 29 Oct 2021 17:56:30 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 43EA54C044;
        Fri, 29 Oct 2021 17:56:30 +0000 (GMT)
Received: from t480-pf1aa2c2 (unknown [9.145.18.93])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri, 29 Oct 2021 17:56:30 +0000 (GMT)
Received: from bblock by t480-pf1aa2c2 with local (Exim 4.94.2)
        (envelope-from <bblock@linux.ibm.com>)
        id 1mgW7B-002nQp-PG; Fri, 29 Oct 2021 19:56:29 +0200
Date:   Fri, 29 Oct 2021 19:56:29 +0200
From:   Benjamin Block <bblock@linux.ibm.com>
To:     Steffen Maier <maier@linux.ibm.com>
Cc:     jwi@linux.ibm.com, bvanassche@acm.org, martin.petersen@oracle.com,
        jejb@linux.ibm.com, linux-scsi@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-next@vger.kernel.org,
        linux-s390@vger.kernel.org
Subject: Re: [PATCH v3] scsi: core: Fix early registration of sysfs
 attributes for scsi_device
Message-ID: <YXw1zXmIHxgpyNeA@t480-pf1aa2c2.linux.ibm.com>
References: <2f5e5d18-7ba9-10f6-1855-84546172b473@linux.ibm.com>
 <20211026014240.4098365-1-maier@linux.ibm.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20211026014240.4098365-1-maier@linux.ibm.com>
Sender: Benjamin Block <bblock@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jsT_bTLMfA6rO_pvORIk1lzbBImwGaWR
X-Proofpoint-ORIG-GUID: jsT_bTLMfA6rO_pvORIk1lzbBImwGaWR
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-29_04,2021-10-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110290096
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 26, 2021 at 03:42:40AM +0200, Steffen Maier wrote:
> v4.17 commit 86b87cde0b55 ("scsi: core: host template attribute groups")
> introduced explicit sysfs_create_groups() in scsi_sysfs_add_sdev()
> and sysfs_remove_groups() in __scsi_remove_device(), both for sdev_gendev,
> based on a new field const struct attribute_group **sdev_groups
> of struct scsi_host_template.
> 
> Commit 92c4b58b15c5 ("scsi: core: Register sysfs attributes earlier")
> removed above explicit (de)registration of scsi_device attribute groups.
> It also converted all scsi_device attributes and attribute_groups to
> end up in a new field const struct attribute_group *gendev_attr_groups[6]
> of struct scsi_device. However, that new field was not used anywhere.
> 
> Surprisingly, this only caused missing LLDD specific scsi_device sysfs
> attributes. Whereas, scsi core attributes from scsi_sdev_attr_groups
> did continue to exist because of scsi_dev_type.groups.
> 
> We separate scsi core attibutes from LLDD specific attributes.
> Hence, we keep the initializing assignment scsi_dev_type =
> { .groups = scsi_sdev_attr_groups, } as this takes care of core
> attributes. Without the separation, it would cause attribute double
> registration due to scsi_dev_type.groups and sdev_gendev.groups.
> 
> Julian suggested to assign the sdev_groups pointer of the
> scsi_host_template directly to the groups pointer of sdev_gendev.
> This way we can delete the container scsi_device.gendev_attr_groups
> and the loop copying each entry from hostt->sdev_groups to
> sdev->gendev_attr_groups.
> 
> Alternative approaches ruled out:
> Assigning gendev_attr_groups to sdev_dev has no visible effect.
> Assigning sdev->gendev_attr_groups to scsi_dev_type.groups
> caused scsi_device of all scsi host types to get LLDD specific
> attributes of the LLDD for which the last sdev alloc happened to occur,
> as that overwrote scsi_dev_type.groups,
> e.g. scsi_debug had zfcp-specific scsi_device attributes.
> 
> Signed-off-by: Steffen Maier <maier@linux.ibm.com>
> Fixes: 92c4b58b15c5 ("scsi: core: Register sysfs attributes earlier")
> Suggested-by: Julian Wiedmann <jwi@linux.ibm.com>
> ---
> 
> Notes:
>     Changes in v3:
>     * integrated Julian's feedback of dropping detour through
>       gendev_attr_groups
>     
>     Changes in v2:
>     * integrated Bart's feedback of updating the comment for
>       the gendev_attr_groups declaration to match the code change
>     * in that spirit also adapted the vector size of that field
>     * eliminated the now unnecessary second loop counter 'j'
> 
>  drivers/scsi/scsi_sysfs.c  | 11 +----------
>  include/scsi/scsi_device.h |  6 ------
>  2 files changed, 1 insertion(+), 16 deletions(-)
> 

Looks good to me.

Reviewed-by: Benjamin Block <bblock@linux.ibm.com>

-- 
Best Regards, Benjamin Block  / Linux on IBM Z Kernel Development / IBM Systems
IBM Deutschland Research & Development GmbH    /    https://www.ibm.com/privacy
Vorsitz. AufsR.: Gregor Pillen         /        Geschäftsführung: Dirk Wittkopp
Sitz der Gesellschaft: Böblingen / Registergericht: AmtsG Stuttgart, HRB 243294
