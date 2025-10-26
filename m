Return-Path: <linux-next+bounces-8708-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CD7C0B3DE
	for <lists+linux-next@lfdr.de>; Sun, 26 Oct 2025 22:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF50F18970A0
	for <lists+linux-next@lfdr.de>; Sun, 26 Oct 2025 21:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05DD207A09;
	Sun, 26 Oct 2025 21:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gCSFO0eb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF8472633;
	Sun, 26 Oct 2025 21:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761512929; cv=none; b=UtPLIFClALUSQOBQnD6sN0buBr79iubmh1TtpCqZRtx0py3rOrzB2p0bQJRQ3lCj4/DxRrwEbLgFJwyNvgEnJi5jd/iC+Kq+HGBYm9zrJXMK5hkIkog2tyMKbYojd/ymaThaCIegCvfGEi0WCgG++4O6mqEYMrr2EAf9FIhRXb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761512929; c=relaxed/simple;
	bh=wtmaUcmUQO2/j1dA5UlzGbNz1/zPq+JvqBmW1XNu4hg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nUrGoIwCVbVkT/mcDngjkNn0O/DHfR9R3c3Y1nZSgwfc+Uglqtm5xF0erq/AL6bR842XYOGnj+nnF2FdM98rGL9YqlYgHdJkJjkeHVK382YYCM7JedFgAHmSJveIApJYpQGMweIZWLns7AixF4UgCkYa0Q8quFrC8H2xmVZL2F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gCSFO0eb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761512916;
	bh=KNGlZDI97pDFpHcN6XMMluyye9W7EKnY2DtK4oajiHE=;
	h=Date:From:To:Cc:Subject:From;
	b=gCSFO0ebq2Fviw+0lRsWmsXzviw/58EoRoC5cFFESZCQilTQ9ls3KGdfxH45BUhBr
	 zvcEciyytMp71Rnx5RFh/0BIsefhTc3jZdQ8eFw3WeWmYG/rumwMc/+BaKXDScei8T
	 GxlwQ75DIKWI40ao6IMVLMxdMbiK9kh4uXB4oyirxQxo7tCZypCRrPi9FLwHpn+Tes
	 rrfcGb3rc7cy4xKh2S8R9KmA4lJI564cLIAdyBC8oF+Gwu+Vtydjzwj2O2cNYaMMAO
	 JMuGv97jfoPQMAJV4gIynaG6sh6HJmxcOSIgtHe0a5mwtRnjPGtGx1d0/hC1cmtrO/
	 Zy4hof8/rIqTg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cvq4N1Nh0z4wCV;
	Mon, 27 Oct 2025 08:08:36 +1100 (AEDT)
Date: Mon, 27 Oct 2025 08:08:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the mfd-fixes tree
Message-ID: <20251027080835.04e0a4c2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OiQeCwxxs9cyHX.b1aGV1x9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OiQeCwxxs9cyHX.b1aGV1x9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  91a3e1f5453a ("mfd: ls2kbmc: Check for devm_mfd_add_devices() failure")
  fdff3cadeea9 ("mfd: ls2kbmc: Fix an IS_ERR() vs NULL check in probe()")

These are commits

  4af66c2bcab0 ("mfd: ls2kbmc: check for devm_mfd_add_devices() failure")
  0892507f4a0b ("mfd: ls2kbmc: Fix an IS_ERR() vs NULL check in probe()")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/OiQeCwxxs9cyHX.b1aGV1x9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj+jdMACgkQAVBC80lX
0GwspAgAnVOdEQYjIuoFHKwnfEQthnwIeLBhSGg7byoTvzilQr96WKiiDmY8OIXT
tHVDMvg2qKVLdgaPt8K05Yugs7NX7w3WOOB1rlbsNI1u6iLUvgn+U0GnauxXS0UY
4Br8Fr9Vo0lh2ks4gYpv3cOD6DeAsNwrl0ibiRfvxBbDfi7ws+8ZNA1oj2EQRgwl
QX/Rq+DElcwtoB01TqlDymxdTRVcwml/CEohuzDujhi3lrdr2c1SkJ0nxvT+Sa2q
YAM5rXDVnzBKXXsxY6Sw3/9B51u9MlLsRPZ/MccMcQJb+qClX//WevbGzXxebx6s
w6msYSa86s3PSU43nUKePT1JEoMSGQ==
=pS8G
-----END PGP SIGNATURE-----

--Sig_/OiQeCwxxs9cyHX.b1aGV1x9--

