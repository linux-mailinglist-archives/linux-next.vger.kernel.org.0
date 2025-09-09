Return-Path: <linux-next+bounces-8242-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 690CAB4A3FF
	for <lists+linux-next@lfdr.de>; Tue,  9 Sep 2025 09:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 920244409EA
	for <lists+linux-next@lfdr.de>; Tue,  9 Sep 2025 07:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFC5242D7B;
	Tue,  9 Sep 2025 07:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sRv7I9MT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D57330C367
	for <linux-next@vger.kernel.org>; Tue,  9 Sep 2025 07:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757403552; cv=none; b=mMT5eMc6aM5NKdMDEd9QUxqIPgBwab/Q7LLkZCgLo6FuXWAamWaEdDsH3UAfaH3YHdZRf7FQvOaf48dIzLpu5Mc7VtJxEm0EC+sToZvxD0a7mh0PzMFhqRfKHeB8v3lFjuy7wq8Spb/U3XnRz6DTkTmJ88phlkrC4B3+AyalDrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757403552; c=relaxed/simple;
	bh=K0aPggGEOTRmUyRZFo/DV0xphP60f1axIKEtguCKkhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eakBgZMgfZbQ+K+3zOZTAc2qNCyJznU2ZQ+7TXZ1ZuJmBwix1p24l3AsuOfOvA5VswrcpuotSZ/XNg9oqIAp4ymZ79plaTSZT1pGwdWpjAwU1TtquiNhFNVdWvqM7xAAtacWot54MYV49nxisdEufHT1Fk5LzlqUl2j5Uov/RbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sRv7I9MT; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b04abcc1356so454517566b.0
        for <linux-next@vger.kernel.org>; Tue, 09 Sep 2025 00:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757403549; x=1758008349; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NNA+enFp9mFHaApkAPMar5j9pjUFiMUPT5abXuL1ISs=;
        b=sRv7I9MT+WK+EOLrajvacAAB4DYPHlVffVS6fUxdAH7wj5RB7F7KJaSFpj8fCfZ46Q
         4wVoEHPmFqBr9Dbq3KlrZTXNa/thr8tooCwOSgjeXLE4qTksvLhEQtIBtlVqhwCOODMh
         XF47FcldXToR5XtvwzuGGrSRe0ntROCQEVCAQ6xIw0xNBuSNpJDqzz2tBGUiRMoF5qZN
         q/suvnw8ygzJqoTtyOcdsZkor1nGkGkAR8wlPFbVhk0AOpWdpNPKVDexbgFTs5Nj8MAc
         KvoRNZ7oJk9sIaLpktn5ImTvKep0pZ9sCpQbbhmwmI0CAXkAhlnQC/hkX8idFmb/INka
         P5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757403549; x=1758008349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNA+enFp9mFHaApkAPMar5j9pjUFiMUPT5abXuL1ISs=;
        b=cUqUU1kCW74VpPztfW7O/m+qfUPTENHEHRh/eKwRsUojrAX/C/U5ml7fTx7FOPxrCm
         WbEm1IHAloJR48KB2EFi8zEnuTeYWxfcoigUW8UCVVpxOo4KyMt5/h2BaqiY/vP/A+sS
         skB8KxxlqAGhQs/BZs4TD9JEdKLLMQEkQ+A4HVj7EzzinnjMeXsWOuSXmm3f95AzwtAB
         nsHdE97cydQyyZsP1lZ0Kdw6DKC9qqsXfF7vEC8ifXX4Tmavqs28bgQmtO72mC6jrLsI
         us57jZcPS4GDp00+ypvngKZfUB8wBQYyF+EITuUC9EgqAL1sq+pWw9b3N9C/U49g7PWH
         QVlg==
X-Forwarded-Encrypted: i=1; AJvYcCUwihn023FINJVqBR0zl43JJuNLabT6vF0O19l6r8HQHlc11H+odlPoKQ9GdhdjfY3Lmf2+MugLTmEI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+uHKBWgtn0bufJaDISzI60VxxdycHyAgyo10cj9jBXZnBzkvh
	DDYNsmmTuUfBv+CXr4EmLvYdvb4Rtki9KJ7QE2HFL80tKj0nkN9v/9gQm6mdWTbr7F1cts9AxDd
	6jIgAkebPO6MM+rko5W/Yi+RtNC0Rf7Y0uMMOLoRYOhyPVS2rreMGzYVCqA==
X-Gm-Gg: ASbGncvhuTu8sVS7KCBXRaK5t+xTvU1mgp3rSZbKXsXcxu34jl77m04a3ZyZyZZaax8
	RaHFA0MdqXYjUaI1Vw0jU/nXTUuBjuLIGuRlHne2ChxVyXRm+UD2tbPTERV3VmP8FXG74gAPZST
	+b0M9k9p9b1T2CqRnHgDtAn+6GTzrMlR49SXZDU2ckWGvgefdjjS7ndH25ig6U9WNhext0BAFAi
	c9Xg/qKU6vqnmRrKntZmLz2glQu+3dvsQ1g43FoCGbwPVkymA==
