Return-Path: <linux-next+bounces-4858-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 796B09E1B4B
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 12:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B29A282EA6
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 11:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCDD1E631D;
	Tue,  3 Dec 2024 11:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jTTDxWzA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F001E5708
	for <linux-next@vger.kernel.org>; Tue,  3 Dec 2024 11:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733226602; cv=none; b=FRYLLAvvuiyXZK0Ep3YrnvspfEXY8UWPXEmCZiHzvtjNG5K6NpI2DPyZ1VqJk0AiWwk68r8+BrScafZ/WhRXbg0AIyixR60gBpv1BL8UxWDPT9hI4uDo4nMijAwIM9paRCIjqLAHGvVGOYssH+EYevKw+gg9YFWyRnFayNfOz5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733226602; c=relaxed/simple;
	bh=qpNNCsPIgITiLdoRQfCJAiK5prJ5MmKbaYwoDG9Z54A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UglS6KGYqJzp+09vbIzBQEU4udX3xyYn/gUMUDGAr0DCFSEauq5+rnJZ04DkPMlXFu5fzHHU0ZjZCmEv1etVExO0Q1AlEGg1OKojes4MruRQcs/UNwtNwGjpbNaSp09Gmrbuq+R/ypfKWj9s8v93jacZI+LRMHXSNPsMlVaVt3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jTTDxWzA; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-434a10588f3so34905105e9.1
        for <linux-next@vger.kernel.org>; Tue, 03 Dec 2024 03:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733226598; x=1733831398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t1eGTuoIcul4oTlM0V2VgbBHVZmBmDWQofZqgaFw1zw=;
        b=jTTDxWzAOUE2BTaTv3FDSUia/mcKKlE/IC5o3NjyTRAJV9ZyjRQuBi088868SIjmIR
         lyIrOg5CfLcIbDfMOI73atdC8r68iDNyS/rtTnIIdW206kulByKYZLOrbbtTW003LcVc
         pYXK28lG4dc1Btk87wHKx/kRT80njm0WsQmJCH3021e+GntMXgXNHUC3gUqL06uhCmdl
         yHlacz4LYv95v3mP44UnahV6yYdvLppFJPlWgpI3JjjP/jT+ZT/frL5mqo4pz9IOqfWL
         Grk8U7T/uFy1z7TGDcg9WkKNomEKyDVaETWlFUpQkx0PiTvOhRKJyNrp816LYltl0fpz
         /7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733226598; x=1733831398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1eGTuoIcul4oTlM0V2VgbBHVZmBmDWQofZqgaFw1zw=;
        b=RNy7hNi6RJQYZMqjq2H2OSTQVHGV70iwhLzv9ftnGhPmEbBym+Y2SuqwBoLYfH/i9O
         HV9WAFUjybVQqgkImuCrORmc2v78i3NKRGeZ/RIF7NT1jmOAK1JKzOVhXEU7zUw/XuzC
         cg/O0G2UX2aommMx0JoKLGCEeHmd9ZsasbACvFta1MgXvx+2dFf237W1BLEoFqvySRA8
         OJ7vmmXJNbe4eB+m2A8lcmjfUeSxWUpmps4Uz0C/JB3q1K71HBdLrcQAHdai7SWkSXKQ
         9+f22w0uCbuBNiizIcIrGallTsQZEfT71E4ypSgdMPgr3xeA09v9ekWxHQklTcEND34W
         sVwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjraZpGLuuWyXCij+B+9GFwrttFwcjNHIPpYyTZAudyNDAKJgV9BekqYCCwUmERmEQ4ec1/I6++Lls@vger.kernel.org
X-Gm-Message-State: AOJu0YyS64THzwn7oa+NH8mhtCcYMwGbn5UpZWhdX+4jKkRPdaJVl1rl
	PSMr6lt+dqPSQxZIM1lFWXdkawrrvlSQvzSmZ7k+lLnSMPQoD9G4OItVJoqFreI=
X-Gm-Gg: ASbGnctDfSPCR0kt9BCzAy79+NFNodSIVSMCyBg5LH2jYEaclmp0RoJWb1wzxYdhyX5
	oBTfnlm5iy3tPr6UFCWMiQqwUwgRevhxBkN3nb3Qig7dNd1+t0TC4HbDQE7NzW2Ly3HxlbgAGfa
	zcujH0tqg6EpmDq897577zRoLr/JEQ8PIMTYHM8r3rFz2AjeOB4Q+pYMUcVVNDc6q1rAo3BCvmX
	VvYIweOOC1pRH24BrNHZGShmOyQzi0ohUtjhwlntAB9MtB76Pk8aUmqzZhRiIxRGUF8zlYDUcFK
	wBPzKVy38TfRmafogUccOFCQr7MKgays1nQ8t9o=
