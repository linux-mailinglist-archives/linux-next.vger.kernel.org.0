Return-Path: <linux-next+bounces-3697-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4A6971638
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 13:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6926B26677
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 11:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C49C1B5327;
	Mon,  9 Sep 2024 11:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0K9QNXA"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF481B3B2E
	for <linux-next@vger.kernel.org>; Mon,  9 Sep 2024 11:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879945; cv=none; b=QqGTNM/ktJk3hX87Eb2aSnpzwLDQTycssBnFRsBx6gRQ8l/2EcOaaDbPt4QmXMFnKVnL3usv8tpg2WgMypCCCgXwLL8Hl7cEakim+R4cHWbi6WGVk88B1Pi9Bib41oNN+33F0IxtA92PaondTu0EFEJC5zFM8b6Km7HMeaW9fj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879945; c=relaxed/simple;
	bh=vmSu9VDetZGE/LkdFi1kqiqVlJXSE8WQwUWMqyRhGg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gdl2Q4DjPmVqR3cPc6vfKJiU7mTvn3AdE59MRQ7Bp0/kAB3dPMZCBIEu8QH3IWaq5yqx0JH6xy45kKZkkvLbCgel+Q3zAAgz8LIIkv4Z9/6/XEcvpqGfFFyWLcHTSEOY6vyRQMlVE2CJwY6Kl6nFhE7FjBo41ojpaVNuf/tO83g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0K9QNXA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CADEC4CEC5;
	Mon,  9 Sep 2024 11:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725879945;
	bh=vmSu9VDetZGE/LkdFi1kqiqVlJXSE8WQwUWMqyRhGg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0K9QNXAf62FZJAubTy3Qvpn6cIytC84a0Zm0xp07B1Xt3I2qqbsVTbctkmkXJYi7
	 33kG9tYt4MIziAvdayMypyaICgAxewQgo0SMnyVCq6Tlp1ke4l2PprFNzx8+C3ucSh
	 Jqzc7fzEXWJtXU6UbP18rPd/Wve8TGPLu342BWplyBaGPn/cT7asrqwJR6hEAyufWz
	 ckYBhoJXNCAGSL/ImmIV7tMG4gndKqESxeQKYdeE0MDakpSUBUOny2QVRkRXN+FG5s
	 DyxY3CGZZp4998+89sPdoQKZN2NkilYhipbLvebN+2opVz6WtvO53BN+8DRpZh5tqs
	 6T65u36rM9h9Q==
Date: Mon, 9 Sep 2024 13:05:41 +0200
From: Christian Brauner <brauner@kernel.org>
To: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Cc: Chandan Babu R <chandanbabu@kernel.org>, linux-next@vger.kernel.org, 
	mszeredi@redhat.com
Subject: Re: [BUG REPORT] linux-next/fs-next released on 6th September fails
 to boot
Message-ID: <20240909-seenotrettung-skilanglauf-020233fc1838@brauner>
References: <87v7z586py.fsf@debian-BULLSEYE-live-builder-AMD64>
 <20240909-einjagen-meterhoch-45c77ca03164@brauner>
 <CAJqdLrq+pScjJdnrp2jAZMqKEq-SyEjsBdb-=9QAFN6=h1=S5w@mail.gmail.com>
 <20240909-unwillig-irreal-26bd9fa085c6@brauner>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909-unwillig-irreal-26bd9fa085c6@brauner>

