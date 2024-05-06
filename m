Return-Path: <linux-next+bounces-2189-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F091A8BCC3B
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 12:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5C661F22C2F
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 10:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C807580D;
	Mon,  6 May 2024 10:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPxs1gUg"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BABD2BAE3;
	Mon,  6 May 2024 10:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714992300; cv=none; b=t4y91e+jjEzg4QzDfLPhKmtfI0nMJtWJ/46rfZzuPU1lJBHyhSUMMZym+TaTRYOCMpgcCcLKgWlNsPCwG216ZwITOM1bgHvuPZdsafraYbTTR2t1Y22JajaY2C6yw7VyGg6kk20zo8D39PzoVP/FqQSmQgFuqQZPnkIpQUmdT+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714992300; c=relaxed/simple;
	bh=6p5fZPY/k6HoticDelvy9oYtjthQNx017xAtNI1Rnr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BlWNgLVVfiMNOzyLFxyfFsXKu0U+tBshvZOvShere0FckJFnJtNGEcitIWQ2pN5an/gU6Z3DbROWjMkMh0VtBoe8C/HpGCYKD4eAm9z539RVc/u+hcAuE+Ll/R+BnC+j+RKIIa3gBIuAzN47cMmHR4iMkESe+WM9bLrSeoWp0NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPxs1gUg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2407C4AF68;
	Mon,  6 May 2024 10:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714992299;
	bh=6p5fZPY/k6HoticDelvy9oYtjthQNx017xAtNI1Rnr8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LPxs1gUgzHrJE1fZIhS0/FT9ZUZgrpOMCMLoU1aOYeu+QQY3ORFeVAAnnAAb4FjLg
	 BGGg+ykgjvhqRCIYmL+Nw1tEzbUxyZqB+ZU6f8bD6APfMlwRhv5uxNP58WsvZ2/kev
	 ggocuS7voF7qDXwXbeVrgYZqQz9unbYcZsXn2s4XiJJPqFmZn/BhcSjzWaW6g83gXY
	 ZyAnvmWM549NWOvJFqtpw/nzZehJ/jlJwmFduUitkNjK23qOMmAnPbC0eRuWorSzWp
	 wAPnVBKtIwm6QGSOD3wyWigeqtzhe4zmrQpQ2y76+0Yo/WOyi7CH2/Z61cP8YogDLv
	 wTjmL/eiI8SIQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e242b1df60so21943091fa.1;
        Mon, 06 May 2024 03:44:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNm128sPciEUUgVmbQR2AQZOheIpymJvbL9I6OVhREXxFSCCdfAyRmIOk4gIoL+ZwRyjVPKHzOdy7gSsfI/7o9qbO15CG7/w/FAKX2X3gSDmaWqQMZZcwkRlb/fxlw77Gpju0atF2ZlA==
X-Gm-Message-State: AOJu0YyvUpdwGmjTE994jQTP116XqPG1YNhwphFJjKad3kcRctBVD4T3
	9GrRd9MU29fcURQVBOQxsVf6AABcgIUidw20axTT55A6D95SssIWFnd7SL5ddy6N497SDTskzX2
	5qspeOV3A5blQv0Cc+7sDFU9JW8s=
X-Google-Smtp-Source: AGHT+IEzPPARHoWhaTjPe5rSU8Swi3pUhUvurJinD/rL5qZmWA4PYKg9dNt/SmyxAMy4eHsu5liD9yqcgNisLmObh20=
X-Received: by 2002:a05:6512:2090:b0:51e:f0e8:d70d with SMTP id
 t16-20020a056512209000b0051ef0e8d70dmr7709134lfr.21.1714992298415; Mon, 06
 May 2024 03:44:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506121308.09de6f33@canb.auug.org.au> <20240506122914.2f08c2cc@canb.auug.org.au>
In-Reply-To: <20240506122914.2f08c2cc@canb.auug.org.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 6 May 2024 19:44:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNATNY9eYD3U6TJfoqbfn07diULRxyy07isCndSppCt1t4g@mail.gmail.com>
Message-ID: <CAK7LNATNY9eYD3U6TJfoqbfn07diULRxyy07isCndSppCt1t4g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm-msm tree with the kbuild tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 11:29=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> On Mon, 6 May 2024 12:13:08 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > Today's linux-next merge of the drm-msm tree got a conflict in:
> >
> >   drivers/gpu/drm/msm/Makefile
> >
> > between commit:
> >
> >   7c972986689b ("kbuild: use $(src) instead of $(srctree)/$(src) for so=
urce directory")
> >
> > from the kbuild tree and commit:
> >
> >   0fddd045f88e ("drm/msm: generate headers on the fly")
> >
> > from the drm-msm tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tre=
e
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularl=
y
> > complex conflicts.
>
> I actually needed the below instead.

Thanks.

I ran
  $ git grep '$(srctree)/$(src)'

There is no $(srctree)/$(src) remaining in next-20240506,
so it should be OK.

(If $(srctree)/$(src) is remaining, please replace it with $(src). )



--=20
Best Regards
Masahiro Yamada

