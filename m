Return-Path: <linux-next+bounces-2258-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA598C1EAA
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 09:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 339D2283599
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 07:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF03515ECEF;
	Fri, 10 May 2024 07:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jbLIvdc+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A74E15217A;
	Fri, 10 May 2024 07:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715324912; cv=none; b=G1EC5UWHPn7/FZi6MQQjGvnXTt9u3Utg2hpJ7oqE8Z/V5TXyrxgQf5gpZLEYAglrh++tTknfxubUMgGkTXuXl5tLlxvmitcOfgzL5R5AOLvvCIohToCETY+UDxFRXp1hMFaMf3Og/m20m/8Y3BtBh8BjD2qcURkmUD2KEqJz1+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715324912; c=relaxed/simple;
	bh=3MrBVyxp1+vrcSn+LlVGY7ra+MZGFnx/12p7qpY0AKI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZLjeAZ5UaYMYOz+yg+F7glHpWhJwt7qy2E+A4l00xumLtEsYdoZjNvLPG6W+6vwq+/geWHhBuZrxAMTFLgjRLDtIpmOU10nYXLHHAwq7M9EmB5ieUzyCnTUvByu/GB05pELSQF0OCwEy6l/Rk5tduEc0NzjO2ZMnscZnOoHz/9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jbLIvdc+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715324908;
	bh=3MrBVyxp1+vrcSn+LlVGY7ra+MZGFnx/12p7qpY0AKI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jbLIvdc+VhxhQWH1nvaMiVGvpIRa5vJ8rzGW8X5HVi7Fsu6RzQsmx2BSWqAOMz3CX
	 V03bVB2NvdapuNuHirnp4X8Z9vdXyOCmZQzkIok8rcw3YL1F4IwnUqMbVJf2FHRPCB
	 ggSXJ4DU/B2vqqpTx3/iw2hxKz1nEaZRhq6TYR7VTA+MzQCjA2c8onyhxjwPsGPRDC
	 OifDqLp4X/lF0jcKmP1Y6hozdsUfMpqED8PnQUuH0ssXWS92/Bx9pCifA70rjuEGCM
	 LY8MBgNGn0A96EU8Qla8tn+VhWkzG8zA6gCIAXh6nsX04iA0CtepUC7CSWriebB/KX
	 rkN1+nNgfnpqw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VbKjR53kyz4wd3;
	Fri, 10 May 2024 17:08:27 +1000 (AEST)
Date: Fri, 10 May 2024 17:08:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the
 gpio-brgl-fixes tree
Message-ID: <20240510170827.2b655636@canb.auug.org.au>
In-Reply-To: <CACMJSev6EDeLdQ0e7A7f6AMhh08FznA67x5ONG+vSseC5QLt6A@mail.gmail.com>
References: <20240510153212.246fbf31@canb.auug.org.au>
	<CACMJSev6EDeLdQ0e7A7f6AMhh08FznA67x5ONG+vSseC5QLt6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/If2HvKBjlQgYGda+h0=Ozeu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/If2HvKBjlQgYGda+h0=Ozeu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Fri, 10 May 2024 08:33:37 +0200 Bartosz Golaszewski <bartosz.golaszewski=
@linaro.org> wrote:
>
> Thanks! I will send the fixes upstream today and then pull v6.9 into
> my tree before the merge window PR to fix this conflict.

Or you could just merge your for-current branch into your for-next
branch and avoid possible issues with all the rest of v6.9 ...

--=20
Cheers,
Stephen Rothwell

--Sig_/If2HvKBjlQgYGda+h0=Ozeu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY9x+sACgkQAVBC80lX
0Gy8ZQf9FAnF+zrtqEl5VDDNEEgG3oO86YrcCHI7IiTakoztkUR0QEGONjqySWNo
WFe+9IH9RPtY9u47/gX8qlFN4r9NQaD1G+Gmvvog/A7vASCpWdMqlyXi44NlZtp9
UfAwU4t8kiKG+bLAk4Pc3sKvKmhcQOXiVIkYLRvu3HwhzxlxC1KXtDfAMC8dimts
W6oFbsDuAtXJCRqtuz5XePwYUPNJQuzD+mUe4x/e6franP6VbrnPD3Ud/3zNPTrO
8YCyfo/OBaSzH4BbWcd5kIA/mUnDx7qMQQHOYXi9162lKGJVhYSLwhBDapkkTsCu
s4FGvi7gpwCiQchM1b5MNkPYddACFA==
=moAU
-----END PGP SIGNATURE-----

--Sig_/If2HvKBjlQgYGda+h0=Ozeu--

