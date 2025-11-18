Return-Path: <linux-next+bounces-9069-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D8AC67C12
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 07:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0FC174E069F
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 06:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828292EA15B;
	Tue, 18 Nov 2025 06:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="BXSvqwPW"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63932BE646;
	Tue, 18 Nov 2025 06:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763448033; cv=none; b=CMaen8Gj56NhunFMmvQrhUiuFc2fa0VieAQJbIAQWKAloRevimCLRGcnNlTQ0Soc3KOHchEZyel4GdauOaNZS4kTNa1+Q3w0de7r0goT0w0JZQ5iQK/+NARbOgHJ+tHqV7ejPnnhafw1QWoblPeBCOLvDY6jvQbskRkp8JADLAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763448033; c=relaxed/simple;
	bh=gzeBotJ6D4UJpKOtjG9nVvjzEHHWVz0SO+ju7Krs2yE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=IZREkM3yEvjraXh8mrEbwAkXVYjlD6R0Vaye5N/IrL+2ikbfC2MDkA0OsHYL71UXscXZE7Fhep4qsxVHVY7aTMmDxjAmYWTfJH5Qg5Uc+l3kT35MYtk5ha6auZ6L8AOkhjftJX0F5o71SLTQhNNwJ/sUz+DrILr/Zg0PHJgJDCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=BXSvqwPW; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AI53bM6027087;
	Tue, 18 Nov 2025 06:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=9IlkI1y1WEwhFaVvRpdmQND2wvhz
	A4JwHQLoOjbhsCA=; b=BXSvqwPWJQwlZ1VG3ab+Yu22A2o+CW1qK4GXE68U4Wiz
	/Ty5RplEXFtCSJvhgRb709VFgLBy78mu5auVvpgrQGW9QWBgKvrQvnqCYg80pimF
	zLtRPcpmPZuNNdDRedrOtHRwrsMqbfO2Fd5GwADzlpNeWOh15cOeuym/de8jsVwn
	Tjzc27Rxh47oUAgbnBVdkH0u1BWtbuRLn4BNuGE1c27Ajk2dqLqHkrQDScJhxVuZ
	4rP055FoOgnaEqSB+3ijkdvelJyb4KM0dDmxUW1Jq8IKefoWwS5YZzabZnH51CFJ
	ntaVWfHZ/ecLImnQztRFbIfB0thpShek5m5GiHjL8g==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk9scpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 06:40:15 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AI32Jqh005137;
	Tue, 18 Nov 2025 06:40:14 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af5bk1qpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 06:40:13 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AI6eCQg11076298
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Nov 2025 06:40:12 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 550C558061;
	Tue, 18 Nov 2025 06:40:12 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 842D858059;
	Tue, 18 Nov 2025 06:40:09 +0000 (GMT)
Received: from [9.98.109.80] (unknown [9.98.109.80])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Nov 2025 06:40:09 +0000 (GMT)
Message-ID: <5ef3eb20-d1db-41d0-83cf-4a78439e4a3c@linux.ibm.com>
Date: Tue, 18 Nov 2025 12:10:07 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Ingo Molnar <mingo@kernel.org>,
        Shrikanth Hegde <sshegde@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [linux-next20251118] BUG: Kernel NULL pointer dereference
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gigNVgdsrhRWfJHKnCYP1lmyKx1WPT9d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX5jxGJyEghP0n
 JTKrQJBkFV8+3tX5bXTt/+46ToUGj8zNSKQicZkiNczUedY2EcO3iOAFlYc8hys6srcvY0ySqOv
 B3ZLddv64SxfJSrCjjg87qKmo7CLfawFYkCqTb9FFezT5pxM8GcTumepcblSv4MB52Tkrofn0wc
 rSQSrxw/O51HgjIQZzG51BaPnQvHvf3boxuYyKjGPKRSKG7LBQLyH0f+pyXsnerj79eKbr8m3Xi
 sRxC0O2HcICqkIW6G4pJPYev1f2wni9RlYqkiPj+tldhVf709cSc9FClksdJ3XgKccXO5LlRW6N
 I7dQTXdtr+/QPixOdJuAP5k0D6UKQaTa73sJJGyYZkjlgf8PN7r58gAW+K8iM2tCFLX9Qy5Bfjr
 g/UDHWgltXwoEtxD7qamdrxls55jVg==
X-Proofpoint-ORIG-GUID: gigNVgdsrhRWfJHKnCYP1lmyKx1WPT9d
X-Authority-Analysis: v=2.4 cv=XtL3+FF9 c=1 sm=1 tr=0 ts=691c14cf cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=r7MKod_UI1lkIC2NXqAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032

Greetings!!


IBM CI has reported a boot crash while booting with linux-next2025118 
kernel.


Traces:


