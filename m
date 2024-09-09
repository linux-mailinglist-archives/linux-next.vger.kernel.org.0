Return-Path: <linux-next+bounces-3698-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50445971641
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 13:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C13B1C229D7
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 11:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F111AF4FA;
	Mon,  9 Sep 2024 11:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qXoJIUrD"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D912015EFA1
	for <linux-next@vger.kernel.org>; Mon,  9 Sep 2024 11:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725880042; cv=none; b=US2G1ZWQLLX+oSZS3sikVlD2OzGfhwLdgOexl4xQpDkG8fVjdePKAusVpimfg9/21670xW0R92TFEuSlUIjqBTsgWDznwE5i1sCtMGTzVhhEV4OEQKsCQvm+djMNfD0Xo96LGonsqbRfq7rgvpbXZcZVwNynBDUbvyZANb7wNRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725880042; c=relaxed/simple;
	bh=TjY3R5QmchBVYSjP4stek8jA/8DtzEltlEOylJbW67k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSVGvTxzxngeO4hROLwVsdkWHA9UHzx/8xXugBpLb5CO0U57856J4OOiNHVFbmDg6hcE89GQb6BLO48MFx0VUinaTDjgX7nVihq2Id1WARBkArPcBVUZaPJf4ovu79fbL4+wPVc6dXOfThIrZQxXl9TUeSqfMFz7fMMZfQRQG5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qXoJIUrD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC15C4CEC5;
	Mon,  9 Sep 2024 11:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725880042;
	bh=TjY3R5QmchBVYSjP4stek8jA/8DtzEltlEOylJbW67k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qXoJIUrDBhf7cw99/vGUOXOs6/kAEHM0Z8GDes4KU5lc0Va1qXh/X1CFFjhEdHPUU
	 OqnaJVTS6lBvbp9uCFustMPQtb2gidzu5joKqATkIn1c/JaAnqQ1+AHrafKhGeBOBW
	 /zU8d8IYTC7YIssesX3+87UbM64FG/iROG91tj2MSQzNp/W/lza/4YgcpGz0mauZ6R
	 2BVysr+levMJTZ/cidEwbdXu/+vN92o0Kv1fDrlD5x8+hJ0Dcvj6qVGgEr1OcTa9xX
	 yPFSxfxvDhPpzznX4o5s7EfURDJ6mB5fIoSNelln8KZ3qzuwqdG48ne/tiNo+IONvt
	 pyNbP5zekA2Rg==
Date: Mon, 9 Sep 2024 13:07:18 +0200
From: Christian Brauner <brauner@kernel.org>
To: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Cc: Chandan Babu R <chandanbabu@kernel.org>, linux-next@vger.kernel.org, 
	mszeredi@redhat.com
Subject: Re: [BUG REPORT] linux-next/fs-next released on 6th September fails
 to boot
Message-ID: <20240909-arterien-zweit-3502f11b9f50@brauner>
References: <87v7z586py.fsf@debian-BULLSEYE-live-builder-AMD64>
 <20240909-einjagen-meterhoch-45c77ca03164@brauner>
 <CAJqdLrq+pScjJdnrp2jAZMqKEq-SyEjsBdb-=9QAFN6=h1=S5w@mail.gmail.com>
 <20240909-unwillig-irreal-26bd9fa085c6@brauner>
 <CAJqdLrqjD_vXVm48LG-9HM_wRsSFUg46rrWFL+o24n6dLgQJ6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJqdLrqjD_vXVm48LG-9HM_wRsSFUg46rrWFL+o24n6dLgQJ6g@mail.gmail.com>

