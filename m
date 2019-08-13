Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11C5B8BC3C
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 16:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729591AbfHMO5o convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 13 Aug 2019 10:57:44 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18972 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729404AbfHMO5o (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 10:57:44 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7DErQsk042824
        for <linux-next@vger.kernel.org>; Tue, 13 Aug 2019 10:57:43 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2uby4091k8-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Tue, 13 Aug 2019 10:57:42 -0400
Received: from localhost
        by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <gor@linux.ibm.com>;
        Tue, 13 Aug 2019 15:57:41 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 13 Aug 2019 15:57:38 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x7DEvbID60686372
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Aug 2019 14:57:37 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B5699A405D;
        Tue, 13 Aug 2019 14:57:37 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 777C8A4053;
        Tue, 13 Aug 2019 14:57:37 +0000 (GMT)
Received: from localhost (unknown [9.152.212.112])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 13 Aug 2019 14:57:37 +0000 (GMT)
Date:   Tue, 13 Aug 2019 16:57:36 +0200
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Matthew Garrett <matthewgarrett@google.com>,
        James Morris <jmorris@namei.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Aug 13
References: <20190813191924.7c5310dd@canb.auug.org.au>
 <your-ad-here.call-01565700115-ext-9407@work.hours>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <your-ad-here.call-01565700115-ext-9407@work.hours>
X-TM-AS-GCONF: 00
x-cbid: 19081314-0016-0000-0000-0000029E32C3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081314-0017-0000-0000-000032FE47CD
Message-Id: <your-ad-here.call-01565708256-ext-1951@work.hours>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-13_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908130157
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 13, 2019 at 02:41:55PM +0200, Vasily Gorbik wrote:
> On Tue, Aug 13, 2019 at 07:19:24PM +1000, Stephen Rothwell wrote:
> > Merging security/next-testing (a4848e06f9af Merge branch 'next-lockdown' into next-testing)
> > CONFLICT (content): Merge conflict in kernel/trace/trace_kprobe.c
> > CONFLICT (content): Merge conflict in fs/tracefs/inode.c
> > Applying: early_security_init() needs a stub got !CONFIG_SECURITY
> 
> Hi all,
> 
> next-lockdown causes panic on s390 when doing:
> cat /sys/kernel/debug/tracing/events/syscalls/sys_enter_read/id
> 
> [ 3972.384027] Unable to handle kernel pointer dereference in virtual kernel address space
> [ 3972.384031] Failing address: 0000000000000000 TEID: 0000000000000887
> [ 3972.384032] Fault in home space mode while using kernel ASCE.
> [ 3972.384033] AS:00000000744cc007 R3:00000001fffd0007 S:00000001fffd6000 P:000000000000013d 
> [ 3972.384051] Oops: 0004 ilc:1 [#1] SMP 
> [ 3972.384053] Modules linked in: binfmt_misc(E) dm_crypt(E) lcs(E) ctcm(E) fsm(E) algif_skcipher(E) af_alg(E) nfsv3(E) nfs_acl(E) nfs(E) lockd(E) grace(E) sctp(E) quota_v2(E) quota_tree(E) ntfs(E) vfat(E) fat(E) overlay(E) loop(E) dm_service_time(E) kvm(E) xt_CHECKSUM(E) xt_MASQUERADE(E) xt_tcpudp(E) ip6t_rpfilter(E) ip6t_REJECT(E) nf_reject_ipv6(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_conntrack(E) ip6table_nat(E) ip6table_mangle(E) ip6table_raw(E) tun(E) ip6table_security(E) bridge(E) iptable_nat(E) nf_nat(E) stp(E) llc(E) iptable_mangle(E) iptable_raw(E) iptable_security(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) ip_set(E) nfnetlink(E) ip6table_filter(E) ip6_tables(E) iptable_filter(E) ip_tables(E) x_tables(E) sunrpc(E) dm_multipath(E) dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) s390_trng(E) ghash_s390(E) prng(E) aes_s390(E) des_s390(E) des_generic(E) sha512_s390(E) sha1_s390(E) vfio_ccw(E) vfio_mdev(E) mdev(E) vfio_iommu_type1(E) vfio(E) eadm_sch(E) sch_fq_codel(E)
> [ 3972.384076]  sha256_s390(E) sha_common(E) pkey(E) zcrypt(E) rng_core(E) autofs4(E) [last unloaded: dummy_del_mod]
> [ 3972.384084] CPU: 17 PID: 45118 Comm: psvc-ioctl-bpf1 Tainted: G           OE     5.3.0-20190813.rc4.git0.8e72ac275c63.301.fc30.s390x+next #1
> [ 3972.384086] Hardware name: IBM 3906 M04 704 (LPAR)
> [ 3972.384087] Krnl PSW : 0704c00180000000 0000000000000000 (0x0)
> [ 3972.384090]            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3 CC:0 PM:0 RI:0 EA:3
> [ 3972.384103] Krnl GPRS: 000003e004c0fb90 0000000000000000 00000001f912abf0 0000000197b36800
> [ 3972.384104]            0000000197b36810 0000000000000001 0000000100000000 0000000197b36810
> [ 3972.384105]            00000000736ae3a0 0000000100000000 00000001f912abf0 0000000197b36800
> [ 3972.384106]            000000013aff0000 0000000073c625a8 00000000734a1486 000003e004c0fbc8
> [ 3972.384110] Krnl Code:>0000000000000000: 0000                illegal 
>                           0000000000000002: 0000                illegal 
>                           0000000000000004: 0000                illegal 
>                           0000000000000006: 0000                illegal 
>                           0000000000000008: 0000                illegal 
>                           000000000000000a: 0000                illegal 
>                           000000000000000c: 0000                illegal 
>                           000000000000000e: 0000                illegal 
> [ 3972.384116] Call Trace:
> [ 3972.384122] ([<00000000734a1486>] do_dentry_open+0x206/0x3c0)
> [ 3972.384125]  [<00000000734b8c1e>] do_last+0x16e/0x918 
> [ 3972.384126]  [<00000000734b944e>] path_openat+0x86/0x2b8 
> [ 3972.384128]  [<00000000734baa64>] do_filp_open+0x7c/0xf8 
> [ 3972.384129]  [<00000000734a3484>] do_sys_open+0x18c/0x258 
> [ 3972.384134]  [<0000000073c457cc>] system_call+0xd8/0x2c8 
> [ 3972.384135] Last Breaking-Event-Address:
> [ 3972.384139]  [<00000000736ae3fa>] default_open_file+0x5a/0x78
> [ 3972.384141] Kernel panic - not syncing: Fatal exception: panic_on_oops
> 
> Which correspond to:
> fs/tracefs/inode.c:46
> static int default_open_file(struct inode *inode, struct file *filp)
>  45         real_fops = dentry->d_fsdata;
>  46         return real_fops->open(inode, filp);
> 
> Commit which introduces the problem:
> commit 757ff7244358406dd16a7f5f623ca40ed27c603c
> Author:     Matthew Garrett <matthewgarrett@google.com>
> AuthorDate: Wed Aug 7 17:07:19 2019 -0700
> Commit:     James Morris <jmorris@namei.org>
> CommitDate: Fri Aug 9 22:23:58 2019 -0700
> 
>     tracefs: Restrict tracefs when the kernel is locked down
>     
>     Tracefs may release more information about the kernel than desirable, so
>     restrict it when the kernel is locked down in confidentiality mode by
>     preventing open().
>     
>     Signed-off-by: Matthew Garrett <mjg59@google.com>
>     Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
>     Signed-off-by: James Morris <jmorris@namei.org>
> ---
>  fs/tracefs/inode.c           | 40 +++++++++++++++++++++++++++++++++++++++-
>  include/linux/security.h     |  1 +
>  security/lockdown/lockdown.c |  1 +
>  3 files changed, 41 insertions(+), 1 deletion(-)
> 
> Using default s390 config, where
> # CONFIG_SECURITY_LOCKDOWN_LSM is not set

Hm, this actually looks like a general problem. Please, consider the
following patch, if it makes sense. It fixes the problem for me.

-- 
⣿⣿⣿⣿⢋⡀⣀⠹⣿⣿⣿⣿
⣿⣿⣿⣿⠠⣶⡦⠀⣿⣿⣿⣿
⣿⣿⣿⠏⣴⣮⣴⣧⠈⢿⣿⣿
⣿⣿⡏⢰⣿⠖⣠⣿⡆⠈⣿⣿
⣿⢛⣵⣄⠙⣶⣶⡟⣅⣠⠹⣿
⣿⣜⣛⠻⢎⣉⣉⣀⠿⣫⣵⣿

