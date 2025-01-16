Return-Path: <linux-next+bounces-5235-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E087A141B5
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 19:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77FC8168046
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 18:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6338B22C9F9;
	Thu, 16 Jan 2025 18:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iMojqgd8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AFC22BAB7
	for <linux-next@vger.kernel.org>; Thu, 16 Jan 2025 18:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737052166; cv=none; b=N8liSIB905ZNi0BlEG8cl8gTGvYH1Imnakt+bYa10u0bXblSiFRmeJB6r+ic7q5j4fU3XPUVrF2hY3N/RPfg4WISqnpNnSdK8yAgUngRG+Ytdrxg8FBIFX0sTcmuJ5WgzIQRT0oFf8/Qfib/VYzyv9yVlGvNFarZWa+6gnLHqeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737052166; c=relaxed/simple;
	bh=l1OcMmQYwUx9p8iiGAZnlllFzMjLn6bzvfAjIyOIu7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I2phd/4P2bXq+4P5y2CIQmYpThqZOyspbKx7ebAxp8fPBnSXXz9N6oZPlxG4dh79DhqVQk8XESzYP66k8GbZoAvwCIacEtd6UMXh7uhm1n6XzvhohoJQAl8ZQMpRINXUEvzJel1UgcY9x6ugaF+2HoMCDu4j/0xA2kXRpLcUyzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iMojqgd8; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4678c9310afso12351cf.1
        for <linux-next@vger.kernel.org>; Thu, 16 Jan 2025 10:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737052164; x=1737656964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZpRoutbDerQITMdKXxk7g8r4QuvuApllKvagSZTEyc=;
        b=iMojqgd8gXHjj5UcKR6GBzxe6f219piuwP/i7zczTYwVFKulhScchZCK7S0cifgi9G
         GXjgB4O3LAqrl9OUvsWsgtYslkTUQqixUnCMnDr1nJ0kVyFdVzXPrWG7SGvQ6e4cu6RZ
         q47Ud/ivOPJIMoH6z8uIYstVFiKq++K95+iIzBy6/f1PnalPwzyupDEAISMky2yIS1Ai
         iferbJg/s2f2fcGgGR8mNCM1CTTWhOzWhuBnhEnrcZPhwJIah14B8lTqVzHjH1qNc4lT
         9jqMKdsLbvIf6Vd0bBlGtQoNT9O76rRs7HM9MTGh45jUCZuwXCbew7D21sz1CH80a3SZ
         lzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737052164; x=1737656964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZpRoutbDerQITMdKXxk7g8r4QuvuApllKvagSZTEyc=;
        b=mqszjF7MLjJSCC5xVgGpChHSoVW44UYB0jmzO0+SE/vtsjAEu3SPk/hFl/XmQZkZ+o
         89TLvLfwppst5WPX67KaU9thvlmo3P3Yu4ikEW4/kc7amdOiRIGsO0NVllaoT2jyJHWz
         oHBdztNDb235Qx7bfftljYsG9UNW80Bk1IFCJEOGr1kbKKGkjqpwTIniKGDkvexOXEZl
         Y5dq1/K0s693crtemu59JUhf452qfYDB2qOus0edWDOh1ukRBdaN6KkNX2Ss/tBpmqy5
         iwvkju53Eb4tBjOfUSGw2dT6WIZehDN4WDBxBUJXfXinHCVGEjMjOKT3NCYe12W3r1EK
         GRfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXClq6Ml00tWGlcR43t4rx9NTU2CR9BC3NRSJKkR8wKxsV1xXkFF+qv0izUzrI92E82+yFG12QhudEc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv6KQRd164CTWgF/2A9GI36sq3MB9ledSR+xzf0mvNwMxQ02OS
	0a3+d8Xne98rxW5Fh0yCUcxgWFkJRmU9FzSQ+3NrdWsN7bWBA1SVd4zg4IfsJHiFaSV3hh22tDE
	Yk4jEbZOXjlh+uwNN7oTDePf5V6wvmJwBBRuzPOmI5npWq9WJm+PC
X-Gm-Gg: ASbGncu3vxY3JVpxuvcWsRKqwdjDi6eW0XPc+r40J2UQ4Hc1oE/YZWDt71jHgae2OdU
	iNI5S1UWm6qxI6CtmcZJl52NqweUCh3mjue8sKX0NbUoXvVQ2j8fzcz+BSOGOTVKHsQ==
X-Google-Smtp-Source: AGHT+IEZjA+mZNySZ8gYJsZTkf0TTrT48sOBimJ2CHhQIQotpLOzy46S/e8A+cHLNf/Jg+ZiYUPeP0WnH4oYmlW5QUQ=
X-Received: by 2002:a05:622a:1894:b0:46c:77a0:7714 with SMTP id
 d75a77b69052e-46e054bcc92mr3880281cf.21.1737052163376; Thu, 16 Jan 2025
 10:29:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116170522.23e884d5@canb.auug.org.au> <CAJuCfpFkPvyDLNxjQ1bJS=fQds-mUS=+e-ZKf00nSQ5OyohhRg@mail.gmail.com>
In-Reply-To: <CAJuCfpFkPvyDLNxjQ1bJS=fQds-mUS=+e-ZKf00nSQ5OyohhRg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 16 Jan 2025 10:29:12 -0800
X-Gm-Features: AbW1kvZ220VnRHDYbrVNSk_wQUWl7SiD8HxPje-qvPUVoKpDm1nfwvDOgLT-5Hg
Message-ID: <CAJuCfpFo5TGTiQxnOGck=Gf_osSt5=BvLGmZodwbU5RHScK5gQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the mm-stable tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 7:10=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Wed, Jan 15, 2025 at 10:05=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:
> >
> > Hi all,
> >
> > After merging the mm-stable tree, today's linux-next build (htmldocs)
> > produced this warning:
> >
> > include/linux/seqlock.h:341: warning: Function parameter or struct memb=
er 'start' not described in 'raw_seqcount_try_begin'
>
> Oops. Thanks for catching this! It should be:
>
> @start: count to be passed to read_seqcount_retry()
>
> Should I send a fixup to Andrew for inclusion into the mm tree?

I posted the fix at
https://lore.kernel.org/all/20250116182730.801497-1-surenb@google.com/
in case it's needed.

>
> >
> > Introduced by commit
> >
> >   dba4761a3e40 ("seqlock: add raw_seqcount_try_begin")
> >
> > I seem to have missed this when it was first introduced, sorry.
> >
> > --
> > Cheers,
> > Stephen Rothwell

