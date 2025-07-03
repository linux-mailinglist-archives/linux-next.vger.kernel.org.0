Return-Path: <linux-next+bounces-7323-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BE8AF6BC3
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 09:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E94D61C46120
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 07:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEFD299A9C;
	Thu,  3 Jul 2025 07:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D34iojH9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676D0221F37;
	Thu,  3 Jul 2025 07:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528372; cv=none; b=sYI3rHbLDj44iBtfKowRRYfshlTJ/F3NMXa/hfribG09x2wRmstXtzqq3MFIAb7I3Qy3WfwcopyT5ChNBqbvmO0bIM7bkDP9OWYuMc2mcGrWt8063LqGUY6n9DaMOoYAv9RbcLfO6fJ5YzlZDyghoLHJc9+WPCgJrWNnoNv2CEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528372; c=relaxed/simple;
	bh=DcK/cK7orXY4sw4RW2E82Q2gOS6nw3jLrsat9F1jso0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qK0ct2jWSGh2GAPFvtLLexjLJ+9peKpABgzgcWzHzcXaIelY+0CD8FozQ74/7NcTuLV4MeGnxFkM+TH2U/jyeRhFm9e155VC2SQJi+vmYKXY1hR13g7nK4DUj1ZUVVn07DXLgExacCkuHB1nzLHQH4yywBkMxZYio+JjcJD3s7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=D34iojH9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751528343;
	bh=klFrYuInid0ZD+Mp6eViRkJ/bEkbZ6noqcZuLB21X8Q=;
	h=Date:From:To:Cc:Subject:From;
	b=D34iojH97mPJVC9CNFKNxa3HeSVTTSIxv32QQ1YvIJN/gH5xx+/OHFga75NGgviDc
	 8AD+aYxPqvEUBj4t1w33TCqCAD6hULViuIntUT7c/lJE+v4e5uAKrhZpAFw457pptD
	 HoeG7fcU4AJrg6VEVBkmwZfW8l586hIw3wZWic9BYc9+AyxGGvJE7NJmy2bHBDAJtf
	 6SaLxRnKfN0zY6o5+ZbHpI7uHyW2IqUXIIwwC16YKq+0qrWeK1VG1YIHgtzG5+5YhM
	 Kid95QKf1XKQZLCb4Y/6eeLAA8dWrASkRndrYXWBl4LDWm34YfIgaP8pl1ldTUwt6L
	 Yvcw982qc7mrA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bXpYL4hm7z4wbR;
	Thu,  3 Jul 2025 17:39:02 +1000 (AEST)
Date: Thu, 3 Jul 2025 17:39:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Shiji Yang <yangshiji66@outlook.com>
Subject: linux-next: manual merge of the pinctrl tree with the mips tree
Message-ID: <20250703173923.57d49700@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mlFsqj.iE3/qg7tVmxt8vh_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mlFsqj.iE3/qg7tVmxt8vh_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pinctrl tree got a conflict in:

  drivers/pinctrl/pinctrl-xway.c

between commit:

  98a0bd6aa579 ("pinctrl: xway: mark xway_pinconf_group_set() as static")

from the mips tree and commit:

  e62acaef5d3b ("pinctrl: xway: statify xway_pinconf_group_set()")

from the pinctrl tree.

I fixed it up (I just used the former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/mlFsqj.iE3/qg7tVmxt8vh_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhmM6sACgkQAVBC80lX
0GyaTAf/a0irhJmrf07R+2ACs714Grpz6foa0pIe1mbKUh7rbNZhqiOGY4v8bKgC
CmnxyiqmzcMBIveNKb1K5+ZApHEb9NomFlTv4prqLqVkZa0sx2ORNwL4jZWtJckb
f1s0/XwET195FPOjIE8Jk0H3lqt0+/xyzkgOeobwBSUr6TG5z6pInT5WalQvzlAJ
HUyI8K4xKQsR5u0vB8FQvuR4TIlt3Q+g4pfJGu8pznkGXjBrft3ORTnQ/iu4xf8q
4YspOaykDSMskVbWSeSOku7Gh+BQNs1DTwKDDicBHhOLFKEDK41UfzP/5ctMCyeL
JQ3/3ddhVI12mlpvvyiOjMp7pvZS2A==
=V3MV
-----END PGP SIGNATURE-----

--Sig_/mlFsqj.iE3/qg7tVmxt8vh_--

