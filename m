Return-Path: <linux-next+bounces-7898-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E525BB20A5D
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 15:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08D102A4F54
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 13:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829B619342F;
	Mon, 11 Aug 2025 13:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjRQ05Lt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0518F14658D
	for <linux-next@vger.kernel.org>; Mon, 11 Aug 2025 13:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754919314; cv=none; b=NXP5ixW+qrKy8unDDY1TS0CUxZlm15ub5X5HxHWIRxFb0s/7OMxxRRsP/bIkJuDN5oW96G3WhmFxQmvh6ldg7O0vhyvZFugQIDHp5D5Xfpdq3OEPaCFRxXHeby/H6XGZu7P0/G9b2OZIkU11VrkFHbbLksAlcUf1hw3J2wazztM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754919314; c=relaxed/simple;
	bh=fK7+/N26I1H4Kn9nT6ZWSvsAHeSZyeoTH3n6GPiDDZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FPMdy9FfAgUsSZGEkb3G25SA2hT+Wri/EGfJxTZUWeNr5TxBct6H5/R4xD2krlGSaY4X9WmD9WsbMx9ewThnd9CsRVI4MPM3btyEdUU984EILDFCpLzzcSjvcYMA0MNEzmMAmGDmj38eJBBky9v55D7r1QRhfWdkylVSB0C/evc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjRQ05Lt; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-24286ed452fso4391345ad.1
        for <linux-next@vger.kernel.org>; Mon, 11 Aug 2025 06:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754919312; x=1755524112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84sNkZvrOW1k1PWbS/vBQaH01fKqFeP8Lnq34vdgDlE=;
        b=TjRQ05LtXnnI/Yiwjv2vccMzLuqb0xYrA077kskJ0RDsFREeColk26rVngvtiiQqM3
         hsLtgaU6cHgDSJhNygtrPUnki9FTRkB8DqlsLARVq1g/840/Rn3F1i4LVX2chnvIOwmh
         l6IHM0QM3MgkQnEZlzSWAS4u+fyRstSFwm95/husyb3wAN7qZtY2UiFEYb1EjN2jIpYa
         +sYH1DBeEiBuqniejtdjzQC0WkVUWaOVeaHJdctmYoegLvJY9gsxMb4qfzKPHNEhWiWm
         HVYXEwyIQNoJiKKuusM1XqDqOUggj4HT9E5JKJbMR6HSfvOvAcshHsiuK19Wz2JCgs0f
         rtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754919312; x=1755524112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84sNkZvrOW1k1PWbS/vBQaH01fKqFeP8Lnq34vdgDlE=;
        b=AzJef1pLAOrqrg69QxFXd+pzaLSB8HnxlU3XvmmKH5oAgfPYEWNYaOnVJoSY4SqMiL
         6zIBnZDZjoDkt/8gmEtfcrtaZi1e22L3o4rTK1/9SNdJ6Z57gjNLd4LED6m/UNjBJWEs
         fTR2FnZmJWIeis1kNv8ZNSpUgiOsNvom1kyD+0tEvgB1Kmnu1AYdo2dug1M6aUAiO0fe
         zGV4jCI2D/OigiN6fLWPRE3TNr+tUeVtviFF6dw1qbMa+ruh3PTvAk2CVRezKCAwmjqA
         EFbtc9tFbLSTzsKSMA5/dZuRnGEF4EcTyvA6D4AIPdLbaEuQxCfk2EMNv/ZLOfSSUSEi
         Apog==
X-Forwarded-Encrypted: i=1; AJvYcCUhHAuPuaTybnkhnJpSoffWbZf+zwIGIHk+zaEaFArYPq3UVNr+EQqbCFEpAM6mFRBjWpjgYJbxPvc9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy02YtbEbr4yjNejrbLUkzm+NEKXKmoNZqr7TTXpxEQ9BaI6dp4
	YO4tqyPgbinoSEaDXWQElwXy8Xt0cK1CD58+2J70lOW1SaDrmn8tXKCb4iCOgU3qd+ib+Xk4cFc
	tuFgpmvx2jfJJFeOFOFAyTaSrpOMshxk=
