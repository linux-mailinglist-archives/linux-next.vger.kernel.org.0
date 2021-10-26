Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E734B43AFA6
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 12:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235174AbhJZKDY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 06:03:24 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38164 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234523AbhJZKDR (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Oct 2021 06:03:17 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19Q8o7gf007203;
        Tue, 26 Oct 2021 10:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to : sender :
 content-transfer-encoding : mime-version; s=pp1;
 bh=kCLjwJNz/9j4kibMotrYLNkEFO6mORC07ogDQFFB4zg=;
 b=mPc62hFWJgWzl5WOe40cUpNsGtHQHO1BrR4JlJz2HWRdLfEOTcn+qCp0duhMpnImCUsn
 GTXliHRZjf4yl17JBYcuuf1vPkzhzdhzB/NvuyCdhrqrBeKhzFo8H37qQfxNICfnDROO
 7JhQ3yC//8OCLiPnGh7NxvLPgPEdr55aBSXM7oZkkX4VC67RWwowPrZUrMQWwp34OjIr
 LpZ/tQolnhXV5RXLIl5q798PJzDCrStnGC5o+nHb2897+cNfvT63GhAbXYkz2pFcaRLR
 WYDzelUuOSndlE8EmYbHJYCDA09TnYfd7fd/pWTFhXcP8GeAzwdlw+u94SJffFMwEvgf mQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3bx4k2gh0a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Oct 2021 10:00:37 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
        by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19Q9rpVG012137;
        Tue, 26 Oct 2021 10:00:35 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
        by ppma06fra.de.ibm.com with ESMTP id 3bx4ehkt7e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Oct 2021 10:00:34 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 19QA0Vam58393084
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Oct 2021 10:00:31 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id AF89311C064;
        Tue, 26 Oct 2021 10:00:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A664D11C06E;
        Tue, 26 Oct 2021 10:00:31 +0000 (GMT)
Received: from t480-pf1aa2c2 (unknown [9.145.156.133])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 26 Oct 2021 10:00:31 +0000 (GMT)
Received: from bblock by t480-pf1aa2c2 with local (Exim 4.94.2)
        (envelope-from <bblock@linux.ibm.com>)
        id 1mfJFv-000w2x-2q; Tue, 26 Oct 2021 12:00:31 +0200
Date:   Tue, 26 Oct 2021 12:00:31 +0200
From:   Benjamin Block <bblock@linux.ibm.com>
To:     Steffen Maier <maier@linux.ibm.com>, bvanassche@acm.org
Cc:     jwi@linux.ibm.com, martin.petersen@oracle.com, jejb@linux.ibm.com,
        linux-scsi@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-next@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v3] scsi: core: Fix early registration of sysfs
 attributes for scsi_device
Message-ID: <YXfRvxKu/xXVubF8@t480-pf1aa2c2.linux.ibm.com>
References: <2f5e5d18-7ba9-10f6-1855-84546172b473@linux.ibm.com>
 <20211026014240.4098365-1-maier@linux.ibm.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20211026014240.4098365-1-maier@linux.ibm.com>
Sender: Benjamin Block <bblock@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pGTS_-CuMXCH0gfalXKAQ7zMg37iVfea
X-Proofpoint-ORIG-GUID: pGTS_-CuMXCH0gfalXKAQ7zMg37iVfea
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_02,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110260053
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

Oh.. damn, I didn't notice either.

> 
> Surprisingly, this only caused missing LLDD specific scsi_device sysfs
> attributes. Whereas, scsi core attributes from scsi_sdev_attr_groups
> did continue to exist because of scsi_dev_type.groups.

Hmm, maybe this is out of scope for this fix, but couldn't we
essentially do the same thing for the host attributes. Have the
`shost_class` take the `scsi_shost_attr_group` as default attributes for
the shost class, and then assign the `shost_groups` from the LLDD
template to `shost_dev.groups` as optional attributes? 

Then we get rid of the indirection loop in `hosts.c` as well, that was
introduce with he original patch by Bart.

Just a shot in the dark, I don't know whether the `struct class` behaves
the same in this case as `struct device_type`.

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

-- 
Best Regards, Benjamin Block  / Linux on IBM Z Kernel Development / IBM Systems
IBM Deutschland Research & Development GmbH    /    https://www.ibm.com/privacy
Vorsitz. AufsR.: Gregor Pillen         /        Geschäftsführung: Dirk Wittkopp
Sitz der Gesellschaft: Böblingen / Registergericht: AmtsG Stuttgart, HRB 243294
