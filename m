Return-Path: <linux-next+bounces-8009-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCA4B2B980
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 08:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA738682A9B
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 06:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FC825A34D;
	Tue, 19 Aug 2025 06:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJMPff2T"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889BF3FE7;
	Tue, 19 Aug 2025 06:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755585244; cv=none; b=mrfcvssRbVeGG/fZ/+EJnOszyiHffMcepvW5eZNVSF68mdMBCQ09YRgN+fyJMlv+ibhsy1+ha5Ms6zRdeaozPceCmFcyQc9PXpysgBHBsYCZ1kLEpoH8049T4e98H4xgy3pN09nM9mIK0+b/J/6dWCImWuDblEgzo7WmyEMZUlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755585244; c=relaxed/simple;
	bh=M/3ie/2boyOvZGJGab5YslAVveCDGUHz8hKaCAWvKkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PnR4ALV534QOxmsgmdzD08q0aoPpOYxe1FSaVL6oO3RhwZaIc0eVwBXBNqGnq6iynsuzRq4RVsViNDm6nKe0bunotS4s2xR1w2Ogp37TJj5hx476SfEtrOCRbN+0qhWIFilLfgaYYjibyBgwdfgmUa0bFZqUNsdO/GKjTNVgTLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJMPff2T; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-30ccec59b4bso4083139fac.3;
        Mon, 18 Aug 2025 23:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755585241; x=1756190041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3VpbzxzEkcEzo1uHcgT71iyAEqp47/7STtYxmZ8los=;
        b=LJMPff2TuXvguf1+7EByk409Rb7Z0x+hKku4ItfomvZdbjBtT9Bpamzvxu0MH+SZ+7
         F5CRaTfA17rLUAwsU5fYLBrpzSA8IDY/TWziGIbAsKb3iGectMBeUPq3Lk3+mUAKuJ5q
         YyP/2e8eYRSAO5recN2Lnc24k5YqASmFCnZPOfmFeIqvHWk1tz1soPvLCqtvtat0uV7+
         4lynR8QEnK+dWl8BDZhALrHLAGOtF0FegzEgiCkVXF0dd6jQgJ6f5QryRS7DMLSZjLYC
         c+XC4/vsMCtleDogFj4C/OxR5xXiNXwmfASSig9l9qGzk9MU9MRvQL5AkwLzzax1zGiT
         JaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585241; x=1756190041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3VpbzxzEkcEzo1uHcgT71iyAEqp47/7STtYxmZ8los=;
        b=RUhM0twQOGWfocBda7fewbfsxfBHJsbeB3C5uZTARphzbseH9nQ8bQGR/QbV9eURDj
         yg2eSkv0Qnf1fUE/k/gwixQSLSj1++uYeZpQ/VyC4OKrtCL35YytIz2/APi4KhMPRUvl
         642Mp0Jr2lM3EFyPsRU4XVh1RS/KVG4aAnCOtGl8/4ET7W2IxCXcSej9JQbHtDbkG+A3
         xKOJS7ormBY2SR2UyaTzLaR/pd0megv+gLFPHNDMutaNOKgjBorzwuTCBZkuTP1M7e/Z
         sjDhrXL7sPS+DMpsnaG9iglNCFq9+KMntQJT3IUmu2NHtDxLFgViuA2zpEYAbljJlbA9
         IZZw==
X-Forwarded-Encrypted: i=1; AJvYcCW0Lujbe1JN6lGflJc4Oe7Ro42YWq/2TpHYueqxgJd7umXlgQm+sSAVLe3Up4WUrdkGDXgAQrzBRB/3IOs=@vger.kernel.org, AJvYcCXyc24Lm6wrp87G3ZffIBD1YV5joUhZ9ucepuvHmLbjJoGUFHG2JsoI9OJeH4q0S/2E/aGdsb7P0C+/Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB6ezWozOyLqTesNlvJtUsTo33y+c3xZL/jAOSRVPfFANhHZ6q
	ljDhtTJLFa6KqC/AnA+DcWxaQItNVdrIDScK4+Cv6FfyGVT2ZS5nmv+86u4VR2KK/1Jg0kL3VMS
	83wIG0E7QVnw42xWPC8jUX+LJPZ2mlfU=
