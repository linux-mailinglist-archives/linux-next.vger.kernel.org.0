Return-Path: <linux-next+bounces-3548-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 84979968DF6
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 20:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1AABB21055
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 18:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019531A3A8E;
	Mon,  2 Sep 2024 18:55:36 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826A21A3AB4;
	Mon,  2 Sep 2024 18:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725303335; cv=none; b=STTcsMQKKRdUPo+AaOW469v0Z2fy8GhmB5OBBhKGG+27qs/yfCbNsH3D2x3Urk2bh5QH3Aor/KI8fdevFnMQixu7yFgV2cHhh+GjU7qC0CbJmH4eZrz6I7wtuXX1ZYUj2YKIfJo/n05lwaPPG4pUo31ba0/XBcMaqUQD8Brpbtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725303335; c=relaxed/simple;
	bh=rX5XkmhXk6gC3MpVezdKzDLr3hE5LFcsGFoid73tBZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0eTGCxZTKDTwiJxJUznE4ajjoSXsh26Mt3W118Y7D7lYMFwawVEHTboiaXFUzZJiy+HTt8ir7p9VrWpE6vF6Glk5wd41xsQi6qMFHTpbZoMp0MgoKgkigmTPHY9BP6enPzG1EFW8v73N2+ZBxmEJLRtMQm/xEzWAwmjv+w017M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7cd9e634ea9so2988549a12.0;
        Mon, 02 Sep 2024 11:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725303334; x=1725908134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7PspJxYIBwacJ8wrDrSYEhvwkcAvTj3wScyJGG8fyc=;
        b=Y1cj3L4D0wXnK0HuX0NJVaG5lkX2dC5anoMK/Or3pPR/eb+Xw4oUMaiTmXj6uaish5
         C9sga1wxo4EYuP9GiUCXWfFHCjXy2NRlp4E21yteBc9/u7eXx0fNRdUgqxua7z591dox
         iabTxdaBkthR8fXUjT4a2GlXrbMG0CqDjBjm8GTLxsAWKiKNMB1+xjHkJs0zpHHREXri
         b9QMpRTKolJBLlPG2JZ9DrsBlKmjINv/Oa3gYgOcoHU+26pNe1S0GSs9YEVh/K78mPSf
         gKScgTy0qfohsjp09dH69qU11wczKjBIeOEHYDJq+qOd3t0yxD+A/v8lYCsf5G66HQlp
         UFGg==
X-Forwarded-Encrypted: i=1; AJvYcCUhKuL6qadXAd8dIrolYHtKpxfVltKyUZuEjRYcGczWM4yy4cnTFnsaRUdwulK1seX54mm/sRLuX/VznmA=@vger.kernel.org, AJvYcCVTvwOabsCirK4wfIqZEyk3wPrneBetkFha7w9a3xGQxeAUasoHwRDVRroxA/uYk0x1C2qMGrjcAfqZ0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTetKsE1Biv/FaUO5qpJgVMqs6OgkaNnZkBV/0oKL/nf7ZWCjW
	Z+4zaOBX2RP6e4HDry2hHyuJIGvb5glR9VlEjYmVSZmDBYb9cITofFlm5pFcNZc0Qkgmv2DcIyn
	xN2BpHsAeudO0V3e7QXTk+/U6VnY=
X-Google-Smtp-Source: AGHT+IGwFf9JPPBPJminq+ZPxPP9Wr8G8QB6Tp6yse9TPjIVfPg+QaOSv2/rL0Wn+EOd/1b3PwEd+c57Na5QmuIfb4k=
X-Received: by 2002:a17:90a:12ce:b0:2d3:b643:8386 with SMTP id
 98e67ed59e1d1-2d893284e4emr7193606a91.9.1725303333507; Mon, 02 Sep 2024
 11:55:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902081837.6def2734@canb.auug.org.au> <ZtYHGDaoJrwLgs--@x1>
