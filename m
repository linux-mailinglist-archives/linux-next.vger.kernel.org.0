Return-Path: <linux-next+bounces-3706-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EC49719C2
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 14:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 764851C23041
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 12:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E1E1B7910;
	Mon,  9 Sep 2024 12:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="KTWcYZjK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471BD1B7904
	for <linux-next@vger.kernel.org>; Mon,  9 Sep 2024 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725885852; cv=none; b=XX88hs1rnlc2K98iHl+Nn6AHzZTrEmCluQ6NVi1jMXNE1P0wv/hQ5HJRjzn8YXqksjOiPjM36AtY9i1pIWIARDAnN2/EHjYF3xolH5YXxn+Tu6zNeZ7hM9DyGxDMGRnVR6MNqQpzR8mHei9NDUGBy2/+MNR8VyR6MfNa8sX30WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725885852; c=relaxed/simple;
	bh=W90+DW2hyuIx2V/cK5K00pKQBc830wB1/A+01XJ8lv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcLiUcTQusHMTxtLwOukSYK87GK/9EFe2NSmzpXSp7+NtRoPiXG9iSSSD6bGKxNhv7KX5cOaLeD4Z2mCM/uygqeGA3PWPcDT1h2m1kwdKOMIunSBuRLu1Ffh2QQkKR9vHIMkMDdHisg85TFM+4UWIB6EILczVVp9z9oD15X5KKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=KTWcYZjK; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f762de00e5so17897411fa.3
        for <linux-next@vger.kernel.org>; Mon, 09 Sep 2024 05:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1725885848; x=1726490648; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MYdG8XqcqntK7pP+CFb2AhfxxU7C6N7w8gzqJG0BTFU=;
        b=KTWcYZjKF0DppOFcVJgoAUud/NIgbFNsUBFv5j9n0WfFnfXo7fOzxDOHfJrdkSvxg9
         9158r4VSSEfRD0BhsXor+w3wsMqBxpKWnQ3sX35XnKOR72UuR/Me0N0U6GUgvPLtsbj+
         7bhBM6sjY7fb8VfT8K04JxYBFwsWKWRl2zNRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725885848; x=1726490648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYdG8XqcqntK7pP+CFb2AhfxxU7C6N7w8gzqJG0BTFU=;
        b=WkbmR7ue/tnAgv2B3I1So5fbuSfm6qG7a+Oqvk52KgdmuDCPn0s2W00S2/Vvny8gcq
         Ku2/DUQu83rWRAUDC2LbwwZMmyQDlV1LgGZxAm+fWtYb9oh0pRYN4tOxdNXJJ5BBvBfg
         rW8pN/ys/+ro6wgQqdcApBTVrl/bpcI34OWBJzxsVNo7Goh9k0d4zaim6u5E813zp/bP
         JoWSJe40MQN5oG05EBa1lKQ5KFprkUmSAmgS2Jm7Ju608dWygpuP3GYV3M+DPRLbrhy9
         3p295pMQ7/5M9wnbwpXFnNd1KW2tDb7XB7j7BoLHokqOTpwlpJi72FxdwKmCjQ0u5Jyf
         6Irg==
X-Forwarded-Encrypted: i=1; AJvYcCUU6/T05uF2YorUegCAkAG7UmJ9/o2K/FIBaFqRzJxHdwbaeVbw3AEpty3IbVT5ZY5e3mGVwjM5ua1G@vger.kernel.org
X-Gm-Message-State: AOJu0YzpnTABJNb6ocO3JzeWL30ygqupTY0aw3kL9KQpEPzvM2t+DU4L
	J2qOnnheM6B4za9FVBmNBekCEP2lwo+qnBJNHSyfdzObb24ZJHbuJthfRC3DIWjmwhReydu1GZJ
	CEcM/9khL2OOnjCNeaKn/Qcw7ex96HDCOJfaFSg==
