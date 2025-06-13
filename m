Return-Path: <linux-next+bounces-7146-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 918D7AD882B
	for <lists+linux-next@lfdr.de>; Fri, 13 Jun 2025 11:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 236531E110E
	for <lists+linux-next@lfdr.de>; Fri, 13 Jun 2025 09:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A360229CB24;
	Fri, 13 Jun 2025 09:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="j4BXtpJW"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB3A238C06;
	Fri, 13 Jun 2025 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749807829; cv=none; b=GiDwVDdJ6rrjWHYqzDqvSs/Qz4HwDT+CY5qVQKheQYP9K5zHfZJrUQOW8Q6uowmz/UYz61XySa///Zy+G6vvnTd3YAocH+gv1jkfyWm6gBsl3/Szjr5SZeFBMDWKqJ/DdlHaOjZq0siAy8/xHq/frn5NIDU5pRyVTtxmEh8qBt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749807829; c=relaxed/simple;
	bh=SE0MfHaPx13OGEpxSVvRa0nbI3QT/pJZM3UTvovZhIw=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=ZM3PQ8bwDtr8mWeOim7scoBXs7LfhvaXzKTxZoud7F1ylGSHgRXjsRRtG0cd2vdw7u8Gdbp2G+veYaWQSXKxeavALpZYu0HvO7aLV7En+fEd/TZMUk+A5dwyk2eTgb0eCeprKTA3Ft70E2RJF/egx+grSlpyhdVsfVDy50Mo0dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=j4BXtpJW; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D0BbqJ017418;
	Fri, 13 Jun 2025 09:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=VkLn83ekM7644CbOs+U+cJuruyJ9
	TnaH/Kqp3k/lkxc=; b=j4BXtpJWcB4/z2xMQccLZWaTZjAWC6rtu5u3ZNGtUqdS
	LeK01IdUy04QuUtXPZGw3BdaRsUVrlDgY33BJfeqBJ7uoZNh1XqIxVm1i/t8+dGj
	lRLkc3x4cZU8Td937ZaSBnnVhE82wXm9Zb1Tm5Vgd04yr67Te6+z5zS9QcMfQa4G
	HDbCoz8fsTmRxReVrj5Md/UyVw3ohVdlGGyupsRJf1qhomBfCjkKC98fqF/DGwpV
	DAyfh+Y4ZDBqCj9xe/mZ+0xxUkf249Yj4kTRmVrNXEJi8jOuAEfayP+3O7IaNpSe
	Sa/6mHZO5VRMPci4nNcm6QBPjb7Os0OeT3RYzuY+lQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474hguybge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 09:43:31 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55D6frxP027928;
	Fri, 13 Jun 2025 09:43:30 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47518msaw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 09:43:30 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55D9hTjp25363126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 09:43:29 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3991A58053;
	Fri, 13 Jun 2025 09:43:29 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4659858043;
	Fri, 13 Jun 2025 09:43:26 +0000 (GMT)
Received: from [9.61.253.31] (unknown [9.61.253.31])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Jun 2025 09:43:25 +0000 (GMT)
Message-ID: <24438fa1-da2c-47d4-b752-66e3ba247a82@linux.ibm.com>
Date: Fri, 13 Jun 2025 15:13:21 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>, riteshh@linux.ibm.com,
        linux-mm@vger.kernel.org, osalvador@suse.de,
        Kees Cook <kees@kernel.org>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [linux-next]kernel BUG at mm/slub.c:546!
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Pfr/hjhd c=1 sm=1 tr=0 ts=684bf2c3 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=9nCWa3IslF5rD-6bosgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: krzbAM2jPMeu84ycUsV8P-YAWZd2jzc5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA2OCBTYWx0ZWRfX1vfyHDk8SK26 NrJm7lIAkKea4mySoXCrqNstEsFcfByiW7tlRt3qFxtE3ksBup5jC0E0ilTORPF42BVkykretu/ MleZSJe/neF06n3uxYjxuE5PHc+GBP4oi6+ptmF+H5h4D+ooHFZNHs0tqgDfhey08swIbOv2aWz
 CKSUNN3ku3BK8S0xdZnTgyJCo4C5nmic5CUpv2BLQfU8OA+IHZ45Tjxhfpw0LLTOXTD6DqcoNE5 1oRjsr4S0V6dRrKZ6SXzXBO3c5l3bNckqWjlLmzPPx9TC3bnT02NOEievHqKducuEfrkYIaN4PP 7jNWzTGYTt86IudYsHZQRBs15P8Iiqx2ZtzCZ4VwApOjRqCx4XKVcgz3Nc1FqL9Y70GZVOZ7Qb1
 gwhHL2afhVWnQlg38A/FRCTK5rVE20ZD1R8BXO+fOurbMrlk4JSwrnn7Fb9qVdrfQUGxdHXo
X-Proofpoint-ORIG-GUID: krzbAM2jPMeu84ycUsV8P-YAWZd2jzc5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1011 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=510
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130068

Greetings!!!


IBM CI has reported kernel BUG at mm/slub.c:546!, while running fuzzer 
test, on linux-next-20250613 kernel on IBM Power Server.


Traces:


