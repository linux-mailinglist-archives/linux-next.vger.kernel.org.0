Return-Path: <linux-next+bounces-7075-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE538ACF503
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 19:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41A46188F978
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 17:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8C1276048;
	Thu,  5 Jun 2025 17:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rbEli0xE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7577127603C
	for <linux-next@vger.kernel.org>; Thu,  5 Jun 2025 17:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749143310; cv=none; b=IXRp3oHlXIpSBSQreVwh06nDjb3+zOvmbJU7mhe7D64LC5iucDObM9dLUAUyqcJdXX5JbygRYt0ltF0O72Re7P6OU3/f4T3g7xdzSRpgLsZyxK92Mp56lBf0uRl2eO/0y/5mYLFa/KMStEFSwxMUxUsKUJSLuiCvF2iyERVj6YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749143310; c=relaxed/simple;
	bh=Xor07VUsbOeFgDBNzxyUQcS3y1z857Vg/NhaiO09Vjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rikB/Z1Iq7XJcWFsi4KBqRWS6wawZdei4zCoBVE/FINpORaoJi0da9PB+lONGhDY3RaSqZcWAjCNg5yjRezItZYsEX6jFCqke6opoZZCnBDBavAlbzRXkXRVt9OBbPImMZEC2C8EcDmYQuPNadMwtcjqTkUsOXhvBLwQFGX40Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=rbEli0xE; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad88105874aso196069166b.1
        for <linux-next@vger.kernel.org>; Thu, 05 Jun 2025 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749143307; x=1749748107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBFaMyvc7Z4G2BwTWyjfiiTjbOmRhGeDBAsf/dJ0JBA=;
        b=rbEli0xEIWhc+ZpMaMWUQ3UAx0qdLDux7ZR2rXzF5Vygr1KL28gi5aKC68/Jef7uXd
         llytjwtPq1rqZlgfU+mBiFO7rnA1Oetk+Jmc3z25xo2ssSLnRmCSMkr1R+mwCYj2y6Rs
         RVsUjA5agZyEL20glRRO1Pq1yCsP2i4FPpUbdDX6YSB2++oxMCojcFHTyLkKJR+vXgnC
         JaZgsub0WJdQzQuInSRiUrNPELxQyoB7wbUmu0C49+PrROVYPiI9Y+CCLvrzdLHZvG9E
         OpBk7qxToDpUIKweWdzDTr0mz03JBd3MLc6cMvSF6DrCCLzaCu60ozId0OYPXCG3M6z5
         TCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749143307; x=1749748107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBFaMyvc7Z4G2BwTWyjfiiTjbOmRhGeDBAsf/dJ0JBA=;
        b=rQ5NDCcdXw/SktMQAWpVlRr29IHeLL2Baxggjvr4OAp63fH0K5l7pM4JjxoA/VZ5dE
         /lSFsXPqAuv4A2jMh6dm+zGz7ggB2bTJV5G+NUhaMSGdm4b3cx58lnvOsEy/W3YblCTi
         OS2PHO6sdhsohU5rcspZ4B8QTbr51bcdUr+nUst2b3wbiXwpkuXM1gCFdFtsDMOr/z0l
         k7aVsI1Omw1ZbF0vKGOp4K3zizuu1y6FwK6eMhs8B1kZbMVjzKM5/7byQ4FcuhmKIkWV
         orwTylJ/tf7NDxgK64/N1F41KnZZ2aGOJOL/fnC0ZWVLB5RsgL5d7GfpYc/zwom+mmHr
         xYeg==
X-Forwarded-Encrypted: i=1; AJvYcCVvPXBoJQL1efHBAXL5/gMNURmHHD5zVIqoq5giuOx6Z67ju+PHmFs3nClkK/wzkcCkh2nLbupk6Y29@vger.kernel.org
X-Gm-Message-State: AOJu0YzyYkZc5qhZeQl79REs2ci0inrGb2QTfhVEzDIRA4IAznFC/CaD
	t/IPcwvbnAN6sMCBxZzrxRvw61V5qax2OZ7NWXz3oBSlKg3dKeOVcwj8ihIBxgouxmplk+wo7Ki
	O+IYLgE3V2WKKTI7iiQphXHKIuVaPQGfHeB93uLq4A1oxbQQrGeBj
X-Gm-Gg: ASbGnctCZ1JmT0EXhAtFjd0le/hUXKxbU0DhKZml5HJD7cInznze0jYhr55SNmiQwrF
	qVDi19QQmBFEIFIcmhK8wZaCOfckg1hWn+j68TpAV0juDsQzYRV/q3kreAoAnEzrMQ/pi5bOmQH
	7xPfM3hLncU+AlmbzS/t+Gda1NCBDrTMiaJ7nTyh48nhmoe5uRm7Nz2CHASFtEQnTWkg==
X-Google-Smtp-Source: AGHT+IGTCHq+t5jdVb8jQHUiPfAMFaQRkOyee0NnDl9vyCqzG6RguIOtsl/bnX1AkhqzfGKID5KrFbQAwgDjTLTpk0k=
X-Received: by 2002:a17:906:7309:b0:add:f182:2f with SMTP id
 a640c23a62f3a-addf8ff42c6mr763518166b.51.1749143306591; Thu, 05 Jun 2025
 10:08:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605163513.7cfb7f2b@canb.auug.org.au> <mhng-3E0595D4-92E8-4E7C-B02A-C33F7289E4A6@palmerdabbelt-mac>
In-Reply-To: <mhng-3E0595D4-92E8-4E7C-B02A-C33F7289E4A6@palmerdabbelt-mac>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 5 Jun 2025 19:08:15 +0200
X-Gm-Features: AX0GCFvCQWwB2B0ViDQFNYu-OFCgo9Wv2Jrd8RVGLpLAUQmyY22KHw5EsyNqXeI
Message-ID: <CAHVXubicfhkX15S=fSo2yQcSCUmA57cJATk6=ayy5OCWvRx0MA@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the risc-v tree
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Walmsley <paul@pwsan.com>, cyrilbur@tenstorrent.com, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 6:23=E2=80=AFPM Palmer Dabbelt <palmer@dabbelt.com> =
wrote:
>
> On Wed, 04 Jun 2025 23:35:13 PDT (-0700), Stephen Rothwell wrote:
> > Hi all,
> >
> > In commit
> >
> >   4e27ce58e7fa ("riscv: uaccess: Only restore the CSR_STATUS SUM bit")
> >
> > Fixes tag
> >
> >   Fixes: 788aa64c0c01 ("riscv: save the SR_SUM status over switches")
> >
> > has these problem(s):
> >
> >   - Target SHA1 does not exist
> >
> > Maybe you meant
> >
> > Fixes: b0feecf5b812 ("riscv: save the SR_SUM status over switches")
> > Fixes: 788aa64c01f1 ("riscv: save the SR_SUM status over switches")
> > or
> > Fixes: 8f9b274ad153 ("riscv: save the SR_SUM status over switches")
> >
> > (yes, they are all the same patch ... and all ancestors of 4e27ce58e7fa=
)
>
> Ya, thanks.  Something's gone way off the rails here, let me try to
> figure it out...

I expected to send this fix (along with other fixes) next week, after
the -rc1 was released, with the proper fixes tag, so maybe Palmer you
can just drop it?

>
> > --
> > Cheers,
> > Stephen Rothwell