In-Reply-To: <ZtYHGDaoJrwLgs--@x1>
From: Namhyung Kim <namhyung@kernel.org>
Date: Mon, 2 Sep 2024 11:55:22 -0700
Message-ID: <CAM9d7chNFFdHODHX9sCKLoHCpuCdW5E+DOobK2-kOrz8fVLucA@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the perf-current tree
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, 
	Veronika Molnarova <vmolnaro@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 11:42=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Mon, Sep 02, 2024 at 08:18:37AM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > In commit
> >
> >   387ad33e5410 ("perf test pmu: Set uninitialized PMU alias to null")
> >
> > Fixes tag
> >
> >   Fixes: 3e0bf9 ("perf pmu: Restore full PMU name wildcard support")
>
> In the perf-tools-next I have it as:
>
> commit 37e2a19c98bf99747ca997be876dfc13f9165e0a
> Author: Veronika Molnarova <vmolnaro@redhat.com>
> Date:   Thu Aug 8 12:37:49 2024 +0200
>
>     perf test pmu: Set uninitialized PMU alias to null
>
>     Commit 3e0bf9fde2984469 ("perf pmu: Restore full PMU name wildcard
>     support") adds a test case "PMU cmdline match" that covers PMU name
>     wildcard support provided by function perf_pmu__match().
> <SNIP>
>     Fixes: 3e0bf9fde2984469 ("perf pmu: Restore full PMU name wildcard su=
pport")
>     Signed-off-by: Veronika Molnarova <vmolnaro@redhat.com>
>     Cc: James Clark <james.clark@linaro.org>
>     Cc: Michael Petlan <mpetlan@redhat.com>
>     Cc: Namhyung Kim <namhyung@kernel.org>
>     Cc: Radostin Stoyanov <rstoyano@redhat.com>
>     Link: https://lore.kernel.org/r/20240808103749.9356-1-vmolnaro@redhat=
.com
>     Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Ok, you only updated perf-tools-next.  I thought you did it on
perf-tools too.  I'll update perf-tools soon.

>
> As I have:
>
> =E2=AC=A2[acme@toolbox perf-tools-next]$ git config core.abbrev
> 16
> =E2=AC=A2[acme@toolbox perf-tools-next]$
>
> And scripts to make sure we get enough resolution to avoid such problems

Sure, will do.

>
> I just checked and yeah, on perf-tools/perf-tools it is:
>
>     Fixes: 3e0bf9 ("perf pmu: Restore full PMU name wildcard support")
>     Signed-off-by: Veronika Molnarova <vmolnaro@redhat.com>
>     Cc: james.clark@arm.com
>     Cc: mpetlan@redhat.com
>     Cc: rstoyano@redhat.com
>     Link: https://lore.kernel.org/r/20240808103749.9356-1-vmolnaro@redhat=
.com
>     Signed-off-by: Namhyung Kim <namhyung@kernel.org>
>
> So I suggest Namhyung fixes up the Fixes tag to have a longer prefix for
> the sha and Veronica to run:
>
> =E2=AC=A2[acme@toolbox perf-tools]$ git config core.abbrev 16
> =E2=AC=A2[acme@toolbox perf-tools]$ git config core.abbrev
> 16
> =E2=AC=A2[acme@toolbox perf-tools]$

Yep, thanks!
Namhyung

>
> > has these problem(s):
> >
> >   - Target SHA1 does not exist
> >
> > Actually, the quoted SHA1 is too short and is ambiguous in my tree:
> >
> > $ git show 3e0bf9
> > error: short object ID 3e0bf9 is ambiguous
> > hint: The candidates are:
> > hint:   3e0bf9fde298 commit 2024-06-26 - perf pmu: Restore full PMU nam=
e wildcard support
> > hint:   3e0bf93e0354 tree
> > fatal: ambiguous argument '3e0bf9': unknown revision or path not in the=
 working tree.
> >
> > so you should use
> >
> > Fixes: 3e0bf9fde298 ("perf pmu: Restore full PMU name wildcard support"=
)
> >
> > --
> > Cheers,
> > Stephen Rothwell
>
>

