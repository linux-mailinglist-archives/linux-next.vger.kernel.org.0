Return-Path: <linux-next+bounces-9087-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE218C7058E
	for <lists+linux-next@lfdr.de>; Wed, 19 Nov 2025 18:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 0B08E28F73
	for <lists+linux-next@lfdr.de>; Wed, 19 Nov 2025 17:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0724B26B764;
	Wed, 19 Nov 2025 17:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lNoJXNvE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578612F12CE
	for <linux-next@vger.kernel.org>; Wed, 19 Nov 2025 17:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763572321; cv=none; b=Uj/3zyKf2E7aiiq4Q1X1b8EneA2p7YL/S+oHSunlvSSmoOq6bfHPPZ1CBz2Ta4Vw64PkkRsLLbeMn9sVpl3vE7Ib2+LQowTryisdgiadwCsYQ6j1kwSm4PKNzAfau4oHNWFcv00yaas9Rxy4yjZmEhVC2xXe7VAiPLW6IAr//yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763572321; c=relaxed/simple;
	bh=r4aiqwMQm9pAsRbju3BAW7kcqQFVl4hxCvpIKzpfkF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AN6Tmz0QvAtQVxSz5x7YiQrv+okR05SgQDUQR4GdHDT5mnJxnz90iYlHyRMEG0ZhUr6OiC+H5gmW9ZmvEEgppZDmGJrYGn/KIh4ylfbeq66iLvlBYpsiEYkQvZCrY04JEj23ZeLkMCfcveYRIAIMTsf7fmquUp13knQFm13hEMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lNoJXNvE; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-640f2c9ccbdso6272450d50.1
        for <linux-next@vger.kernel.org>; Wed, 19 Nov 2025 09:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763572319; x=1764177119; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KYOF6QcTq9f0kc2aOIV0ivFzas2h7wpGWg7uqkoYwY8=;
        b=lNoJXNvEyARQf9rJm/dTiNq9PMnqjETrfo6LBgOUs27eweuVjY2IK3F/gZm2tFQ1e8
         FwjgBYSb2trbKooeXQGwL5aJuU1i2qgiwVgvwDRU9iaJPGrvBZdI7xmdNSsaHK1QFnSd
         H7qukcv8KXuW6KNAlPunmJ4b4pFWwvLOexq9V3YGidExIKX9ay/bs37hWvL5REUbCzIs
         YA8Cgakqts1XEDG5mo2R3hmjZ+KaxE3ZT1/kxeLnhcIApQQD2RJtqRErdSiknPwBzDIw
         fHKDJES1i8J31qdO1G1VbNMrCSmeEvb/oR2ARJ19DKnf1j0ALjGjZJHSQtES77NNCM3/
         sVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763572319; x=1764177119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYOF6QcTq9f0kc2aOIV0ivFzas2h7wpGWg7uqkoYwY8=;
        b=qiUdftHJYxZR3Ueo/DeZQ+dK8PbqB4bkyEX79jmZ57BPpEIRYtUplZKfyKHHqbzoAI
         SONyBtiDz6r/S4F9u5XP8GIfhrNwLdHuCWlbGVP2MuwZ+2e6ICqLo3cRUOa3OQy8LQCS
         OoChAdtk9bFSbePiF/xPFYV1sjhLaW7UnpaRMyhwd6FUG4ifC0Xv8PVpPCaNRzXC/gRm
         +ec11ZYOUfBnAtuh7heXZS+A9akZw6V4cluTJKBtybMYATGqZ1NmtGw8X3Sm2gHFzY0p
         y3oM9f54ANxI93nWyAigvOpJcUelfZwS7RFE/QOHrDemSB/zVk8OFIvwITKKalxh9SQT
         +OAw==
