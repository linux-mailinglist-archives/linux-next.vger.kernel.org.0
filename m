Return-Path: <linux-next+bounces-7400-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEB5AFC533
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 10:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 691DB1BC27C4
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 08:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E2A221DBA;
	Tue,  8 Jul 2025 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AIeBEvpp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BEE21A428;
	Tue,  8 Jul 2025 08:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751962549; cv=none; b=P5ifZ+CJGDFM9YtdcjY4+f6yr3SF8NjThWjOAwHo+/tNc59fH93eVIU+z3zbsqbACt3/Nx/LiCpHKiC4uHmVlZapL8Liejxg+s1dMq+FpYJ1fTdeMJOvRZLHaIxKvRXph9+sbLhwUj9dgOoKdZfXTnzHw2ilZ170x+GrmcagKhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751962549; c=relaxed/simple;
	bh=r9q/EiudV3kXfTjVVEmKd7UhTKCPCUE7+VKFJysxdME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Rcrrz9ObdNluk472Gh5Hbq+gy6M/92Dz53fZsONMZdO/Udq//La4VfFmxJfy68f4fYfpXzZpmPXv4rCOq45CTjD6KZYDG6NexAOmrB6790idEUE+kJYnwgXIGo/1qJb9AvhHXVUOk/4elwnXoHY7rDNyVUYbSxgiG0LbHlevrX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AIeBEvpp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751962483;
	bh=L6uK0a8fc3zG//xlUD3YgxBcRzUgvy5utAg02bIAiyI=;
	h=Date:From:To:Cc:Subject:From;
	b=AIeBEvppMWbCV1DI91zVlELJm2DTf3ynxD36NtCHFF2UyRft3vnlBpf7Y/oKIdXkj
	 qXXk7PdYAC+FcaBZDROt9VOyky/LuvCEqyx6h5IP0piKybmUE05m87AT9gDDhITGDh
	 YjoKp2vKFLoY1CG8loXChzPQ6ZPj4tQ2/vQxZ3J13h9jF0r81oKsEzHFpZTu0k+dvI
	 V5QurFDnFSZrG/J4+FHcQJyuSaOuJ02bHXmcetReocMODBIzkdrGZv5UjQq5ewGdK4
	 C7U0ttkNkK+MSiTBQImNXPHjCsBp4KzfNYAHZQAQyQuxqKaV0lFgOGlvcoap3ZerRc
	 FjzoNhUWALfVw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bbv6B2syrz4wxx;
	Tue,  8 Jul 2025 18:14:42 +1000 (AEST)
Date: Tue, 8 Jul 2025 18:15:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shuah Khan <skhan@linuxfoundation.org>, Richard Weinberger
 <richard@nod.at>
Cc: Johannes Berg <johannes.berg@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Marie Zhussupova <marievic@google.com>,
 Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>
Subject: linux-next: manual merge of the kunit-next tree with the uml tree
Message-ID: <20250708181539.0e778563@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rA/zZX9M.06NvosOvXORJgP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rA/zZX9M.06NvosOvXORJgP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kunit-next tree got a conflict in:

  lib/kunit/Kconfig

between commit:

  013c51446570 ("kunit: Enable PCI on UML without triggering WARN()")

from the uml tree and commit:

  5ac244b9cc8f ("kunit: Make default kunit_test timeout configurable via bo=
th a module parameter and a Kconfig option")

from the kunit-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc lib/kunit/Kconfig
index c8ca155521b2,c10ede4b1d22..000000000000
--- a/lib/kunit/Kconfig
+++ b/lib/kunit/Kconfig
@@@ -93,11 -93,17 +93,24 @@@ config KUNIT_AUTORUN_ENABLE
  	  In most cases this should be left as Y. Only if additional opt-in
  	  behavior is needed should this be set to N.
 =20
 +config KUNIT_UML_PCI
 +	bool "KUnit UML PCI Support"
 +	depends on UML
 +	select UML_PCI
 +	help
 +	  Enables the PCI subsystem on UML for use by KUnit tests.
 +
+ config KUNIT_DEFAULT_TIMEOUT
+ 	int "Default value of the timeout module parameter"
+ 	default 300
+ 	help
+ 	  Sets the default timeout, in seconds, for Kunit test cases. This value
+ 	  is further multiplied by a factor determined by the assigned speed
+ 	  setting: 1x for `DEFAULT`, 3x for `KUNIT_SPEED_SLOW`, and 12x for
+ 	  `KUNIT_SPEED_VERY_SLOW`. This allows slower tests on slower machines
+ 	  sufficient time to complete.
+=20
+ 	  If unsure, the default timeout of 300 seconds is suitable for most
+ 	  cases.
+=20
  endif # KUNIT

--Sig_/rA/zZX9M.06NvosOvXORJgP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhs06wACgkQAVBC80lX
0Gw/AQgAltP32Lo12gRByUmLpIEz38sxeWdOHP+kA26/VfeB2AOYoaP16hJqMRZi
g8jjTjEVPVprDfJbfwGw2AU7T26z4SOTuLRyPZY+7uHvjKjmpYZlVtVye50oMDiw
qpkAgNTe7I06P0VNtoEKcyNMDrUy6E5qZdXK3EVjSNu3bq7qbUO4jIeBy8E4Zwyo
tAq1f92ocKni04QZh2oGLTInllJ5NswnRZTJKKSoyasAaT4DQ7lI2iIMijevX9ST
l65AxlECnYb/WOGXsMS4l1lhE+ckJXVE/2yn91N2c0tkUQ6v4+QaeWw+M2KOeFl2
ffHDT31usERcTQXnU+B5K8k4oYxZYA==
=9fqo
-----END PGP SIGNATURE-----

--Sig_/rA/zZX9M.06NvosOvXORJgP--