[ 4017.318542] ------------[ cut here ]------------
[ 4017.318577] kernel BUG at mm/slub.c:546!
[ 4017.318586] Oops: Exception in kernel mode, sig: 5 [#1]
[ 4017.318596] LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=8192 NUMA pSeries
[ 4017.318605] Modules linked in: nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 
nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct 
nft_chain_nat nf_nat nf_conntrack bonding nf_defrag_ipv6 tls 
nf_defrag_ipv4 rfkill ip_set nf_tables nfnetlink kmem device_dax 
pseries_rng vmx_crypto dax_pmem fuse ext4 crc16 mbcache jbd2 sd_mod sg 
nd_pmem nd_btt papr_scm ibmvscsi scsi_transport_srp ibmveth libnvdimm
[ 4017.318678] CPU: 13 UID: 0 PID: 1673332 Comm: sigfuz Kdump: loaded 
Not tainted 6.16.0-rc1-next-20250613 #1 VOLUNTARY

[ 4017.318701] NIP:  c000000000585fd0 LR: c00000000058686c CTR: 
0000000000000000
[ 4017.318710] REGS: c0000003f038f680 TRAP: 0700   Not tainted 
(6.16.0-rc1-next-20250613)
[ 4017.318719] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  
CR: 24002838  XER: 20040001
[ 4017.318740] CFAR: c000000000586868 IRQMASK: 0
[ 4017.318740] GPR00: c00000000058686c c0000003f038f920 c000000001658100 
c000000004016200
[ 4017.318740] GPR04: c00c000000331200 c0000000cc4c8000 c0000000cc4c8000 
c0000000cc4ca000
[ 4017.318740] GPR08: 0000000000002000 0000000000000001 0000000000000000 
0000000000002000
[ 4017.318740] GPR12: 0000000000000001 c000000efffe6700 0000000000000000 
0000000000000000
[ 4017.318740] GPR16: 0000000000000000 0000000000000000 c000000004016200 
c0000003daecb860
[ 4017.318740] GPR20: c0000003daecab80 c0000000cc4c8000 0000000000000000 
0000000000000001
[ 4017.318740] GPR24: 0000000000000001 0000000000000001 c0000000cc4c8000 
c0000003f7b18700
[ 4017.318740] GPR28: c0000000002b1aa4 0000000080200013 c0000000cc4c8000 
c00c000000331200
[ 4017.318828] NIP [c000000000585fd0] __slab_free+0x94/0x444
[ 4017.318841] LR [c00000000058686c] kfree+0x19c/0x488
[ 4017.318850] Call Trace:
[ 4017.318854] [c0000003f038f920] [c0000000042b0ee8] 0xc0000000042b0ee8 
(unreliable)
[ 4017.318867] [c0000003f038f9f0] [c00000000058686c] kfree+0x19c/0x488
[ 4017.318877] [c0000003f038fa60] [c0000000002b1aa4] 
futex_hash_free+0x50/0x7c
[ 4017.318889] [c0000003f038fa90] [c000000000169f94] __mmput+0x13c/0x1b4
[ 4017.318900] [c0000003f038fac0] [c0000000001775c8] exit_mm+0xdc/0x16c
[ 4017.318911] [c0000003f038fb00] [c000000000177864] do_exit+0x20c/0x55c
[ 4017.318921] [c0000003f038fbb0] [c000000000177da0] do_group_exit+0x4c/0xbc
[ 4017.318931] [c0000003f038fbf0] [c00000000018f368] get_signal+0xb60/0xb64
[ 4017.318941] [c0000003f038fcf0] [c0000000000216ac] do_signal+0x7c/0x324
[ 4017.318953] [c0000003f038fd90] [c000000000022820] 
do_notify_resume+0xb0/0x13c
[ 4017.318963] [c0000003f038fdc0] [c000000000032358] 
interrupt_exit_user_prepare_main+0x1ac/0x264
[ 4017.318976] [c0000003f038fe20] [c000000000032560] 
syscall_exit_prepare+0x150/0x178
[ 4017.318986] [c0000003f038fe50] [c00000000000d068] 
system_call_vectored_common+0x168/0x2ec
[ 4017.318999] ---- interrupt: 3000 at 0x7fffb3d04764
[ 4017.319006] NIP:  00007fffb3d04764 LR: 00007fffb3d04764 CTR: 
0000000000000000
[ 4017.319014] REGS: c0000003f038fe80 TRAP: 3000   Not tainted 
(6.16.0-rc1-next-20250613)
[ 4017.319023] MSR:  800000000280f033 
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 42004438  XER: 00000000
[ 4017.319044] IRQMASK: 0
[ 4017.319044] GPR00: 0000000000000072 00007fff7b7ee440 0000000010027f00 
fffffffffffffe00
[ 4017.319044] GPR04: 00007fff7b7ee5d0 0000000000000000 0000000000000000 
00007fff7b7f68e0
[ 4017.319044] GPR08: 00007fff7b7ef1a8 0000000000000000 0000000000000000 
0000000000000000
[ 4017.319044] GPR12: 0000000000000000 00007fff7b7f68e0 0000000000000000 
0000000000810000
[ 4017.319044] GPR16: 00007fff7b7ef160 0000000000000000 0000000000000000 
00007fffb3ff1040
[ 4017.319044] GPR20: 00007fff7b7ef8e0 00007fff7b7ef0a0 0000000000010000 
00007fff7afe0000
[ 4017.319044] GPR24: 0000000000000001 00007fffd28f0820 0000000010001e90 
00007fffd28f0697
[ 4017.319044] GPR28: 00007fff7b7ee5d0 000000000019bef5 0000000000000000 
0000000000000000
[ 4017.319129] NIP [00007fffb3d04764] 0x7fffb3d04764
[ 4017.319136] LR [00007fffb3d04764] 0x7fffb3d04764
[ 4017.319143] ---- interrupt: 3000
[ 4017.319149] Code: fba100b8 fbc100c0 f80100e0 60000000 ebdf0020 
81120028 39400000 39200001 ebbf0028 7c3af000 7cfa4214 7d29509e 
<0b090000> 78e50022 54e6c03e 7d57e850
[ 4017.319178] ---[ end trace 0000000000000000 ]---


If you happen to fix this, please add below tag.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>



Regards,

Venkat.


