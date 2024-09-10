Return-Path: <linux-next+bounces-3722-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E78C19729CB
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 08:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F568B22C41
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 06:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57462174EDB;
	Tue, 10 Sep 2024 06:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="Vnh/K8iO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50861B85FC
	for <linux-next@vger.kernel.org>; Tue, 10 Sep 2024 06:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725951065; cv=none; b=h9nOptgzQX+H31wINDyj8CZEKym1evfYhb+dyRlquHLs3EJ9rB/9O4zxjJaL0Idnhifm2rdCliRCe2n92WK0jikHsltTNX4vepbg31CM089RIvAcqkGFDo1FVO9B70TaU1y8+7/7/h9Z+QEi7bJob+lUmvYv8TAT4y/3Q7rjp6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725951065; c=relaxed/simple;
	bh=sSqwpZhCAURgYJ05cc0dUVDlK2oJAnOgH0zE/wLeyS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dk2/AhMd9MclOXxBhjzesGqL+H8B6imyFaYot5eyOpAhAC+9d+LBO3FabgIZanOLZN7vE6fVAkhO0PU89hkwBLmizF41/o5Xl/1es8zfJ9M0ZGXbpE/aSty778xD8vhDivoetvuUeLxC7eU9zmVBxNPKHmL6KIJiN6JH9GHGUsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=Vnh/K8iO; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5365cf5de24so3591630e87.1
        for <linux-next@vger.kernel.org>; Mon, 09 Sep 2024 23:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1725951061; x=1726555861; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sb6xysG1EwQF7PHJqQM4UyG/SRiKSl1lTm1k5/muITM=;
        b=Vnh/K8iO1idyxQZKPsGhRN/gRth/urNz2Au2CCVjEb+nzr366+Ywap0H6MyR2qoBm4
         /VRVW8um6eB/MtYr9m19c3ukEb19nnNTbLfhd+rg6lelz1dVVlfpaVvDZ/xESNZKzLTe
         0q9T8r7plJ51G8pf7MqeInPRSkHYBgNDyxLgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725951061; x=1726555861;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sb6xysG1EwQF7PHJqQM4UyG/SRiKSl1lTm1k5/muITM=;
        b=uMXyd74HjilQ/cUJ8TA1gANPn+rfp3Qg1G8DYdq6NEWRSRQlW9frD9HBy6ebXbyRxa
         vyhYDDsWV5utfnEj3cE19Uio/q2JEYoAtku/H29q6pSlEPTOIt1yXiVcavfK0Xf9h46V
         9z9Es2R7BFYCHTFNT36sDLSKH20RVlPEOKQi+TTconRMVDA+QMzzD+qXnMuB2tKWDkyN
         tYqZVBbXKTwd/CHuISQLpDUbIDKYMf7lJrepkhnA5DCdMkY9RWdD/tEV6yycOTpr3nVX
         Mx2HUh4CUDa/Xuf3K0hHcLUqHqSAalcFT0F2Q3BBOiNJW1DmAwH3muZRBvqJNNeBqaFn
         SNBg==
X-Gm-Message-State: AOJu0YymySf023WM4Vn/LZIc5Z2Ih5ju8c6g/PhjdCcGe0pZZk6S6+nH
	4GPA/wdw8DJRjp8Hl6D5EEYKAsYicsP/I6L60QSVAvFayNyOT7sh/xwqyY5k527ItdoNoGK573v
	P6H792DLtXKohQB83jFp8ZOAFmKYbHR76suwzwQ==
X-Google-Smtp-Source: AGHT+IFO3q+914Sezs158vGcWC0YHGuppUdYSUHue3QuLbBbKWzKn772LY29C064/BkTcvsWdweefy8M5oAag7db7Yc=
X-Received: by 2002:a05:6512:3d89:b0:52e:fd75:f060 with SMTP id
 2adb3069b0e04-53658819c5amr6542652e87.61.1725951060021; Mon, 09 Sep 2024
 23:51:00 -0700 (PDT)
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
 <CAJqdLros2VVCXQ8RK4FeU1+=oX4=K64i7dxbDor+RUepFNJzJA@mail.gmail.com> <87frq8atxt.fsf@debian-BULLSEYE-live-builder-AMD64>
In-Reply-To: <87frq8atxt.fsf@debian-BULLSEYE-live-builder-AMD64>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Tue, 10 Sep 2024 08:50:48 +0200
Message-ID: <CAJqdLroMSD5cpgnAxKV+9vAtxD-u6zPfVRmDfhR5+zj=nc=EAg@mail.gmail.com>
Subject: Re: [BUG REPORT] linux-next/fs-next released on 6th September fails
 to boot
To: Chandan Babu R <chandanbabu@kernel.org>
Cc: linux-next@vger.kernel.org, mszeredi@redhat.com, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Am Di., 10. Sept. 2024 um 08:45 Uhr schrieb Chandan Babu R
<chandanbabu@kernel.org>:
>
> On Mon, Sep 09, 2024 at 06:11:29 PM +0200, Alexander Mikhalitsyn wrote:
> > I'll send a patch with this fix a bit later, once
> > https://lore.kernel.org/linux-fsdevel/20240906143453.179506-1-aleksandr.mikhalitsyn@canonical.com/
> > is merged to prevent merge conflicts later on.
> >
> > Am Mo., 9. Sept. 2024 um 17:56 Uhr schrieb Alexander Mikhalitsyn
> > <alexander@mihalicyn.com>:
> >>
> >> Dear Chandan,
> >>
> >> Please can you check if the following patch resolves issue for your
> >> workload:
>
> Hi Alexander,

Hi Chandan,

>
> I am sorry. I now see that the bug is present even after commit
> 9dc504f244895def513a0f2982c909103d4ab345 (virtio_fs: allow idmapped mounts) is
> reverted. I was using kexec to boot into new kernels during the bisect
> operation.

It's not a surprise, that revert of
9dc504f244895def513a0f2982c909103d4ab345 (virtio_fs: allow idmapped
mounts)
itself does not help, because really this commit does nothing and can
take effect only if the userspace side
activates idmapping support.

At the same time, from the call stack that you provided I can see that
crash happens on:

   42.672223]  <TASK>
[   42.672226]  ? die_addr+0x41/0xa0
[   42.672238]  ? exc_general_protection+0x14c/0
x230
[   42.672250]  ? asm_exc_general_protection+0x26/0x30
[   42.672260]  ? fuse_get_req+0x77a/0x990 [fuse]
[   42.672281]  ? fuse_get_req+0x36b/0x990 [fuse]
<CUT>
[   42.672376]  fuse_simple_background+0xe7/0x180 [fuse]
[   42.672406]  cuse_channel_open+0x540/0x710 [cuse]
[   42.672415]  misc_open+0x2a7/0x3a0
[   42.672424]  chrdev_open+0x1ef/0x5f0
<CUT>
[   42.726570]  ? __pfx_do_filp_open+0x10/0x10
[   42.726981]  ? do_syscall_64+0x64/0x170

which corresponds to CUSE.

I would suggest applying that patch I sent yesterday and try it out.

>
> However, now when I do a normal kernel installation (i.e. make modules_install
> && make install) and reboot into the new kernel, I am noticing that the kernel
> fails to boot even with alleged bad commit reverted. I will write back with
> more details.
>
> Apologies, for the inadvertent mistake.

Kind regards,
Alex

>
> --
> Chandan