X-Gm-Gg: ASbGncvsodyXjVv2nWMzh+hKL4nRvOPNLQgTVv+Mtseqgbm3T5QJn2DKiaSyN+x5r1W
	Wmk5u+C+C9liofP9bsJvx7YgcbbHIvVIFXoipQg0WGxUKTuhJYvqNrYC6hszpj18xQG+t1Rxo0t
	N6Ko7UshFY4qppPsG10bT13GViEFotVsbTm/kuU2XkKzNdE69OaiBlmcu7/CWEOiJMLiT1hebgE
	xQRS2StuOqspNx3RA==
X-Google-Smtp-Source: AGHT+IHykrwNnrf4q7gUeWlVpSMzF3Sgc+KqbTwg0mDXjVcieClbsteVE8gcQXaErn0BALVWv/pwqwJaMAhNoJlmf8Y=
X-Received: by 2002:a17:903:2449:b0:242:d186:5bce with SMTP id
 d9443c01a7336-242d383451fmr59257895ad.3.1754919312124; Mon, 11 Aug 2025
 06:35:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9846b386-87c4-4f86-ae11-6361470cbce7@amd.com> <20250811092125.22630-1-listout@listout.xyz>
 <a6da8462-e0c4-4bba-b65d-25ba3f5cdacc@amd.com>
In-Reply-To: <a6da8462-e0c4-4bba-b65d-25ba3f5cdacc@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Aug 2025 09:35:00 -0400
X-Gm-Features: Ac12FXw-e0ywhoHK7Z0ZKlIK4kTRwiALit1X0nC7Kn7H_E-i-z1susch16guNcs
Message-ID: <CADnq5_MimooPVJXu9SnpL_1Yhkz0ZOfsXWDnnWAKmt+ymH=HRg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/r600_cs: clean up of dead code in r600_cs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Brahmajit Das <listout@listout.xyz>, airlied@redhat.com, alexander.deucher@amd.com, 
	amd-gfx@lists.freedesktop.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Mon, Aug 11, 2025 at 8:53=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 11.08.25 11:21, Brahmajit Das wrote:
> > GCC 16 enables -Werror=3Dunused-but-set-variable=3D which results in bu=
ild
> > error with the following message.
> >
> > drivers/gpu/drm/radeon/r600_cs.c: In function =E2=80=98r600_texture_siz=
e=E2=80=99:
> > drivers/gpu/drm/radeon/r600_cs.c:1411:29: error: variable =E2=80=98leve=
l=E2=80=99 set but not used [-Werror=3Dunused-but-set-variable=3D]
> >  1411 |         unsigned offset, i, level;
> >       |                             ^~~~~
> > cc1: all warnings being treated as errors
> > make[6]: *** [scripts/Makefile.build:287: drivers/gpu/drm/radeon/r600_c=
s.o] Error 1
> >
> > level although is set, but in never used in the function
> > r600_texture_size. Thus resulting in dead code and this error getting
> > triggered.
> >
> > Fixes: 60b212f8ddcdb ("drm/radeon: overhaul texture checking. (v3)")
> > Signed-off-by: Brahmajit Das <listout@listout.xyz>
>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >  drivers/gpu/drm/radeon/r600_cs.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/=
r600_cs.c
> > index ac77d1246b94..811265648a58 100644
> > --- a/drivers/gpu/drm/radeon/r600_cs.c
> > +++ b/drivers/gpu/drm/radeon/r600_cs.c
> > @@ -1408,7 +1408,7 @@ static void r600_texture_size(unsigned nfaces, un=
signed blevel, unsigned llevel,
> >                             unsigned block_align, unsigned height_align=
, unsigned base_align,
> >                             unsigned *l0_size, unsigned *mipmap_size)
> >  {
> > -     unsigned offset, i, level;
> > +     unsigned offset, i;
> >       unsigned width, height, depth, size;
> >       unsigned blocksize;
> >       unsigned nbx, nby;
> > @@ -1420,7 +1420,7 @@ static void r600_texture_size(unsigned nfaces, un=
signed blevel, unsigned llevel,
> >       w0 =3D r600_mip_minify(w0, 0);
> >       h0 =3D r600_mip_minify(h0, 0);
> >       d0 =3D r600_mip_minify(d0, 0);
> > -     for(i =3D 0, offset =3D 0, level =3D blevel; i < nlevels; i++, le=
vel++) {
> > +     for (i =3D 0, offset =3D 0; i < nlevels; i++) {
> >               width =3D r600_mip_minify(w0, i);
> >               nbx =3D r600_fmt_get_nblocksx(format, width);
> >
>

