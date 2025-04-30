Return-Path: <linux-next+bounces-6450-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0296AA4317
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 08:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 125094C259A
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 06:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241D41E5B7A;
	Wed, 30 Apr 2025 06:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="YTdqY5xz"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2B61BD9D3;
	Wed, 30 Apr 2025 06:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745994478; cv=none; b=hSbQTWmPZ4T8fpmrbvkxMULsei8t39Fl4N0uHYLD4IntjF5AI5DdsqTJKdv8z71mO7IOKck1aYT5np3qn/5hLI3p3srsnqtrShFI3Hdasq6uDChJhastjfeCryFfK4wJoyTmWcOQjisndZoOOa6AWi4lapOMZgrqzskEGYfiA9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745994478; c=relaxed/simple;
	bh=9xLnkVVuPU4cJNsZgsMdEOkOHPFGVy9pfaGGnE2G7Ck=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PdcY5dtz04mXBwnR0W+UttyfN9PvdXxbG8q89hNp7vC1NPxaV+l4tHRKxXQ99ZrjEri5GC0siBbVrlzowl/3I5KY2MCM+pVJYeV+17eLwLZ7iC1HRug/B9CvQP+2pWH32nzzxWlt76WKvGkz1+FrrS04ppOiGfiwn+kCr13j27E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=YTdqY5xz; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLc7sl016556;
	Wed, 30 Apr 2025 06:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=owqRKj
	YUV8ODqQZRc7A2CXHmnHz+pAhBNwwk/L5Gaf4=; b=YTdqY5xzIdUetOB4nAq/IJ
	1rPlpHhXzS7FaVI5TIQBKdiKHWAavUKPsEHxBdmaoUW5VkRAGiqibQOhsYcmni9G
	4POhpUSd6rTw+HsV2D9SkZV1xpPohwHf29HMvRknPnSpjNdzGPSVQ4kWQyUVda3V
	WuSfRUzmIxAM5mOwsgofHiy3Fzf6F8b6PQjEhSoK7U4fRSUNs2fpWgfl4zbXGp+b
	l5pcCq3e92dqrkKCHupyzf7/3zdQ9twmu2nFjIuj3VW8ZDKHes7pVZxG1REr+5/s
	hc05yLJqcbpGq32D9rM5Lq6YNasWHut5JuXpYIySEmTl4xmjGnXV7/3xvsLR4B8Q
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46b6uphgpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 06:27:19 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53U3U6aQ001893;
	Wed, 30 Apr 2025 06:27:18 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469bampkcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 06:27:18 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53U6RHer31195778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 06:27:17 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 473195805C;
	Wed, 30 Apr 2025 06:27:17 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D41E58058;
	Wed, 30 Apr 2025 06:27:14 +0000 (GMT)
Received: from [9.61.255.15] (unknown [9.61.255.15])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Apr 2025 06:27:14 +0000 (GMT)
Message-ID: <562a79d1-e8a4-4d8f-a576-47c017aadf93@linux.ibm.com>
Date: Wed, 30 Apr 2025 11:57:12 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next]Build Failure: kernel/watchdog.c:936:2: error: too
 many arguments
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, luogengkun@huaweicloud.com,
        Andrew Morton <akpm@linux-foundation.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        dianders@chromium.org, joel.granados@kernel.org, song@kernel.org,
        Thomas Gleixner <tglx@linutronix.de>
References: <339e2b3e-c7ee-418f-a84c-9c6360dc570b@linux.ibm.com>
 <20250428084117.31215b8c@canb.auug.org.au>
 <33aabaae-5789-4b67-bd06-06b79d03ea38@linux.ibm.com>