On Mon, Sep 09, 2024 at 01:03:50PM GMT, Alexander Mikhalitsyn wrote:
> Am Mo., 9. Sept. 2024 um 13:00 Uhr schrieb Christian Brauner
> <brauner@kernel.org>:
> >
> > On Mon, Sep 09, 2024 at 12:55:53PM GMT, Alexander Mikhalitsyn wrote:
> > > Am Mo., 9. Sept. 2024 um 12:40 Uhr schrieb Christian Brauner
> > > <brauner@kernel.org>:
> > > >
> > > > On Mon, Sep 09, 2024 at 01:53:24PM GMT, Chandan Babu R wrote:
> > > > > Hi,
> > > > >
> > > > > linux-next/fs-next released on 6th September is failing to boot on a x86
> > > > > guest,
> > > > >
> > > > > [   42.659136] Oops: general protection fault, probably for non-canonical address 0xdffffc000000000b: 0000 [#1] PREEMPT SMP KASAN NOPTI
> > > > > [   42.660501] fbcon: Taking over console
> > > > > [   42.660930] KASAN: null-ptr-deref in range [0x0000000000000058-0x000000000000005f]
> > > > > [   42.661752] CPU: 1 UID: 0 PID: 1589 Comm: dtprobed Not tainted 6.11.0-rc6+ #1
> > > > > [   42.662565] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.6.6 08/22/2023
> > > > > [   42.663472] RIP: 0010:fuse_get_req+0x36b/0x990 [fuse]
> > > > > [   42.664046] Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 8c 05 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 6d 08 48 8d 7d 58 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 4d 05 00 00 f6 45 59 20 0f 85 06 03 00 00 48 83
> > > > > [   42.666945] RSP: 0018:ffffc900009a7730 EFLAGS: 00010212
> > > > > [   42.668837] RAX: dffffc0000000000 RBX: 1ffff92000134eed RCX: ffffffffc20dec9a
> > > > > [   42.670122] RDX: 000000000000000b RSI: 0000000000000008 RDI: 0000000000000058
> > > > > [   42.672154] RBP: 0000000000000000 R08: 0000000000000001 R09: ffffed1022110172
> > > > > [   42.672160] R10: ffff888110880b97 R11: ffffc900009a737a R12: 0000000000000001
> > > > > [   42.672179] R13: ffff888110880b60 R14: ffff888110880b90 R15: ffff888169973840
> > > > > [   42.672186] FS:  00007f28cd21d7c0(0000) GS:ffff8883ef280000(0000) knlGS:0000000000000000
> > > > > [   42.672191] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > > [   42.[ CR02: ;32m00007f3237366208 CR3: 0  OK  79e001 CR4: 0000000000770ef0
> > > > > [   42.672214] PKRU: 55555554
> > > > > [   42.672218] Call Trace:
> > > > > [   42.672223]  <TASK>
> > > > > [   42.672226]  ? die_addr+0x41/0xa0
> > > > > [   42.672238]  ? exc_general_protection+0x14c/0x230
> > > > > [   42.672250]  ? asm_exc_general_protection+0x26/0x30
> > > > > [   42.672260]  ? fuse_get_req+0x77a/0x990 [fuse]
> > > > > [   42.672281]  ? fuse_get_req+0x36b/0x990 [fuse]
> > > > > [   42.672300]  ? kasan_unpoison+0x27/0x60
> > > > > [   42.672310]  ? __pfx_fuse_get_req+0x10/0x10 [fuse]
> > > > > [   42.672327]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > > [   42.672333]  ? alloc_pages_mpol_noprof+0x195/0x440
> > > > > [   42.672340]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > > [   42.672345]  ? kasan_unpoison+0x27/0x60
> > > > > [   42.672350]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > > [   42.672355]  ? __kasan_slab_alloc+0x4d/0x90
> > > > > [   42.672362]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > > [   42.672367]  ? __kmalloc_cache_noprof+0x134/0x350
> > > > > [   42.672376]  fuse_simple_background+0xe7/0x180 [fuse]
> > > >
> > > > I think this is basically:
> > > >
> > > > fuse_simple_background()
> > > > -> !args->force
> > > >    -> fuse_get_req(NULL, fm, true);
> > > >
> > > > and there you have fm->sb->s_iflags & SB_I_NOIDMAP with idmap == NULL
> > > > afaict.
> > >
> > > Yeah, but fuse_get_req() is ready for idmap == NULL case:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/fs/fuse/dev.c?h=fs-next#n111
> > >
> > > It must be something else. Maybe there is a mistake during merge? I'll check.
> >
> > Oh yeah, I'm blind.
> >
> > Well, this is a background request? In that case can't the idmap go away
> > in the meantime and become freed? If so, then you need mnt_idmap_get()
> > and mnt_idmap_put().
> 
> It is a background request, but we handle all idmappings stuff when we
> form fuse_header structure for the userspace.
> So it is *before* all background stuff. Also, we never keep struct
> mnt_idmap pointers anywhere in fuse filesystem data structures.
> => no need to take references

Hm, ok but what about

        if (fuse_block_alloc(fc, for_background)) {
                err = -EINTR;
                if (wait_event_killable_exclusive(fc->blocked_waitq,
                                !fuse_block_alloc(fc, for_background)))
                        goto out;
        }

?

