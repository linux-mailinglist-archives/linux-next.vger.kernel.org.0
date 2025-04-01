Return-Path: <linux-next+bounces-6128-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0909DA774E6
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 09:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41D903AA202
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 07:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640271DEFE1;
	Tue,  1 Apr 2025 07:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qFxX2zRw"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4F61E47A8;
	Tue,  1 Apr 2025 07:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743490911; cv=none; b=lgFFsMICB7+9dF0A2kK8+jObuEOZEKNCebjZAUHVETzM9GKPqD3xLhmE4O+A4DDIQZm370m3CffOSIixoTzgWi35uoYNLDKkL1Cnz48pB/HFkoW6aeaQgKec0wf82xLSqv/Kokg2KdWJSwq2vPG9Ima/wNY/mHhucnjz/8ViSlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743490911; c=relaxed/simple;
	bh=Xyj9fy0t+j9yqXvpzxTBsevb37aXQjn4WdDr6SgaL1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TTJmJaSneL8kUmeSWFSpYT3OrguR7gkpB2DDd6+0qZl4e6OT9Tr6NHEmWQ5QjD8fGfM8o6U3MlSJhejti7wpQQ5+uEz+Agm+KMYEhVfHweq3b+ZAuC+15jBSc703CtMLcLQLN2/VTwu5B0XwtGXRQs5REHsg2oalMiQo3dYlEWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qFxX2zRw; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5310Ytdb007912;
	Tue, 1 Apr 2025 07:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=DZwEJ2
	EdSPqEmxgJ44h6Rc6DHX40NZXvgEZD3qSDd0g=; b=qFxX2zRwSgWQrAgXNbjs4m
	NZL3kqLo1HTyX50l7iNT/v1i+dPvPmTziJ7kGX+ov9xEqI+XBWNXpcqNwXl76xpN
	YkhtJ0QNdpUdY3OQLA7/d4G4trJ6qVeqXHD569YjnsgsXMfpc7LduioRCc/cgtbU
	wLMkRyhoROidqPHcXPgq3eq+/XIavbRp+ui2vsyyF/10O82zhdfec0Y8IPgP+nyb
	RC5W8ENGJaL4xBfpm73zuNOQRn6XXhxQIISABMmHUxTgwD4C9lm56dGu+1sHc1XG
	1oyhLsfrGzXMxa+qF30fSGrUqSGWYDC4kweGmIypSJJDyoU6GcbyDyG4/EPnPCPQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45qvfpuwd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 07:01:28 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5314HdhL009999;
	Tue, 1 Apr 2025 07:01:27 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45pv6nsakj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 07:01:27 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53171Q2Y53149962
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Apr 2025 07:01:26 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 71D965805D;
	Tue,  1 Apr 2025 07:01:26 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12BD758067;
	Tue,  1 Apr 2025 07:01:22 +0000 (GMT)
Received: from [9.204.204.161] (unknown [9.204.204.161])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Apr 2025 07:01:21 +0000 (GMT)
Message-ID: <4641ce2f-74eb-45ea-a2f8-c7d0db905b7a@linux.ibm.com>
Date: Tue, 1 Apr 2025 12:31:20 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
Content-Language: en-GB
To: Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Dave Jiang <dave.jiang@intel.com>,
        "Paul E. McKenney"
 <paulmck@kernel.org>, linux-cxl@vger.kernel.org,
        dave@stgolabs.net, jonathan.cameron@huawei.com,
        alison.schofield@intel.com, vishal.l.verma@intel.com,
        ira.weiny@intel.com, gourry@gourry.net, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, sfr@canb.auug.org.au,
        Madhavan Srinivasan <maddy@linux.ibm.com>
