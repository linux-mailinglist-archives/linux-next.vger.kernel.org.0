Return-Path: <linux-next+bounces-8613-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F02E8BE9531
	for <lists+linux-next@lfdr.de>; Fri, 17 Oct 2025 16:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC90D189A2BC
	for <lists+linux-next@lfdr.de>; Fri, 17 Oct 2025 14:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF9A335064;
	Fri, 17 Oct 2025 14:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BS3ALYkm"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BA72F12A0;
	Fri, 17 Oct 2025 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712439; cv=none; b=ceElmj4zLj4lbFyzoq4rMpHSpbXmzVsybNSQYb1lG2gQl/pCxLcd1zpcEiUXCUfgJIEqBtTlgIJ+2kA++e9EhZUsJJNNEJOQEBdKAJasSwvWsR5Qtq/VZYZaT8yRYVmhVTQjsQGVL0FpYzCMC/gBiZx0PMqeZyGWjXb7Rh+PIhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712439; c=relaxed/simple;
	bh=32vBynVJya09c9z7j4Z73nhh943xgWGDN8z9zi+tnrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dxk9B2z4IuOTlYwv1h3MajvkqExA/MIVooUgn9Sx7JbFUYS0tCs1DtLTmsx4GnIUQQvAqMZcsSMoGc8Fa9lMU/WM8Erjnj7axSWnwRHAhLrk/aVXd3vOhzOtQUJjIFSd4GUGqvFomnh6j4TnOaOKJr78BtLDKw3EWbZ2R4FvLok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BS3ALYkm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2D1C4CEE7;
	Fri, 17 Oct 2025 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760712439;
	bh=32vBynVJya09c9z7j4Z73nhh943xgWGDN8z9zi+tnrI=;
	h=Date:From:To:Cc:Subject:From;
	b=BS3ALYkmQIZzi7N0EZBezjylBmIyKNaxYsM6oEXaAZTNI3C8+XiXX1evQ5LNysc9f
	 83zmEPbyClUaRkBak+A2rmrCZGO/Gt7wdpre4pFr4bNdjl76NCBrdMzxJnUr1gtU6f
	 wZP1K/bRR4Y7A2k5vtAgCHONSdfRIQefj8vMyYR/Tb7A+cY5tb5Z2aUKwlp3xS90Rr
	 t1Z+kDLPjJpwIK3quaLI2XjXTjVe/u9Mj52kerWjWKnlm9XdtpW0xOBHbyUC5zlBUG
	 ftvbhcF51ewOmroF1Ch3XQXUXXMhqgidrJE6oy58Ru7kIKSkoQLVGZ1C13/cbMoAw2
	 WJF0voFNwIlcg==
Date: Fri, 17 Oct 2025 15:47:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Ioana Ciornei <ioana.ciornei@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Michael Walle <mwalle@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the gpio-brgl tree
Message-ID: <aPJW8HIke5pj3doX@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u03tAdeySyx/+Qpn"
Content-Disposition: inline


--u03tAdeySyx/+Qpn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the gpio-brgl tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-qixis-fpga.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-qixis-fpga.o

Caused by commit

  e88500247dc32 ("gpio: add QIXIS FPGA GPIO controller")

I have used the version from 20251016 instead.

--u03tAdeySyx/+Qpn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjyVvAACgkQJNaLcl1U
h9A0jAf+JldT0f71xtML03Xjc0bZaFRGfaXdbetH9b6/wkbGKjdq4DSqegj+Rm9N
21DMDNa+seztJq50jOCE7jQiqCu+c+2t+SZlHo7Wlxxqu8l1iHuC8xz9KYnumQwY
UFeLMd9ApYBJ2vHyLo6Tx+KHKEF4pE9YdrekWP+J2wOc0pPPwZP56fvMnydwceDD
43bdLLREpQS8RbSN6zE9udPs+4qyhSxEt2KLtWNCu1courBzwIyplPpnA//zzWZ/
mx9BjeUDDnrn1u8VVVtDNptT8VDPees4GEJCmeti8iwA7hLKLEYVYw6LbMshMsoW
KLwGfkIrsq/+f5Nnw8cWQPQJB/E+uA==
=rJeg
-----END PGP SIGNATURE-----

--u03tAdeySyx/+Qpn--

