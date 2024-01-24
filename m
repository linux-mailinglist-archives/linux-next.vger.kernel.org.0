Return-Path: <linux-next+bounces-844-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9860B83B5C2
	for <lists+linux-next@lfdr.de>; Thu, 25 Jan 2024 00:52:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FCD82870E4
	for <lists+linux-next@lfdr.de>; Wed, 24 Jan 2024 23:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BC6136675;
	Wed, 24 Jan 2024 23:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VkrwiB2a"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAD312C532
	for <linux-next@vger.kernel.org>; Wed, 24 Jan 2024 23:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706140359; cv=none; b=tuxC3Jnf6C9vupjFV14Xi/wXlPijsvIcMd4iJ5toxa09AmCbB6dvwwBvIjTaT7Ig3oRyMm1nTI6+NBJf2mrWcEw/a1SNigRgDo/I/GWtDcmULvQUwXmndlNo6gSUJ/EGjXRvyFzlRjnb9dCqyG+/kKSWAmXatdMWFGvRo8NLuu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706140359; c=relaxed/simple;
	bh=dkPOXnDEon7hfFcvOvi0AHwWCXpk2G2X1sh8XFl80fI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AI7T/xI6k0KCP2tMVyoFPi7i5wHaVOwxBn4Lsxc2Sglskt2jhk4Rc4rLYK50pHfEE8ACE/E0pAILha1mhphBxNpzCXkf21l6AGDzI84bIGNQzOv3yOgjeKkV68BjZL1DRNVoxVhwOvEyMnKyD/KOs9ybbxFFDxRB9jvHBLrClXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VkrwiB2a; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc221f01302so4837517276.2
        for <linux-next@vger.kernel.org>; Wed, 24 Jan 2024 15:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706140355; x=1706745155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siCkJ3+nRrnEEV/cIxml7sSFdBvyOQ4Q3/VfxMKRmag=;
        b=VkrwiB2aYR8Ztd/HS9hY4v4hfVji3ojdjzkMphh3/05a+4RTXGwpCkWCZaTE3XwzYp
         gV2HinEvRdE8rNoEk+HdXKOQ2xgIe00u+wr38dTrwhnWc0zV8YdjVvwJ+xvizZ0PQ81g
         eV+CdbzE1ukzu5eKrqqaaQ/0FlhTN25BaDjjOG20vsniUya+x8HDWZBE5Ez5ZLUJcGtC
         NcPv3N0WEgenwGj7VQeu7d0IITe3a4eEQvJwgZfa7hv+gjZrelJ5nfflcY7Qo1lPA5qY
         WaGTrjwcxNUvJC5yHmZYsAhhrQBVcL3GfukVygNqxHGvmP2Un7L8DiJtPRhYvVLOGdJ4
         sPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706140355; x=1706745155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siCkJ3+nRrnEEV/cIxml7sSFdBvyOQ4Q3/VfxMKRmag=;
        b=l9ZchUrThDvwCFgMs4mPcJwmHtLH/9adLv42uKg9Nli4LaRfaXQFpXpJ7RXcePteRd
         3K5ywvEadoDGBgNLROrUQgqH07/Nm14LWhkXasEyqX8+GcPOQUC7KlGdRYRDqy84zIKt
         oZyLJAR1soQBTBlf9OlO0yBYc0cvs0M+UjJoOD/b1k+4Hm7jVJderHqsxNyqry6HvmEQ
         LDG0uEiZVTeveDDaGjz/Ay5IKKIiRNCzW9flzMC47BmoWTrIMNgGbK9rjpALECApsORQ
         niKH16yJuJyWr9r68woHMhTKRRXg1mNhEp2jKYo1k9Rmn9JWoUQy3G7B4AO+Bcz5Uhq7
         +q0A==
X-Gm-Message-State: AOJu0Ywf2lwmPkHgLxCJxR00/nHm37fojmrZCup7Rw8gyEdCpqhUVXtP
	oR5+e9ldsKRqlEf5NgCIEGV42zuhJ5Pffyl6UHvotLugqPVQs1hFxEwMWKIMlNPBLjXVIktbNOp
	PWabbQP/nRrI2WkJtJNO7Y5GZgB51aZfcCQLN
X-Google-Smtp-Source: AGHT+IGTfJYt4MI4ga2viErUFyGW78IX6A5k6MCpNuIrV7N3/YoYwHJJePqA5mzf2ETqdzLEnreaB2rWAee9DU1dIpA=
X-Received: by 2002:a5b:4d1:0:b0:dc2:325c:57cd with SMTP id
 u17-20020a5b04d1000000b00dc2325c57cdmr145494ybp.73.1706140354766; Wed, 24 Jan
 2024 15:52:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125102333.6701aa08@canb.auug.org.au>
In-Reply-To: <20240125102333.6701aa08@canb.auug.org.au>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 24 Jan 2024 15:52:22 -0800
Message-ID: <CAJuCfpEyOd2Y-5gMGPhWDDKe+fEdFOGRCw8CnFkk8Si=1hOo=A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 3:24=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the mm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> make[4]: *** No rule to make target 'kernel/elfcorehdr.o', needed by 'ker=
nel/built-in.a'.  Stop.
>
> Presumably caused by commit
>
>   1777bfb42f56 ("crash: remove dependency of FA_DUMP on CRASH_DUMP")
>
> from the mm-unstable branch of the mm tree.  It looks like the expected
> file rename did not happen.
>
> I have applied the following (git) patch for today.

I've got the same error in mm-unstable and your patch below fixed it. Thank=
s!

>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 25 Jan 2024 09:58:54 +1100
> Subject: [PATCH] fix up for "crash: remove dependency of FA_DUMP on
>  CRASH_DUMP"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  kernel/{crash_dump.c =3D> elfcorehdr.c} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename kernel/{crash_dump.c =3D> elfcorehdr.c} (100%)
>
> diff --git a/kernel/crash_dump.c b/kernel/elfcorehdr.c
> similarity index 100%
> rename from kernel/crash_dump.c
> rename to kernel/elfcorehdr.c
> --
> 2.43.0
>
> --
> Cheers,
> Stephen Rothwell

