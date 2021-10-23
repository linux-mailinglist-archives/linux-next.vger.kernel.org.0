Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA36438575
	for <lists+linux-next@lfdr.de>; Sat, 23 Oct 2021 22:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhJWU5O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 23 Oct 2021 16:57:14 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:65378 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230142AbhJWU5O (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sat, 23 Oct 2021 16:57:14 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19NKgUTr029534;
        Sat, 23 Oct 2021 16:54:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=nDpay4QtSlj7zYDpfuufBQ/erd3Q7otWWp1itAd2JsI=;
 b=Lp/AJcfFxWwS+52EOBSMi/K5Pdg79Sa0TvBLC7ot8CA4aOuIMRfv63PSVwktZ9DkTp1k
 74C6TiNGAJclW5jkZ6Scp89ErWEi99PBgQL/XOU48fRHK4wirwdVp8iKmdLmx0DNC4tx
 6ZwLJPQgawP5uqh2wp4Wr9rzl6HCfQ+SzQVu1ouVHwY9OZdyLD+Ywcd/NrKHpAlNDsuD
 cVNeTFZgUTrkaXOqzghOL06UbI4VXj6c1HXZAIU1D+cdctb3yMq1Ym0lqSnehUE3SykX
 rUP+TI/EgEjx5FwsCGj2SITBOCVnwWHhqB36//FMcZy7lpa2aBd9BGi4g6I+2pFCHvzb uw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3bvejur657-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 23 Oct 2021 16:54:50 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19NKsHlH023467;
        Sat, 23 Oct 2021 20:54:48 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
        by ppma03ams.nl.ibm.com with ESMTP id 3bva19b95e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 23 Oct 2021 20:54:48 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 19NKsk6X7340722
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 23 Oct 2021 20:54:46 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 072E152051;
        Sat, 23 Oct 2021 20:54:46 +0000 (GMT)
Received: from [9.145.189.27] (unknown [9.145.189.27])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A9FB05204E;
        Sat, 23 Oct 2021 20:54:45 +0000 (GMT)
Message-ID: <7c0af228-e098-5657-934e-d2bd2bff5ee3@linux.ibm.com>
Date:   Sat, 23 Oct 2021 22:54:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Missing driver-specific sysfs attributes of scsi_device [was: Re:
 [PATCH v4 00/46] Register SCSI sysfs attributes earlier]
Content-Language: en-US
To:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-scsi@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Benjamin Block <bblock@linux.ibm.com>
References: <20211012233558.4066756-1-bvanassche@acm.org>
 <163478764102.7011.9375895285870786953.b4-ty@oracle.com>
From:   Steffen Maier <maier@linux.ibm.com>
In-Reply-To: <163478764102.7011.9375895285870786953.b4-ty@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SXoiBcY5tMdKikwDCG-EKQFuQcbz2Q9V
X-Proofpoint-GUID: SXoiBcY5tMdKikwDCG-EKQFuQcbz2Q9V
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-23_03,2021-10-22_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110230133
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Bart, hi Martin,

since Friday 2021-10-22 our CI reports errors with linux-next. It complains 
about missing zfcp-lun resources (although that's a follow-on error). Machines 
that have their root-fs on zfcp-attached SCSI disk(s) are stuck in boot. 
Looking at user visible effects, I see zfcp-specific sysfs attributes of 
scsi_device missing:

$ lszfcp -D
/usr/sbin/lszfcp: line 390: 
/sys/bus/ccw/drivers/zfcp/0.0.1780/host0/rport-0:0-0/target0:0:0/0:0:0:1089224725//hba_id: 
No such file or directory
/usr/sbin/lszfcp: line 391: 
/sys/bus/ccw/drivers/zfcp/0.0.1780/host0/rport-0:0-0/target0:0:0/0:0:0:1089224725//wwpn: 
No such file or directory
/usr/sbin/lszfcp: line 392: 
/sys/bus/ccw/drivers/zfcp/0.0.1780/host0/rport-0:0-0/target0:0:0/0:0:0:1089224725//fcp_lun: 
No such file or directory

That made me think of this patch series. It also happened so that Martin 
applied the series to 5.16/scsi-queue on 2021-10-21. Linux-next merged it on 
2021-10-22:

Merging scsi-mkp/for-next (83c3a7beaef7 scsi: lpfc: Update lpfc version to 
14.0.0.3)
$ git merge -m Merge branch 'for-next' of 
git://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git scsi-mkp/for-next
...
+ drivers/s390/scsi/zfcp_ext.h                    |   4 +-
+ drivers/s390/scsi/zfcp_fsf.c                    |   2 +-
+ drivers/s390/scsi/zfcp_scsi.c                   |   8 +-
+ drivers/s390/scsi/zfcp_sysfs.c                  |  52 ++--
[https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20211022&id=cf6c9d12750cf6f3f6aeffcd0bdb36b1ac993f44]

So this seems to match with the occurrence of problems for us.

I wonder if any of the other LLDDs see similar problems. I left those LLDD 
patches in the list below, that also were migrated from sdev_attrs to sdev_groups.

Guess it would be good to fix this before the v5.16 merge window opens 
(2021-11-08 after predicted v5.15 release? [http://phb-crystal-ball.org/]) so 
the error does not land in Linus' tree (which our CI also tests).

Not sure if I'll find time to dig deeper.

On 10/21/21 05:42, Martin K. Petersen wrote:
> On Tue, 12 Oct 2021 16:35:12 -0700, Bart Van Assche wrote:
> 
>> For certain user space software, e.g. udev, it is important that sysfs
>> attributes are registered before the KOBJ_ADD uevent is emitted. Hence
>> this patch series that removes the device_create_file() and
>> sysfs_create_groups() calls from the SCSI core. Please consider this
>> patch series for kernel v5.16.
>>
>> Thanks,
>>
>> [...]
> 
> Applied to 5.16/scsi-queue, thanks!
> 
> [01/46] scsi: core: Register sysfs attributes earlier
>          https://git.kernel.org/mkp/scsi/c/92c4b58b15c5
> [02/46] ata: Switch to attribute groups
>          https://git.kernel.org/mkp/scsi/c/c3f69c7f629f
> [03/46] firewire: sbp2: Switch to attribute groups
>          https://git.kernel.org/mkp/scsi/c/5e88e67b6f3b

> [06/46] scsi: zfcp: Switch to attribute groups
>          https://git.kernel.org/mkp/scsi/c/d8d7cf3f7d07

> [10/46] scsi: 53c700: Switch to attribute groups
>          https://git.kernel.org/mkp/scsi/c/90cb6538b5da
> [11/46] scsi: aacraid: Switch to attribute groups
>          https://git.kernel.org/mkp/scsi/c/bd16d71185c8

> [18/46] scsi: cxlflash: Switch to attribute groups
>          https://git.kernel.org/mkp/scsi/c/780c678912fb

> [21/46] scsi: hpsa: Switch to attribute groups
>          https://git.kernel.org/mkp/scsi/c/4cd16323b523

> [25/46] scsi: ipr: Switch to attribute groups
>          https://git.kernel.org/mkp/scsi/c/47d1e6ae0e1e

> [28/46] scsi: megaraid: Switch to attribute groups
>          https://git.kernel.org/mkp/scsi/c/09723bb252ca
> [29/46] scsi: mpt3sas: Switch to attribute groups
>          https://git.kernel.org/mkp/scsi/c/1bb3ca27d2ca

> [31/46] scsi: myrb: Switch to attribute groups
>          https://git.kernel.org/mkp/scsi/c/582c0360db90
> [32/46] scsi: myrs: Switch to attribute groups
>          https://git.kernel.org/mkp/scsi/c/087c3ace6337

> [42/46] scsi: smartpqi: Switch to attribute groups
>          https://git.kernel.org/mkp/scsi/c/64fc9015fbeb

> [45/46] scsi: usb: Switch to attribute groups
>          https://git.kernel.org/mkp/scsi/c/01e570febaaa
> [46/46] scsi: core: Remove two host template members that are no longer used
>          https://git.kernel.org/mkp/scsi/c/a47c6b713e89



-- 
Mit freundlichen Gruessen / Kind regards
Steffen Maier

Linux on IBM Z and LinuxONE

https://www.ibm.com/privacy/us/en/
IBM Deutschland Research & Development GmbH
Vorsitzender des Aufsichtsrats: Gregor Pillen
Geschaeftsfuehrung: Dirk Wittkopp
Sitz der Gesellschaft: Boeblingen
Registergericht: Amtsgericht Stuttgart, HRB 243294