X-Google-Smtp-Source: AGHT+IFFFJ6aSbdwKQfCJGlTAx0KlS8LkoY9mpDupII7tabKZPxhESuSjPiBuwP7KrpAO6X67oTGaXhql6YeDguG9Mk=
X-Received: by 2002:a05:651c:542:b0:2f6:6202:bfd5 with SMTP id
 38308e7fff4ca-2f751f6a2c7mr69862671fa.34.1725885847658; Mon, 09 Sep 2024
 05:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87v7z586py.fsf@debian-BULLSEYE-live-builder-AMD64>
 <20240909-einjagen-meterhoch-45c77ca03164@brauner> <CAJqdLrq+pScjJdnrp2jAZMqKEq-SyEjsBdb-=9QAFN6=h1=S5w@mail.gmail.com>
 <20240909-unwillig-irreal-26bd9fa085c6@brauner> <CAJqdLrqjD_vXVm48LG-9HM_wRsSFUg46rrWFL+o24n6dLgQJ6g@mail.gmail.com>
 <20240909-arterien-zweit-3502f11b9f50@brauner> <CAJqdLrpA4B3rKOWcwYyBA14ofPiSba2qrAggYBE2D_h70zni2A@mail.gmail.com>
 <20240909-zumal-revision-8af9dc0593e5@brauner>
In-Reply-To: <20240909-zumal-revision-8af9dc0593e5@brauner>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Mon, 9 Sep 2024 14:43:56 +0200
Message-ID: <CAJqdLrrz-DH0YLbMFt951c4jiZMAiCVcS0YR3Mz-y=O3zNn6Kg@mail.gmail.com>
Subject: Re: [BUG REPORT] linux-next/fs-next released on 6th September fails
 to boot
