Return-Path: <linux-next+bounces-4902-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2887E9E888C
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 00:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 269871884DFE
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2024 23:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD1A189F42;
	Sun,  8 Dec 2024 23:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gdeOHd5C"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE6E3E47B;
	Sun,  8 Dec 2024 23:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733699611; cv=none; b=EdgRDh0L6cgEfBUHNzgsG3S45m3RjmMzes8AhXDLUthK/SaL713SlqHWPOcqdBrtDt00v5HwTtQlp+IJPD39YMjBrWAI/R3V5uMe5B/h73eWwhl7EV0qnwVpY1+TmovtjT9aDbvQrK5emlKwdZoJ6OtisAqKkw7YSvEMWN56+TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733699611; c=relaxed/simple;
	bh=ptxLZbsBhhfrWOuJvoOKgnAL+OR0PyuMPZfRdlNynEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k5UEQ0dw7O++QlxnqYigCBp0pvx9f5/1XYAOseencaUDpFx/Vh+IddpCdyHYPC2gv5nLghwWJpfOVgI9wRqgAIqrED2o7IRHZaVGUafNJVA9d2nSfe6isK3N+6FBdEN1irEozAeaWmuv6x62RkigVDuorlDGREAZ7NymeuC8CHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gdeOHd5C; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733699600;
	bh=L2+9rDlV9ndJi1o5jkoP1JiIlANKo/2oofMIiGi6nIQ=;
	h=Date:From:To:Cc:Subject:From;
	b=gdeOHd5CY1nITlZ4UwxVZxhGbdz8Mt6XEVim4KOOtkh1qxjVRcUnp+bl0qkQU8n+e
	 9FaXxymXKsuYL61DrzpBppwa+uxXppj7tuOW0H5WR1iihT3U5uVEIhws+pdjYPcOsC
	 9ue06x3rqN2vhC4Jjn1N0izkgjnQzJQDDddcAt0eq6R9j4TiIYpw0BvnloaiYk0CuQ
	 Sdkr7JyMqkqApJR19oOfmtGb/y+ZaVuidE7pwcI4pMMVLCbfHImYTAlRjBTBV1FP3q
	 b1WLlY/8JR6kG/FMa07601psNePOds3e3WegprMyT1GQET2spsSU8mwIAGkq7cFklK
	 VnQVqAcHdveYQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y614w4rZdz4wp0;
	Mon,  9 Dec 2024 10:13:19 +1100 (AEDT)
Date: Mon, 9 Dec 2024 10:13:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vfs tree
Message-ID: <20241209101322.08e7be4f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t9DqOw0GB74m9x6=++AQX3A";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/t9DqOw0GB74m9x6=++AQX3A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the vfs-brauner-fixes tree as a different
commit (but the same patch):

  b4080c21aeaa ("fs/qnx6: Fix building with GCC 15")

This is commit

  989e0cdc0f18 ("fs/qnx6: Fix building with GCC 15")

in the vfs-brauner-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/t9DqOw0GB74m9x6=++AQX3A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWKBIACgkQAVBC80lX
0GzzMAf/QG7B8EEXTkQR6a2E+vZII1ckeBNUyt9BgLFa7FklEx0GF9P5qvIxuYKh
nXQ/IUTUjkH0NcitAVzYIXafuJOXWVtoFlQucuNef6dIS+tU2Ku3qPpT9G/sEqoQ
ZsjVFl3/CZ6GyIN0wjgJ+ZyiBDvOavHi+s97UxgUiQJsdTf/9Qb9ZyPQBQNCNK1Z
WbNecjDJdq36FHqIlS74XM4YY1vNTyi/oWETYbKTSPZQr2eAtE5hlS1Eqhqvajz9
Os0Zr/pg1x/UKwsOAC1eZAUY+/TkPw0v5Sis0CjSqQ+kySeiGnlLVoTtYwA+EFhb
E1scYXqTOI7pVfh0g12FcL1BinqHwg==
=Vt5Z
-----END PGP SIGNATURE-----

--Sig_/t9DqOw0GB74m9x6=++AQX3A--