[    0.116026] audit: type=2000 audit(1763602256.110:1): 
state=initialized audit_enabled=0 res=1
[    0.116282] thermal_sys: Registered thermal governor 'fair_share'
[    0.116284] thermal_sys: Registered thermal governor 'step_wise'
[    0.120228] BUG: Kernel NULL pointer dereference at 0x00000000
[    0.120236] Faulting instruction address: 0xc0000000002b08a4
[    0.120241] Oops: Kernel access of bad area, sig: 11 [#3]
[    0.120245] LE PAGE_SIZE=64K MMU=Hash  SMP NR_CPUS=8192 NUMA pSeries
[    0.120252] Modules linked in:
[    0.120257] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G   D      
        6.18.0-rc6-next-20251118 #1 VOLUNTARY
[    0.120265] Tainted: [D]=DIE
[    0.120268] Hardware name: IBM,8375-42A POWER9 (architected) 0x4e0202 
0xf000005 of:IBM,FW950.80 (VL950_131) hv:phyp pSeries
[    0.120273] NIP:  c0000000002b08a4 LR: c0000000002b04a4 CTR: 
0000000000000000
[    0.120278] REGS: c0000009fffffaa0 TRAP: 0380   Tainted: G D          
     (6.18.0-rc6-next-20251118)
[    0.120284] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
48002828  XER: 20040006
[    0.120296] CFAR: c0000000002b04bc IRQMASK: 0
[    0.120296] GPR00: c0000000002b04a4 c0000009fffffd40 c000000001e58100 
0000000000000001
[    0.120296] GPR04: c000000002d68100 0000000000000007 0000000000000000 
0000000000000001
[    0.120296] GPR08: c000000005331e78 0000000000000400 c000000002d68100 
0000000000000000
[    0.120296] GPR12: 0000000000000000 c000000002f90000 0000000000000000 
c0000009fffffe94
[    0.120296] GPR16: 0000000000000000 c000000002cadb00 0000000000000000 
c000000003675e00
[    0.120296] GPR20: 0000000000000000 0000000000000000 0000000000000001 
00000000ffff8add
[    0.120296] GPR24: 0000000000000001 c00000000cacaa00 c000000002c72b00 
0000000000000000
[    0.120296] GPR28: c0000009fffffdb8 0000000000000000 c0000009e941b800 
c0000009e941b800
[    0.120353] NIP [c0000000002b08a4] sched_balance_rq+0x504/0x8b0
[    0.120361] LR [c0000000002b04a4] sched_balance_rq+0x104/0x8b0
[    0.120367] Call Trace:
[    0.120370] [c0000009fffffd40] [c0000000002b04a4] 
sched_balance_rq+0x104/0x8b0 (unreliable)
[    0.120379] [c0000009fffffe60] [c0000000002b1928] 
sched_balance_domains+0x298/0x3f0
[    0.120386] [c0000009ffffff00] [c00000000023d8d8] 
handle_softirqs+0x138/0x400
[    0.120394] [c0000009ffffffe0] [c000000000017da8] 
do_softirq_own_stack+0x38/0x50
[    0.120402] [c000000002c2fa20] [c00000000023cfe8] 
__irq_exit_rcu+0x198/0x1c0
[    0.120408] [c000000002c2fa50] [c00000000023e0ec] irq_exit+0x1c/0x40
[    0.120415] [c000000002c2fa70] [c00000000002a7e8] 
timer_interrupt+0x178/0x310
[    0.120421] [c000000002c2fad0] [c000000000009ffc] 
decrementer_common_virt+0x28c/0x290
[    0.120428] ---- interrupt: 900 at plpar_hcall_norets_notrace+0x18/0x2c
[    0.120435] NIP:  c0000000001ba998 LR: c0000000001c2584 CTR: 
0000000000000000
[    0.120440] REGS: c000000002c2fb00 TRAP: 0900   Tainted: G D          
     (6.18.0-rc6-next-20251118)
[    0.120445] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 
22000222  XER: 20040006
[    0.120457] CFAR: 0000000000000000 IRQMASK: 0
[    0.120457] GPR00: 0000000000000000 c000000002c2fda0 c000000001e58100 
0000000000000000
[    0.120457] GPR04: 000000000000ffff 0000000000000000 0000000000000000 
0000000000000000
[    0.120457] GPR08: 0000000000000000 0000000000000000 80000000791afc00 
ffffffffffffffff
[    0.120457] GPR12: 0000000000000000 c000000002f90000 0000000000000000 
0000000000000000
[    0.120457] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[    0.120457] GPR20: 0000000000c00000 0000000000000008 0000000000000000 
0000000000000000
[    0.120457] GPR24: 0000000000000000 c000000000000000 c00000000a6e0000 
000000000bde2ca0
[    0.120457] GPR28: c000000002cad140 c0000000022418e0 c0000000022418e8 
c0000000022418e0
[    0.120513] NIP [c0000000001ba998] plpar_hcall_norets_notrace+0x18/0x2c
[    0.120519] LR [c0000000001c2584] pseries_lpar_idle.part.0+0x74/0x160
[    0.120524] ---- interrupt: 900
[    0.120527] [c000000002c2fda0] [c000000a0036d500] 0xc000000a0036d500 
(unreliable)
[    0.120534] [c000000002c2fe20] [c0000000000214ac] 
arch_cpu_idle+0x4c/0x110
[    0.120541] [c000000002c2fe40] [c0000000013a0ca0] 
default_idle_call+0x50/0x140
[    0.120547] [c000000002c2fe60] [c0000000002bb6ec] 
cpuidle_idle_call+0x1ac/0x240
[    0.120554] [c000000002c2feb0] [c0000000002bb878] do_idle+0xf8/0x1a0
[    0.120560] [c000000002c2fef0] [c0000000002bbba4] 
cpu_startup_entry+0x44/0x50
[    0.120566] [c000000002c2ff20] [c0000000000113ac] rest_init+0xec/0xf0
[    0.120572] [c000000002c2ff50] [c0000000020054c0] do_initcalls+0x0/0x18c
[    0.120580] [c000000002c2ffe0] [c00000000000ea9c] 
start_here_common+0x1c/0x20
[    0.120586] Code: eac1ffb0 eb21ffc8 eb41ffd0 eb81ffe0 ebc1fff0 
ebe1fff8 7c0803a6 4e800020 38c00000 3d4200f1 38e00001 3c8200f1 
<81260000> 394a1438 7d2807b4 7ca05028
[    0.120605] ---[ end trace 0000000000000000 ]---
[    0.120610]
[    1.113513] Kernel panic - not syncing: Fatal exception
[    1.122739] Rebooting in 10 seconds..



If you happen to fix this issue, please add below tag.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.



