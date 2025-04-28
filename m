Return-Path: <linux-next+bounces-6412-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA43AA9ED24
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 11:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AC9E18837DB
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 09:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F057263F4E;
	Mon, 28 Apr 2025 09:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oOsatzxp"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F15263F44;
	Mon, 28 Apr 2025 09:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745833297; cv=none; b=X/Yb3FDk2KCLJUPHDYQqe/dzgjBnnCfvG/DLUbew3UOeArpUlb0Kct2M/Qd021f3Un+aPaLUkcHEjirv1pVLyjEBbYp1XPiw+UkhLWzgqpFhEDY7qF4hg5fe8VTSy/3qFwZwinRcART7N2cnPiWp3iVWn1JxH709e2iQP/uDfuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745833297; c=relaxed/simple;
	bh=I3UZ8yw9vctYavrl+mnunAivPdDwRdaT/Lu3gz+ndk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g2hfFlRci4dw07ESbKNqdmLtHuUKnvJAPBbW5d2WpUgqAvuLVMzFxodlYiQ6sWGm+YNsemAmHoo6IzVs+qGQFeLxjxw0t9eGrmm9ni6S58odWDZroPn3mz0SZzzVLHBAMAPRNxA6QbziV595QzhguoRICl/J7mlrfjcCYNETcgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oOsatzxp; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53RLfGHd016501;
	Mon, 28 Apr 2025 09:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ovzO73
	6OqnS+DHkXDt/EEWkOgm2AQbagVbjGOAgfd9g=; b=oOsatzxpfe1nPkI+K09CTI
	H8zPnqeKwRCu7HxcTjNHv2fIlxp5t8dbo3BJA8uvWvnCYQ719Ityx/rKMAZMbFv4
	QCGklMzhPiu/FYkzqLCa9YPpicb3xSrn36Bv6UcMZL4HCtwT4e8ypCzl0hIEVhhK
	Nv86ZEVSIFI5WkNqVtKGB6tuLblbNYv/bTMCuai1p9hfIGBlP9t5bmg+ESULvmCG
	FrxTP5Li4dK4tivrbDZpLAGN0BhceHqfV4QcI0eod15Jc4Esfx4SwiWc6xiKRFUK
	41mhujdymSm6l3Sws5k248NgLEFzpjAeWYpqvepqwxhRJKsX0ug0GYqf0avk/V/A
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 469v5kjeb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:41:12 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53S781Mq000666;
	Mon, 28 Apr 2025 09:41:11 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469atp5t6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:41:11 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53S9fAvr3801752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 09:41:10 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 909C458065;
	Mon, 28 Apr 2025 09:41:10 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 578365805E;
	Mon, 28 Apr 2025 09:41:07 +0000 (GMT)
Received: from [9.204.204.179] (unknown [9.204.204.179])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Apr 2025 09:41:07 +0000 (GMT)
Message-ID: <33aabaae-5789-4b67-bd06-06b79d03ea38@linux.ibm.com>
Date: Mon, 28 Apr 2025 15:11:06 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next]Build Failure: kernel/watchdog.c:936:2: error: too
 many arguments
To: Stephen Rothwell <sfr@canb.auug.org.au>, luogengkun@huaweicloud.com,
        Andrew Morton <akpm@linux-foundation.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        dianders@chromium.org, joel.granados@kernel.org, song@kernel.org,
        Thomas Gleixner <tglx@linutronix.de>
References: <339e2b3e-c7ee-418f-a84c-9c6360dc570b@linux.ibm.com>
 <20250428084117.31215b8c@canb.auug.org.au>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250428084117.31215b8c@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3Jd9e6VET3uap56e_FWsM-TE4J19HF5S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3OSBTYWx0ZWRfX97bQxrdDGmPs CH56xF21WsOd2HwKoWc1Imw4QMCD9KBXhCLYtDUPr6HX5+hACWVaL3IpWt9URdKr8dC+sIcysVG VJoYF9kSxK7h1uNfVGOABkfO8YCNai47SPOy8FUn9CCKnZvDPjf9lq9fbI61C82cx53AZdom14m
 Ib+ucM8k9V61BWwoxHmbhsNXf2QV7pzjuY6Ye6pemi6Rm6Dk8iTMJLVnccgMrMi44kZaxWlurA5 CnPHVBlH8bcLx7XEU8AHCi+/J7o7VKHWvCW2o0nnIkqShj5FsXZnjCd05aIDR36EqoBbP7xzC4b X3LIz+ySs4DT67D1YsB68L96kLhFf0WQGuxgbpMq4cbuNNqBUl3ZbAb2/MDZ+RVxs7k4iyiGS8D
 th02ypM9qY6cUYHigZJ3oo0WhgIz5RGAzgqka5NpnPAlHq4rtIdiJ6tfeMziq9cMrFN4k+Q2
X-Proofpoint-GUID: 3Jd9e6VET3uap56e_FWsM-TE4J19HF5S
X-Authority-Analysis: v=2.4 cv=DvxW+H/+ c=1 sm=1 tr=0 ts=680f4d38 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=flcYxCUImN8H2Fr_exYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280079


On 28/04/25 4:11 am, Stephen Rothwell wrote:
> Hi all,
>
> On Sat, 26 Apr 2025 20:39:26 +0530 Venkat Rao Bagalkote <venkat88@linux.ibm.com> wrote:
>> I am observing below build failure on IBM Power8 server with linux-next-20250424 repo.
>>
>> This issue seems to be introduced by the below commit. After reverting the below commit, kernel build is successful.
>>
>> Bad Commit: 6b07f9a0fa41 watchdog: fix watchdog may detect false positive of softlockup
>>
>> Note: To hit this issue, one should first resolve this [1] <https://lore.kernel.org/all/e8bf676e-7bf0-4896-b104-ac75e1b22d2e@linux.ibm.com/>
>>
>> Repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> Branch: master
>> GCC: 8.5.0 20210514
>> ldd (GNU libc) 2.28
>>
>> Attached is the .config file.
>>
>> Errors:
>>
>> kernel/watchdog.c: In function 'lockup_detector_reconfigure':
>> kernel/watchdog.c:936:2: error: too many arguments to function '__lockup_detector_reconfigure'
>>     __lockup_detector_reconfigure(false);
>>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/watchdog.c:926:13: note: declared here
>>    static void __lockup_detector_reconfigure(void)
>>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/watchdog.c: In function 'lockup_detector_setup':
>> kernel/watchdog.c:940:2: error: too many arguments to function '__lockup_detector_reconfigure'
>>     __lockup_detector_reconfigure(false);
>>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/watchdog.c:926:13: note: declared here
>>    static void __lockup_detector_reconfigure(void)
>>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/watchdog.c: In function 'proc_watchdog_update':
>> kernel/watchdog.c:962:2: error: too many arguments to function '__lockup_detector_reconfigure'
>>     __lockup_detector_reconfigure(thresh_changed);
>>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/watchdog.c:926:13: note: declared here
>>    static void __lockup_detector_reconfigure(void)
>>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> If you happen to fix this, please add below tag.
>>
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Yeah, the CONFIG_SOFTLOCKUP_DETECTOR unset version of
> __lockup_detector_reconfigure() was not updated :-(


After seeting CONFIG_SOFTLOCKUP_DETECTOR kernel build is successful.


Regards,

Venkat.

>
> This is now commit
>
>    45c4eb661074 ("watchdog: fix watchdog may detect false positive of softlockup")
>
> in the mm-nonmm-unstable tree.
>

