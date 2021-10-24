Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B95438604
	for <lists+linux-next@lfdr.de>; Sun, 24 Oct 2021 02:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbhJXAmW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 23 Oct 2021 20:42:22 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:22442 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231131AbhJXAmW (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sat, 23 Oct 2021 20:42:22 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19NNi8L0029098;
        Sat, 23 Oct 2021 20:39:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=DKFPhH2mYYuleP5I4kPW8Tq6giZY2HeDOmxWjzskfVk=;
 b=sYE5MU+gy3yVvaMXNIs+TOCuZMkzBz1CfNixYSrVrvHK6x9ZGPsPFJGbEjPZyXvwD3s+
 S4UMMC3x7VnvEYFf9qhEoW8+Qvrdua54oY4g1tJrcacVmvUedJj8Nl/CSMixD0OaIbQx
 AESZVSDXhAEP79LR72C3XC54K7dyMqKlghj9XrnYwkNBVb+O3XsnnYgq2UQB8g1Z4XOP
 o6cH8wfhOlo7vxcG6wmF8F+qEU15EYE1PkguqXaPOdqUnpYcmmfcPu6XcGtP3EhcQXEX
 zwh2sYKfasZm5jneXdY916nUluKZsU7/jbWGIYpD5jU2h4KiQOKo+n5Kq3lmwkVB8qD8 7Q== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3bvecsafvf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 23 Oct 2021 20:39:56 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19O0WJab025901;
        Sun, 24 Oct 2021 00:39:55 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
        by ppma03ams.nl.ibm.com with ESMTP id 3bva19c4dh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 24 Oct 2021 00:39:55 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 19O0dqVM3736280
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sun, 24 Oct 2021 00:39:52 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BAAF15205A;
        Sun, 24 Oct 2021 00:39:52 +0000 (GMT)
Received: from [9.145.189.27] (unknown [9.145.189.27])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6215052050;
        Sun, 24 Oct 2021 00:39:52 +0000 (GMT)
Message-ID: <604fad4c-4003-b413-b3c8-00abcd65341e@linux.ibm.com>
Date:   Sun, 24 Oct 2021 02:39:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Missing driver-specific sysfs attributes of scsi_device [was: Re:
 [PATCH v4 00/46] Register SCSI sysfs attributes earlier]
Content-Language: en-US
From:   Steffen Maier <maier@linux.ibm.com>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-scsi@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Benjamin Block <bblock@linux.ibm.com>
References: <20211012233558.4066756-1-bvanassche@acm.org>
 <163478764102.7011.9375895285870786953.b4-ty@oracle.com>
 <7c0af228-e098-5657-934e-d2bd2bff5ee3@linux.ibm.com>
In-Reply-To: <7c0af228-e098-5657-934e-d2bd2bff5ee3@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: A-wlCNd2dwlg_ZztWVp03uFf4pr96cTS
X-Proofpoint-ORIG-GUID: A-wlCNd2dwlg_ZztWVp03uFf4pr96cTS
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-23_03,2021-10-22_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110240002
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/23/21 22:54, Steffen Maier wrote:
> Hi Bart, hi Martin,
> 
> since Friday 2021-10-22 our CI reports errors with linux-next. It complains 
> about missing zfcp-lun resources (although that's a follow-on error). Machines 
> that have their root-fs on zfcp-attached SCSI disk(s) are stuck in boot. 
> Looking at user visible effects, I see zfcp-specific sysfs attributes of 
> scsi_device missing:
> 
> $ lszfcp -D
> /usr/sbin/lszfcp: line 390: 
> /sys/bus/ccw/drivers/zfcp/0.0.1780/host0/rport-0:0-0/target0:0:0/0:0:0:1089224725//hba_id: 
> No such file or directory

> That made me think of this patch series. It also happened so that Martin 
> applied the series to 5.16/scsi-queue on 2021-10-21. Linux-next merged it on 
> 2021-10-22:

> So this seems to match with the occurrence of problems for us.
> 
> I wonder if any of the other LLDDs see similar problems. I left those LLDD 
> patches in the list below, that also were migrated from sdev_attrs to sdev_groups.
> 
> Guess it would be good to fix this before the v5.16 merge window opens 
> (2021-11-08 after predicted v5.15 release? [http://phb-crystal-ball.org/]) so 
> the error does not land in Linus' tree (which our CI also tests).
> 
> Not sure if I'll find time to dig deeper.

v4.17 commit 86b87cde0b55 ("scsi: core: host template attribute groups")
introduced explicit sysfs_create_groups() in scsi_sysfs_add_sdev()
and sysfs_remove_groups() in __scsi_remove_device(), both for sdev_gendev,
based on a new field const struct attribute_group **sdev_groups
of struct scsi_host_template.

Commit 92c4b58b15c5 ("scsi: core: Register sysfs attributes earlier")
removed above explicit (de)registration of scsi_device attribute groups.
It also converted all scsi_device attributes and attribute_groups to
end up in a new field const struct attribute_group *gendev_attr_groups[6]
of struct scsi_device. However, that new field is not used anywhere.

I tried to fix it by assigning the pointer of that new field to the groups
field of sdev_gendev so the driver core gets our groups on devide_add().
Just like scsi_host_alloc() was changed by the same commit,
although scsi_host_alloc() already had assigned something to
shost_dev.groups so the necessary change was more obvious there.

However, that gave me:

> Oct 24 02:06:20 t3545002 kernel: scsi 1:0:2:1090207765: scsi scan: INQUIRY pass 1 length 36
> Oct 24 02:06:20 t3545002 kernel: scsi 1:0:2:1090207765: scsi scan: INQUIRY successful with code 0x0
> Oct 24 02:06:20 t3545002 kernel: scsi 1:0:2:1090207765: scsi scan: INQUIRY pass 2 length 164
> Oct 24 02:06:20 t3545002 kernel: scsi 1:0:2:1090207765: scsi scan: INQUIRY successful with code 0x0
> Oct 24 02:06:20 t3545002 kernel: scsi 1:0:2:1090207765: Direct-Access     IBM      2107900          2.19 PQ: 0 ANSI: 5
> Oct 24 02:06:20 t3545002 kernel: scsi 1:0:2:1090207765: alua: supports implicit TPGS
> Oct 24 02:06:20 t3545002 kernel: scsi 1:0:2:1090207765: alua: device naa.6005076309ffd43000000000000015fb port group 0 rel port 103
> Oct 24 02:06:20 t3545002 kernel: sysfs: cannot create duplicate filename '/devices/css0/0.0.0019/0.0.1880/host1/rport-1:0-2/target1:0:2/1:0:2:1090207765/device_blocked'
> Oct 24 02:06:20 t3545002 kernel: CPU: 1 PID: 1530 Comm: chzdev Not tainted 5.15.0-rc1sdevattr+ #29
> Oct 24 02:06:20 t3545002 kernel: Hardware name: IBM 8561 T01 703 (z/VM 7.2.0)
> Oct 24 02:06:20 t3545002 kernel: Call Trace:
> Oct 24 02:06:20 t3545002 kernel: [<00000000701c923e>] dump_stack_lvl+0x8e/0xc8 
> Oct 24 02:06:20 t3545002 kernel: [<000000006f991408>] sysfs_warn_dup+0x78/0x88 
> Oct 24 02:06:20 t3545002 kernel: [<000000006f990fb0>] sysfs_add_file_mode_ns+0x1c8/0x1e8 
> Oct 24 02:06:20 t3545002 kernel: [<000000006f991e3c>] create_files+0xb4/0x230 
> Oct 24 02:06:20 t3545002 kernel: [<000000006f992068>] internal_create_group+0xb0/0x1e8 
> Oct 24 02:06:20 t3545002 kernel: [<000000006f9928b0>] internal_create_groups.part.0+0x60/0xc8 
> Oct 24 02:06:20 t3545002 kernel: [<000000006fe807ca>] device_add_attrs+0x72/0x1d0 
> Oct 24 02:06:20 t3545002 kernel: [<000000006fe85168>] device_add+0x360/0x690 
> Oct 24 02:06:20 t3545002 kernel: [<000003ff801429b0>] scsi_sysfs_add_sdev+0x60/0x1a0 [scsi_mod] 
> Oct 24 02:06:20 t3545002 kernel: [<000003ff8013d870>] scsi_add_lun+0x3b0/0x5d0 [scsi_mod] 
> Oct 24 02:06:20 t3545002 kernel: [<000003ff8013e62c>] scsi_probe_and_add_lun+0x184/0x4a0 [scsi_mod] 
> Oct 24 02:06:20 t3545002 kernel: [<000003ff8013f4ec>] __scsi_scan_target+0x9c/0x240 [scsi_mod] 
> Oct 24 02:06:20 t3545002 kernel: [<000003ff8013f76a>] scsi_scan_target+0xda/0xf8 [scsi_mod] 
> Oct 24 02:06:20 t3545002 kernel: [<000003ff802d2a9c>] zfcp_unit_scsi_scan+0x6c/0x78 [zfcp] 
> Oct 24 02:06:20 t3545002 kernel: [<000003ff802d2e32>] zfcp_unit_add+0x1ea/0x220 [zfcp] 
> Oct 24 02:06:20 t3545002 kernel: [<000003ff802d0f3c>] zfcp_sysfs_unit_add_store+0x4c/0x70 [zfcp] 
> Oct 24 02:06:20 t3545002 kernel: [<000000006f98f946>] kernfs_fop_write_iter+0x13e/0x1e0 
> Oct 24 02:06:20 t3545002 kernel: [<000000006f899ff8>] new_sync_write+0x100/0x190 
> Oct 24 02:06:20 t3545002 kernel: [<000000006f89ced0>] vfs_write+0x230/0x2e0 
> Oct 24 02:06:20 t3545002 kernel: [<000000006f89d1ec>] ksys_write+0x6c/0xf8 
> Oct 24 02:06:20 t3545002 kernel: [<00000000701cc7ba>] __do_syscall+0x1c2/0x1f0 
> Oct 24 02:06:20 t3545002 kernel: [<00000000701df168>] system_call+0x78/0xa0 
> Oct 24 02:06:20 t3545002 kernel: 4 locks held by chzdev/1530:
> Oct 24 02:06:20 t3545002 kernel: #0: 0000000003711498 (sb_writers#3){.+.+}-{0:0}, at: ksys_write+0x6c/0xf8
> Oct 24 02:06:20 t3545002 kernel: #1: 000000000e77fa90 (&of->mutex){+.+.}-{3:3}, at: kernfs_fop_write_iter+0x102/0x1e0
> Oct 24 02:06:20 t3545002 kernel: #2: 0000000035754e10 (kn->active#83){++++}-{0:0}, at: kernfs_fop_write_iter+0x10e/0x1e0
> Oct 24 02:06:20 t3545002 kernel: #3: 0000000031bf90f0 (&shost->scan_mutex){+.+.}-{3:3}, at: scsi_scan_target+0x90/0xf8 [scsi_mod]
> Oct 24 02:06:20 t3545002 kernel: scsi 1:0:2:1090207765: failed to add device: -17

So I suspected that sdev_gendev is not a good idea and tried with its child 
sdev_dev instead. But now I'm back at square one with the attributes missing.

Where can I read about sdev_gendev vs. sdev_dev in a hopefully easy to 
understand way?

And how do we get to pass our scsi_device.gendev_attr_groups to the driver core 
to appear in sysfs?

> On 10/21/21 05:42, Martin K. Petersen wrote:
>> On Tue, 12 Oct 2021 16:35:12 -0700, Bart Van Assche wrote:
>>
>>> For certain user space software, e.g. udev, it is important that sysfs
>>> attributes are registered before the KOBJ_ADD uevent is emitted. Hence
>>> this patch series that removes the device_create_file() and
>>> sysfs_create_groups() calls from the SCSI core. Please consider this
>>> patch series for kernel v5.16.
>>>
>>> Thanks,
>>>
>>> [...]
>>
>> Applied to 5.16/scsi-queue, thanks!
>>
>> [01/46] scsi: core: Register sysfs attributes earlier
>>          https://git.kernel.org/mkp/scsi/c/92c4b58b15c5
>> [02/46] ata: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/c3f69c7f629f
>> [03/46] firewire: sbp2: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/5e88e67b6f3b
> 
>> [06/46] scsi: zfcp: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/d8d7cf3f7d07
> 
>> [10/46] scsi: 53c700: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/90cb6538b5da
>> [11/46] scsi: aacraid: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/bd16d71185c8
> 
>> [18/46] scsi: cxlflash: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/780c678912fb
> 
>> [21/46] scsi: hpsa: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/4cd16323b523
> 
>> [25/46] scsi: ipr: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/47d1e6ae0e1e
> 
>> [28/46] scsi: megaraid: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/09723bb252ca
>> [29/46] scsi: mpt3sas: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/1bb3ca27d2ca
> 
>> [31/46] scsi: myrb: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/582c0360db90
>> [32/46] scsi: myrs: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/087c3ace6337
> 
>> [42/46] scsi: smartpqi: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/64fc9015fbeb
> 
>> [45/46] scsi: usb: Switch to attribute groups
>>          https://git.kernel.org/mkp/scsi/c/01e570febaaa
>> [46/46] scsi: core: Remove two host template members that are no longer used
>>          https://git.kernel.org/mkp/scsi/c/a47c6b713e89
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