X-Forwarded-Encrypted: i=1; AJvYcCUDyo//YgvCs/S+h+8JDbemtBO8JC7wpD/y2MXxhsFG5FL9mkkcEMrcmVA1rPl91IrAcYN3C7ZHKM1d@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4HzUb5uJsgQdiANu4paWcQCl5iTUNW7FgBSN64++eYqbp0sTU
	EIW7s73gPiglu7ZnhaYC4Ffhnk5hYZUV6pq1onpaNY+wlcRjdvYoRbKRlg26Q7y0k4i3Rl9w/rP
	v0GNjN4tTT0A4AnAV3lQWe3kbNGtjcRxcI+DA3k2ODQ==
X-Gm-Gg: ASbGnct78ZEgTQMwKb51tcNtAoZvJgsUqM98LTGIQInH1BzbOZIP9MexuAsHyCrBba6
	A+/9Xab4Zvreb5VDmL5eYmv4HF2qR1kD8VT4xXDJWp2ACSWJ25dGrCMbZS2Y6A9dcbo4a3LvC0X
	Osm8XJpCk1BcOTOQNm/KhUs27zmSRIAO67LKyEFGcIupsKqCvFRkypruXD3QBgFTlF8YB0pE1zg
	ePx+VJ9VbcWmRGDbQjkwB7TLVFyvzDLmci3X/ayOhs/JWwClgQuLU3WwIVIxQ9kL7h3OJfw
X-Google-Smtp-Source: AGHT+IFN+m8LjKC99G9Zn6f1MkCP4AJcfCOYkm7R8QuIGFWs/PTpvyAJWScHB3ZpNweC/KGOWpKW04Q2t4ITVVSbtuw=
X-Received: by 2002:a05:690e:d58:b0:640:dd25:d84 with SMTP id
 956f58d0204a3-641e7688e39mr15934520d50.47.1763572319343; Wed, 19 Nov 2025
 09:11:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114144243.05facfce@canb.auug.org.au> <20251118183319.GR1949330@google.com>
 <CAPDyKFr70C3hXyjVeoMZ2h79yyuau5E_-pZxa2txpHFZc92oOg@mail.gmail.com> <20251119130130.GS1949330@google.com>
In-Reply-To: <20251119130130.GS1949330@google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 19 Nov 2025 18:11:22 +0100
X-Gm-Features: AWmQ_blaYHQcj8HSwF9m-3_-xExBXkB-PE34Xl_2m-y4quLHI9ZyyUlMFjB0tzo
Message-ID: <CAPDyKFqn2sKcqKQghQz=+7Ui-qfKdHRkQ910Aw7vHK9dF7NvyA@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the mfd tree
To: Lee Jones <lee@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Nov 2025 at 14:01, Lee Jones <lee@kernel.org> wrote:
>
> On Wed, 19 Nov 2025, Ulf Hansson wrote:
>
> > On Tue, 18 Nov 2025 at 19:33, Lee Jones <lee@kernel.org> wrote:
> > >
> > > On Fri, 14 Nov 2025, Stephen Rothwell wrote:
> > >
> > > > Hi all,
> > > >
> > > > The following commit is also in the pmdomain tree as a different commit
> > > > (but the same patch):
> > > >
> > > >   30ed024fb076 ("mfd: bcm2835-pm: Add support for BCM2712")
> > > >
> > > > This is commit
> > > >
> > > >   060d111e8a56 ("mfd: bcm2835-pm: Add support for BCM2712")
> > > >
> > > > in the pmdolain tree.
> > >
> > > Why is this in the pmdomain tree, Ulf?
> >
> > The corresponding dt doc patch is in my tree too, so to keep them
> > together, but also because Florian acked/suggested it to me [1].
>
> Neither of you should be deciding the fate of MFD patches.  :)

Sorry, I got carried away. :-)

>
> > I can rebase and drop it from my tree, if you prefer to take it via
> > your tree? The DT doc patch is however on an immutable branch just
> > named "dt", so you need to pull that in that case. Please let me know
> > and sorry for the mess!
>
> Yes, if you can drop the MFD commit, it would solve some issues.

Done!

>
> Thanks buddy.  Hope that you're well.

Np, old friend! I hope you are well too!

Kind regards
Uffe

