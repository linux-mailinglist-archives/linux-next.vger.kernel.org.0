Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD7689BEB1
	for <lists+linux-next@lfdr.de>; Sat, 24 Aug 2019 18:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbfHXQEv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Sat, 24 Aug 2019 12:04:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53724 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726842AbfHXQEu (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sat, 24 Aug 2019 12:04:50 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7OG1XDM083225
        for <linux-next@vger.kernel.org>; Sat, 24 Aug 2019 12:04:49 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2uk1r8rtqe-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Sat, 24 Aug 2019 12:04:49 -0400
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <sachinp@linux.vnet.ibm.com>;
        Sat, 24 Aug 2019 17:04:47 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sat, 24 Aug 2019 17:04:45 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x7OG4i4U43778170
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 24 Aug 2019 16:04:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9EDC152054;
        Sat, 24 Aug 2019 16:04:44 +0000 (GMT)
Received: from [9.85.95.149] (unknown [9.85.95.149])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 774445204F;
        Sat, 24 Aug 2019 16:04:43 +0000 (GMT)
From:   Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: [powerpc]WARN : arch/powerpc/platforms/powernv/smp.c:160
Date:   Sat, 24 Aug 2019 21:34:41 +0530
Cc:     linux-next@vger.kernel.org, ego@linux.vnet.ibm.com
To:     linuxppc-dev@ozlabs.org
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19082416-4275-0000-0000-0000035CF7D4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082416-4276-0000-0000-0000386F22BB
Message-Id: <AB1A20B4-523B-491E-AB89-124AD2810C17@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-24_10:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=477 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908240176
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

linux-next is currently broken on POWER8 non virtualized. Kernel
fails to reach login prompt with following kernel warning
repeatedly shown during boot.

The problem dates back atleast till next-20190816. 

[   40.285606] WARNING: CPU: 1 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160 pnv_smp_cpu_kill_self+0x50/0x2d0
[   40.285609] Modules linked in: kvm_hv kvm sunrpc dm_mirror dm_region_hash dm_log dm_mod ses enclosure scsi_transport_sas sg ipmi_powernv ipmi_devintf powernv_rng uio_pdrv_genirq uio leds_powernv ipmi_msghandler powernv_op_panel ibmpowernv ip_tables ext4 mbcache jbd2 sd_mod ipr tg3 libata ptp pps_core
[   40.285643] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.3.0-rc5-next-20190823-autotest-autotest #1
[   40.285644] NIP:  c0000000000b5f40 LR: c000000000055498 CTR: c0000000000b5ef0
[   40.285646] REGS: c0000007f5527980 TRAP: 0700   Not tainted  (5.3.0-rc5-next-20190823-autotest-autotest)
[   40.285646] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24004028  XER: 00000000
[   40.285650] CFAR: c000000000055494 IRQMASK: 1 
[   40.285650] GPR00: c000000000055498 c0000007f5527c10 c00000000148b200 0000000000000000 
[   40.285650] GPR04: 0000000000000000 c0000007fa897d80 c0000007fa90c800 00000007f9980000 
[   40.285650] GPR08: 0000000000000000 0000000000000001 0000000000000000 c0000007fa90c800 
[   40.285650] GPR12: c0000000000b5ef0 c0000007ffffee00 0000000000000800 c000000ffffc11d0 
[   40.285650] GPR16: 0000000000000001 c000000001035280 0000000000000000 c0000000015303c0 
[   40.285650] GPR20: c000000000052d60 0000000000000001 c0000007f54cd800 c0000007f54cd880 
[   40.285650] GPR24: 0000000000080000 c0000007f54cd800 c0000000014bdf78 c0000000014c20d8 
[   40.285650] GPR28: 0000000000000002 c0000000014c2538 0000000000000001 c0000007f54cd800 
[   40.285662] NIP [c0000000000b5f40] pnv_smp_cpu_kill_self+0x50/0x2d0
[   40.285664] LR [c000000000055498] cpu_die+0x48/0x64
[   40.285665] Call Trace:
[   40.285667] [c0000007f5527c10] [c000000000f85f10] ppc64_tlb_batch+0x0/0x1220 (unreliable)
[   40.285669] [c0000007f5527df0] [c000000000055498] cpu_die+0x48/0x64
[   40.285672] [c0000007f5527e10] [c0000000000226a0] arch_cpu_idle_dead+0x20/0x40
[   40.285674] [c0000007f5527e30] [c00000000016bd2c] do_idle+0x37c/0x3f0
[   40.285676] [c0000007f5527ed0] [c00000000016bfac] cpu_startup_entry+0x3c/0x50
[   40.285678] [c0000007f5527f00] [c000000000055198] start_secondary+0x638/0x680
[   40.285680] [c0000007f5527f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
[   40.285680] Instruction dump:
[   40.285681] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
[   40.285684] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
[   40.285687] ---[ end trace 72c90a064122d9e4 ]—

Relevant code snippet :
156         /*
157          * This hard disables local interurpts, ensuring we have no lazy
158          * irqs pending.
159          */
160         WARN_ON(irqs_disabled());  <<===
161         hard_irq_disable();
162         WARN_ON(lazy_irq_pending());

Thanks
-Sachin

