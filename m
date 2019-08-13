Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D01BE8BC38
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 16:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729559AbfHMO4w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 10:56:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:54560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729539AbfHMO4v (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 10:56:51 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DEFA5205F4;
        Tue, 13 Aug 2019 14:56:49 +0000 (UTC)
Date:   Tue, 13 Aug 2019 10:56:45 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Vasily Gorbik <gor@linux.ibm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Matthew Garrett <matthewgarrett@google.com>,
        James Morris <jmorris@namei.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: linux-next: Tree for Aug 13
Message-ID: <20190813105645.4ffba70c@gandalf.local.home>
In-Reply-To: <your-ad-here.call-01565700115-ext-9407@work.hours>
References: <20190813191924.7c5310dd@canb.auug.org.au>
        <your-ad-here.call-01565700115-ext-9407@work.hours>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


This looks related to what Marek posted.

  https://lore.kernel.org/linux-security-module/3028ed35-3b6d-459f-f3c8-103c5636fe95@samsung.com/

Care to apply the change he suggested to see if it fixes the issue for
you. If it does, Marek, can you make an official patch?

-- Steve


On Tue, 13 Aug 2019 14:41:55 +0200
Vasily Gorbik <gor@linux.ibm.com> wrote:

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
> [ 3972.384053] Modules linked in: binfmt_misc(E) dm_crypt(E) lcs(E) ctcm(E) fsm(E) algif_skcipher(E) af_alg(E) nfsv3(E) nfs_acl(E) nfs(E) lockd(E) grace(E) sctp(E) quota_v2(E) quota_tree(E) ntfs(E) vfat(E) fat(E) overlay(E) loop(E) dm_service_time(E) kvm(E) xt_CHECKSUM(E) xt_MASQUERADE(E) xt_tcpudp(E) ip6t_rpfilter(E) ip6t_REJECT(E) nf_reject_ipv6(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_conntrack(E) ip6table_nat(E) ip6table_mangle(E) ip6table_raw(E) tun(E) ip6table_security(E) bridge(E) iptable_nat(E) nf_nat(E) stp(E) llc(E) iptable_mangle(E) iptable_raw(E) iptable_security(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) ip_set(E) nfnetlink(E) ip6table_filter(E) ip6_tables(E) iptable_filter(E) ip_tables(E) x_tables(E) sunrpc(E) dm_multipath(E) dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) s390_trng(E) ghash_s390(E) prng(E) aes_s390(E) des_s390(E) des_generic(E) sha512_s390(E) sha1_s390(E) vfio_ccw(E) vfio_mdev(E) mdev(E) vfio_iommu_type1(E) vfio(E) eadm_sch(E) sch_f
 q_codel(E)
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
> 

