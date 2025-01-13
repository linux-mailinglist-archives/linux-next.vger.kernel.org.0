Return-Path: <linux-next+bounces-5184-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07379A0C3F9
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 22:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FFAF1885874
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 21:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CFE24024E;
	Mon, 13 Jan 2025 21:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="odQ8sFCy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8504417CA12;
	Mon, 13 Jan 2025 21:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736804795; cv=none; b=kstE8HZeuk71YyC/4Vxm/QWZpVd54OaFwIP9UZVF8h69dj5cVP9CULR3sLfO4GYDeHcmHsoUSrjnC25an+dbX4djMgoU5hV4JPuZ1AeuiX0bRGse5xndTma2gI2lOivmqdvmHhpEfB1l1/+d09M3YUQY5uhTn/UTqMT2mIEAdro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736804795; c=relaxed/simple;
	bh=QY9VdByOQ93UmZHD9EeAuX9Pd4s/VcFcU4k2oWyCSz4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H/X1kGhrV6MfmDLTHnQ6gRA9/mzoL/lJIIn6HQraT5zIcsghAU5A38crVwhZOwSixlCOGZTG28Z7m40ShbjGuJO9QuptMXix8g6vptAgKacog1SpeYWG6FSeEl84a8bA3XGZtvkImg8CsnGh3DPIeYRYc0cg3bKIyW7+HkVAEVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=odQ8sFCy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736804774;
	bh=osLDujeUafGBDHZOXGHa19voRe7fbXo/pBCc5Mt+++Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=odQ8sFCy0Za64rkktgn9qnSR4KeRsW9n9XsAk6NujUt1Z/JBcEAzstl9/51wEm49C
	 5002be/uh4sUerCakO6gLVrFmuCcB0Rf+EQJgJ3zyCQrL/B5W8B03W7ekKDIA/U1uU
	 5wcIfqTl8iFplDodj8VKz5CwacqhsbzhZQQ/NXRsU5tER5opMMnz8WO5gJzrO+Ng1B
	 xwKR5tYQ7EpNIXAbOdutlqQ8DmyKZ/OUXVotAGNHasDwvuJcF9Fe8BWkN42XMoV/pg
	 T+D2SzDJulCiq/X6X+1NmKlSzadlm2ISRbY3u9QEzl4IBCMBuhKCXgM1eCwRKQjwab
	 SE3G1v6Jy6maQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YX5Rn65yBz4wxm;
	Tue, 14 Jan 2025 08:46:13 +1100 (AEDT)
Date: Tue, 14 Jan 2025 08:46:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chanwoo Choi <cw00.choi@samsung.com>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the devfreq
 tree
Message-ID: <20250114084620.702a08bc@canb.auug.org.au>
In-Reply-To: <20250113074928.316be5e9@canb.auug.org.au>
References: <20250113074928.316be5e9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vM7nT24mvGAD=cxRsFxffMZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vM7nT24mvGAD=cxRsFxffMZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 13 Jan 2025 07:49:28 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Commit
>=20
>   f3253b23535f ("PM / devfreq: exynos: remove unused function parameter")
>=20
> is missing a Signed-off-by from its committer.

This commit is now in the pm tree (via a merge).

--=20
Cheers,
Stephen Rothwell

--Sig_/vM7nT24mvGAD=cxRsFxffMZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeFiawACgkQAVBC80lX
0Gxpqwf/VZPynbEwd69v2ygs9abVCOqWX5VKlo6Dmd+JUGlt/qC0PgrhagYE9fJ1
/xqI+DahLTbWJmiUsUcWrXvDnuHzsMJ751JnOJS7n9EvL7u2vkLeupYeSTdX4h3P
vbC/iAZabvlHqPrp1owXddRJRkg/Mz8dXC4e7MF4hza1jAZ1JymZ2ErPUI8t1h9h
SFAVAySTKzW3rE3am1YRnLld0b9kXIWQAyUaBmU6X7b2et/0GpAxcWzISjSzcy+Z
habMKazK78eSyrPhTcb3dOHkxpoteGJCYL+DajuAW4SN3Jb2x9SNSfbE83nAvCAV
0m9QarmeqxSzSkMvxv3yQL8rlzGcZQ==
=k0RW
-----END PGP SIGNATURE-----

--Sig_/vM7nT24mvGAD=cxRsFxffMZ--

