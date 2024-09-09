Return-Path: <linux-next+bounces-3712-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD689971ED5
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 18:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74869285893
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 16:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093B53D38E;
	Mon,  9 Sep 2024 16:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="iRHL9TI0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5057D1BC39
	for <linux-next@vger.kernel.org>; Mon,  9 Sep 2024 16:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725898306; cv=none; b=j7/0Wk6RnQUIe7cjX2EAw7rmuwvVNNADNEvmceVPZTRAEgnZLHMpkFWmf2vdUW/oEkt4WwMjKG+hNuHBqe2yVytrYjgJIMiod7L+sLmPzVnFJQgljQR8ozqCXTAzCUovLsg94SoUbMgwikbTCsdSDXtxfJXreZuCU3Jkt9RudHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725898306; c=relaxed/simple;
	bh=R3zfAwne5wA6VgSy8mj1QUEYgGy3lHFRn0t76TNTuEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/6GZTsIVNt5+ix1XEN4n+/xk7MrTgkUnzDxTM2Tx+HRY8SayQjU1kzeEn9ifpgPS8/lFC7Uppf7kRyA3mv5kwWpSn0UTRTdomiDmoPGJA0S3mQMCz8jkxvAcuLB0ybHDQwOb5MDeRJR34lACAPz8QhbfBZBjcE40cGX3dRA660=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=iRHL9TI0; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f763e9e759so19127811fa.3
        for <linux-next@vger.kernel.org>; Mon, 09 Sep 2024 09:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1725898301; x=1726503101; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1cPu5RvI6FYsrey/6vk4jSOCV6O0Iy6fDn284yEEV2k=;
        b=iRHL9TI0s1soauKaVRnJZgvmLGmPPcVP2sIgBS+zHXUs/ICECitECMnRGkKtBsL6iF
         3uYYZInSjciQ0BTgzlM7BHrBeDDF0nrCccB2wHt+RLm3nNl1Bn6O8VEEASKMhRlUWUct
         a4GJb+QP63JhROrDzSJ/EhXf+1/A6wZGbrM+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725898301; x=1726503101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cPu5RvI6FYsrey/6vk4jSOCV6O0Iy6fDn284yEEV2k=;
        b=e55RyNfyktGH1NI/CFZlW0a3xKQSYmSucXqyelYeWO/56CEFHVuZ1U6qlkwku9AuIT
         /TuiqqwRqbN1+wk67ncTsadrGaakF6sjx4kMuc51uG5U3rXaHdhlKxacLaBLndSP1yUV
         LQGsxU/eqc0sVTyfodXlbs4pZc6iNqw2kI2YbVUr44vvhZ/o/Lfz6Jj+lop0MWp2MPsA
         ANoHiafJBhgvlZPySv519w/sd8oL75+INXe7WgZFSrYwS07c7p88PW2etXVzKr9yzwZl
         GjGY7DWK14pnbvWjYOmS9r4Tvd1wcPOFlA5sqB2WFFLtRJMtRXDZGqRcjmP+IrYiZg7t
         8LqA==
X-Gm-Message-State: AOJu0Yw0d8WB8btrZY6B6pmtMqmISeiCnvTQwaDtze5RABKitW24uRQd
	yrzR+lPxctXxGLEUn0R+Snz6x8FtX2WqS/EsJ3Ec3MZIoP1Ya+GZVWEE6in77cZR8m6C/ULsTyX
	m6Q+4rnv17NO0umjH8GiCGB9KQ1SYYvZOa6tbKg==
X-Google-Smtp-Source: AGHT+IE3HuAkiZPIzYcFxEk+xYeGCtK3VCyQkPXSxBQRm7LddCoEnEIhNQATAwibWV0tIktaqEK9ymqlv06up3IoXC8=
X-Received: by 2002:a2e:bc0a:0:b0:2ef:2e6b:4105 with SMTP id
 38308e7fff4ca-2f751f67ea2mr79380641fa.34.1725898300666; Mon, 09 Sep 2024
 09:11:40 -0700 (PDT)
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
 <20240909-zumal-revision-8af9dc0593e5@brauner> <CAJqdLrrz-DH0YLbMFt951c4jiZMAiCVcS0YR3Mz-y=O3zNn6Kg@mail.gmail.com>
 <CAJqdLrpwuaPG3PoFwbxPRp8GrbEWooXazrMZgV4Wj=FK=vq=6A@mail.gmail.com>
In-Reply-To: <CAJqdLrpwuaPG3PoFwbxPRp8GrbEWooXazrMZgV4Wj=FK=vq=6A@mail.gmail.com>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Mon, 9 Sep 2024 18:11:29 +0200
Message-ID: <CAJqdLros2VVCXQ8RK4FeU1+=oX4=K64i7dxbDor+RUepFNJzJA@mail.gmail.com>
Subject: Re: [BUG REPORT] linux-next/fs-next released on 6th September fails
 to boot
