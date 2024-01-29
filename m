Return-Path: <linux-next+bounces-887-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B6483FFC2
	for <lists+linux-next@lfdr.de>; Mon, 29 Jan 2024 09:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C2F31C20D2C
	for <lists+linux-next@lfdr.de>; Mon, 29 Jan 2024 08:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F65E52F6F;
	Mon, 29 Jan 2024 08:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s/kiLwnB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C7952F6D
	for <linux-next@vger.kernel.org>; Mon, 29 Jan 2024 08:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706516059; cv=none; b=Jgo4aY6VNPVfGgZa+PsJ9VIrIEZGc88yN7/ojcE0JoKxzQO6w2EJ2nSG6YxNU1Hw9oTXzCHhewhiJjFsE6ONL2Zx15/LP50yt1fFXIzuenQQza8TuL3qXSu1bsdvu6dMKYeZ82ksCLYgSoMxHJE6PE7I9ie/dwjyPXodZbkqqg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706516059; c=relaxed/simple;
	bh=GjRJ7N2AN6+nVd0ooC5HSu51Pgqr674PVVlLwNU5juE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DytKSV6MD7xKG29OzXeu+nf7ze9MLQxEhL4r7XMrK9zeXqgTEgzbGDar4HAgT5AD9tU1/f3FT6g321VP6OQVcQNak5OMtxD1jts0uD1bnG8uMluZai+Ig5YM3KBr1QxGC8EPTc0QO8PhwyAeWVwj8R488Oc4n9+0fLJC4dvhRV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s/kiLwnB; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5ff9adbf216so21790237b3.1
        for <linux-next@vger.kernel.org>; Mon, 29 Jan 2024 00:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706516056; x=1707120856; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s2EnDbBMqDGbBhFQtliI/OLJRkwmER6ZZAy6Ip4xfDU=;
        b=s/kiLwnByVZN9S8Cbq9OhGCD7AKthmb/pw9zKvOxp9e/+0X1AWQV/wC3IG4gV2GSID
         IdMYt0CG39yv4T2tkFSsP1aCVnPes7U0CZst09fFUKn+XJMDQCb/tjzbhSn+nN82uTzR
         hHwRkW8ozWRC5yNITP7+52EHVAXXjRC4vPNYYsk2id05MrknuodgiDLUYFiDCbdGwmXV
         PltNnlW8kV0z7lxN6OnpCAUnGYcnbcHwmvTO4fIaxRQSMbQ4X1ApD+sjGZuKvU4dvSGK
         Vxl5OBf10PlH7VxPbk2Q/gWxDa7T7lYpEx+y/3UGTaIt/b87vMYxxepdDOe6P8Wqo5Kq
         IJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706516056; x=1707120856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2EnDbBMqDGbBhFQtliI/OLJRkwmER6ZZAy6Ip4xfDU=;
        b=lVop600GLVw5KG55Yhw/mGlyw6VhOiQxhE3DIHH285No0r3HY5f0aFDkzppa/fRcb1
         MdIEwFl8o7wRiFCDA2A41NwdOFck9t26bOzndvsQctVhm8XgQiXqTIJkakFDhqG6gMXE
         QprgC/iKT62q8nuzsmnuZjIcGul312MGjmUnyeBgXX+9aVI1fEYUjLJ0Pwz69JDXSYLa
         6dEU9RfEXzZyOBSYTZGi2ciM2AShO9AC24100qV17vt/iAQkil3b7tJjL+eZG1C/qY7Z
         hy/cMX7sKF4pcRvBPffZOzkgzVj+ucI6bMxlIz4cGFoMSu9UiyVd2rGPQ0+HbrsH+T4g
         Jv2Q==
X-Gm-Message-State: AOJu0YzEuiaTnipBT5DQ5cCDzyK7sOR1Ztbpf4HNQ0YUI4JUtwiAZjg5
	xzn37i7bRXk3oo6kliirZjuOf9MDR0RkVbTs8/QuE/YhmNwhyrkVxm5jk9JeMZGZP1TvjNO/kv0
	PEWH2gBcumrJsKLQl/bF6GAHCYZmm49XLa0gZAg==
X-Google-Smtp-Source: AGHT+IHoQ4lHklai6GeRs9anEF15zJtmMSEEoJ71q/uoTgpvBAB/SEG/Cz2GSBtiVZLFQpCVIghkMhjg4twujJwqqio=
X-Received: by 2002:a0d:d495:0:b0:603:e7b6:79a7 with SMTP id
 w143-20020a0dd495000000b00603e7b679a7mr5729ywd.88.1706516056317; Mon, 29 Jan
 2024 00:14:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129122222.6b690c58@canb.auug.org.au>
In-Reply-To: <20240129122222.6b690c58@canb.auug.org.au>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 29 Jan 2024 09:14:05 +0100
Message-ID: <CACMJSeuGJ2-++wrKcT34e_Lrvuz96LynwG-=_HYDoCGUkSi04Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 02:22, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> In file included from include/linux/compiler_types.h:89,
>                  from <command-line>:
> kernel/irq/irq_sim.c: In function 'irq_domain_create_sim':
> include/linux/compiler_attributes.h:76:41: error: expected expression before '__attribute__'
>    76 | #define __cleanup(func)                 __attribute__((__cleanup__(func)))
>       |                                         ^~~~~~~~~~~~~
> include/linux/cleanup.h:64:25: note: in expansion of macro '__cleanup'
>    64 | #define __free(_name)   __cleanup(__free_##_name)
>       |                         ^~~~~~~~~
> kernel/irq/irq_sim.c:173:19: note: in expansion of macro '__free'
>   173 |         pending = __free(bitmap) = bitmap_zalloc(num_irqs, GFP_KERNEL);
>       |                   ^~~~~~
>
> Caused by commit
>
>   590610d72a79 ("genirq/irq_sim: Shrink code by using cleanup helpers")
>
> I have used the tip tree from next-20240125 for today.
>
> --
> Cheers,
> Stephen Rothwell

For the record: this is not my code. This is what I sent:
https://lore.kernel.org/all/20240122124243.44002-5-brgl@bgdev.pl/

Applying my version will fix the problem.

Thanks,
Bartosz