Content-Language: en-GB
In-Reply-To: <33aabaae-5789-4b67-bd06-06b79d03ea38@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=IqQecK/g c=1 sm=1 tr=0 ts=6811c2c7 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Dc_VTNDoBUFHScTmsKMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: EWBJLxJ1VR9J5isIcIK1I8etVbMBNCgT
X-Proofpoint-GUID: EWBJLxJ1VR9J5isIcIK1I8etVbMBNCgT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA0MSBTYWx0ZWRfX8sfSbPR6H1ey FeeKgcmua5Lu+z85byeUDJ/u/hAt7Up0jmjw1FWpZ9AG8DxRIhRsr/nkbZ1Kkgu9t6EoIFKVIMV vGCxAdDi/slBwmQvJMwUI9MBGbpJ9y8XPzeYFH1CxmbyMd2L1LR60tqgyx6pVWvhhCFwgFq4jGS
 LpgG/HxrJwhcnhLTIehaPxjEBzv64slxCVZUhxVXt9WLLAUTgkU9kLQezqWPF8JYnORfhb9f5Q+ e/SeLGxKIl4QitXWWdaL4w6CziPtllIbNerMlpmko8y98Ixo86Gg7Z7K8CZ1+xHxIyeiFkTnuwu Inq1gCmJVPCNfatR9LgsGpcTs03K2rVpjPvQR2J2w5ZowvjT3n5q8Rm6Pmg3R8lMm8tlwYqbjQN
 OjbPWOFXeRiuOQXmpktp+KHLACvWZ6u2kcGMGPwhsYR8glZYX1BJhagI8NEy/35O0UPTcYmB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300041


On 28/04/25 3:11 pm, Venkat Rao Bagalkote wrote:
>
> On 28/04/25 4:11 am, Stephen Rothwell wrote:
>> Hi all,
>>
>> On Sat, 26 Apr 2025 20:39:26 +0530 Venkat Rao Bagalkote 
>> <venkat88@linux.ibm.com> wrote:
>>> I am observing below build failure on IBM Power8 server with 
>>> linux-next-20250424 repo.
>>>
>>> This issue seems to be introduced by the below commit. After 
>>> reverting the below commit, kernel build is successful.
>>>
>>> Bad Commit: 6b07f9a0fa41 watchdog: fix watchdog may detect false 
>>> positive of softlockup
>>>
>>> Note: To hit this issue, one should first resolve this [1] 
>>> <https://lore.kernel.org/all/e8bf676e-7bf0-4896-b104-ac75e1b22d2e@linux.ibm.com/>
>>>
>>> Repo: 
>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>> Branch: master
>>> GCC: 8.5.0 20210514
>>> ldd (GNU libc) 2.28
>>>
>>> Attached is the .config file.
>>>
>>> Errors:
>>>
>>> kernel/watchdog.c: In function 'lockup_detector_reconfigure':
>>> kernel/watchdog.c:936:2: error: too many arguments to function 
>>> '__lockup_detector_reconfigure'
>>>     __lockup_detector_reconfigure(false);
>>>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> kernel/watchdog.c:926:13: note: declared here
>>>    static void __lockup_detector_reconfigure(void)
>>>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> kernel/watchdog.c: In function 'lockup_detector_setup':
>>> kernel/watchdog.c:940:2: error: too many arguments to function 
>>> '__lockup_detector_reconfigure'
>>>     __lockup_detector_reconfigure(false);
>>>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> kernel/watchdog.c:926:13: note: declared here
>>>    static void __lockup_detector_reconfigure(void)
>>>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> kernel/watchdog.c: In function 'proc_watchdog_update':
>>> kernel/watchdog.c:962:2: error: too many arguments to function 
>>> '__lockup_detector_reconfigure'
>>>     __lockup_detector_reconfigure(thresh_changed);
>>>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> kernel/watchdog.c:926:13: note: declared here
>>>    static void __lockup_detector_reconfigure(void)
>>>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> If you happen to fix this, please add below tag.
>>>
>>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>> Yeah, the CONFIG_SOFTLOCKUP_DETECTOR unset version of
>> __lockup_detector_reconfigure() was not updated :-(
>

Hello Stephen,


Will this be fixed, or from now on we will have to set the 
SOFTLOCKUP_DETECTOR always in the .config file.


Trying to understand the way forward.


Regards,

Venkat.

>
> After seeting CONFIG_SOFTLOCKUP_DETECTOR kernel build is successful.
>
>
> Regards,
>
> Venkat.
>
>>
>> This is now commit
>>
>>    45c4eb661074 ("watchdog: fix watchdog may detect false positive of 
>> softlockup")
>>
>> in the mm-nonmm-unstable tree.
>>

