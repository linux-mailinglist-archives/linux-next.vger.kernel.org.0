Return-Path: <linux-next+bounces-7747-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B01D0B14ABF
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 11:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E08B43B3640
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 09:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36DC285C9F;
	Tue, 29 Jul 2025 09:07:23 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686E1285CAD;
	Tue, 29 Jul 2025 09:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753780043; cv=none; b=iNJOvup48t8iaZO+3VG+YZGqRIFiv3IuOfAzuBSQlrTMaMTAfsEIoNNRuPhNWeo6hQzux76vovCXhW3qE6p91pN32YTXRaTnD2v6PLdc9xd20etyoNK+Jdwm+oBBNNAFC/M5NV1cuTcq2YDss0kUo7WdyUhklUOhWF+tCfCqDkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753780043; c=relaxed/simple;
	bh=ecjkvecP5NqSvqFl308Avop4YFgulP7Zpyo+eKxO91M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KO6fwq9Ttjeq1mTbx/3t5QEOpx8ZRtnneS3w13pmaz2UHji7smtG8TSGM+rBB5MJf7giKETbDhCSDdD0REmsbPHmjnKu5R3OcSyhpB3uedPzn1Lo3iLjgqdTWRGA/rrNI1OXgv8pO/El07J5E6XZlfOEXFD7e5lhKhI+zkTsov8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5347686c12cso1412413e0c.0;
        Tue, 29 Jul 2025 02:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753780040; x=1754384840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkOjGmt6FRb/fWmi2ESCljwkz9qkq8rezEdxE529VyY=;
        b=Fac83ZLVZr01Rf4D2qW0sQ26pVSffn7oB8c7MVbnv2pmsm06KW02wruZJoGTWDHfcX
         8PSGc+sZIUeTMbGZoGHJioP0fmDhHIlWvbw6ZFxBqTNcS391UrE1oM7DROueLOjNt1bz
         d+FOP2Mqenx5+5rtEAj1AQMwbLtM4sToNQZMeSUojl/Ro/mGcdmrGh0OHYZ8qD6nO/da
         PX7ldNJjJi0qDSnNlZPHZR67HvlbmBM5rxvl0oZTwNDHYD/H/tQSlYh/t8owCULHexPc
         i2A5S/bNGLsZOE3+Xa7PqWy7l+PFVPgFCe7ncGl7vyCweFkAnkOw+AjwBjDmRmWzJAwg
         DlYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbbR9Q7pw8vcWmMbXs8mubBlX1yCMwWPxMPRYv7l8y+T7LztOAa2AY/5UXysXJk7CIJe4msukzayDYU3U=@vger.kernel.org, AJvYcCWkVpXO6Q50Rd9XKq+rC2w5XFwml2p0b5I+8bvzUUtHA4Q6tMJm5KapRFIU0XglwqOtCpJ2w7Mn8MYZDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAcptE/DLmlWcmPlbo+wN06fnVf7bJNNlJJ/41niLd5GIv1FU+
	T7AaOdK+Q3Mcif+OFZocK2LXLvWcsinD8XxIFNVxnvp8sUR9lJdMHLFKrMgKlmRq
X-Gm-Gg: ASbGncs+TcfGOePDSRT09RubdtfRUYDvVRpBgZfHLFTF7FF2gOnhfNs+1VdA2kxr0v6
	/PbwsdqFzLmA90V95oVcdboSbWiwt7V/BOQFPV9zBxOzae9BR8o4QCcpF4ygaVcTAU1asyEWo2/
	piyN8Mk1UzEq6Tf0zsm00n8PeucoqunyjcD+PUYHbs6XAS+956FFDQZAKjrAzLlo7E/nC5hjR5D
	sBk1Uju8Jc2chK3TotFUi3XgBc3fu4/DU0elBk5kute9FUhRfQ8pjL6SoOK+5SXTLHV2uzV5IKK
	TWUwypTYi1rCwd/174wUUNIj7Q2TCj637YnH2xa7xfrKQ36/+T7PJC0o2mw1HbwqYeJ5npfOyj+
	Y6kGMA4k5uANA5qOmfq0J58GQ8RcRFVGCpbVH13U4TLM3gL6foBohddMChQVMZh4UqeheDpI=
X-Google-Smtp-Source: AGHT+IGMGwwvP+9jsj1F9BLplIXmi8KJnCGaIAAw43pPrZZ5Rvdr23+D+zYiEqo/RxHsVux9b3GkIA==
X-Received: by 2002:a05:6122:8c0e:b0:531:312c:a715 with SMTP id 71dfb90a1353d-538db4d73afmr6342381e0c.2.1753780039885;
        Tue, 29 Jul 2025 02:07:19 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-538e28591absm1990913e0c.23.2025.07.29.02.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 02:07:19 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-88bb3eebeacso407052241.0;
        Tue, 29 Jul 2025 02:07:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUib1L0i/iN81Wiamz7ukqvdPF/m2QCP6n/VySKyXm70p9ULs+y9xL+gvd4nbByeRn7mK9f7lEadMBoA==@vger.kernel.org, AJvYcCWF7M1PTDPCwhUfTKclW9BSzzvrORvsdgPoDaaKDsRt+ea8J4lnQY3Mzl6fHiDY8hXXQOWXOkZtzQp3l/U=@vger.kernel.org
X-Received: by 2002:a05:6102:5a91:b0:4f1:2ec7:af39 with SMTP id
 ada2fe7eead31-4fa3ff0655cmr5886798137.18.1753780039018; Tue, 29 Jul 2025
 02:07:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709172138.34ffb49f@canb.auug.org.au> <2025070903-census-heavily-929a@gregkh>
In-Reply-To: <2025070903-census-heavily-929a@gregkh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Jul 2025 11:07:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGUFAXrCDyO-FufuEib9jVWi9FNF8oX-kifTjZEPvNFQ@mail.gmail.com>
X-Gm-Features: Ac12FXw4Iu3SiZyrFc7lsYkwidmDVIvTjFHBm8xbxRb02DcQ9ETGSJ7lZXMiE_o
Message-ID: <CAMuHMdUGUFAXrCDyO-FufuEib9jVWi9FNF8oX-kifTjZEPvNFQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the usb tree with the imx-mxs tree
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Shawn Guo <shawnguo@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, James Clark <james.clark@linaro.org>, 
	Larisa Grigore <Larisa.Grigore@nxp.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	"Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Wed, 9 Jul 2025 at 10:18, Greg KH <greg@kroah.com> wrote:
> On Wed, Jul 09, 2025 at 05:21:38PM +1000, Stephen Rothwell wrote:
> > Today's linux-next merge of the usb tree got conflicts in:
> >
> >   arch/arm64/boot/dts/freescale/s32g2.dtsi
> >   arch/arm64/boot/dts/freescale/s32g3.dtsi
> >
> > between commit:
> >
> >   06ee2f0e2180 ("arm64: dts: Add DSPI entries for S32G platforms")
> >
> > from the imx-mxs tree and commit:
> >
> >   d1b07cc0868f ("arm64: dts: s32g: Add USB device tree information for s32g2/s32g3")
> >
> > from the usb tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
>
> Looks good to me, thanks!

No it is not: the USB nodes do not follow the DTS sorting rules
(by unit-address).
Oh, apparently that was an issue with the original patch.  Looks like
it was applied (to the USB tree, not the freescale SoC tree), despite
several review comments pointing out valid issues?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

