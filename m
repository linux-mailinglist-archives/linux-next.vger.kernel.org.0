Return-Path: <linux-next+bounces-6846-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E29ABD181
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 10:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 767B78A6B1A
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 08:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F2B2571CA;
	Tue, 20 May 2025 08:07:27 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D17F20E000;
	Tue, 20 May 2025 08:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747728447; cv=none; b=r7wuL3TlgqrxsSyhRmLYCKcUwfipKigwyGSDcU3F0RXfN93mlREhSUgxOCVeNx8VpahAz9+HiA7t6QFRXqtNDg1QNCPTbrE/3q4EhZ5xdsMUAlViwXW9Jk+yyyLHni27NBD5OGJtBbgcOs+RrpvZUqDAw/aoZHWefdNAZPDChxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747728447; c=relaxed/simple;
	bh=z6Dd/oQkZ4aRbbBXNGpctfnYVE9o7qSP6wR0gQ51tcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJauNQ2AbJ3MEblJPOVdEAiV/8YBxL1T3l9U2rvvcGRs5XUZnFag9joa1UcJa2pvEt/atXkqnQN4g1qrO4YUZ0Syb7NKP/j2ynn/PAJrSIaE+Ehlvf7x9d9LI0lUghqW0cQyNtKrekjM8xfzzgCl5qBO93K2VBehoSHjiVb9XDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-87beb9976e5so728506241.3;
        Tue, 20 May 2025 01:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747728444; x=1748333244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0OkeJ2UmcoGftyF2J9m/ldgYQ4lKUralL2MdRmggQY=;
        b=NoeI48/TMq0ror4E07PdlRxS+Zz8RwtG/zyGHLDRATO9sWq+hJHVffWwuUIP/+a/8U
         XE6DowyiIFrXTzsOt1WRM/IZatxo16dIvO9UIQOvztHT3x/Koh9Mwtyjptg7coq5wJ57
         PaVzgAeYWlO5H3cqIU+XVRPvKROQ5jaw8S/0vG/Rr6oLqu+1CR8f9EkGRcVNrfgxzrf5
         hw2Z/TWNkjeqOLmQGbyBFLxIA3mQ2rJWA7kW76IDYyVKUfRuqEaA4eZgylFo9tXNZIR3
         9sogE5NNFgfzG45XlfyqoZj8BeDgnIKDzoRi3KhXg1IjQCoe4gi1EtiJcNYog1FiaaQH
         IcuA==
X-Forwarded-Encrypted: i=1; AJvYcCUorovM5C0TuxoePzgrpLQL7YGPu46oI5EUWpvroacwzhkXnXTIta5Xz0XxJ+lwLB3bCmDtRzZRUI2iUA==@vger.kernel.org, AJvYcCXLHuYsorZPQ1n1S32O3sS/pqo4cTne5IBsHqrdecArV4SqE8dj+KdxoQF9LfKwDPAXMReMsCgcVn66bVk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6+hGkQHbN5VMArwoKig8mlnWF9aV46F5UfjGX9gVxnpH5Noos
	RvV0qS5wJUVX9LRk50NI9HZQDbiM1ixo/53FsIiCmoCOllY8d50ssvwBSPi+h5Ci
X-Gm-Gg: ASbGncspJEST5yQZpEoJLrIsJMYafDDh8kBfXIXT48LoDSQy5LgkcdcXWKkTEILiWo6
	0JxILktGP1PJWi4gbUVx+mtXgflxdI2S2wyQnkKYuOac69h/opUsdswNvYCRRw7MipVxzk3iBRW
	QFaxhs3Rk+q9fUXBC0rfD4TNmQn8VIC1tfxzzofxdWo0DusPUR9299RyDkFyu+GRFmoG/HSPUN4
	AeQFpzVr7oO4USoeCTjPqdA4ABugiAl5czy/oakiOJqiuuPntv2IJ3yvGomIUwIGexiQyHJpybp
	F6ukhzRkc80Y0RVE35QQO08b8Z5El+HWyJ4aCjywkFOiuxP3T3tRgCToyKxgPtoHs7pzE55szDW
	1yIvSXIL6pvPfZA==
X-Google-Smtp-Source: AGHT+IHQHUj0yjL1Zbp8ovdifIdJ+D2wDKQ5BIgzJg6+GigkmUYl63WQ8pS4m0IoRGpA3Ry35J7SIA==
X-Received: by 2002:a05:6102:c0e:b0:4af:c519:4e7f with SMTP id ada2fe7eead31-4dfa6c07ef6mr14659862137.18.1747728443813;
        Tue, 20 May 2025 01:07:23 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec10c550sm7105521241.6.2025.05.20.01.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:07:22 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86f9c719d63so996082241.1;
        Tue, 20 May 2025 01:07:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfoTEE06IBg4UYZzp13nIVTB1HkpcxAv71HVyqv3vTcUVN6mUvUzDv++KFLb/UL/N1hWp6TLkvCzykrQ==@vger.kernel.org, AJvYcCXFZXnmdvinJ86A6rUudNdMzXVRJJrCOpB/i9mbYsnUl2U7SQ7Qr1Q7S0Vxl6j9ZizR8eCb4OjqSFuYU/U=@vger.kernel.org
X-Received: by 2002:a05:6102:370a:b0:4c2:ffc8:93d9 with SMTP id
 ada2fe7eead31-4dfa6b64a38mr15053682137.9.1747728442387; Tue, 20 May 2025
 01:07:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515171420.7c6a4e4b@canb.auug.org.au>
In-Reply-To: <20250515171420.7c6a4e4b@canb.auug.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 May 2025 10:07:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMf3+Q2N5yXgf23LPSQPuogA3R66_W0WGWVgJRRh-ZcA@mail.gmail.com>
X-Gm-Features: AX0GCFvt2cAU7h6bhFQUSrCPrc6NmFxPnx3s6kvdiG4YzCcTzDjIuor00aU5-y4
Message-ID: <CAMuHMdVMf3+Q2N5yXgf23LPSQPuogA3R66_W0WGWVgJRRh-ZcA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the phy-next tree with the phy tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Algea Cao <algea.cao@rock-chips.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Stephen,

On Thu, 15 May 2025 at 09:23, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the phy-next tree got a conflict in:
>
>   drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>
> between commit:
>
>   f9475055b11c ("phy: phy-rockchip-samsung-hdptx: Fix PHY PLL output 50.25MHz error")
>
> from the phy tree and commit:
>
>   0edf9d2bb9b4 ("phy: rockchip: samsung-hdptx: Avoid Hz<->hHz unit conversion overhead")
>
> from the phy-next tree.
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
> diff --cc drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index 77236f012a1f,bb49d69a6f17..000000000000
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@@ -444,47 -412,45 +412,47 @@@ struct rk_hdptx_phy
>   };
>
>   static const struct ropll_config ropll_tmds_cfg[] = {

[...]

>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 650000, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
> +       { 65000000ULL, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 502500, 84, 84, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 11, 1, 4, 5,
> ++      { 50250000Ull, 84, 84, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 11, 1, 4, 5,

Note that all other entries are using all-caps ULL.

>  +        4, 11, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> -       { 337500, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01, 5,
> +       { 33750000ULL, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01, 5,
>           1, 1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },

[...]

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

