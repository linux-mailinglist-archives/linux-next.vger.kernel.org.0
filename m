Return-Path: <linux-next+bounces-9420-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CD2CC078F
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 02:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FAB330248BD
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 01:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F17F1E570D;
	Tue, 16 Dec 2025 01:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWjL87C4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6144527AC54
	for <linux-next@vger.kernel.org>; Tue, 16 Dec 2025 01:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765849079; cv=none; b=FnnJtmLp1X3mRSlT6K5KepTnxKBhT6ZFbdbzTeS7zmo1mb5xTNNUIqn4rUpJ52fDB9rhT4Y3geY+LScNis/W+gHJd7IWMwb4jsfFmyT8iIXqrPYB4KlIxtqJ5VhrPIQ71qSCkUJLRsGVq/7zfoqZQufbyi1ytGKttzNbDQjZiIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765849079; c=relaxed/simple;
	bh=x+RMwbKGsV4PMkD0KkMkba/tk7/2mcKaDGjNa1T7ZjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GkrU5bW6PEgo1enkzzpCH/cwi+l+3A4A4roYDLsj1mhO0RWgCKqjOp3glteQFQn0iOGZ6WG9SfnRgzTHkUx83orUjJxqnS5UHVmh/gVB36YcCEfCNP+D9Af3Ka4V39fokzCkrl9c/UceOlrdWDjqHfNiFDm6AfKhxeMUdGEBY8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWjL87C4; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-430f57cd471so1112668f8f.0
        for <linux-next@vger.kernel.org>; Mon, 15 Dec 2025 17:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765849076; x=1766453876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/pNAke2nQIdqwnOq2FBv9V/0iQOVyEeIV9hoKI21mk=;
        b=UWjL87C42n2kzOuvW32trYRoN6z+XfPUs0ox8zzBKlBoiQWezZomC5uvMLkXCb9jtX
         EPWSsCb1M4X+QmVtk0ORp1oAPApC6WqU6WaRTXsLMj4+gNFCWRIJrl71BInR214GEifk
         PIm4rjCXdYOG5As7g45bwpi3GaX7f6ww8u2+cDkj/GmY6sZaA3+YuaoSCEC052AzwHgz
         JZPxhzaDU4MSUJmszQmH4oEhJAoAphasczkCYpiSlpPD7dW+1R3CYUTM6vMsSDSMxiqU
         NWy1/tuDCWUIgjVYljPfQqDzMZ0AKplLl66K55uuHCqHoCPo8oGSiU+lJ/B81WHNK5Nj
         RdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765849076; x=1766453876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J/pNAke2nQIdqwnOq2FBv9V/0iQOVyEeIV9hoKI21mk=;
        b=gD1tiJAERsD3nTJ1OhyvddpsZ6FJEqvgNdvPIh8ZyK/b3L9MQAzLimcEjxCKyPv4f5
         EyK0BnHdQtB7H6xaQPf74+B1G2SqTz2x3Q7M51u4AulA1gNQztVOYzt9OiMLU7PNaMK2
         bqFKxmCoeIpKQVySWw3KGNd+SkYdvTtIz5+c8iJuOZKm6m57XOR8e9yMfezsf4wciZ9x
         9rOJ3F9xa4sLfBcDRJSMaluvAzCvtmhN62gPuOyuGXmpRgFO4pRJF9hXORyLVkb6x5YL
         d7zkGnjU33qIpee8v7Oz5Rr7QFSSW6pjGhCvxPzvzSP04wfPFgDeeFZ64iXNNxrOmU5b
         MVsw==
X-Forwarded-Encrypted: i=1; AJvYcCVBtjL3owHnAinLJp1vkRNzc3Q8GgMA5VJWg4UvYjkSPa3vtxjo5XPfQQWwzEiekIlGrwA3yVehblGG@vger.kernel.org
X-Gm-Message-State: AOJu0YwYWdNhtfGawrb+YEnPHuEfAXrcHBBut3lpeqNOOM65FUqmKPEc
	afxJSWcIQM7wcaxumaW8Vq7YWnM8sTQgJlcJ1chViTv+4qlPYc/Pd6Td/Hl5QlX4CRxlsWVL8d6
	kQbiaWixKSAyFqGuCYdBqCjEse0TfhiM=
