Return-Path: <linux-next+bounces-3693-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A61FB9715BD
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 12:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CAA01F21FB6
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 10:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8731AF4E3;
	Mon,  9 Sep 2024 10:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="YOJp4V0H"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E859D1B4C4F
	for <linux-next@vger.kernel.org>; Mon,  9 Sep 2024 10:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879370; cv=none; b=buPhJsJmwM0NmjaO9+Z72NPleJnjkVzhcoaieg9l4rY47GJfYPVRtV0LMdyXXBfd40N2fbA0iXYz7yG1tUn6/ggS1wwmTQAgEKR6ek/BHK1kiOrI2YBr3asajGCLXJgyE9onPMqkD4n5hjJivuYQppuk/VBOPX176pMQxwSO5pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879370; c=relaxed/simple;
	bh=E/RPBnBQ0vDQ1tNdCLimTR7gwv/XWd/yi5M09Fe5HqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BKanpQzaRIpw4NkXZXSsdiETbqkGbqukg6V6KZtqn5EVaPQqtKMewKpKoaNWA/zL10YqtaekJvpsKgmVgrM1NyGR7ZpjnbyKA0AmQ+fmAkfTIdPdmjBLpBa1U08pNxyV6muN3I06KDoVxvWGasK66TXXE+yvt3DM8jBTrtIGCvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=YOJp4V0H; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5353cd2fa28so5065177e87.3
        for <linux-next@vger.kernel.org>; Mon, 09 Sep 2024 03:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1725879366; x=1726484166; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2rkAVkuhjxF+qFElh4Mc6AbItl6PIN4dnDx2TZy5Ces=;
        b=YOJp4V0H2sP+4qRwYeFF8XRCObul8SP/xgZzov5S30E6XkCPdd43e2uygCvF3MYkcT
         08ECxMCPZd31ZvvZ4GSq1FmwNs4HlhzhmLB/vL1kSt4VIjIvubgpX4J/+e2i+Ks0VqoQ
         qw+CA7nD/F87RgE5HHlc/V2UROoue7DKmqKi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879366; x=1726484166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2rkAVkuhjxF+qFElh4Mc6AbItl6PIN4dnDx2TZy5Ces=;
        b=L5er/rID7FtO7yq5KoDj4VN/2mw0+XvL1pYSxWiNADcBk1WBJAKB70otJhmddT853K
         pAyeB506P82HQketjd/kDsE8BMbIg0Yxl/yozJCMc7vQwFzUI33rXEk1/Nx+eSaNINYH
         YuA3+vSJMgu6DnLtYrw1pma3Y2dnzEeILju2rg7f2+IvVJNbSaEciTJuKSyXH0KksHbb
         qFb6sSakjtZXr+BedBk2luqzearyaM14dxVecx4EblHXZA6vtBAMpH9HUe0qwMk6ExDu
         IDsMnTgfHFUkdc1RxW/7yDdD0vMHBRQCgnaR+9MIx5zoXHsIfA/YZhugNhLVuABi1ZS0
         i3eA==
X-Forwarded-Encrypted: i=1; AJvYcCWM2ZliJVyBQK8ev3esIJMj3Cff46wdMCUNA16hMNfbckF/DaCwqGKGMLj257cATibmJcHiCuwggFe9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9f6bCDv+/kXLK4TfpLKt8oDTIb9t0ZGT4SLtYJ52diFxcVgGj
	82Y2afRrU5fJFMAeDgWypDr+AO8FxKrm6jdgea88PiWvobEXxZNvixs0hPtv+LtiJh3Y/QDkDYC
	q5ymm150Wgzfvc/rgFKwORj4koxuQKWMPcIY4yw==
X-Google-Smtp-Source: AGHT+IGm9MQaw2xliP8Pw11Ta4hc5zUXql3G1mOv0f9i/ePy61T5h3zCH2rQxvZwnxAfqgY5ii2cOMFt64bdvK/SGxI=
X-Received: by 2002:a05:6512:3ca6:b0:536:55a8:6f78 with SMTP id
 2adb3069b0e04-536587b032amr7385327e87.17.1725879364755; Mon, 09 Sep 2024
 03:56:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87v7z586py.fsf@debian-BULLSEYE-live-builder-AMD64> <20240909-einjagen-meterhoch-45c77ca03164@brauner>
In-Reply-To: <20240909-einjagen-meterhoch-45c77ca03164@brauner>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Mon, 9 Sep 2024 12:55:53 +0200
Message-ID: <CAJqdLrq+pScjJdnrp2jAZMqKEq-SyEjsBdb-=9QAFN6=h1=S5w@mail.gmail.com>
Subject: Re: [BUG REPORT] linux-next/fs-next released on 6th September fails
 to boot