To: Christian Brauner <brauner@kernel.org>
Cc: Chandan Babu R <chandanbabu@kernel.org>, linux-next@vger.kernel.org, mszeredi@redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Mo., 9. Sept. 2024 um 14:32 Uhr schrieb Christian Brauner
<brauner@kernel.org>:
>
> On Mon, Sep 09, 2024 at 01:19:11PM GMT, Alexander Mikhalitsyn wrote:
> > Am Mo., 9. Sept. 2024 um 13:07 Uhr schrieb Christian Brauner
> > <brauner@kernel.org>:
> > >
> > > On Mon, Sep 09, 2024 at 01:03:50PM GMT, Alexander Mikhalitsyn wrote:
> > > > Am Mo., 9. Sept. 2024 um 13:00 Uhr schrieb Christian Brauner
> > > > <brauner@kernel.org>:
> > > > >
> > > > > On Mon, Sep 09, 2024 at 12:55:53PM GMT, Alexander Mikhalitsyn wrote:
> > > > > > Am Mo., 9. Sept. 2024 um 12:40 Uhr schrieb Christian Brauner
> > > > > > <brauner@kernel.org>:
> > > > > > >
> > > > > > > On Mon, Sep 09, 2024 at 01:53:24PM GMT, Chandan Babu R wrote:
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > linux-next/fs-next released on 6th September is failing to boot on a x86
> > > > > > > > guest,
> > > > > > > >
> > > > > > > > [   42.659136] Oops: general protection fault, probably for non-canonical address 0xdffffc000000000b: 0000 [#1] PREEMPT SMP KASAN NOPTI
> > > > > > > > [   42.660501] fbcon: Taking over console
> > > > > > > > [   42.660930] KASAN: null-ptr-deref in range [0x0000000000000058-0x000000000000005f]
> > > > > > > > [   42.661752] CPU: 1 UID: 0 PID: 1589 Comm: dtprobed Not tainted 6.11.0-rc6+ #1
> > > > > > > > [   42.662565] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.6.6 08/22/2023
> > > > > > > > [   42.663472] RIP: 0010:fuse_get_req+0x36b/0x990 [fuse]
> > > > > > > > [   42.664046] Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 8c 05 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 6d 08 48 8d 7d 58 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 4d 05 00 00 f6 45 59 20 0f 85 06 03 00 00 48 83
> > > > > > > > [   42.666945] RSP: 0018:ffffc900009a7730 EFLAGS: 00010212
> > > > > > > > [   42.668837] RAX: dffffc0000000000 RBX: 1ffff92000134eed RCX: ffffffffc20dec9a
> > > > > > > > [   42.670122] RDX: 000000000000000b RSI: 0000000000000008 RDI: 0000000000000058
> > > > > > > > [   42.672154] RBP: 0000000000000000 R08: 0000000000000001 R09: ffffed1022110172
> > > > > > > > [   42.672160] R10: ffff888110880b97 R11: ffffc900009a737a R12: 0000000000000001
> > > > > > > > [   42.672179] R13: ffff888110880b60 R14: ffff888110880b90 R15: ffff888169973840
> > > > > > > > [   42.672186] FS:  00007f28cd21d7c0(0000) GS:ffff8883ef280000(0000) knlGS:0000000000000000
> > > > > > > > [   42.672191] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > > > > > [   42.[ CR02: ;32m00007f3237366208 CR3: 0  OK  79e001 CR4: 0000000000770ef0
> > > > > > > > [   42.672214] PKRU: 55555554
> > > > > > > > [   42.672218] Call Trace:
> > > > > > > > [   42.672223]  <TASK>
> > > > > > > > [   42.672226]  ? die_addr+0x41/0xa0
> > > > > > > > [   42.672238]  ? exc_general_protection+0x14c/0x230
> > > > > > > > [   42.672250]  ? asm_exc_general_protection+0x26/0x30
> > > > > > > > [   42.672260]  ? fuse_get_req+0x77a/0x990 [fuse]
> > > > > > > > [   42.672281]  ? fuse_get_req+0x36b/0x990 [fuse]
> > > > > > > > [   42.672300]  ? kasan_unpoison+0x27/0x60
> > > > > > > > [   42.672310]  ? __pfx_fuse_get_req+0x10/0x10 [fuse]
> > > > > > > > [   42.672327]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > > > > > [   42.672333]  ? alloc_pages_mpol_noprof+0x195/0x440
> > > > > > > > [   42.672340]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > > > > > [   42.672345]  ? kasan_unpoison+0x27/0x60
> > > > > > > > [   42.672350]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > > > > > [   42.672355]  ? __kasan_slab_alloc+0x4d/0x90
> > > > > > > > [   42.672362]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > > > > > [   42.672367]  ? __kmalloc_cache_noprof+0x134/0x350
> > > > > > > > [   42.672376]  fuse_simple_background+0xe7/0x180 [fuse]
> > > > > > >
> > > > > > > I think this is basically:
> > > > > > >
> > > > > > > fuse_simple_background()
> > > > > > > -> !args->force
> > > > > > >    -> fuse_get_req(NULL, fm, true);
> > > > > > >
> > > > > > > and there you have fm->sb->s_iflags & SB_I_NOIDMAP with idmap == NULL
> > > > > > > afaict.
> > > > > >
> > > > > > Yeah, but fuse_get_req() is ready for idmap == NULL case:
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/fs/fuse/dev.c?h=fs-next#n111
> > > > > >
> > > > > > It must be something else. Maybe there is a mistake during merge? I'll check.
> > > > >
> > > > > Oh yeah, I'm blind.
> > > > >
> > > > > Well, this is a background request? In that case can't the idmap go away
> > > > > in the meantime and become freed? If so, then you need mnt_idmap_get()
> > > > > and mnt_idmap_put().
> > > >
> > > > It is a background request, but we handle all idmappings stuff when we
> > > > form fuse_header structure for the userspace.
> > > > So it is *before* all background stuff. Also, we never keep struct
> > > > mnt_idmap pointers anywhere in fuse filesystem data structures.
> > > > => no need to take references
> > >
> > > Hm, ok but what about
> > >
> > >         if (fuse_block_alloc(fc, for_background)) {
> > >                 err = -EINTR;
> > >                 if (wait_event_killable_exclusive(fc->blocked_waitq,
> > >                                 !fuse_block_alloc(fc, for_background)))
> > >                         goto out;
> > >         }
> > >
> > > ?
> >
> > Yes, we can sleep on this thing (and do a context switch), but won't
> > leave the fuse_get_req()
> > function and nobody can free idmap before we exit from fuse_get_req()
> > and all the functions upper the stack.
> >
> > So, my point is that if we use an idmap pointer from a VFS callback
> > argument and never preserve this pointer anywhere in
> > other data structures (but just pass it down the stack to helper
> > functions) then we don't need to care about the idmap lifetime because
> > it's controlled automatically. But if we start to deal with idmap in
> > rcu callbacks, works, kthreads (like it was in cephfs) then yes. We do
> > care.
> >
> > Please, correct me if I'm saying something stupid :)
>
> No, you're right. I'm task switching too much. It should also be

I can imagine ;-)

No worries about this one, I'll debug it and get back with results.

> irrelevant here since @idmap is NULL anyway in your current patch.

