Return-Path: <linux-next+bounces-9070-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C270C67C39
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 07:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0EF2435FAA2
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 06:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13B82EC0B5;
	Tue, 18 Nov 2025 06:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="A+dVusqW"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB3C2749DF;
	Tue, 18 Nov 2025 06:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763448323; cv=none; b=Hs3913oLC8W2mRau6VRqGA4JevydCu/t+UlLs06u9VzqAF7M034ORoTDkXXcoNCIS8CNlt8eWfB0Bgb6b17hwaNLNNBFR6aBlWzTyTL4ilpMXOViKddOf2Hr++n6LX3iUslGR+kH0s6E+nK0Uu1QmzzHMYhRt1czxlZsKld9HJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763448323; c=relaxed/simple;
	bh=W7WdHMfpsJwIhGwfTrMs03wdO4HJGEZiOmPu+0XISc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=ZUiHGAFvDXHTdtGKrQ5bjsrDwUctV/M0ZtqPZC+W478S/fU0JsaowDp7KUJh5Ht2Ub/GK5axZF0fq949zPgP5+nrG3YvBKoPu2j0VsCR2RSRgIh3oXOgy8kZj/R+lH0coC623GQxQNmLzolCd5q+CtRQftf61kg+ZuY1t+ah2HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=A+dVusqW; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AI5LJWF028142;
	Tue, 18 Nov 2025 06:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=NJ5a2t
	H6kpfzkP6X0YT73Gga6Uv+ViX+H/JuyMLpr24=; b=A+dVusqWffu6a/GOQpSJ04
	NN7YVJpU/QGUx8MRAkndhiXbeLwH4AN+bl+sDbf96+tUaTMKxMVuqV5/ea1h9UZ4
	yi2qEX6CORHCTusM32L692Pv+jmuHZkiV4OuvKQtuxDnJyLlBxbD7PwI3PeF5D/a
	DqIh8cjdQmZmdnosBuRwKh6238TjXRVnjqKIQMXjOttYS7ZXe60yyeKSAaQgWyvM
	4t4AdAghOAa1OiD6Xn75VcIy7FHx/QEhWaNZ3bBK0nody72CxwzEZlt1ONs/IAKL
	4El9Re9pcq7q0Ru1EVTeeqtGIwUtPWmV003P5AFw0X5Qpa7rWcSkjZxhG3FeetTg
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjts81d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 06:44:55 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AI50GuR017318;
	Tue, 18 Nov 2025 06:44:54 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af6j1hfyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 06:44:54 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AI6ioJE42598744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Nov 2025 06:44:50 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 92AD720043;
	Tue, 18 Nov 2025 06:44:50 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 328D720040;
	Tue, 18 Nov 2025 06:44:49 +0000 (GMT)
Received: from [9.124.214.85] (unknown [9.124.214.85])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Nov 2025 06:44:49 +0000 (GMT)
Message-ID: <c28f975f-30a7-4042-8e6b-588e8f9746fa@linux.ibm.com>
Date: Tue, 18 Nov 2025 12:14:48 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next20251118] BUG: Kernel NULL pointer dereference
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
References: <5ef3eb20-d1db-41d0-83cf-4a78439e4a3c@linux.ibm.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Ingo Molnar <mingo@kernel.org>
In-Reply-To: <5ef3eb20-d1db-41d0-83cf-4a78439e4a3c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zeqmLfOB9fiwk1QrTzaGmS8zCpyfUJI6
X-Proofpoint-ORIG-GUID: zeqmLfOB9fiwk1QrTzaGmS8zCpyfUJI6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXwXyyz/PVJg5Q
 aLzAG0lP1jH/YspVNO07j3lbmUMr1vBzbq1d3KTmuBc1mVSKMvcuOxjzEpepHu76L2kB84Y0DrL
 +mzNrePYOOYGWFQ0yEISOCgud72UBfMMruub28RfOIb2/xBbHRnTDhamCRlzVVqvIF/bn0lKzzF
 IMKjNXb1Nj4CMEOytYnCt90WNDru3Z0+e9hJEozcONfdvSP8Lgm4SqvEcdHLevI3NhijfWErpE5
 kbDMQJGDE5oGNbPdITngOjgPwJfDuFowHRhO+8EdLa4qV+n57lqExF2AG+TMKwp+A5Fti5Jk8RU
 fwuQywF0m8F7Pf9BPtXLhYLLmc23oytSA2bxWsHHK8f/PBXuiID8Ygb5z1EGnc0sLBd4mRG+PuT
 WhKWxg7+kKPJjc6qH91lZQboP03R+Q==