X-Google-Smtp-Source: AGHT+IFsnaahKV4dsatLKWcqYS7Ec/1sg7wL73iHar/F358cxfbXSRjS1/ttRnI5KGYWJY45r+/TUA==
X-Received: by 2002:a05:600c:4690:b0:434:a929:42bb with SMTP id 5b1f17b1804b1-434d09cd002mr20521795e9.18.1733226598426;
        Tue, 03 Dec 2024 03:49:58 -0800 (PST)
Received: from localhost (p200300f65f242d005bbc9b581c6b9666.dip0.t-ipconnect.de. [2003:f6:5f24:2d00:5bbc:9b58:1c6b:9666])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f7dccasm185521965e9.43.2024.12.03.03.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 03:49:57 -0800 (PST)
Date: Tue, 3 Dec 2024 12:49:54 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jakub Kicinski <kuba@kernel.org>, richardcochran@gmail.com, 
	yangbo.lu@nxp.com, dwmw2@infradead.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linux-Next <linux-next@vger.kernel.org>
Subject: Re: [PATCH] ptp: Switch back to struct platform_driver::remove()
Message-ID: <5qiehbnmzufzqjgn2l4jcghebdx7llr52lgl7hi2jizpg7gfnd@c73bpxxxdeiv>
References: <20241130145349.899477-2-u.kleine-koenig@baylibre.com>
 <173318582905.3964978.17617943251785066504.git-patchwork-notify@kernel.org>
 <CAMuHMdV3J=o2x9G=1t_y97iv9eLsPfiej108vU6JHnn=AR-Nvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jpb65nidl5tvnz4e"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV3J=o2x9G=1t_y97iv9eLsPfiej108vU6JHnn=AR-Nvw@mail.gmail.com>


--jpb65nidl5tvnz4e
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ptp: Switch back to struct platform_driver::remove()
MIME-Version: 1.0

Hello Geert,

thanks for pointing out this conflict.

On Tue, Dec 03, 2024 at 10:48:36AM +0100, Geert Uytterhoeven wrote:
> On Tue, Dec 3, 2024 at 1:30=E2=80=AFAM <patchwork-bot+netdevbpf@kernel.or=
g> wrote:
> > This patch was applied to netdev/net-next.git (main)
> > by Jakub Kicinski <kuba@kernel.org>:
> >
> > On Sat, 30 Nov 2024 15:53:49 +0100 you wrote:
> > > After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> > > return void") .remove() is (again) the right callback to implement for
> > > platform drivers.
> > >
> > > Convert all platform drivers below drivers/ptp to use .remove(), with
> > > the eventual goal to drop struct platform_driver::remove_new(). As
> > > .remove() and .remove_new() have the same prototypes, conversion is d=
one
> > > by just changing the structure member name in the driver initializer.
> > >
> > > [...]
> >
> > Here is the summary with links:
> >   - ptp: Switch back to struct platform_driver::remove()
> >     https://git.kernel.org/netdev/net-next/c/b32913a5609a
>=20
> Note that this now conflicts with commit e70140ba0d2b1a30 ("Get rid of
> 'remove_new' relic from platform driver struct") upstream.

Indeed. The differences are only about whitespace.

> Resolution: just take the version from upstream.

But IMHO my variant is better than Linus's. After Linus' change the =3D
for .probe and .remove are aligned in the conflicting files. However the
other members initialized there are only using a single space before the
=3D. My change used the single space variant consistently for the whole
initializer.

So I suggest to either drop my change, or in the conflict resolution
take my variant and not Linus's.

Best regards
Uwe

--jpb65nidl5tvnz4e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdO8F8ACgkQj4D7WH0S
/k6KEAf9F+5sS9kn27evKyDBVLtmYthIzlL6RVq3+pB4aw882KLlwsIKZEZaG6sW
h4CUtJwrjOm62GfBaKL54529/j8wJ23voQX99z8W+JBYIBaPqwRs7gTHNYXAaQC8
nbke+jKVEgm3BOxK3tfoOfWYyJbar8FkCWWbVTKbrM04bkO2XeLYK88qCHDx47mp
q6hyI0EgLoxE9OlGJVbCx4SInXXDyeQD7I96G5VccSaxxmoSp5Zx82sXGn6CfzVr
RKCNPJ+oqpnBi4muJ9S9SHhxXxGfyBm5ZASzxOFcuEzMmufUXsrfVUsm1m7R6I5w
cKSWIjE8MZEFpl9kZ9kUZTn26f1Tyw==
=hFOS
-----END PGP SIGNATURE-----

--jpb65nidl5tvnz4e--