X-Gm-Gg: AY/fxX7jII7s3gjWC/Ud6E6Xg5YVFjxWQpySDwcxrQeFk4ORBpZhFdZyT94jDfcls9G
	odbWFZykJtAY1WnaOy3YC0tneEyVf4J6vycR8dNpqp2Rx3HJL5eyhLwnfEZX4B3SuNiE6AmnPCh
	uu1oO0LsYp3sPS/Q09pBYl/WzWvsmlnogo6i5P4gFj3+2VLPFxIg23Rxx3KCE7NsY5n43sXlbiX
	9ldppkcrVuHzkB8vIzb/fxMxBzZJGmVHS42LxJ70JODJr7sbQHuoq0/HBb9j3jxozWBkEGjIyli
	OoMkBk4ZiVIQ61sWQM0SWmIVmZwi
X-Google-Smtp-Source: AGHT+IFPU0s3bOPB3rQAta6oFL313UAj3hIJMxw2uWb7NN2NlEfaIUbg6fQFPzAZXBnRUdVenFhgkatm/4QgRmmEnDE=
X-Received: by 2002:a05:6000:24c8:b0:430:ff0c:35fb with SMTP id
 ffacd0b85a97d-430ff0c3838mr4510125f8f.52.1765849075664; Mon, 15 Dec 2025
 17:37:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <176584314280.2550.10885082269394184097@77bfb67944a2>
 <20251216122514.7ee70d5f@canb.auug.org.au> <3cd2c37e-458f-409c-86e9-cd3c636fb071@linux.dev>
In-Reply-To: <3cd2c37e-458f-409c-86e9-cd3c636fb071@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 15 Dec 2025 17:37:44 -0800
X-Gm-Features: AQt7F2q0Rsxh6xewkzWqNTcgEYzDxngWg4m_SWh3bFIyuupfaMDEEJZmkhGJV1k
Message-ID: <CAADnVQKB1Ubr8ntTAb0Q6D1ek+2tLk1yJucLOXouaF_vMqP3GA@mail.gmail.com>
Subject: Re: [REGRESSION] next/pending-fixes: (build) error: unknown warning
 option '-Wno-suggest-attribute=format'; did...
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Borkmann <daniel@iogearbox.net>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, KernelCI bot <bot@kernelci.org>, 
	kernelci@lists.linux.dev, kernelci-results@groups.io, 
	Linux Regressions <regressions@lists.linux.dev>, gus@collabora.com, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 5:32=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.=
dev> wrote:
>
> On 12/15/25 5:25 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > On Mon, 15 Dec 2025 23:59:03 -0000 KernelCI bot <bot@kernelci.org> wrot=
e:
> >>
> >> Hello,
> >>
> >> New build issue found on next/pending-fixes:
> >>
> >> ---
> >>  error: unknown warning option '-Wno-suggest-attribute=3Dformat'; did =
you mean '-Wno-property-attribute-mismatch'? [-Werror,-Wunknown-warning-opt=
ion] in kernel/bpf/helpers.o (scripts/Makefile.build:287) [logspec:kbuild,k=
build.compiler.error]
> >> ---
> >>
> >> - dashboard: https://d.kernelci.org/i/maestro:32e32983183c2c586f588a4a=
3a7cda83311d5be9
> >> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-n=
ext.git
> >> - commit HEAD:  326785a1dd4cea4065390fb99b0249781c9912bf
> >>
> >>
> >> Please include the KernelCI tag when submitting a fix:
> >>
> >> Reported-by: kernelci.org bot <bot@kernelci.org>
> >>
> >>
> >> Log excerpt:
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >>   CC      kernel/bpf/helpers.o
> >> error: unknown warning option '-Wno-suggest-attribute=3Dformat'; did y=
ou mean '-Wno-property-attribute-mismatch'? [-Werror,-Wunknown-warning-opti=
on]
> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >>
> >>
> >> # Builds where the incident occurred:
> >>
> >> ## defconfig on (arm64):
> >> - compiler: clang-21
> >> - config: https://files.kernelci.org/kbuild-clang-21-arm64-mainline-69=
4097d2cbfd84c3cdba292d/.config
> >> - dashboard: https://d.kernelci.org/build/maestro:694097d2cbfd84c3cdba=
292d
> >>
> >>
> >> #kernelci issue maestro:32e32983183c2c586f588a4a3a7cda83311d5be9
> >>
> >> --
> >> This is an experimental report format. Please send feedback in!
> >> Talk to us at kernelci@lists.linux.dev
> >>
> >> Made with love by the KernelCI team - https://kernelci.org
> >>
> >
> > Presumably caused by commit
> >
> >  ba34388912b5 ("bpf: Disable false positive -Wsuggest-attribute=3Dforma=
t warning")
>
> Hi Stephen,
>
> A potential hotfix is here:
> https://lore.kernel.org/bpf/d80c77cf-c570-4f3b-960f-bbd2d0316fac@linux.de=
v/
>
> Needs acks/nacks.

I removed the offending patch from bpf tree.