On Mon, Sep 09, 2024 at 01:00:27PM GMT, Christian Brauner wrote:
> On Mon, Sep 09, 2024 at 12:55:53PM GMT, Alexander Mikhalitsyn wrote:
> > Am Mo., 9. Sept. 2024 um 12:40 Uhr schrieb Christian Brauner
> > <brauner@kernel.org>:
> > >
> > > On Mon, Sep 09, 2024 at 01:53:24PM GMT, Chandan Babu R wrote:
> > > > Hi,
> > > >
> > > > linux-next/fs-next released on 6th September is failing to boot on a x86
> > > > guest,
> > > >
> > > > [   42.659136] Oops: general protection fault, probably for non-canonical address 0xdffffc000000000b: 0000 [#1] PREEMPT SMP KASAN NOPTI
> > > > [   42.660501] fbcon: Taking over console
> > > > [   42.660930] KASAN: null-ptr-deref in range [0x0000000000000058-0x000000000000005f]
> > > > [   42.661752] CPU: 1 UID: 0 PID: 1589 Comm: dtprobed Not tainted 6.11.0-rc6+ #1
> > > > [   42.662565] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.6.6 08/22/2023
> > > > [   42.663472] RIP: 0010:fuse_get_req+0x36b/0x990 [fuse]
> > > > [   42.664046] Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 8c 05 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 6d 08 48 8d 7d 58 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 4d 05 00 00 f6 45 59 20 0f 85 06 03 00 00 48 83
> > > > [   42.666945] RSP: 0018:ffffc900009a7730 EFLAGS: 00010212
> > > > [   42.668837] RAX: dffffc0000000000 RBX: 1ffff92000134eed RCX: ffffffffc20dec9a
> > > > [   42.670122] RDX: 000000000000000b RSI: 0000000000000008 RDI: 0000000000000058
> > > > [   42.672154] RBP: 0000000000000000 R08: 0000000000000001 R09: ffffed1022110172
> > > > [   42.672160] R10: ffff888110880b97 R11: ffffc900009a737a R12: 0000000000000001
> > > > [   42.672179] R13: ffff888110880b60 R14: ffff888110880b90 R15: ffff888169973840
> > > > [   42.672186] FS:  00007f28cd21d7c0(0000) GS:ffff8883ef280000(0000) knlGS:0000000000000000
> > > > [   42.672191] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > [   42.[ CR02: ;32m00007f3237366208 CR3: 0  OK  79e001 CR4: 0000000000770ef0
> > > > [   42.672214] PKRU: 55555554
> > > > [   42.672218] Call Trace:
> > > > [   42.672223]  <TASK>
> > > > [   42.672226]  ? die_addr+0x41/0xa0
> > > > [   42.672238]  ? exc_general_protection+0x14c/0x230
> > > > [   42.672250]  ? asm_exc_general_protection+0x26/0x30
> > > > [   42.672260]  ? fuse_get_req+0x77a/0x990 [fuse]
> > > > [   42.672281]  ? fuse_get_req+0x36b/0x990 [fuse]
> > > > [   42.672300]  ? kasan_unpoison+0x27/0x60
> > > > [   42.672310]  ? __pfx_fuse_get_req+0x10/0x10 [fuse]
> > > > [   42.672327]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > [   42.672333]  ? alloc_pages_mpol_noprof+0x195/0x440
> > > > [   42.672340]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > [   42.672345]  ? kasan_unpoison+0x27/0x60
> > > > [   42.672350]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > [   42.672355]  ? __kasan_slab_alloc+0x4d/0x90
> > > > [   42.672362]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > [   42.672367]  ? __kmalloc_cache_noprof+0x134/0x350
> > > > [   42.672376]  fuse_simple_background+0xe7/0x180 [fuse]
> > >
> > > I think this is basically:
> > >
> > > fuse_simple_background()
> > > -> !args->force
> > >    -> fuse_get_req(NULL, fm, true);
> > >
> > > and there you have fm->sb->s_iflags & SB_I_NOIDMAP with idmap == NULL
> > > afaict.
> > 
> > Yeah, but fuse_get_req() is ready for idmap == NULL case:
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/fs/fuse/dev.c?h=fs-next#n111
> > 
> > It must be something else. Maybe there is a mistake during merge? I'll check.
> 
> Oh yeah, I'm blind.
> 
> Well, this is a background request? In that case can't the idmap go away
> in the meantime and become freed? If so, then you need mnt_idmap_get()
> and mnt_idmap_put().

So sm like:

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 7885f071fa1e..a7bf7f6d17e6 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -117,6 +117,10 @@ static struct fuse_req *fuse_get_req(struct mnt_idmap *idmap,
        int err;
        atomic_inc(&fc->num_waiting);

+       /* Ensure that @idmap can't just go away. */
+       if (for_background)
+               mnt_idmap_get(idmap);
+
        if (fuse_block_alloc(fc, for_background)) {
                err = -EINTR;
                if (wait_event_killable_exclusive(fc->blocked_waitq,
@@ -166,6 +170,8 @@ static struct fuse_req *fuse_get_req(struct mnt_idmap *idmap,
                if (unlikely(req->in.h.uid == ((uid_t)-1) ||
                             req->in.h.gid == ((gid_t)-1))) {
                        fuse_put_request(req);
+                       if (for_background)
+                               mnt_idmap_put(idmap);
                        return ERR_PTR(-EOVERFLOW);
                }
        } else {