X-Gm-Gg: ASbGnctxyv2aPOvku9bMgNYH/v4vf/8zDyHckQJC8U67Nv15yc4+uDznD6kke4u/ysZ
	yrhWBuT2JbexJUVmy87jzPSTkwZUfOxkDS/ZcGhJL/BU7pQ+gtU4s/0Ynv63zb25JF5CENbAajB
	lIC7RxWGTLF2v3VcikcosqaDG3FH5MxK3rZ87pqxhsFabrsF3AZw5Kme+KPLrLqJef3JMNROUfP
	ToO
X-Google-Smtp-Source: AGHT+IFB2lsWvItMhN1kOS4y9iO+D1PQ1ACsQ4YmtNScKHE8KbS330nCGcFUX5FHzDqevNahYYQ0hwgH5GN9QPJy+ZM=
X-Received: by 2002:a05:6870:5106:b0:30b:7a64:d67b with SMTP id
 586e51a60fabf-3110c15084amr1155481fac.5.1755585241367; Mon, 18 Aug 2025
 23:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABFDxMFpzS9ynd7OsJWdKwZD-kW0-nu9=HhoFUmiOm5Jkz_QzQ@mail.gmail.com>
 <20250819053926.38696-1-sj@kernel.org>
In-Reply-To: <20250819053926.38696-1-sj@kernel.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Tue, 19 Aug 2025 15:33:50 +0900
X-Gm-Features: Ac12FXy5FcKZqIIuPS-yCKN6CS4Zziv3Qm_H8RrDUZAquapCdZkP9ri20cqj2Fk
Message-ID: <CABFDxMHuEgtYj-JXM9Jr4FyA2ETNbNDQ+1c1KQu8UHV=HegAtA@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the mm-unstable tree
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 2:39=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote=
:
>
> On Tue, 19 Aug 2025 10:55:13 +0900 Sang-Heon Jeon <ekffu200098@gmail.com>=
 wrote:
>
> > On Tue, Aug 19, 2025 at 10:14=E2=80=AFAM Andrew Morton
> > <akpm@linux-foundation.org> wrote:
> > >
> > > On Tue, 19 Aug 2025 09:59:20 +0900 Sang-Heon Jeon <ekffu200098@gmail.=
com> wrote:
> > >
> > > > > has these problem(s):
> > > > >
> > > > >   - Target SHA1 does not exist
> > > > >
> > > > > Maybe you meant
> > > > >
> > > > > Fixes: a0b60d083fb6 ("selftests/damon: test no-op commit broke DA=
MON status")
> > > >
> > > > You're right. I think it might be changed at the point rc1 -> rc2 o=
n
> > > > the mm tree.
> > > > Is there anything I can do? Or maybe Andrew can help?
> > > >
> > > > I didn't mean to bother you guys.  Also, original patch is from her=
e [1]
> > > >
> > > > [1] https://lore.kernel.org/all/20250816014033.190451-1-ekffu200098=
@gmail.com/
> > >
> > > I deleted the Fixes: tag.  The quilt filename
> > > selftests-damon-test-no-op-commit-broke-damon-status-fix.patch means
> > > "this will be folded into
> > > selftests-damon-test-no-op-commit-broke-damon-status.patch"
> >
> > Thank you, andrew
>
> Thank you for Cc-ing me, Sang-Heon.  Thank you for fixing this, Andrew.
>
> I actually suggested Sang-Heon to add the Fixes: tag, to help Andrew easi=
ly
> understand the context.  It didn't make noises before, but everything cha=
nges.
> Anyway I'm also responsible for this noise, sorry about that.
>
> Another common way to send followup fixes for commits in mm tree is, send=
ing
> the fixup patches as a reply to the broken patch mail thread, with a brie=
f
> explanation of the context for Andrew, like my recent one[1].  I think us=
ing
> this way without Fixes: tag in the patch can still help Andrew easily
> understand the context while not making noises.  Sang-Heon, please consid=
er
> using that way if you get similar cases in future.

Thanks for your advice. I'll use Fixes only if that commit is in the
past version. If commit is in rc, I will consider sending a patch as a
reply.

> [1] https://lore.kernel.org/20250709182843.35812-1-sj@kernel.org/
>
>
> Thanks,
> SJ
>
> [...]

Thank you to everyone. Have a nice day :)

Best Regards
Sang-Heon Jeon

