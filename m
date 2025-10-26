Return-Path: <linux-next+bounces-8710-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 400F8C0B41F
	for <lists+linux-next@lfdr.de>; Sun, 26 Oct 2025 22:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAB0A1898490
	for <lists+linux-next@lfdr.de>; Sun, 26 Oct 2025 21:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416052561AA;
	Sun, 26 Oct 2025 21:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EXjhsaXj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB62F20CCCA;
	Sun, 26 Oct 2025 21:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761513481; cv=none; b=YjVBJo1m7S/K5IHAt8X+FVwlZ2XlswQ3z9Qcq/4xV4cOAc5HB5LSmpJ9Qxt/dGWWCYEhZtHqDhOCckKJ0uEsuPAypwfTQ7e8sTHDwEDg5iB11IZfXZ2KvUQ4pNAycXWZJZe1lNBOr6T6GCgX/5fapCGjwyQ7+Vf1VrGXGORNxOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761513481; c=relaxed/simple;
	bh=OS8A9HBFvQKOXSk0FuBkqDAWR+ZTr2T3Fd6CP/iIrX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hKFRiu/go3u4OuMGuuGG7zTpoAw0qhRwtPaz2CmTDOl4VjZu152PBw9YC3XUVr9vfmYc+uoZogKJwg9FXM+QwXpQ3len6ujsyuWpyk0zTQZfZ0mGFufXq7RVvnEYgjxjofYvctaeMyOmuooFFbiN6ByqSBSMOWuwfIHRs2o5K5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EXjhsaXj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761513476;
	bh=YrxOsgBvtFtytgIWF/+hoCna4nK+bL/X/NI674y5F7M=;
	h=Date:From:To:Cc:Subject:From;
	b=EXjhsaXjAh7g/3C1io+LS8J9OhUqp9Z1klcyG7aDrJG6scpmmPLLjc48E/V1L/EB/
	 7cCW4SezOYSxShn2bQ0ni6iw0VSlxwdohwVDhjAP78KCOwcy2jfbCpH67VzZ6I91Fa
	 AwZHYvl36jDU/ExtzKezox4//3+hhgDUZnjjNOjBZAFV1S2KRM+8wlN/L2QeRrqnLM
	 FGC5TmsEiMLVD41AugDh4lhQEYX8sQRq33OZ+ccwiQVttYdVCozvVl/bO6JlK2tKeh
	 ab5weB4RwWOdYdeAZjeOFob4a2CTP4HHpj0bpQqUH262q7/4L2gJUHsuBgJsPZ+VPJ
	 dCX3rXhj6EM7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cvqH84DK2z4w2N;
	Mon, 27 Oct 2025 08:17:56 +1100 (AEDT)
Date: Mon, 27 Oct 2025 08:17:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the gpio-brgl tree
Message-ID: <20251027081755.58816c98@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qZp02uJMQezZXBYWc5Ekl=a";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qZp02uJMQezZXBYWc5Ekl=a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  ae495810cffe ("gpio: regmap: add the .fixed_direction_output configuratio=
n parameter")

This is commit

  00aaae60faf5 ("gpio: regmap: add the .fixed_direction_output configuratio=
n parameter")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/qZp02uJMQezZXBYWc5Ekl=a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj+kAMACgkQAVBC80lX
0GzZtAf8Dct5VaAffgCsrG2IZqfIZHNEgKdoSPxOJw7cvKUqYb29szzNLlNtesCq
PKJdReZn9rnmQB2SstIpLnM2EwEtm9W0lqKg9wuZ0IPhFHoD23j3WokW7xNXiFA1
N4IbAoWh2jk2os5Sfy5Y7XI1to1VKwtgB3IITe6m/9FllB8eO8AZrQYlGWAXQo7A
0LIDf7KTipC3Ih+Fra0y32peurW2NqyObKSh9Yn7Y7qmmGoT4s5onD4rwx0mAkTB
ZYaG5dsRSJxfFcs6GmmNS1zGAX7rb81GM6+LyEDBTXNMQcg8Ymmm219uOkt418qg
vvXbkrwauI178dregsnG+OccR3ZlOQ==
=HCMO
-----END PGP SIGNATURE-----

--Sig_/qZp02uJMQezZXBYWc5Ekl=a--

