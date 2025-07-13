Return-Path: <linux-next+bounces-7503-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 415A7B030DA
	for <lists+linux-next@lfdr.de>; Sun, 13 Jul 2025 13:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9685A3BDDA5
	for <lists+linux-next@lfdr.de>; Sun, 13 Jul 2025 11:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA0A487BE;
	Sun, 13 Jul 2025 11:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvg+aywe"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3F86ADD;
	Sun, 13 Jul 2025 11:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752406483; cv=none; b=qHYRAVbuYLWsZq65vnisYBcMfUz0unHPHHSVpl3ziOt/8yHpCngl4M5rFvAsDRv+0xpA0eGEZ2j8CejThrsRkEhBUsSskS+ULylcnXel9j2Zjo479wuhjR6wcZw08qnmdwueKATgqTj93XCV1mfFMLAtF1TeX1OSsknLCB1kLiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752406483; c=relaxed/simple;
	bh=3E86QT1RQXoKJncONVA3h+/7auEBcT28VLs3DwrCUJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pljwTtqbxbWJz3pvM5BuiofijgkwZ8EorIpNBs6B/zEBNj8+8NntY40ekrlXsvA+e0KrT7C49LXupeS/fInE479kLiJWLvWuS1shuuNYbfSy2dBam2aByNdZ6INFOAoRvZ+IjmC1GHtC5aFKovMooDe8LLN0RZ7ED9Y458wx0GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvg+aywe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0828C4CEF6;
	Sun, 13 Jul 2025 11:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752406482;
	bh=3E86QT1RQXoKJncONVA3h+/7auEBcT28VLs3DwrCUJ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hvg+ayweakIDCRbAlcrFOO/jgaolzxaxaAnvpEW2awR1I5gO2q4a9io+rubRDXhx2
	 t9lqVysGEjZJNN3LTOL5E9ZBVFbqLfyw+h/gyfWZiPj0M9qIohULdRBwKDBra1OX/b
	 ctJuVe6YwFFPAPiRQTTPGgWxQOXOZ3q8xgveNnxunVxL+XEup/XIXB2sVXlY27dakB
	 OrFumIR3Bpp76rsOW6h3rbWB7ye2GyD8N2T0VeB9dVe30HQDcU2j9fapmaJyr/7FZg
	 r1jNme94CyBwNLUuLFS5BSP75iW3RbQ6h8/ztHyKiSu2RZy1VXWU6n/BpX3Grko8MM
	 HYYsusx2FA0xw==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6120049f09fso1746553eaf.2;
        Sun, 13 Jul 2025 04:34:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvGFLofizQZH8uRTFQaH55CrZ7ZmUwCECxPwi714L9asbnLkyK3J5XLniJ/jVtqSzugteLPQiokhGLz1k=@vger.kernel.org, AJvYcCVDaaEaf37wEe/+90Vh95CllM7nFzhx373ApLSyaCDQaMrPXv/kSVrvs9Q5GoijlC+aaXwIoFRiHPNR5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLuIM8vcOKWNiCoLPvhEeCB1l07zY8HCVPJNeOgPrponyj0ZIS
	0JOhlcoAOf6GlHhRyGeAP2XZWcoRdoFWVSayMQuxkwJeev6x2CYtM6wtTFICeFc1i8ON1Q4NvBV
	Jsa+lod1Bzcq+WjgGDr9v32uA/ouYlxs=
X-Google-Smtp-Source: AGHT+IFuYADzEutbEFDy/gs33SAlKKQHOs/PwanKwOXzdQ3mwgrkBASnOMI/05PrG5u0tEDdh7iap+htCumpxf94JKI=
X-Received: by 2002:a05:6820:4409:b0:615:7c7f:4aa6 with SMTP id
 006d021491bc7-6157c7f622amr526377eaf.3.1752406482201; Sun, 13 Jul 2025
 04:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711191014.12a64210@canb.auug.org.au> <49080a96-2c7a-4eea-a64c-deac0b7a665b@infradead.org>
 <CAJZ5v0h1CX+aTu7dFy6vB-9LM6t5J4rt7Su3qVnq1xx-BFAm=Q@mail.gmail.com> <35f0dd7e-f4c1-4042-bc85-19d277f4b1f9@kernel.org>
In-Reply-To: <35f0dd7e-f4c1-4042-bc85-19d277f4b1f9@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sun, 13 Jul 2025 13:34:31 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jejQBii9U+69PUjqzebrdWPky93ZoJ9wKuqeGDpK--JQ@mail.gmail.com>
X-Gm-Features: Ac12FXwM3thsZjq3fqSeZdk6Wyvn9W-4fbkxOYzhvQlR8d53h_Oxqxin_woNNr8
Message-ID: <CAJZ5v0jejQBii9U+69PUjqzebrdWPky93ZoJ9wKuqeGDpK--JQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 11 [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
To: Mario Limonciello <superm1@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Mario Limonciello <mario.limonciello@amd.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux DRI Development <dri-devel@lists.freedesktop.org>, Samuel Zhang <guoqing.zhang@amd.com>, 
	amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 12, 2025 at 9:02=E2=80=AFPM Mario Limonciello <superm1@kernel.o=
rg> wrote:
>
>
>
> On 7/12/25 3:11 AM, Rafael J. Wysocki wrote:
> > On Fri, Jul 11, 2025 at 11:25=E2=80=AFPM Randy Dunlap <rdunlap@infradea=
d.org> wrote:
> >>
> >>
> >>
> >> On 7/11/25 2:10 AM, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Changes since 20250710:
> >>>
> >>
> >> on x86_64, when
> >> # CONFIG_SUSPEND is not set
> >> # CONFIG_HIBERNATION is not set
> >> # CONFIG_PM is not set
> >>
> >> ERROR: modpost: "pm_hibernate_is_recovering" [drivers/gpu/drm/amd/amdg=
pu/amdgpu.ko] undefined!
> >>
> >> caused by commit
> >> 530694f54dd5e ("drm/amdgpu: do not resume device in thaw for normal hi=
bernation")
> >>
> >> Rafael, is a stub appropriate for this case?
> >
> > pm_hibernate_is_recovering() is not supposed to be called by code that
> > does not depend on CONFIG_HIBERNATE_CALLBACKS, but a stub returning
> > false would work for this.
>
> Thanks, I just sent out a fix for this.
>
> >
> > Mario, it would be good to fix this up in your tree.  Also, it would
> > be good to expose stuff to 0-day build testing before letting it go
> > into linux-next.  I use the bleeding-edge branch for this purpose.
> >
> Honestly; I'm surprised that 0-day didn't raise this on either dri-devel
> or amd-gfx.  I had expected at least one of those lists to raise this
> over the last week of patches.
>
> Anyone know the history why neither has 0-day?

Maybe they do, but it had too little time to get to testing  them.

That's why I asked 0-day to send success reports too for my
bleeding-edge branch.  When I get a report (either failure or success)
for it, I know that it has been tested.