References: <f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop>
 <14bfcfa0-5999-49e4-854e-ff8810d6df3c@intel.com>
 <52a34c97-88d2-415e-a899-6583ae3ba620@paulmck-laptop>
 <30a7f782-4388-45b6-bb3c-a0faf85b7445@intel.com>
 <51e9823c-784c-4b91-99d4-0500aaf5cec0@paulmck-laptop>
 <67e7301dc8ad7_201f0294a5@dwillia2-xfh.jf.intel.com.notmuch>
 <1f48ba3b-9ba8-44e5-98c7-4c9abf95a935@intel.com>
 <20250331132439.GD10839@nvidia.com>
 <67eac8df3e217_201f02948d@dwillia2-xfh.jf.intel.com.notmuch>
 <20250331171755.GC289482@nvidia.com>
 <67eaf14b7c611_201f0294ba@dwillia2-xfh.jf.intel.com.notmuch>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <67eaf14b7c611_201f0294ba@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6XmQSx-ez0iC_pP1npL9XVksmZMGgIvy
X-Proofpoint-GUID: 6XmQSx-ez0iC_pP1npL9XVksmZMGgIvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1011 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010046


On 01/04/25 1:17 am, Dan Williams wrote:
> Jason Gunthorpe wrote:
>> On Mon, Mar 31, 2025 at 09:54:55AM -0700, Dan Williams wrote:
>>> Jason Gunthorpe wrote:
>>>> On Fri, Mar 28, 2025 at 05:26:42PM -0700, Dave Jiang wrote:
>>>>>> For now the following builds for me, but it is a quite a mess to undo
>>>>>> the assumption that that the hardware object definitions can not use
>>>>>> uuid_t:
>>>>> +Jason.
>>>> Seems invasive?
>>> Yeah, it left a bad taste for me as well.
>>>
>>>> Maybe just like below?
>>> I like that this avoids converting to the kernel's uuid API, however,
>>> not quite happy that it forces userspace to contend with the
>>> type-conflict with uuid/uuid.h.
>> Oh I see
>>   
>>> So how about one more riff on your idea?
>> Sure, works for me, please post it..
> b4 am supports scissors lines, so:
>
> b4 am -P _  67eac8df3e217_201f02948d@dwillia2-xfh.jf.intel.com.notmuch
>
> ...works for me. Do you still need a separate posting?
>

This issue got introduced in next-20250307 and got fixed in 
next-20250311(not sure what fixed).

But again got re-introduced in  next-20250318. I tried bisection, below 
are the logs.

One of the things I tried is to install the UUID packages on my set up 
and after installing those packages, issue is not seen.

rpm -qa | grep uuid

libuuid-2.37.4-20.el9.ppc64le
uuid-1.6.2-55.el9.ppc64le
uuid-c++-1.6.2-55.el9.ppc64le
uuid-dce-1.6.2-55.el9.ppc64le
uuid-devel-1.6.2-55.el9.ppc64le
uuidd-2.37.4-20.el9.ppc64le
libuuid-devel-2.37.4-20.el9.ppc64le

So wondering is this not a setup issue?  Please advice.


Bisect Log:

