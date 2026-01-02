Return-Path: <linux-next+bounces-9518-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E56F1CEDFBC
	for <lists+linux-next@lfdr.de>; Fri, 02 Jan 2026 08:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06ABF3005B8C
	for <lists+linux-next@lfdr.de>; Fri,  2 Jan 2026 07:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CD92C235D;
	Fri,  2 Jan 2026 07:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFtQsoPS"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FBB275114
	for <linux-next@vger.kernel.org>; Fri,  2 Jan 2026 07:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767338994; cv=none; b=UoJpSfXgkGrWRciA3lgyxbztNuZfbeiAO0EJipSa+R8iDVLKDyEOeoCbieJDqv1Cr9TdRVit0s2iejwQ66gPd3bJmtdACAcPQguVaOs8hWh5xi+1ivvKJOubbHZsF3azgjzPUPB4VLR/QXxS6jktNG9OEtFj4r6x9597oFqNWNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767338994; c=relaxed/simple;
	bh=gl2uoXbjs+jJYec1j1smL6aMW95lGb1X6nY3IHN22pQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hdc+dGFLt/uuRwmU00jodrfHox/KorLeyfyu/o88+VEb+OzcuBlj0N5USm5ogI99MkMBxntx9GJHpRV/MN1hXayr5s7YCF0g5zF+9McdVAhKUlQSbDDseb4hsOX7kw1NVNCal+Pegdtfci3Qa6Pt06thlgrp/6GWGDpicWEMQ9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFtQsoPS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762F6C4AF09
	for <linux-next@vger.kernel.org>; Fri,  2 Jan 2026 07:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767338994;
	bh=gl2uoXbjs+jJYec1j1smL6aMW95lGb1X6nY3IHN22pQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VFtQsoPS+TsxM0ohQvybS95VXMuMyCm5deUoGqTEngMcXr/iLTq3zgmwDecDX1r+x
	 4mKChAvPXBEaWBRIRZFWHsF7vtcuUJAdDtuWKurYj4zblaAKHx1wdob3kk7n2A1Eu/
	 GwGV1F3HLuAtbUX9nUdy3wDTdN6i97RpeDkVb7PNZ2I9slDBlu3IDkCjece/A4gHDC
	 0HjqA1e6w/41m1XAAf7vTfROaqzPWRmkK53HtdgzV6vj0h95VQp9hFav+qet1q8/qW
	 qvbBOyYNOONVDYrtOzlBKw3jRIrAqMaFa2X53lQthF9N1AxAXZssLYtXa5Smp9GHAG
	 nRWqbm4F3YxLA==
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34f2a0c4574so2237798a91.1
        for <linux-next@vger.kernel.org>; Thu, 01 Jan 2026 23:29:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3kjmHvUukGrgaoaGDm/MErl733I38yX/4GnEl4xAjMU2N0AWVZCoShtb7HLr2B/FM9Pkha3r9nGm5@vger.kernel.org
X-Gm-Message-State: AOJu0YyRJnY7tFF/pOq0I+ta+4Q+Zg6R2L2F9AW8xQVbP74vo/ZAW2jC
	YegO1115N0iPAjatKYibY59vLmnpMOCyBOvR0NK7s8rCYiahFjokgADwjMmXLLTHEUDmM0WKw3C
	pyNsnqGMVLAF+vzQ/o9Vra9qvGS/jJtw=
X-Google-Smtp-Source: AGHT+IGE+hLSD8705WZBJaWGrQc/lj87cSmqD0ZBcyI7D5pdwZSC2fmIzBPLehAjrarZ8q4dQYlZlb0VwFHhJPlrask=
X-Received: by 2002:a17:90b:4a44:b0:32d:db5b:7636 with SMTP id
 98e67ed59e1d1-34e921e0556mr39029534a91.27.1767338994056; Thu, 01 Jan 2026
 23:29:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218153050.44da4a78@canb.auug.org.au> <fcc9ca3e-8c04-43c0-606c-e798bc0cf9ce@linux-m68k.org>
 <aU67sD1u83Qrpvdu@laps>
In-Reply-To: <aU67sD1u83Qrpvdu@laps>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 2 Jan 2026 08:29:42 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFjttKG3JF=aw9KgRup-ge-WeUnncfEfTZmUVSfi4F6fg@mail.gmail.com>
X-Gm-Features: AQt7F2qf031FXDju5gNzdS0_tgySBY0_zmFjsgMRkJDQscwe4TEHY2iFAOTc0Vs
Message-ID: <CAMj1kXFjttKG3JF=aw9KgRup-ge-WeUnncfEfTZmUVSfi4F6fg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mm-nonmm-unstable tree
To: Sasha Levin <sashal@kernel.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Dec 2025 at 17:45, Sasha Levin <sashal@kernel.org> wrote:
>
> On Sun, Dec 21, 2025 at 01:58:17PM +1100, Finn Thain wrote:
> >
> >On Thu, 18 Dec 2025, Stephen Rothwell wrote:
> >
> >> After merging the mm-nonmm-unstable tree, today's linux-next build
> >> (x86_64 allmodconfig) failed like this:
> >>
> >> x86_64-linux-gnu-ld: error: unplaced orphan section `__bug_table' from `arch/x86/boot/compressed/sev-handle-vc.o'
> >>
> >
> >I found that I could reproduce the same build failure after applying
> >Peter's patch to v6.19-rc1. So it's not confined to linux-next. I used
> >allnoconfig with CONFIG_LD_ORPHAN_WARN_LEVEL=error and
> >CONFIG_AMD_MEM_ENCRYPT=y because allmodconfig takes forever to build.
> >
> >The patch in question is this one:
> >https://lore.kernel.org/lkml/0c18fd08ef19497768070783da28086e01d11a00.1765866665.git.fthain@linux-m68k.org/
> >
> >I may have found a solution for the problem, but I don't understand this
> >code, so I've Cc'd Ard et al. I don't know whether the __bug_table section
> >is relevant to sev-handle-vc.c. If that section is not desired, I propose
> >to make this change to Peter's patch --
>
> I think that the issue here is that we're trying to use WARN in the early boot
> context. We should probably add CONFIG_DEBUG_ATOMIC to the list of configs we
> disable for that:
>
> diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
> index 4f86c5903e03..bb36dcef7d08 100644
> --- a/arch/x86/boot/compressed/misc.h
> +++ b/arch/x86/boot/compressed/misc.h
> @@ -14,6 +14,7 @@
>   #undef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>   #undef CONFIG_KASAN
>   #undef CONFIG_KASAN_GENERIC
> +#undef CONFIG_DEBUG_ATOMIC
>

In spite of the prior art, #undef'ing CONFIG_ options is the worst
possible way of dealing with this, as it could result in
inconsistencies (as Finn already found). And it is definitely not
something that belongs in generic code - the x86 decompressor is
somewhat of a lost cause at this point, I'm afraid.

In this case, I'd prefer it if we added a helper, rather than
duplicating the same check 3 times. But in this check, testing for
__DISABLE_EXPORTS is perfectly reasonable: it is already used in this
manner across architectures.

