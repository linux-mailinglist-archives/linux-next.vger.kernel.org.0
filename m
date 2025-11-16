Return-Path: <linux-next+bounces-9021-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADB5C61BFB
	for <lists+linux-next@lfdr.de>; Sun, 16 Nov 2025 20:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2285F4E1530
	for <lists+linux-next@lfdr.de>; Sun, 16 Nov 2025 19:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5162571D4;
	Sun, 16 Nov 2025 19:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tTF17u8F"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E7823F422;
	Sun, 16 Nov 2025 19:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763322848; cv=none; b=QIGkP8Z6UPcX58HhgmE4DkYXDbw/NGSwBRWfd0yiPnmqD9VpVNZJVweP2wOrAz3PdGm0f0knhIVf/n+4+ne/XrQ5DyobHPMTX/l24R6wYSVCIah1Wn3wKHAMXu96OXTJrPWXCFCKF3WdptNKWJ+pg5A3TBPCeGzjiimta8gyi3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763322848; c=relaxed/simple;
	bh=1DVEn9PON4JYkU5/FBczFHEmi9rCD029N3kMLh+dyA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NVOjcFI2TYJyAr4htVw0xooa5uwkZ0POSn4n2jPAUtztAZGcNymIyYv68JY0mQ4CNw6LH8jYOw/qAz9T6dQLxBggovkuIPgsWdRn3DMrqd5SV2c2KLMvBx1Fe8ymPLoSigFqH3AUUpxHijrSjX5s3nNFBdLWD0PXPdao3ubpd5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tTF17u8F; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763322843;
	bh=jqINqFI+voeDWRKu8AxzERxUNZyz+/17LmcS6z7NuYE=;
	h=Date:From:To:Cc:Subject:From;
	b=tTF17u8FReJ94sxxPI+MmQt7KDnF7ZBkto8A9WxuTdzXHUBkw8pQtZ3XFhxrWADGi
	 qs+c9FV94eyJcJWWYlIqWHPlqFDaDwl6TjMNr62dk06NRe/5UQyJJ8ARoIjxVWFGH+
	 7ns0npvtI5kmggMMEnBWLwVYK46UUgXX8jEKtBFG3dFXPKZcvyzNqZ+zQ4F8hmXiwy
	 +xRTf+WWEskB7AdnpBykCRt1M494DC1Mkh7BA1p0Ef5C6STddmchZEHWari4L3Ruh6
	 BaP7bkHWJfQxOFJHCo1vEAMvHc6JP4GMrpkB0N8J6rsaZwkVBmwDIv5eCVt5txm180
	 hF3h8YpK++ihQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8hQg5pDsz58bL;
	Mon, 17 Nov 2025 06:54:03 +1100 (AEDT)
Date: Mon, 17 Nov 2025 06:54:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the vhost tree
Message-ID: <20251117065402.67cbf754@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W1Z0hstPfvvhig/Kdj9W3_4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/W1Z0hstPfvvhig/Kdj9W3_4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  97e0363667c5 ("ptr_ring: __ptr_ring_zero_tail micro optimization")
  d934cf66809c ("ptr_ring: drop duplicated tail zeroing code")

These are commits

  c39d6d4d9333 ("ptr_ring: __ptr_ring_zero_tail micro optimization")
  4e9510f16218 ("ptr_ring: drop duplicated tail zeroing code")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/W1Z0hstPfvvhig/Kdj9W3_4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkaK9oACgkQAVBC80lX
0Gyqewf+PglQf+JUBSi6rjQ3xvVgv0C/YXo2v/a6i+MX3KZ79UGZAuJIeGEOzN5a
5pcK4Ol9Ggz0PXa4KZBs/dlfthW0OeL/sAIuxgeKfgB5pY1G9IZvRry+eyID4c0N
hUb9ZMkaXVCnzUpjtouUyQhGzWaq+KpKqxbTO9CnhJ/rsox6GLl0I1QdbqHDPT+8
S40CW99ogqtycdM5Ebu+VCO4kIBT/DspVvhn+F0+u5xkt7l/KKUmKiFgoDhQXriP
RUTkc3MksabMbolKpk5S7v02by/TtmL1Goh2dHuqbALwqGS0at167iMsHL1i1INw
aEGvFJnSpEheR0E/7bKlwCIn4137Bg==
=zlbL
-----END PGP SIGNATURE-----

--Sig_/W1Z0hstPfvvhig/Kdj9W3_4--