git bisect log
git bisect start
# status: waiting for both good and bad commits
# bad: [c4d4884b67802c41fd67399747165d65c770621a] Add linux-next 
specific files for 20250318
git bisect bad c4d4884b67802c41fd67399747165d65c770621a
# status: waiting for good commit(s), bad commit known
# good: [4701f33a10702d5fc577c32434eb62adde0a1ae1] Linux 6.14-rc7
git bisect good 4701f33a10702d5fc577c32434eb62adde0a1ae1
# good: [cda4d1b29991d4500e9f65c6936b5d3ccd99ecbb] Merge branch 
'spi-nor/next' of 
git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
git bisect good cda4d1b29991d4500e9f65c6936b5d3ccd99ecbb
# good: [9b22611592aa21d10f7d1b89352a618436dea7ac] Merge branch 'next' 
of git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
git bisect good 9b22611592aa21d10f7d1b89352a618436dea7ac
# good: [264791f7669a8246d129cbb935c861debba2f116] Merge branch 
'driver-core-next' of 
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
git bisect good 264791f7669a8246d129cbb935c861debba2f116
# good: [3c51cb2d6ec7cecf724cd5d78a0633f61f31e726] Merge branch 
'for-next' of 
git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
git bisect good 3c51cb2d6ec7cecf724cd5d78a0633f61f31e726
# good: [612481dbc16505cf5e940809ebf36d8460d174cf] Merge branch 'main' 
of git://git.infradead.org/users/willy/xarray.git
git bisect good 612481dbc16505cf5e940809ebf36d8460d174cf
# bad: [892715be4379deb333376e573113fd75672eca6c] Merge branch 
'rust-next' of https://github.com/Rust-for-Linux/linux.git
git bisect bad 892715be4379deb333376e573113fd75672eca6c
# bad: [b33f4167a8a2b9b9cc6b3e06f79b030db82cf530] Merge branch 'next' of 
git://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
git bisect bad b33f4167a8a2b9b9cc6b3e06f79b030db82cf530
# good: [3b5d43245f0a56390baaa670e1b6d898772266b3] Merge branch 
'for-6.15/features' into cxl-for-next
git bisect good 3b5d43245f0a56390baaa670e1b6d898772266b3
# good: [d11af4ae2169672b690a4d07a9dfdfd76c082683] Merge branch 
'for-next' of 
git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-auxdisplay.git
git bisect good d11af4ae2169672b690a4d07a9dfdfd76c082683
# bad: [5908f3ed6dc209e5c824e63afda7545805f75a7e] cxl: Add support to 
handle user feature commands for get feature
git bisect bad 5908f3ed6dc209e5c824e63afda7545805f75a7e
# good: [18285acc2c047cda2449f426c09fc8969b04b8b1] fwctl: Add documentation
git bisect good 18285acc2c047cda2449f426c09fc8969b04b8b1
# good: [15a26c223fff58d9fa4ada12a8c35697f8ecdf6c] Merge branch 
'for-6.15/features' into fwctl
git bisect good 15a26c223fff58d9fa4ada12a8c35697f8ecdf6c
# bad: [9b8e73cdb1418f7c251c43b2082218ed9c0d0fee] cxl: Move cxl feature 
command structs to user header
git bisect bad 9b8e73cdb1418f7c251c43b2082218ed9c0d0fee
# good: [858ce2f56b5253063f61f6b1c58a6dbf5d71da0b] cxl: Add FWCTL 
support to CXL
git bisect good 858ce2f56b5253063f61f6b1c58a6dbf5d71da0b
# first bad commit: [9b8e73cdb1418f7c251c43b2082218ed9c0d0fee] cxl: Move 
cxl feature command structs to user header

9b8e73cdb1418f7c251c43b2082218ed9c0d0fee is the first bad commit
commit 9b8e73cdb1418f7c251c43b2082218ed9c0d0fee
Author: Dave Jiang <dave.jiang@intel.com>
Date:  Fri Mar 7 13:55:32 2025 -0700

   cxl: Move cxl feature command structs to user header

   In preparation for cxl fwctl enabling, move data structures related to
   cxl feature commands to a user header file.

   Reviewed-by; Jonathan Cameron <Jonathan.Cameron@huawei.com>

   Link: 
https://patch.msgid.link/r/20250307205648.1021626-3-dave.jiang@intel.com
   Reviewed-by: Dan Williams <dan.j.williams@intel.com>
   Reviewed-by: Li Ming <ming.li@zohomail.com>
   Signed-off-by: Dave Jiang <dave.jiang@intel.com>
   Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

  include/cxl/features.h   | 112 +----------------------------
  include/uapi/cxl/features.h | 169 
++++++++++++++++++++++++++++++++++++++++++++
  2 files changed, 170 insertions(+), 111 deletions(-)
  create mode 100644 include/uapi/cxl/features.h


Regards,

Venkat.


