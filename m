Return-Path: <linux-next+bounces-2049-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DB28B152A
	for <lists+linux-next@lfdr.de>; Wed, 24 Apr 2024 23:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 464CB1F245FA
	for <lists+linux-next@lfdr.de>; Wed, 24 Apr 2024 21:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24ECF156C66;
	Wed, 24 Apr 2024 21:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0A/DJg2Y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A2C156C41
	for <linux-next@vger.kernel.org>; Wed, 24 Apr 2024 21:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713993862; cv=none; b=STnEMpP+dLYZnXnSHqX65XD3WyrssSPPvJwOf7n05xexgWHH7hovoyHDVKg+2l/zu5Ud++z9VTWw57wk+qfFxO/03v3UCv+NwGHhoICDl/acE4TlXmfhXfa0QyGY8WARBFvO3EbQ8VTMzvSqrCyMgZ4VwKznBB3DVEJSWB0mJ3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713993862; c=relaxed/simple;
	bh=56L3u3mWz/f7Ancxj6/7U5aabFs9KbNGRAXetHwkqGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R54Zpp84kxXwevAZv+gX3xl5p+BkNKLMTflvSiYAyrmIlnJ93x65tTiZGeWblbTd7d8y+/aNlGTGyZrKPwZCYxpWwOthVuf+3VgwJZBzbIxuDwEBG3uJmY78NKc3h3JT0Hu422uZPi59vKRqflGibE7N6u3UPtp2Dh9zg10rYJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0A/DJg2Y; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-34af8b880e8so224305f8f.0
        for <linux-next@vger.kernel.org>; Wed, 24 Apr 2024 14:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713993859; x=1714598659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvrVeIhNXlLxNagvCO/8b09YzKjzUYPXySJa+PaO2tY=;
        b=0A/DJg2YoaVW38ZRru18w4P2asWOyVP48SS3jbg3rXHNGVpOjLRBc/P8amk3eyE/LC
         kcIWp9aI6Wzyne5NJA9jfUm1NnVVOd+iFhMorE76MV9nyZ5NCwVCEGyd8NIXS+9I9tpC
         di0g6w8Hmtvy1T4o4c1UtgII7epW+7ivxMzga/U/7SCS9dazquOwNTe4Zn1NRn9eSG8l
         aDHH/2VhZOiFDUFjnT9sWgGemr4LFU9JuhF9AYvRBGPoekrgRoMXC7gCp0z2aBWgupuM
         TnY63JX8g0Bfizn8xc9+fgEeUMDJYRgX97WDuCOH4yO1l2fkpIPIZ5xZvFHTkZaNBkpa
         RkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713993859; x=1714598659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvrVeIhNXlLxNagvCO/8b09YzKjzUYPXySJa+PaO2tY=;
        b=R1febY9wZSFCK4q2oPvWCLxbj6L6clIjRg7tLAubfNnYazg2U30xvgne8kmd2Wmzeu
         9QpROhGEEV9km6aKQhwUbFt7tMnBqxPOJ2yPGPLYLIxck64bBYgJK2MOCeZk7rpCVjS+
         QsY6S0nA8kQlnZUFTXa+c51FExYwhNKfigSmjyUJUf2XPsFxeS0KOTER72YV69UD17gp
         YW+xS3kbC9v9zQxyX5ukqED2lP+NSsJWLCka0anNE/6uExoRlpoDg+ihaDZtKuqnkA2C
         GYwjfXnP8n5YGi73Tifebuu71GuL2nFiNw8L9I6EN2eYephzUYb2EyaEih5QVNYyYYde
         gpDg==
X-Forwarded-Encrypted: i=1; AJvYcCX8sU9sFS/4b3yP0g2X9EumM4q1B6olILvhdfRPiz7ZtRNkOxVMnhWEsVxPLUOaO4mFNsGWUsudPOp1NOmBFkNtZmszNwMsBm8kDg==
X-Gm-Message-State: AOJu0YzwQ0Lr5zOrCRwy6dr+0eKP3hBltJRdMOfb2VzkkffrOcR9iMyJ
	c2mp7FCG71BVPurniZs/C5vmudGrDmL68rU/tfDb1hfzg8YbEI1BMPQC9LaWLunnTCXKt486PK4
	0U/EJ6oVg26uhBXM+aqlam8mQuWaZrSdAt86T
X-Google-Smtp-Source: AGHT+IHU5ehhjm1YMUQvjYmLuPWwk+uIlJ9LXIJUYbVGwHDdWS3Qv0SH/JGJHe3voHwchmH0mCVvXAOu5dJZMCzd5Qc=
X-Received: by 2002:a5d:6b87:0:b0:34a:4b4b:7f4b with SMTP id
 n7-20020a5d6b87000000b0034a4b4b7f4bmr568108wrx.19.1713993858389; Wed, 24 Apr
 2024 14:24:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424123935.2f65e886@canb.auug.org.au> <20240424130757.531be2842c505a62246d180c@linux-foundation.org>
 <ZilrutXaEB0laSvr@kernel.org> <CAJuCfpFmZmw-CW17OWjmxzh5BdXsc7a_1HcdEL7kmLTZDpU5kw@mail.gmail.com>
In-Reply-To: <CAJuCfpFmZmw-CW17OWjmxzh5BdXsc7a_1HcdEL7kmLTZDpU5kw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 24 Apr 2024 21:24:06 +0000
Message-ID: <CAJuCfpFT7tBigfSEO2iGKn5YtB0hFgVF-2Sfh+60nAO7drCeqg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the modules tree with the mm tree
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Luis Chamberlain <mcgrof@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 8:33=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Wed, Apr 24, 2024 at 1:31=E2=80=AFPM Mike Rapoport <rppt@kernel.org> w=
rote:
> >
> > On Wed, Apr 24, 2024 at 01:07:57PM -0700, Andrew Morton wrote:
> > > On Wed, 24 Apr 2024 12:39:35 +1000 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
> > >
> > > > Hi all,
> > > >
> > > > Today's linux-next merge of the modules tree got a conflict in:
> > > >
> > > >   kernel/module/main.c
> > > >
> > > > between commits:
> > > >
> > > >   7f014cdda4cb ("lib: code tagging module support")
> > > >   5ab9b0c7ea5c ("lib: prevent module unloading if memory is not fre=
ed")
> > > >
> > > > from the mm-unstable branch of the mm tree and commits:
> > > >
> > > >   0746f9982603 ("module: make module_memory_{alloc,free} more self-=
contained")
> > > >   18da532eefc8 ("mm/execmem, arch: convert remaining overrides of m=
odule_alloc to execmem")
> > > >
> > > > from the modules tree.
> > > >
> > > > I fixed it up (I think, see below) and can carry the fix as
> > > > necessary. This is now fixed as far as linux-next is concerned, but=
 any
> > > > non trivial conflicts should be mentioned to your upstream maintain=
er
> > > > when your tree is submitted for merging.  You may also want to cons=
ider
> > > > cooperating with the maintainer of the conflicting tree to minimise=
 any
> > > > particularly complex conflicts.
> > >
> > > That's a shame.  I don't see much that we can do to reduce the damage=
 here.
> >
> > I can rebase it on mm-unstable and this can go via the mm tree.
>
> Conflict resolution looks fine to me. I'll run relevant tests on
> linux-next within 2 hours.

Tests are passing and module loading/unloading works fine on linux-next.

>
> >
> > > Suren&Kent, please review (and preferably) test Stephen's handiwork i=
n
> > > linux-next?
> > >
> >
> > --
> > Sincerely yours,
> > Mike.