X-Google-Smtp-Source: AGHT+IE5J401+ZOXeNcir7uiDmpw6NJzRHPL83/eS3uh60fnMH+ktE6gyIx3UCx9dsQc+ULaURKa09rPlurVaTZAQkI=
X-Received: by 2002:a17:907:3f1c:b0:add:fe17:e970 with SMTP id
 a640c23a62f3a-b04b14b3857mr1034768966b.14.1757403548642; Tue, 09 Sep 2025
 00:39:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904154122.63acc45c@canb.auug.org.au> <20250904063043.GE2764654@google.com>
 <CACMJSev63kfCBTzQnija6Q+PNm8KgD-LWVKeqRJ2kLBtT7Zh6A@mail.gmail.com>
 <20250904092319.GG2764654@google.com> <20250909122227.4dbbeb6f@canb.auug.org.au>
In-Reply-To: <20250909122227.4dbbeb6f@canb.auug.org.au>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 9 Sep 2025 09:38:57 +0200
X-Gm-Features: Ac12FXwS0BgE2iFe-65_HqqVX12oIt2DaDQqjBo7c-ElCXSWRrEKU6JLLE6rcBU
Message-ID: <CACMJSeu8Zv7i+_2bH5Lp5fuE0aBUNRfuq5ne0rPCxXCij4orDA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mfd tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lee Jones <lee@kernel.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Sept 2025 at 04:22, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Thu, 4 Sep 2025 10:23:19 +0100 Lee Jones <lee@kernel.org> wrote:
> >
> > On Thu, 04 Sep 2025, Bartosz Golaszewski wrote:
> >
> > > On Thu, 4 Sept 2025 at 08:30, Lee Jones <lee@kernel.org> wrote:
> > > >
> > > > On Thu, 04 Sep 2025, Stephen Rothwell wrote:
> > > >
> > > > > After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> > > > > failed like this:
> > > > >
> > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_get':
> > > > > gpio-stmpe.c:(.text+0x21a7c29): undefined reference to `stmpe_reg_read'
> > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_get_direction':
> > > > > gpio-stmpe.c:(.text+0x21a7db2): undefined reference to `stmpe_reg_read'
> > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_irq_sync_unlock':
> > > > > gpio-stmpe.c:(.text+0x21a8166): undefined reference to `stmpe_reg_write'
> > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a82ef): undefined reference to `stmpe_reg_read'
> > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a8372): undefined reference to `stmpe_reg_read'
> > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_irq':
> > > > > gpio-stmpe.c:(.text+0x21a8c27): undefined reference to `stmpe_block_read'
> > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a8f05): undefined reference to `stmpe_reg_write'
> > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a8f89): undefined reference to `stmpe_reg_write'
> > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_disable':
> > > > > gpio-stmpe.c:(.text+0x21a91dc): undefined reference to `stmpe_disable'
> > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_set':
> > > > > gpio-stmpe.c:(.text+0x21a93a4): undefined reference to `stmpe_reg_write'
> > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a941e): undefined reference to `stmpe_set_bits'
> > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_direction_output':
> > > > > gpio-stmpe.c:(.text+0x21a95a4): undefined reference to `stmpe_set_bits'
> > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_direction_input':
> > > > > gpio-stmpe.c:(.text+0x21a9705): undefined reference to `stmpe_set_bits'
> > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_request':
> > > > > gpio-stmpe.c:(.text+0x21a983e): undefined reference to `stmpe_set_altfunc'
> > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_dbg_show_one':
> > > > > gpio-stmpe.c:(.text+0x21a99c0): undefined reference to `stmpe_reg_read'
> > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9b8c): undefined reference to `stmpe_reg_read'
> > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9bb1): undefined reference to `stmpe_reg_read'
> > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9c61): undefined reference to `stmpe_reg_read'
> > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9e6c): undefined reference to `stmpe_reg_read'
> > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_probe':
> > > > > gpio-stmpe.c:(.text+0x21aa5b2): undefined reference to `stmpe_enable'
> > > > > x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21aa83e): undefined reference to `stmpe_disable'
> > > > >
> > > > > Presumably caused by commit
> > > > >
> > > > >   e160dd0ac8c3 ("mfd: stmpe: Allow building as module")
> > > >
> > > > Okay, I have removed this patch until it can be better tested.
> > > >
> > > > > I have used the mfd tree from next-20250903 for today.
> > > > >
> > > > > Note that commit
> > > > >
> > > > >  03db20aaa3ba ("gpio: stmpe: Allow to compile as a module")
> > > > >
> > > > > is in the gpio-brgl tree which has not been merged into linux-next at
> > > > > this point.
> > > >
> > > > Okay, perhaps these need to go in together then.
> > > >
> > > > Thanks Stephen.
> > > >
> > >
> > > I can take it through the GPIO tree if you will and set up an
> > > immutable branch for you. Or not if the potential conflict is minimal.
> >
> > An IB would be good.  Thank you.
>
> I am still seeing this failure.
>

The offending commit is still in Lee's tree[1]. FYI: It's also now in
the GPIO tree as commit df6a44003953 ("mfd: stmpe: Allow building as
module") and was made available in an immutable branch[2].

Bartosz

[1] https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?h=for-mfd-next&id=e160dd0ac8c35747a8ef74aa62c6346c2d76e644
[2] https://lore.kernel.org/all/20250904130516.72266-1-brgl@bgdev.pl/

