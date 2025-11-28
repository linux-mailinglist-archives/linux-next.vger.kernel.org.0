Return-Path: <linux-next+bounces-9264-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 125E4C92169
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 14:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 002413B07C6
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 13:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC66932C926;
	Fri, 28 Nov 2025 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="m9/z6eE6"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0079E32D434;
	Fri, 28 Nov 2025 13:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764335529; cv=none; b=NOny0sAQq9Uw134Qp6ZW6hgBEcLtN2XIHAqU3PfSU8c4JOW5A9Xm/jQ+zkYPSKOk167NKiHjJoO6LHtGqKLQAAEc4A8pgeKhd9ETKimZrfOXqhGJ7ivXHpKoL20YS71De/xJZMe6PtBq77tmxrayaKVoQdJeQREB4kPb31tvly4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764335529; c=relaxed/simple;
	bh=CYS2l0sXN11aw44RS7XqbIMHwFj5EkNTXVYWNf8CdD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBxMSePmoFjedJ2SHQDxLAa8a3WDryoyVV2boj4Aer/jMGrPEGV1NbrBC6S6n8hmrF+w1yRkl46h2OuZpoVEolQzZd9y8UX6tUptSMJ2V7v2WVLyOAU23+Ng80LQ0op/tRg/m0MxkMdwAnVrQTS90XMUu+1EBUUpJzUWNdgiQTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=m9/z6eE6; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AS0PGmr021417;
	Fri, 28 Nov 2025 13:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=OFzaSkhtZNX78qvDlIXIBfjIruNovY
	+/2Z9nDhqczys=; b=m9/z6eE6IBmK05Y+UZjrMc6HCojkIIMl7zdmSI/4oaAgrr
	evi/89fWBtrIxwfDgwgTFI+3GHOgpPNVOo/Oq3NKULKz2WxaDnhZ3t9yK3r3T09M
	1aeJYX3xmSHrwQnGOV0K3q3ZoBOU6SghI6/c/PLYWNMMJP3TO7vRqF/yssFJTU98
	6cBfS1F4vJsgMpeufaGPX0ZhYOSlbn/PWk81aL8pKiiMr2Vt6gmwM0qrOIGz3I+a
	HvAwwbo+ZrIly+mzhC7oaOuu4gDR4EiUANUeAysXqL1X5Etp2Xtjx0V/WvipTC1w
	+v+pSPcTqS8pnbfUC+pLueuNndGmVVg6Nskq0olg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak4u2ctar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Nov 2025 13:11:49 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AS9OFHj016418;
	Fri, 28 Nov 2025 13:11:48 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4aks0kn10k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Nov 2025 13:11:48 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5ASDBkgs48365992
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Nov 2025 13:11:46 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4778E20043;
	Fri, 28 Nov 2025 13:11:46 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F3FD620040;
	Fri, 28 Nov 2025 13:11:45 +0000 (GMT)
Received: from osiris (unknown [9.111.55.113])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 28 Nov 2025 13:11:45 +0000 (GMT)
Date: Fri, 28 Nov 2025 14:11:44 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [linux-next: vfs - regression] - merge error?
Message-ID: <20251128131144.33307A73-hca@linux.ibm.com>
References: <20251128162928.36eec2d6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128162928.36eec2d6@canb.auug.org.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAyMSBTYWx0ZWRfX9WX1VU44Jgfn
 aWRHvuW2VuV2jN4OwKGE8lOfgVoT5y4jBw61B7f1H6gifHp/Y4qV+0SNQsBJIEyR2cZp6ryLjCX
 tSqylqbweUd89y8XT+x8vbduvyzTMU0pCqYevw5zornA9VR+Joshy0vzXLCXFfWRWGfAbZ8I0aX
 RZgfPTWwBeWzLnNSwLy/eGUGrkNGkpIcagqdeL6E9jYG/dvi20e3sp5z4iYxvuO8leOKp0KAb3H
 2Lsm5ukxxdVdvnnvzCHVbeSkn3WvLJ0xDcLIopx+2RM/CBZ0qnauv5jfLCRxHhJKYR2Zb8abxuA
 nNT8zr0uIC55CHnnUQSNbKrttb+LZ8UBZETPE86cOiPpserQ4bY3qxqR/C08v8vbKmvSj+jNZFv
 aNVQE/zAZjmqYz3crkfsd7ceWW1/OQ==
