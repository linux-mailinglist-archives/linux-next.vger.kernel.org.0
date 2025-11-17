Return-Path: <linux-next+bounces-9060-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B9CC66706
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 23:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B288B35909C
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 22:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97893313E2B;
	Mon, 17 Nov 2025 22:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CaCR+4wV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654D2328B70;
	Mon, 17 Nov 2025 22:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763419142; cv=none; b=BEFXLph90IJtSnjmvCWKHCOsWi/O5ZxxOrkE9oNlOYWAeHF0O4It60mTYxHCIKUlZzaoRi8HJGZagWVLXK9hsXiTjoQ5TMFGeQ/1qizNkk1NRV2/4aGyVZ0SoJFoi4Kgt6AgcfMR0OEqfOimVo5oLAXuBc/nKJVoO9dLuBjQynI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763419142; c=relaxed/simple;
	bh=u6q4qWbMTntkeO7PFf/+xru1SEztBgNdxXhQZrsFaPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dHAsZA05n9ujIVaI0kuwXyGtdjJL4l0wxvlplAO9nzCmzovElRFsMCUR9htXJm32sfx5jmmtHQy3G7tU/26L7EaqRwVwmuB9EHK1ru7/iNwBEWrEYAfvlQmoPXNE5dff0pMAk7rwsebLNQiO3uLT9iWQ0jiL/zzXWSbaebof89g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CaCR+4wV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763419129;
	bh=KS6RV49qeWLGOz0Haop6at5QrM8eYoqPcsMUQ+rAGCE=;
	h=Date:From:To:Cc:Subject:From;
	b=CaCR+4wVwFiIfeFq4LdNmvyKd7jBmMUKb3J+l/vO+1MKSQ47OImJBMjct0c6worAd
	 lC2185a7GC0qOBLoRcaOGrcsKDyYROhmcZ/0r5VvOLcgOnN0fDwud8k7UOgvobDHeF
	 gm+dRZUPJGxGrGi+DMWQEZ8ag53G7ywsJ8waPFFoaHPwstXzelhyXzsUk96HVTnHgi
	 kjbjsCDQ8lsRYiSztHcYyfITLZoIDD8wqiI/m+9ii9jyX/wBHCzLrYihTwA3Zqh8Tn
	 bMgP+rrNzCidU0FOlAwx95q6eFb3biNs5lyDcOTxRq/v3VNitMjPBsz62ZV8Wiyk0c
	 hikhgbA4d4eYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d9N2J6lVnz4wD1;
	Tue, 18 Nov 2025 09:38:48 +1100 (AEDT)
Date: Tue, 18 Nov 2025 09:38:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Saravana Kannan
 <saravanak@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the devicetree-fixes tree
Message-ID: <20251118093848.53df748c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HUp+KK0tkH8Im+yuYzuzuxX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HUp+KK0tkH8Im+yuYzuzuxX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the devicetree-fixes tree, today's linux-next build
(powerpc ppc64_defconfig) failed like this:

drivers/base/core.c: In function 'fw_devlink_refresh_fwnode':
drivers/base/core.c:269:23: error: implicit declaration of function 'get_de=
vice_from_fwnode'; did you mean 'get_dev_from_fwnode'? [-Wimplicit-function=
-declaration]
  269 |                 dev =3D get_device_from_fwnode(fwnode);
      |                       ^~~~~~~~~~~~~~~~~~~~~~
      |                       get_dev_from_fwnode
drivers/base/core.c:269:21: error: assignment to 'struct device *' from 'in=
t' makes pointer from integer without a cast [-Wint-conversion]
  269 |                 dev =3D get_device_from_fwnode(fwnode);
      |                     ^

Caused by commit

  227c4e0e70fe ("of: dynamic: Fix overlayed devices not probing because of =
fw_devlink")

I have used the devicetree-fixes tree from next-20251117 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/HUp+KK0tkH8Im+yuYzuzuxX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkbo/gACgkQAVBC80lX
0Gy/dQf/e3ycZkBtZ+A7Gnm+clzsCHWKzBJ9P6ek5E4hDCGC8dC7q/agffJhXaIG
VLuz8eWdBGWaRU6TKsdzXrNxnaXe6SQc4q1Ab0BP1g/+t3yesbzdJ9JKvXwu6MeP
Kkynru7gkwO/7IvOWzqnYBpzlxEin5OEewQOOr7osasIYozDmVqzDy2HKKaoYIF4
7MZGvLmSocTqF6mIAnDU+OuIwRiGRTxEw5Cdb1Xhi12CCHhMUduZ3zvAePZc03ab
S4Wm1OqflUHn9xAXnaMoJC+vdxkt0PJppD3aIRjDIHM2vBbSHb+Y8e7doxLqF9Y+
7R1dwgn2BzsweHpCzZ8kzBn8QVgaDw==
=9quK
-----END PGP SIGNATURE-----

--Sig_/HUp+KK0tkH8Im+yuYzuzuxX--

