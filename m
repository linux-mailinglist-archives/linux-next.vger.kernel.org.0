Return-Path: <linux-next+bounces-6352-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 671B5A97EEC
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 08:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99283188A22D
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 06:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAAB264638;
	Wed, 23 Apr 2025 06:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="lUKsdd6T"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616FF21764B;
	Wed, 23 Apr 2025 06:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388758; cv=none; b=FPi32lGEKRZ2bOTcb5xobH05m458Zw6D/xI8qWaL8CcInURvNHGN2zt1xER8+mR6R+PSDwCNm8pTBYjbmAsPIHrnFEwqYLI3bWq7DNBwxVgKG4i0KhVBg71mFfMAH6xyArHU3I1Sn+u6/IBcwaEPNfeQ4LeewQehw32suh0LEW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388758; c=relaxed/simple;
	bh=6mFTJEya+mwQDbkqHoYpPXOdLh43vCofDRRAF0PpiX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LtSn2NcP61RAm43hYXwctNMF3Zpq7ZA7yLTLuWY2D4+XsC44QYyHQwj/ePFtgFq4yR88EIMrZIE6zx4Brx/A1FraNHesX1uniRuJfQthtgvuZKhnOVBtJPi6O/ioaaL0mfaEAMbz8QJGGvqZ3KLWrIaPn2Wjk6ws1Rfry7GlA7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=lUKsdd6T; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N1iEUU028167;
	Wed, 23 Apr 2025 06:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6mFTJE
	ya+mwQDbkqHoYpPXOdLh43vCofDRRAF0PpiX0=; b=lUKsdd6Tq/YdoTWErvDl4E
	6XpvbMOOH1R2uEGQMmcXfqlHyCiyRf6MpE2HZNFYufVPF9irK5QgF7JmIL1mdJ5J
	k4g+pSm3YS+YjcQIXKVbRa+Lwk7cWeKJ/N0Z6v2fjaoI0MnluC7Hr3c0XxhOTSCQ
	C0X7ryy8Z84mSswDzEP2HZhdmAU4p8P5M8S2SC9sphJklWOL2eOAPDLWRmHG1APt
	LIrXIRdCUIWAFtMK3bVTg89SL2nsmUNfyg1IuESoXjZkpcdAYighlSc2c3FGD4u7
	rM6Ke5ZKLhctGzThSXOY39XTkSpaNs/RIwA1Hsmk4TOed2ssTWcPuTe3xdGzM85A
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 466psnrstj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 06:12:25 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53N1U7ft004072;
	Wed, 23 Apr 2025 06:12:25 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 466jfysp64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 06:12:25 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53N6CLcY23331386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 06:12:21 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BAD45805A;
	Wed, 23 Apr 2025 06:12:24 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E227358056;
	Wed, 23 Apr 2025 06:12:21 +0000 (GMT)
Received: from [9.204.204.179] (unknown [9.204.204.179])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Apr 2025 06:12:21 +0000 (GMT)
Message-ID: <4850a1c9-7aff-4686-aefd-3a2c8d3e7539@linux.ibm.com>
Date: Wed, 23 Apr 2025 11:42:20 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: runtime warning after merge of the mm-unstable tree
Content-Language: en-GB
To: Steven Rostedt <rostedt@goodmis.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>, venkat88@linux.ibm.com
Cc: Libo Chen <libo.chen@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        venkat88@linux.ibm.com
References: <20250422205740.02c4893a@canb.auug.org.au>
 <5628676b-e1ff-4570-a1ee-c87742e5363c@oracle.com>
 <20250423091656.6068c090@canb.auug.org.au>
 <20250422192816.03eaac09@batman.local.home>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250422192816.03eaac09@batman.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XEeHNrIB-4X2Tu34KnZYYRn9VHbOOelC
X-Authority-Analysis: v=2.4 cv=BIezrEQG c=1 sm=1 tr=0 ts=680884c9 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=rOUgymgbAAAA:8 a=yPCof4ZbAAAA:8 a=800HuZrbvkUcGo-v0AwA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAzOSBTYWx0ZWRfX836LCa4PsmHz x4oeUkorl2NPHmw18kO4e50Ejn2HsD9FSl50jFzMtXOc7CL9BchLLmJ+o414w+78z7hkHEKEDFt 1joz4uwl5ZvVpPvYbjv0xXfvAvvlpuwMR2puSgUxbe7Ca3aQt75+mUlhv8rpR/axk+fZzYKF887
 ZcgvntuDQTe5UMl5on6tMlfQxbQd9qmNOVwMG6d0Y9ircG7V+4bmAADvtwbffioJfi0b148wfGa KwVAD7CQfRumZJ2SOqvQI/eQmXBiSfNj2vL+RS8uZSIbFJp6Cqm3CW1MJXNnvmwYBBcJ0++ZrI1 h9/+jVsf04VLLo4baDU0iLDjvJ8FZ0K3gXfceAqy51P3hC/x4Cp59RnSPCc9IWM3RhKP9/FccIG
 MZKwGhNpgQ1Rgcg7FLOpccQYIbsZGDXFJABeB21ml/IPZl0vaNJQ1X7YN9Gwt6BlhX9exBGD
X-Proofpoint-ORIG-GUID: XEeHNrIB-4X2Tu34KnZYYRn9VHbOOelC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_03,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230039


On 23/04/25 4:58 am, Steven Rostedt wrote:
> On Wed, 23 Apr 2025 09:16:56 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>> On Tue, 22 Apr 2025 11:05:10 -0700 Libo Chen <libo.chen@oracle.com> wrote:


Observing same boot warnings on IBM Power9 Servers also.


Regards,

Venkat.

>>> Just to verify, does the build have commit 'tracing: Verify event
>>> formats that have "%*p.."'[1] or not? I do see linux-next/master has
>>> it but just want to first confirm that.
>> Yes, it does have that commit (since it has been in Linus' tree since
>> April 4).
> Looks like we need to teach the verifier about nodemask_pr_args() :-/
>
> -- Steve
>

