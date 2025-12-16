Return-Path: <linux-next+bounces-9421-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8AFCC07AD
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 02:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A4313013EEC
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 01:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1039228469F;
	Tue, 16 Dec 2025 01:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2Dx6LgK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426A827CB04
	for <linux-next@vger.kernel.org>; Tue, 16 Dec 2025 01:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765849381; cv=none; b=WWh0gKhuRe+36a41D4oJLzSmYmyQtqvrA/yjRmdxxZGhbnjABtI11ik3bE0hbxRUfGG51P0YYieBH4dOvVSbuEuGEy5S4aTDZYaT5atJkpfB+fzccaEtjebflGSkqLuThr583Zz/1I6PKf/NKTsJc9tnd4C39qR4c2XMFq2c0Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765849381; c=relaxed/simple;
	bh=ZyiAfBS1SHi1ogYvB6RKd2TbkiFPHcyLTNoNsrXdb6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nCdColczH7ASep25P4ceqB3H/SRCzGcZGmWJT5aph3x0WEjr6XwMryTWoBuNEM0dntWuwDLk9LIBnBAL+3N3k4N4H7TwphLRddpfCla+oax2TjvUa5vE/UIFlmzI7aWNySAHy5xwmcaADCCHd+U43YrihcMj14rkfggHZU7AMkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2Dx6LgK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso17683435e9.0
        for <linux-next@vger.kernel.org>; Mon, 15 Dec 2025 17:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765849378; x=1766454178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyiAfBS1SHi1ogYvB6RKd2TbkiFPHcyLTNoNsrXdb6o=;
        b=i2Dx6LgKk8bWUH8nKoQnZ93ETCB+9Xh/uqM0H4lb7VhzaMYG8aD4w2Rw1Fr0BHrdRS
         QNwdMgyGaVFNPP+eUhh+gtkjly5JkQguZROgJQzLX5ZMuk21oQYgDPMW2fhZUmZayZ3J
         wlWmlCy46UY1gpER8whltbSVvZcj9qYgppRv3mhZb4k2jhJIQqWm+egxlevzYq8vjU7u
         Ee/iW5jgEPBjqjw5VAhIEJD4evmYCiDIlGxZNLcTh10D1mSY5tB4GisuDV3JgZUpzsQZ
         9cH/WzPtrD/4k26QJcQjWWT2WfwSb0OXvxw1VuPWAvHgtxvUQJdf+COMUcuP2pwYlTCO
         yvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765849378; x=1766454178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZyiAfBS1SHi1ogYvB6RKd2TbkiFPHcyLTNoNsrXdb6o=;
        b=HudJfOpRvK15XC6CmzD2zlEjrRmvaCd32jGW8ina507jm8SSQTf8xRhRpEF+wLXjdV
         kQxFa8BrcDNT6ggjNUqABQx71iDpv0cShx5qXky3MPcdldSqgTB+38uaZTf+T5HoibqV
         rTvADr/cIx4n+47WlTnDH44BO63hqwAT3DnWxIVaM/rhnbpkdw7XESxyOqPj2Z2PpGQP
         +K9fRsZ1KVZ5UlmnBKOIrfJ+q3Lpcgev5RABO5wLiINyB6evL1DRiVvMN4G/1Jj0Tpow
         y2tQ3cN6d6VZ2NYZftWiA+Vby7sRDchbnQf45POJ0NeOrfOthStWUSM4RFz5QrqOw/Wm
         1/Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUP6rr9ACaaYa8n8ACl+O8i1n6oalw3jy7bMHATBjsSVJe4cN63UGY2Tol0bIALsKx7rzkCtoTpZ0uW@vger.kernel.org
X-Gm-Message-State: AOJu0YykwgrgwyxJPGB5XC/wCtC/tyzhGrBL3oEECuTM0vMsAb8zoOSI
	Uv6hQps0OlOUTcxTSruJoBVmnH0eJJTt/ka/7cyWBCs9ODemCegKcwo1oOdjXZmNWrq5hsxaOq0
	cIA54x7eAjpEpPQoQJgzbnfxaZjAN888=
X-Gm-Gg: AY/fxX67hzur9/i5BA6i00TGBcdt6c8y6qT0qt8MNRgTLn7ht+Eqvju9dbOGziZuYp9
	3vsn29AplIlk1jeSgI2G0Yhpc02SGSaWLc6iU5mCXWV4+VKjSJ2D/FngAjqbfXBZWLVAFsHVw0p
	o1MnfnW7sM10ddkuEpKAFMrx8bJvPKv1iHbDsm8DDgNQuVmx/1aD+hlcSJ0361tqopl7h4fZzKD
	Xcsf4wFaqd5W78dc3eCvs6Od9ZBVlUECMtUXJ26KCVUXp+wzbsT+Q5bKJ5Po1OHBeJEj3BZp+Wn
	lJGxcnZ/xzkvt9WNYdSdTIGCANoq
X-Google-Smtp-Source: AGHT+IHXZEfg1p3HRgI0++xedDQyyt6TVJAX8tLf80JYu34CJbWOG8x06pVXb0fDbpBBSUhZfKL0ivJQkRM5N2F1zdU=
X-Received: by 2002:a05:6000:381:b0:430:f3bd:720a with SMTP id
 ffacd0b85a97d-430f3bd763amr10307348f8f.27.1765849377540; Mon, 15 Dec 2025
 17:42:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <176584314280.2550.10885082269394184097@77bfb67944a2>
 <20251216122514.7ee70d5f@canb.auug.org.au> <3cd2c37e-458f-409c-86e9-cd3c636fb071@linux.dev>
 <CAADnVQKB1Ubr8ntTAb0Q6D1ek+2tLk1yJucLOXouaF_vMqP3GA@mail.gmail.com>
In-Reply-To: <CAADnVQKB1Ubr8ntTAb0Q6D1ek+2tLk1yJucLOXouaF_vMqP3GA@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 15 Dec 2025 17:42:45 -0800
X-Gm-Features: AQt7F2qZ64Mmn0-BWatGXdXbAgAM-TAJMN_WlLu09kQhu9Y_Np5ib-yXqYgCTp8
Message-ID: <CAADnVQLE1R=DDjj88u+xuws8+JLKo6J2HiLj=jpO8MLpbp98SA@mail.gmail.com>
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

On Mon, Dec 15, 2025 at 5:37=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
>
> I removed the offending patch from bpf tree.

All,

heads up. gmail doesn't like me :(
I see Steven's and Ihor's replies in lore, but nothing in my mailbox.

And Steven's reply was a couple hours ago.
Nothing in my spam either, and I was cc-ed directly!
So it's not mailing list delivery throttling.
Ouch.

If it looks like I'm ignoring your emails, it's not me. It's gmail fault.

