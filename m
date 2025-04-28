Return-Path: <linux-next+bounces-6405-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4B8A9E80E
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 08:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22DA316473F
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 06:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03B41BBBFD;
	Mon, 28 Apr 2025 06:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="tuMS6B9z"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091C28F77;
	Mon, 28 Apr 2025 06:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745820842; cv=none; b=dsmnD+CbbyfiJ2ER9OwKGX+nbBSmANkRPD+EK1qKEtO8TEheTkBiGcEm75suwWIokewa5yT6sXZ31fhkRQJGuKOUqGLBH8pW5es6c5lZ2WHipBCAglNekt+OIyhD0eb6l/MUIQJBbbnSkbQoyWGuc3Bmqs7hVpJ/+BX3o1os1x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745820842; c=relaxed/simple;
	bh=Jl1bKf+qQgVolMwnWqmPgRAHMMq0emPn8byhFiznNLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bjVD5HO1OLVqPl4jgqq9lbdyVC+EfYPNq/YRzebten/CEq98I2R0kGDvkPivvWd8hlT2FXmSykbCIHPvplS58NynypJfGqOLNYIqkdAaVsacG/9Toaj3FEIBAxd1mMz5jBCCjdB8RlxYfhjUhVyDJc7/eJC5288LrwagvjI+yoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=tuMS6B9z; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53RLe42x027532;
	Mon, 28 Apr 2025 06:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=1UywGs
	4iCOx0fuq/rbcL0VIfNn7u+J25m2Ol8HUPzzs=; b=tuMS6B9z3s/KDO8vT4bmth
	mzi/eRV/8VMy0dGNaYYxdaJF13DHkY8RmZofXJLu1YeLQViYxKjGXd0K06myb9Ob
	/BR79BvBncOy3+QrE5amuxsCgrfAfsriLO7cAuxAkWJpa7orSiF8Xf7WJft8HD9U
	Uy1GvvfrpQszZtTgKibKIkwulX8C4niXXKkuMXGc0CsUVZYKkbWJ4z9BYUd3znpT
	RF9qm+S//CYK0z96/dxZJjBmqzTk1nqKKgwhjgkb0eW97xw5MCNCb1H2LnO0hf3b
	kqTrK3cpqMH0F8ATCpgQ5hLtYbSzurvkIHuPDEJOyjME/QlQrIddduptB+zAYPuQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 469vp8hefe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 06:13:33 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53S4A3Kd024644;
	Mon, 28 Apr 2025 06:13:32 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 469c1kvtmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 06:13:32 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53S6DWkd13959682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 06:13:32 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F0515805A;
	Mon, 28 Apr 2025 06:13:32 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D78F158056;
	Mon, 28 Apr 2025 06:13:28 +0000 (GMT)
Received: from [9.204.204.179] (unknown [9.204.204.179])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Apr 2025 06:13:28 +0000 (GMT)
Message-ID: <1aac242c-2d9f-46e6-8c1c-88822c97bfeb@linux.ibm.com>
Date: Mon, 28 Apr 2025 11:43:27 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next]Build Failure: kernel/watchdog.c:936:2: error: too
 many arguments
Content-Language: en-GB
To: Stephen Rothwell <sfr@canb.auug.org.au>, luogengkun@huaweicloud.com,
        Andrew Morton <akpm@linux-foundation.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        dianders@chromium.org, joel.granados@kernel.org, song@kernel.org,
        Thomas Gleixner <tglx@linutronix.de>
References: <339e2b3e-c7ee-418f-a84c-9c6360dc570b@linux.ibm.com>
 <20250428084117.31215b8c@canb.auug.org.au>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250428084117.31215b8c@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA1MCBTYWx0ZWRfX/Wdv1rGYGlBR Fgo0EU9Swu26oq/T4tQ8Lcp8Gv1QCURlGbdNOzHDv6uKf60gyeNBhu3ElyLhyJe0kolLi1egwSp fLtTXQOpiWfqgqRDpHZqdKwTHTWtIhdgF8EmV3mgln3LkESqkeIgM40StvZwVrdnv1ylDXdhVSA
 6PxWJ1fzDsWxb07G3UlRz5Fc+TrEPsrukhWbiU4n3XLT40DO2mgMnbZuXSD1cKBR6GZsTgE8QqK xzMHn0vp8zH/MuLnrY7HzfEn7LFWb6X014+9VNjZrZ6Wl13Zd3V04RWcwtu9qpm1RM8Pi7g57d2 aIOAL/XTvrEdhRApG971Fk7tcF1Zsw6H+61zdWcEKfxO8gvcOvIaQ1Q+ogZ3xQM3j5tYiQZRApP
 6EfMdqUXr25Gaw+ThdV252Cn2kNBhPewBVRGjM4ntTKMo+UQ0sxWCeniRuR2Q0jZHTEC2oJ6
X-Proofpoint-ORIG-GUID: cNvFujItDPuYrtgQZAFE1VQmfDgze5Qh
X-Authority-Analysis: v=2.4 cv=R80DGcRX c=1 sm=1 tr=0 ts=680f1c8d cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=flcYxCUImN8H2Fr_exYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: cNvFujItDPuYrtgQZAFE1VQmfDgze5Qh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280050


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
>
> This is now commit
>
>    45c4eb661074 ("watchdog: fix watchdog may detect false positive of softlockup")
>
> in the mm-nonmm-unstable tree.

Thanks Stephen for pointing me to this commit.


Regards,

Venkat.