To: Christian Brauner <brauner@kernel.org>
Cc: Chandan Babu R <chandanbabu@kernel.org>, linux-next@vger.kernel.org, mszeredi@redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Mo., 9. Sept. 2024 um 12:40 Uhr schrieb Christian Brauner
<brauner@kernel.org>:
>
> On Mon, Sep 09, 2024 at 01:53:24PM GMT, Chandan Babu R wrote:
> > Hi,
> >
> > linux-next/fs-next released on 6th September is failing to boot on a x86
> > guest,
> >
> > [   42.659136] Oops: general protection fault, probably for non-canonical address 0xdffffc000000000b: 0000 [#1] PREEMPT SMP KASAN NOPTI
> > [   42.660501] fbcon: Taking over console
> > [   42.660930] KASAN: null-ptr-deref in range [0x0000000000000058-0x000000000000005f]
> > [   42.661752] CPU: 1 UID: 0 PID: 1589 Comm: dtprobed Not tainted 6.11.0-rc6+ #1
> > [   42.662565] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.6.6 08/22/2023
> > [   42.663472] RIP: 0010:fuse_get_req+0x36b/0x990 [fuse]
> > [   42.664046] Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 8c 05 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 6d 08 48 8d 7d 58 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 4d 05 00 00 f6 45 59 20 0f 85 06 03 00 00 48 83
> > [   42.666945] RSP: 0018:ffffc900009a7730 EFLAGS: 00010212
> > [   42.668837] RAX: dffffc0000000000 RBX: 1ffff92000134eed RCX: ffffffffc20dec9a
> > [   42.670122] RDX: 000000000000000b RSI: 0000000000000008 RDI: 0000000000000058
> > [   42.672154] RBP: 0000000000000000 R08: 0000000000000001 R09: ffffed1022110172
> > [   42.672160] R10: ffff888110880b97 R11: ffffc900009a737a R12: 0000000000000001
> > [   42.672179] R13: ffff888110880b60 R14: ffff888110880b90 R15: ffff888169973840
> > [   42.672186] FS:  00007f28cd21d7c0(0000) GS:ffff8883ef280000(0000) knlGS:0000000000000000
> > [   42.672191] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   42.[ CR02: ;32m00007f3237366208 CR3: 0  OK  79e001 CR4: 0000000000770ef0
> > [   42.672214] PKRU: 55555554
> > [   42.672218] Call Trace:
> > [   42.672223]  <TASK>
> > [   42.672226]  ? die_addr+0x41/0xa0
> > [   42.672238]  ? exc_general_protection+0x14c/0x230
> > [   42.672250]  ? asm_exc_general_protection+0x26/0x30
> > [   42.672260]  ? fuse_get_req+0x77a/0x990 [fuse]
> > [   42.672281]  ? fuse_get_req+0x36b/0x990 [fuse]
> > [   42.672300]  ? kasan_unpoison+0x27/0x60
> > [   42.672310]  ? __pfx_fuse_get_req+0x10/0x10 [fuse]
> > [   42.672327]  ? srso_alias_return_thunk+0x5/0xfbef5
> > [   42.672333]  ? alloc_pages_mpol_noprof+0x195/0x440
> > [   42.672340]  ? srso_alias_return_thunk+0x5/0xfbef5
> > [   42.672345]  ? kasan_unpoison+0x27/0x60
> > [   42.672350]  ? srso_alias_return_thunk+0x5/0xfbef5
> > [   42.672355]  ? __kasan_slab_alloc+0x4d/0x90
> > [   42.672362]  ? srso_alias_return_thunk+0x5/0xfbef5
> > [   42.672367]  ? __kmalloc_cache_noprof+0x134/0x350
> > [   42.672376]  fuse_simple_background+0xe7/0x180 [fuse]
>
> I think this is basically:
>
> fuse_simple_background()
> -> !args->force
>    -> fuse_get_req(NULL, fm, true);
>
> and there you have fm->sb->s_iflags & SB_I_NOIDMAP with idmap == NULL
> afaict.

Yeah, but fuse_get_req() is ready for idmap == NULL case:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/fs/fuse/dev.c?h=fs-next#n111

It must be something else. Maybe there is a mistake during merge? I'll check.

>
> That's why I'm insistent passing NULL is a problem. If I'm not mistaken
> this should be fixed by Alex's patchset to not pass NULL. I'll go review
> that now.

Cool! Thanks, Christian!

