Return-Path: <linux-next+bounces-9243-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB65C8D545
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 09:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 055F14E4EDA
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 08:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509903233FA;
	Thu, 27 Nov 2025 08:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2dc9ML+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C77B3115B8
	for <linux-next@vger.kernel.org>; Thu, 27 Nov 2025 08:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764231922; cv=none; b=mHabD7ZVb5XGX4syk0lkR05oe49ZOuT9AKY3VEhadWNn2g5OSyUfrnIvj0NIAdU/Of1v9GHO7Ls571He+oHTdw4523ofqa1908u1NVwFHgQG7D0icaoqD548UUMb0I3phg9BOLhzwb/FU70m7GfGQy3zkXdNBfnLG8kvvia0ET4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764231922; c=relaxed/simple;
	bh=3U85539l+3uB7FOy0W5vMeo+zHSWVvCH26/xzacIYpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OtIjt/cCaWQFbsVJG1wo/pEF7XGXlQ04CH7FWMj13CkQU0v7YGrqeaebH4SjEDoXtWKlOFMvLH9a2xb4PaQqzPNOTBKvK5Yf1hB9NUJHhUXufnLunSVSxiv85xnpLI6nqvdv9F+o9cIgVN3ZDyzrdDIVNZE8f6+pOvGum9W7QBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2dc9ML+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C43C4CEF8
	for <linux-next@vger.kernel.org>; Thu, 27 Nov 2025 08:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764231921;
	bh=3U85539l+3uB7FOy0W5vMeo+zHSWVvCH26/xzacIYpY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H2dc9ML+ybnnMsVKjeVxIHwGRHwBBvguZ7P1uLwnIdj3QpSI9O3tvxcmcRoWG1C7L
	 J4xJh2NhlE5V3/otX13nwC3bFMZEGXUhGP1aKCs9O3f6LZpzfLYT2fpVkOTh4jm2Q7
	 1M/iViybdU9tqIQo1fvkrGIkWIcrY8GIuflL0y5JL8cNbFGeF8Y/CWv42Q6Ja7oxrq
	 DOXsb19huUhTCmtBByOz0ULGLS4nmBOgUW9IEIRyNdzwa09Nc8OeDKUcEBRllTG/aG
	 ItdNul8NmART6KgFIfMRVVu9byf6urvuAzap1s7az3W0NZxeJRFr05IoRCjBGQw/R+
	 sBwapzAPdUn8g==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-596a055b1b8so697505e87.0
        for <linux-next@vger.kernel.org>; Thu, 27 Nov 2025 00:25:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWzC3+7IWMfIPEZUu+J9Hrv7jjZNBnLnDGPdqmwNjiayTjd/Nr9b3Bep40MiLp6imthFEqZOIZvWQ2+@vger.kernel.org
X-Gm-Message-State: AOJu0YzCHKvlOKUdG8joIOhXVSvFiDH2+QY6l1pMIDoBctyZ+aPWLuw7
	CXp/BSuJ2YPU4u2TLTk7Y6Xy/DuvEHTXw6RY/Ofn+wFFLNXZNJovCrycOSVf+LRvUZZ4f3LTbG9
	uhawpw87pFfqnuii7F47JHAd7kF4DzNvWOX0wr3OFKA==
X-Google-Smtp-Source: AGHT+IFiZJ41PrNdJxrbSJ1Ikf75ypz/ySOoMyOlETpm+fCVdem7mca+LwPsl17ZxPBmjtIqv/OXZt+PQgxYF12JjdY=
X-Received: by 2002:a05:6512:3188:b0:595:7e9c:cdfa with SMTP id
 2adb3069b0e04-596a3eb5e25mr9229032e87.6.1764231920286; Thu, 27 Nov 2025
 00:25:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127104558.31eeb5bd@canb.auug.org.au>
In-Reply-To: <20251127104558.31eeb5bd@canb.auug.org.au>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 27 Nov 2025 09:25:08 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdS7QV0G=zFUJ3fMitQDwmEGM1xH7jCMydicpBaEraVCA@mail.gmail.com>
X-Gm-Features: AWmQ_bn2bjn0iRwL5SD5OyGqGlFMjShSR_mg47cYyu3oWa-b9DS1AYEVZTsqKTE
Message-ID: <CAMRc=MdS7QV0G=zFUJ3fMitQDwmEGM1xH7jCMydicpBaEraVCA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pci tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 12:46=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the pci tree got a conflict in:
>
>   MAINTAINERS
>
> between commit:
>
>   2b6d546ba83e ("MAINTAINERS: update my email address")
>
> from Linus' tree and commit:
>
>   010515bd2d47 ("MAINTAINERS: Add Manivannan Sadhasivam as PCI/pwrctl mai=
ntainer")
>
> from the pci tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc MAINTAINERS
> index 2fcbda2fdca1,c61750164ba9..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -19955,7 -19886,8 +19971,8 @@@ F:   drivers/pci/p2pdma.
>   F:    include/linux/pci-p2pdma.h
>
>   PCI POWER CONTROL
>  -M:    Bartosz Golaszewski <brgl@bgdev.pl>
>  +M:    Bartosz Golaszewski <brgl@kernel.org>
> + M:    Manivannan Sadhasivam <mani@kernel.org>
>   L:    linux-pci@vger.kernel.org
>   S:    Maintained
>   T:    git git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git

Looks good, thanks!

Bart