X-Authority-Analysis: v=2.4 cv=SvOdKfO0 c=1 sm=1 tr=0 ts=691c15e7 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=bb4p-YTHEgrGTQ8LCFsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1011
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032



On 11/18/25 12:10 PM, Venkat Rao Bagalkote wrote:
> Greetings!!
> 
> 
> IBM CI has reported a boot crash while booting with linux-next2025118 
> kernel.
> 
> 
> Traces:
> 
> 
> [    0.116026] audit: type=2000 audit(1763602256.110:1): 
> state=initialized audit_enabled=0 res=1
> [    0.116282] thermal_sys: Registered thermal governor 'fair_share'
> [    0.116284] thermal_sys: Registered thermal governor 'step_wise'
> [    0.120228] BUG: Kernel NULL pointer dereference at 0x00000000
> [    0.120236] Faulting instruction address: 0xc0000000002b08a4
> [    0.120241] Oops: Kernel access of bad area, sig: 11 [#3]
> [    0.120245] LE PAGE_SIZE=64K MMU=Hash  SMP NR_CPUS=8192 NUMA pSeries
> [    0.120252] Modules linked in:
> [    0.120257] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G   D       
>   6.18.0-rc6-next-20251118 #1 VOLUNTARY
> [    0.120265] Tainted: [D]=DIE
> [    0.120268] Hardware name: IBM,8375-42A POWER9 (architected) 0x4e0202 
> 0xf000005 of:IBM,FW950.80 (VL950_131) hv:phyp pSeries
> [    0.120273] NIP:  c0000000002b08a4 LR: c0000000002b04a4 CTR: 
> 0000000000000000
> [    0.120278] REGS: c0000009fffffaa0 TRAP: 0380   Tainted: G D     
> (6.18.0-rc6-next-20251118)
> [    0.120284] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
> 48002828  XER: 20040006
> [    0.120296] CFAR: c0000000002b04bc IRQMASK: 0
> [    0.120296] GPR00: c0000000002b04a4 c0000009fffffd40 c000000001e58100 
> 0000000000000001
> [    0.120296] GPR04: c000000002d68100 0000000000000007 0000000000000000 
> 0000000000000001
> [    0.120296] GPR08: c000000005331e78 0000000000000400 c000000002d68100 
> 0000000000000000
> [    0.120296] GPR12: 0000000000000000 c000000002f90000 0000000000000000 
> c0000009fffffe94
> [    0.120296] GPR16: 0000000000000000 c000000002cadb00 0000000000000000 
> c000000003675e00
> [    0.120296] GPR20: 0000000000000000 0000000000000000 0000000000000001 
> 00000000ffff8add
> [    0.120296] GPR24: 0000000000000001 c00000000cacaa00 c000000002c72b00 
> 0000000000000000
> [    0.120296] GPR28: c0000009fffffdb8 0000000000000000 c0000009e941b800 
> c0000009e941b800
> [    0.120353] NIP [c0000000002b08a4] sched_balance_rq+0x504/0x8b0
> [    0.120361] LR [c0000000002b04a4] sched_balance_rq+0x104/0x8b0


This should be fixed by this.
https://lore.kernel.org/lkml/176339661932.498.15491008222212450109.tip-bot2@tip-bot2/

Can you rebase tip/sched/core to latest and try?

