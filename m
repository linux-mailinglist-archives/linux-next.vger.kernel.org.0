Return-Path: <linux-next+bounces-6476-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22087AA543E
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 20:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E56E43A337A
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 18:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B78266F16;
	Wed, 30 Apr 2025 18:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0deOkIC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDB7263C7F;
	Wed, 30 Apr 2025 18:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746039279; cv=none; b=bfjI3R6IvgoW5X6eaOQs6uJujuErBCPr22VHf4GzuuVLkogAkhdaW9O9ad87xSbGiKPioIj9kI2QoqD/kFvmNpXQ4Uf7CtKlspm0w+uzcEaF7LebtxeEFJhBfhzO7+xwxO6toztKNkDAsijsAvS5mNdUfTS6QWFV4/7Q+0ohTAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746039279; c=relaxed/simple;
	bh=RuEs/0OB2TeUNVBJ7KbaOKTja7dATGjXX+pvvcciRpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IEC8Roobtm38SdAPOdHp7S9u+xOfLEyV4PUoMGHYN6Km8KZrAJD3qBwwvW5tDvZUtwFH4YIqiCffUAzeVbEJPyBFggAolHU8Hcgpas9tOPFRC0xgWwP5tRbiAPHQp7r+hiq0kQgLfxlcV25miFcxpi7184x9ZGnfToS0DHA9wLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0deOkIC; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30c0517142bso1021251fa.1;
        Wed, 30 Apr 2025 11:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746039276; x=1746644076; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INnUYS4aztl17KAR4asCnO8mLObv269L2LB64ZQOrdY=;
        b=C0deOkICKmJQCckbiwLn5NkdfI9azQCB+XgeGB8ZNUwsWJakEsDTFG16vx+Dm4C9OM
         8ldU+w8EvbMr4TrDkaNno3BOuPcIGE4EDb2ZQ52aqFgV5c2lXCMJRD36Wpj5iDCszq1a
         RqER1OAhRSx5NVjT53bRXtOsbDYcmYMh6QywHSzOvYcleiRDNZ5lHD0bnDzDjwph2SOw
         wwk3/VTiGuD5Xk1GdnNfCFUotSj22NtVlRAmRNP/d2JTVLzK/VG+ivSmVQrGJYs+Is3n
         iT8IU63W4jY5Ku3718zkJvK0bLbQQ7fAvJzxrqnNZgJYXbd28o4Xtkrq0W9v+3NaFn9+
         PTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746039276; x=1746644076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INnUYS4aztl17KAR4asCnO8mLObv269L2LB64ZQOrdY=;
        b=nNygLIrvmhM11MdUOpnMpV3A7/03VOJKZlc3b3pXZhVlud+Nt9JfKH1zGEdM4T2vYC
         YKdcR4KnylcShBacH6SSWcScDEcYQc65s/mgZU4TPFJGr9JkGthDnev/fsv7GdDx2cbd
         kAQQmajFNd3AXoGRCeEmi8OUcGdGhk+LxgYe/mYeblQyzTmfQlR6GrBffNMRyfz2fWLd
         bTnhjCYVLqq9n8XMhIRQTEhK4kJN+r5MRooPvRg4zfevkXuUchNb26AEdEDuj8FnAGjo
         kZzieSXDIrpYKMxLsLpMbiZnWZbj+1dPnt9Nf8U5ohOArYraqk9MwvHyTyfssGmaH1Me
         6lqw==
X-Forwarded-Encrypted: i=1; AJvYcCVidq2abLhpt3eMuKm9wbE14k7merO5515RwIBkDJhIAP6g1RSFi07GCSEWR0qI9hGasdanWR5OQ+njMY8=@vger.kernel.org, AJvYcCXEbZ2KcP6mUoyxW6iCYOTWFw11CDJwDDnKVduIvSqHL0GjDlkMMX9jOJtKTDekYsWG8vdpLBu4++C4Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Ad7jXFC84zrCEqSCmH6gq2IsREWSG3aDwBUvwyH7HBxq+61L
	Wdru/VGiCYiCXCM7+wHhkF1EvctIhWbzhotHNT7xHaZYJVK2ywOjH3sCzQOwO6LJqg18Nc+Eg0q
	s97fElX/ZlN2oN8k6v32pigB/LiiqfD3rc4Y=
X-Gm-Gg: ASbGncsjDGTUIZiojZyVnwKFMq1UGt1LJncl34gmaQ4JezPaYY2VX0/RLOEatDkzG+W
	9+bwiv078j3eLkW6Vv3Pnn8g7KeGzNYOJ2kBYch9e4d3xdGKfrC4rZj7HPa54xlcIwlCvw25BHT
	cEb9iIr4ZMQEO9EudRIF1S0qYb4vpS+tCCTMhaMA==
X-Google-Smtp-Source: AGHT+IHmONtEN/xdxnZx+o08PKjnVD4YC1y5YRSR+8KR6UhsXjDD6/Gb/DNtIiijTTw7D4Fogh7Q/wD1bO93+LeWacA=
X-Received: by 2002:a2e:a912:0:b0:30b:f274:d1e2 with SMTP id
 38308e7fff4ca-31e69e31eacmr18647711fa.1.1746039275466; Wed, 30 Apr 2025
 11:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430085544.12800bdd@canb.auug.org.au> <CAJ-ks9mQfDwmz=chKjjcjv2KxPk1su4NWfZXey7nNgQWYXzaWA@mail.gmail.com>
 <4654171.LvFx2qVVIh@rjwysocki.net>
In-Reply-To: <4654171.LvFx2qVVIh@rjwysocki.net>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 30 Apr 2025 11:53:58 -0700
X-Gm-Features: ATxdqUEMlf94wCHJAVWSq2q2Y2wziFWbxXtwh7RY2305fcLElottv8bncPvTPHU
Message-ID: <CAJ-ks9np=yeVPrwNS2BwWJsohqntTgy-2eou68rfWcftR8gjjg@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the pm tree
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, gldrk <me@rarity.fan>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 11:32=E2=80=AFAM Rafael J. Wysocki <rjw@rjwysocki.n=
et> wrote:
>
> On Wednesday, April 30, 2025 1:30:43 AM CEST Tamir Duberstein wrote:
> > On Tue, Apr 29, 2025 at 3:55=E2=80=AFPM Stephen Rothwell <sfr@canb.auug=
.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > Commits
> > >
> > >   9eef70365d71 ("ACPICA: Introduce ACPI_NONSTRING")
> > >   ac9334785c75 ("ACPICA: utilities: Fix overflow check in vsnprintf()=
")
> > >   5de20bc939b0 ("ACPICA: Apply pack(1) to union aml_resource")
> > >
> > > are missing a Signed-off-by from their authors.
> >
> > Hi Stephen, how can I remedy this for 5de20bc939b0 ("ACPICA: Apply
> > pack(1) to union aml_resource")?
>
> The original ACPICA commit does not carry an S-o-b from you, so this one
> does not either.
>
> If you reply with a Signed-off-by to this message:
>
> https://lore.kernel.org/linux-acpi/4664267.LvFx2qVVIh@rjwysocki.net/
>
> I will pick up your tag.
>
> Thanks!

Done in https://lore.kernel.org/linux-acpi/20250430185019.19528-2-tamird@gm=
ail.com/.