To: Chandan Babu R <chandanbabu@kernel.org>
Cc: linux-next@vger.kernel.org, mszeredi@redhat.com, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"

I'll send a patch with this fix a bit later, once
https://lore.kernel.org/linux-fsdevel/20240906143453.179506-1-aleksandr.mikhalitsyn@canonical.com/
is merged to prevent merge conflicts later on.

Am Mo., 9. Sept. 2024 um 17:56 Uhr schrieb Alexander Mikhalitsyn
<alexander@mihalicyn.com>:
>
> Dear Chandan,
>
> Please can you check if the following patch resolves issue for your workload:
>
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 7885f071fa1e..f130b23d6850 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -148,7 +148,7 @@ static struct fuse_req *fuse_get_req(struct
> mnt_idmap *idmap,
>         if (for_background)
>                 __set_bit(FR_BACKGROUND, &req->flags);
>
> -       if ((fm->sb->s_iflags & SB_I_NOIDMAP) || idmap) {
> +       if (!fm->sb || (fm->sb->s_iflags & SB_I_NOIDMAP) || idmap) {
>                 kuid_t idmapped_fsuid;
>                 kgid_t idmapped_fsgid;
>
> From your call stack if looks caused by CUSE case.
> It's my bad that I have not considered this use case for
> fuse_get_req() and there is, obviously,
> no such thing as fm->sb for CUSE scenario.
>
> I'm really sorry about that.
>
> Kind regards,
> Alex
>
> Am Mo., 9. Sept. 2024 um 14:43 Uhr schrieb Alexander Mikhalitsyn
> <alexander@mihalicyn.com>:
> >
> > Am Mo., 9. Sept. 2024 um 14:32 Uhr schrieb Christian Brauner
> > <brauner@kernel.org>:
> > >
> > > On Mon, Sep 09, 2024 at 01:19:11PM GMT, Alexander Mikhalitsyn wrote:
> > > > Am Mo., 9. Sept. 2024 um 13:07 Uhr schrieb Christian Brauner
> > > > <brauner@kernel.org>:
> > > > >
> > > > > On Mon, Sep 09, 2024 at 01:03:50PM GMT, Alexander Mikhalitsyn wrote:
> > > > > > Am Mo., 9. Sept. 2024 um 13:00 Uhr schrieb Christian Brauner
> > > > > > <brauner@kernel.org>:
> > > > > > >
> > > > > > > On Mon, Sep 09, 2024 at 12:55:53PM GMT, Alexander Mikhalitsyn wrote:
> > > > > > > > Am Mo., 9. Sept. 2024 um 12:40 Uhr schrieb Christian Brauner
> > > > > > > > <brauner@kernel.org>:
> > > > > > > > >
> > > > > > > > > On Mon, Sep 09, 2024 at 01:53:24PM GMT, Chandan Babu R wrote:
> > > > > > > > > > Hi,
> > > > > > > > > >
> > > > > > > > > > linux-next/fs-next released on 6th September is failing to boot on a x86
> > > > > > > > > > guest,
> > > > > > > > > >
> > > > > > > > > > [   42.659136] Oops: general protection fault, probably for non-canonical address 0xdffffc000000000b: 0000 [#1] PREEMPT SMP KASAN NOPTI
> > > > > > > > > > [   42.660501] fbcon: Taking over console
> > > > > > > > > > [   42.660930] KASAN: null-ptr-deref in range [0x0000000000000058-0x000000000000005f]
> > > > > > > > > > [   42.661752] CPU: 1 UID: 0 PID: 1589 Comm: dtprobed Not tainted 6.11.0-rc6+ #1
> > > > > > > > > > [   42.662565] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.6.6 08/22/2023
> > > > > > > > > > [   42.663472] RIP: 0010:fuse_get_req+0x36b/0x990 [fuse]
> > > > > > > > > > [   42.664046] Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 8c 05 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 6d 08 48 8d 7d 58 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 4d 05 00 00 f6 45 59 20 0f 85 06 03 00 00 48 83
> > > > > > > > > > [   42.666945] RSP: 0018:ffffc900009a7730 EFLAGS: 00010212
> > > > > > > > > > [   42.668837] RAX: dffffc0000000000 RBX: 1ffff92000134eed RCX: ffffffffc20dec9a
> > > > > > > > > > [   42.670122] RDX: 000000000000000b RSI: 0000000000000008 RDI: 0000000000000058
> > > > > > > > > > [   42.672154] RBP: 0000000000000000 R08: 0000000000000001 R09: ffffed1022110172
> > > > > > > > > > [   42.672160] R10: ffff888110880b97 R11: ffffc900009a737a R12: 0000000000000001
> > > > > > > > > > [   42.672179] R13: ffff888110880b60 R14: ffff888110880b90 R15: ffff888169973840
> > > > > > > > > > [   42.672186] FS:  00007f28cd21d7c0(0000) GS:ffff8883ef280000(0000) knlGS:0000000000000000
> > > > > > > > > > [   42.672191] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > > > > > > > [   42.[ CR02: ;32m00007f3237366208 CR3: 0  OK  79e001 CR4: 0000000000770ef0
> > > > > > > > > > [   42.672214] PKRU: 55555554
> > > > > > > > > > [   42.672218] Call Trace:
> > > > > > > > > > [   42.672223]  <TASK>
> > > > > > > > > > [   42.672226]  ? die_addr+0x41/0xa0
> > > > > > > > > > [   42.672238]  ? exc_general_protection+0x14c/0x230
> > > > > > > > > > [   42.672250]  ? asm_exc_general_protection+0x26/0x30
> > > > > > > > > > [   42.672260]  ? fuse_get_req+0x77a/0x990 [fuse]
> > > > > > > > > > [   42.672281]  ? fuse_get_req+0x36b/0x990 [fuse]
> > > > > > > > > > [   42.672300]  ? kasan_unpoison+0x27/0x60
> > > > > > > > > > [   42.672310]  ? __pfx_fuse_get_req+0x10/0x10 [fuse]
> > > > > > > > > > [   42.672327]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > > > > > > > [   42.672333]  ? alloc_pages_mpol_noprof+0x195/0x440
> > > > > > > > > > [   42.672340]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > > > > > > > [   42.672345]  ? kasan_unpoison+0x27/0x60
> > > > > > > > > > [   42.672350]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > > > > > > > [   42.672355]  ? __kasan_slab_alloc+0x4d/0x90
> > > > > > > > > > [   42.672362]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > > > > > > > [   42.672367]  ? __kmalloc_cache_noprof+0x134/0x350
> > > > > > > > > > [   42.672376]  fuse_simple_background+0xe7/0x180 [fuse]
> > > > > > > > >
> > > > > > > > > I think this is basically:
> > > > > > > > >
> > > > > > > > > fuse_simple_background()
> > > > > > > > > -> !args->force
> > > > > > > > >    -> fuse_get_req(NULL, fm, true);
> > > > > > > > >
> > > > > > > > > and there you have fm->sb->s_iflags & SB_I_NOIDMAP with idmap == NULL
> > > > > > > > > afaict.
> > > > > > > >
> > > > > > > > Yeah, but fuse_get_req() is ready for idmap == NULL case:
> > > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/fs/fuse/dev.c?h=fs-next#n111
> > > > > > > >
> > > > > > > > It must be something else. Maybe there is a mistake during merge? I'll check.
> > > > > > >
> > > > > > > Oh yeah, I'm blind.
> > > > > > >
> > > > > > > Well, this is a background request? In that case can't the idmap go away
> > > > > > > in the meantime and become freed? If so, then you need mnt_idmap_get()
> > > > > > > and mnt_idmap_put().
> > > > > >
> > > > > > It is a background request, but we handle all idmappings stuff when we
> > > > > > form fuse_header structure for the userspace.
> > > > > > So it is *before* all background stuff. Also, we never keep struct
> > > > > > mnt_idmap pointers anywhere in fuse filesystem data structures.
> > > > > > => no need to take references
> > > > >
> > > > > Hm, ok but what about
> > > > >
> > > > >         if (fuse_block_alloc(fc, for_background)) {
> > > > >                 err = -EINTR;
> > > > >                 if (wait_event_killable_exclusive(fc->blocked_waitq,
> > > > >                                 !fuse_block_alloc(fc, for_background)))
> > > > >                         goto out;
> > > > >         }
> > > > >
> > > > > ?
> > > >
> > > > Yes, we can sleep on this thing (and do a context switch), but won't
> > > > leave the fuse_get_req()
> > > > function and nobody can free idmap before we exit from fuse_get_req()
> > > > and all the functions upper the stack.
> > > >
> > > > So, my point is that if we use an idmap pointer from a VFS callback
> > > > argument and never preserve this pointer anywhere in
> > > > other data structures (but just pass it down the stack to helper
> > > > functions) then we don't need to care about the idmap lifetime because
> > > > it's controlled automatically. But if we start to deal with idmap in
> > > > rcu callbacks, works, kthreads (like it was in cephfs) then yes. We do
> > > > care.
> > > >
> > > > Please, correct me if I'm saying something stupid :)
> > >
> > > No, you're right. I'm task switching too much. It should also be
> >
> > I can imagine ;-)
> >
> > No worries about this one, I'll debug it and get back with results.
> >
> > > irrelevant here since @idmap is NULL anyway in your current patch.

