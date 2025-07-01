Return-Path: <linux-next+bounces-7289-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A20EAEF086
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 10:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79AC0162810
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 08:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC64E25B2FA;
	Tue,  1 Jul 2025 08:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gsBT7M9D"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB081F874F;
	Tue,  1 Jul 2025 08:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357402; cv=none; b=s67H8A/K6wmyM30miRtCkQn1fQB59TUjLGRC/W9ImjqEI/JUZ2y6OQPYJnLo8sCMngKFQK6msPYq6ARgkIuOlI+ysZuc7onKoiljQ+S25ZpXpf5j0QGi4f1naIkj73vQXShxxw44oO9/EIrVLlkZj0M8QMrZQEUT6v9mFwN6Zqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357402; c=relaxed/simple;
	bh=V/eNr+XZpOZQasVvgFztfSwbm3QiWu+3jQqKHoSmFcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HK5b+phoaJ9lP89LWgnu0QaUB7AvP2zmyta6n6whw0LiCdEvAdWCbMEGH8sQEU4GXCWVtIpHB6jNc9vaLOiHd9iDEli1cTd7uzqg6XQk4rFWAaqxEBl6WlDYPKO4mOScmVxFC+IVcETn/rwjVRekwg//MscagT5KePKOb58SpYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gsBT7M9D; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751357388;
	bh=i0dwdcktRYAFch2TqkjcggkBLvEQlkeisToFt/av8Uw=;
	h=Date:From:To:Cc:Subject:From;
	b=gsBT7M9DAw7OaCOKuqQ+ldVrAJJktCAigvoccSg4bKcLRiJU6lnNdaUeSiiuOx3pn
	 xMFoLuA2HvxvsuL4CW0o2kqXWvpMmIXRasF/kGL3IT1okwPe4ii7i9lAwwmx6CxSgS
	 DsiOj5eOqu8QsuqXuxqvUtaZCSM8UIEnvnqMCc+UlPutfwFINerMmXAEVGCDHs73Rw
	 0gHCz2WNy0zvJ7scprxMRY92BhRSI935bfdX+CzrUSfUTQdsageoo5pDdEK/fq76v+
	 XpkbvNrcX0iuk1FJUW+euLij8jZg5W0vEazsDMj8OUf3dTek1YDa3BnkTGE1uUR9Us
	 mH938tVkZ/BQQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bWbKm475Nz4wbn;
	Tue,  1 Jul 2025 18:09:48 +1000 (AEST)
Date: Tue, 1 Jul 2025 18:09:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20250701180955.0859f046@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kP_8zd2dCpMVyLt4jEq8i7P";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kP_8zd2dCpMVyLt4jEq8i7P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

include/drm/display/drm_dp_helper.h:859: warning: Function parameter or str=
uct member 'luminance_set' not described in 'drm_edp_backlight_info'

Introduced by commit

  2af612ad4290 ("drm/dp: Introduce new member in drm_backlight_info")

--=20
Cheers,
Stephen Rothwell

--Sig_/kP_8zd2dCpMVyLt4jEq8i7P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhjl9MACgkQAVBC80lX
0GxHYQgAisibYw342qyFhbPHuF4SrxsthEXu+Sen60LXzr5R0XmnvtGOlG1o2Q8G
kXlnGtZl8UYhx6GOYyXhKW163JgjFCrmp8OFdoP/J2ap0x96+Wp4LSTqrthm1hxf
SZbVWw560E+E9g7MUGLzbnpSpTWCn4Tc4ev5QUSwahb1xtFTMWqaSHeZ2LdcjGzD
mt6/6b9hHr9bVMk26KWDsNx0moukBGyaUQe8n6x1lLejtHSbW/c3T83bEI67Y4mI
2pv9HGCa6SRqQ7rCVK0l47QJA561vFZPzsHh5G9L+oiVfcB8za9Zn97jWQnsESih
IHXTCpsE9wu5Cgt8+kXrsp5UyE9xeQ==
=CD2k
-----END PGP SIGNATURE-----

--Sig_/kP_8zd2dCpMVyLt4jEq8i7P--