X-Authority-Analysis: v=2.4 cv=SuidKfO0 c=1 sm=1 tr=0 ts=69299f95 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1xViFuH6XyhmrqvNohcA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: vK9fn5UllqUDYk96PEsUFsUKhplhS2xP
X-Proofpoint-GUID: vK9fn5UllqUDYk96PEsUFsUKhplhS2xP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511220021

On Fri, Nov 28, 2025 at 04:29:28PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20251127:
> 
> This kernel produces a warning at boot time.
> 
> The vfs-brauner tree still had its build failure so I used a supplied
> patch.

ltp's mq_notify03 test case causes this on linux-next as of 20251128:

Unable to handle kernel pointer dereference in virtual kernel address space
Failing address: 0000000000000000 TEID: 0000000000000803
Fault in home space mode while using kernel ASCE.
AS:0000000002528007 R3:00000001ffffc007 S:00000001ffffb801 P:0000000000000400 
Oops: 0011 ilc:3 [#1]SMP 
Modules linked in:
CPU: 2 UID: 0 PID: 702 Comm: mq_notify03 Not tainted 6.18.0-rc7-00495-g73612a36da1a #17 NONE 
Hardware name: IBM 3931 A01 704 (z/VM 7.4.0)
Krnl PSW : 0704e00180000000 000003ffe04f2baa (__fput+0x5a/0x2e0)
           R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3 CC:2 PM:0 RI:0 EA:3
Krnl GPRS: 0000000080000000 000003ffe1a25200 0000000000000008 000003ffe04f2ea0
           000003ffe1a2531d 0000000000000000 00000000899e2300 00000000815e2a20
           000000008ce3c008 0000000088789140 00000000040b801f 00000000827ef800
           000003ff00000000 00000000899e2300 0000037fe0af3c00 0000037fe0af3b98
Krnl Code: 000003ffe04f2b9c: a7a00600            tmlh    %r10,1536
           000003ffe04f2ba0: a744002e            brc     4,000003ffe04f2bfc
          #000003ffe04f2ba4: e35090300004        lg      %r5,48(%r9)
          >000003ffe04f2baa: e31050280004        lg      %r1,40(%r5)
           000003ffe04f2bb0: e33013b80004        lg      %r3,952(%r1)
           000003ffe04f2bb6: ec380023007c        cgij    %r3,0,8,000003ffe04f2bfc
           000003ffe04f2bbc: e30030080004        lg      %r0,8(%r3)
           000003ffe04f2bc2: ec08001d007c        cgij    %r0,0,8,000003ffe04f2bfc
Call Trace:
 [<000003ffe04f2baa>] __fput+0x5a/0x2e0 
([<000003ffe047d38a>] kmem_cache_free+0x40a/0x4a0)
 [<000003ffe0199408>] task_work_run+0x88/0xd0 
 [<000003ffe0174d1a>] do_exit+0x18a/0x4d0 
 [<000003ffe0175220>] do_group_exit+0x40/0xc0 
 [<000003ffe018525a>] get_signal+0x80a/0x840 
 [<000003ffe011e35c>] arch_do_signal_or_restart+0x6c/0x2f0 
 [<000003ffe0228fc2>] exit_to_user_mode_loop+0xd2/0x190 
 [<000003ffe0f52154>] __do_syscall+0x324/0x340 
 [<000003ffe0f5e9fe>] system_call+0x6e/0x90 
Last Breaking-Event-Address:
 [<000003ffe04f2eac>] ____fput+0xc/0x20
---[ end trace 0000000000000000 ]---

I could bisect this to

commit 73612a36da1a ("Merge branch 'vfs-6.19.fd_prepare' into vfs.all")

which also resolves a merge conflict in ipc/mqueue.c. Looks like the conflict
resolution might not be correct?

