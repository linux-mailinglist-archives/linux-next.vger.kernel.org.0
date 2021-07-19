Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23F3F3CD480
	for <lists+linux-next@lfdr.de>; Mon, 19 Jul 2021 14:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236879AbhGSLfl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Jul 2021 07:35:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30257 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236866AbhGSLfk (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Jul 2021 07:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626696980;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fDbKb6eEnI+AB3i9YHvAOBBN6yZ/60zZF8USCg0XPVE=;
        b=iiVFwGW/afUuOp/iVTtol2W+asUJPUvOGOr3RxZPzwTdOZRZc02nt6GEiLQvu6TNAEF97D
        WiIKytn4W2aPW/lLd0Cg8iPjwYGszzFCGM6TZExMlfURaOMBTpvSIPowoSleSCR/h5ZdhH
        2618WTlsNEzQL8PcN8+nKOXcgjH7Z7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-oxx_3wLPPrOpz57nnu6Zfw-1; Mon, 19 Jul 2021 08:16:16 -0400
X-MC-Unique: oxx_3wLPPrOpz57nnu6Zfw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 081B186ABA6;
        Mon, 19 Jul 2021 12:16:15 +0000 (UTC)
Received: from [10.64.54.195] (vpn2-54-195.bne.redhat.com [10.64.54.195])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id D3B1B5C232;
        Mon, 19 Jul 2021 12:16:11 +0000 (UTC)
Reply-To: Gavin Shan <gshan@redhat.com>
Subject: Re: [syzbot] linux-next boot error: WARNING in debug_vm_pgtable
To:     syzbot <syzbot+8730ec44a441a434a2c8@syzkaller.appspotmail.com>,
        akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
References: <00000000000048d99005c7769606@google.com>
From:   Gavin Shan <gshan@redhat.com>
Message-ID: <5e1c2578-c784-9b1e-3033-7d144c4b1e8e@redhat.com>
Date:   Mon, 19 Jul 2021 22:16:29 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <00000000000048d99005c7769606@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/19/21 7:30 PM, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    08076eab6fef Add linux-next specific files for 20210719
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=16624fd2300000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=29a82c885e192046
> dashboard link: https://syzkaller.appspot.com/bug?extid=8730ec44a441a434a2c8
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+8730ec44a441a434a2c8@syzkaller.appspotmail.com
> 
> Bluetooth: BNEP filters: protocol multicast
> Bluetooth: BNEP socket layer initialized
> Bluetooth: CMTP (CAPI Emulation) ver 1.0
> Bluetooth: CMTP socket layer initialized
> Bluetooth: HIDP (Human Interface Emulation) ver 1.2
> Bluetooth: HIDP socket layer initialized
> NET: Registered PF_RXRPC protocol family
> Key type rxrpc registered
> Key type rxrpc_s registered
> NET: Registered PF_KCM protocol family
> lec:lane_module_init: lec.c: initialized
> mpoa:atm_mpoa_init: mpc.c: initialized
> l2tp_core: L2TP core driver, V2.0
> l2tp_ppp: PPPoL2TP kernel driver, V2.0
> l2tp_ip: L2TP IP encapsulation support (L2TPv3)
> l2tp_netlink: L2TP netlink interface
> l2tp_eth: L2TP ethernet pseudowire support (L2TPv3)
> l2tp_ip6: L2TP IP encapsulation support for IPv6 (L2TPv3)
> NET: Registered PF_PHONET protocol family
> 8021q: 802.1Q VLAN Support v1.8
> DCCP: Activated CCID 2 (TCP-like)
> DCCP: Activated CCID 3 (TCP-Friendly Rate Control)
> sctp: Hash tables configured (bind 32/56)
> NET: Registered PF_RDS protocol family
> Registered RDS/infiniband transport
> Registered RDS/tcp transport
> tipc: Activated (version 2.0.0)
> NET: Registered PF_TIPC protocol family
> tipc: Started in single node mode
> NET: Registered PF_SMC protocol family
> 9pnet: Installing 9P2000 support
> NET: Registered PF_CAIF protocol family
> NET: Registered PF_IEEE802154 protocol family
> Key type dns_resolver registered
> Key type ceph registered
> libceph: loaded (mon/osd proto 15/24)
> batman_adv: B.A.T.M.A.N. advanced 2021.2 (compatibility version 15) loaded
> openvswitch: Open vSwitch switching datapath
> NET: Registered PF_VSOCK protocol family
> mpls_gso: MPLS GSO support
> IPI shorthand broadcast: enabled
> AVX2 version of gcm_enc/dec engaged.
> AES CTR mode by8 optimization enabled
> sched_clock: Marking stable (13057587730, 27846366)->(13084401149, 1032947)
> registered taskstats version 1
> Loading compiled-in X.509 certificates
> Loaded X.509 cert 'Build time autogenerated kernel key: f850c787ad998c396ae089c083b940ff0a9abb77'
> zswap: loaded using pool lzo/zbud
> debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1 at mm/page_alloc.c:5349 current_gfp_context include/linux/sched/mm.h:187 [inline]
> WARNING: CPU: 0 PID: 1 at mm/page_alloc.c:5349 __alloc_pages+0x45d/0x500 mm/page_alloc.c:5361
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-rc2-next-20210719-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> RIP: 0010:__alloc_pages+0x45d/0x500 mm/page_alloc.c:5349
> Code: be c9 00 00 00 48 c7 c7 80 e4 96 89 c6 05 89 1a a5 0b 01 e8 4d ba 35 07 e9 6a ff ff ff 0f 0b e9 a0 fd ff ff 40 80 e5 3f eb 88 <0f> 0b e9 18 ff ff ff 4c 89 ef 44 89 e6 45 31 ed e8 6e 74 ff ff e9
> RSP: 0000:ffffc90000c67b08 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: 1ffff9200018cf62 RCX: dffffc0000000000
> RDX: 0000000000000000 RSI: 0000000000000012 RDI: 0000000000000cc0
> RBP: 0000000000000000 R08: 000000000000003f R09: 0000000000000003
> R10: ffffffff81b9a5e8 R11: 0000000000000003 R12: 0000000000000012
> R13: 0000000000000012 R14: 0000000000000000 R15: dffffc0000000000
> FS:  0000000000000000(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffff88823ffff000 CR3: 000000000b68e000 CR4: 00000000001506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   alloc_page_interleave+0x1e/0x200 mm/mempolicy.c:2124
>   alloc_pages+0x26a/0x2d0 mm/mempolicy.c:2274
>   alloc_mem mm/debug_vm_pgtable.c:1138 [inline]
>   debug_vm_pgtable+0x762/0x2986 mm/debug_vm_pgtable.c:1169
>   do_one_initcall+0x103/0x650 init/main.c:1285
>   do_initcall_level init/main.c:1360 [inline]
>   do_initcalls init/main.c:1376 [inline]
>   do_basic_setup init/main.c:1396 [inline]
>   kernel_init_freeable+0x6b8/0x741 init/main.c:1598
>   kernel_init+0x1a/0x1d0 init/main.c:1490
>   ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
> 

This was caused by allocating pages more than (1 << (MAX_ORDER - 1)) in
mm/debug_vm_pgtable.c::alloc_mem() in v1 series. I will fix it in v3 to
skip the allocation if the requested size is more than (1 << (MAX_ORDER - 1))
in v3.

> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 

Thanks,
Gavin

