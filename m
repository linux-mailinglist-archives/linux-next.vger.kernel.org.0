Return-Path: <linux-next+bounces-9065-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DC547C670E9
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 03:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7A018346EEB
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 02:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7268338DEC;
	Tue, 18 Nov 2025 02:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Pn1p7HR7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5570E645;
	Tue, 18 Nov 2025 02:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763434075; cv=none; b=HdGmpADKIhff+eKRv1V9pav3KPmHRSIrwhnwMWI+dBUsH8XYPLfwrXn5v4qc6L6/U6YW/ljLs24fpQKf8olG7NE6q98tCVRGlKRT7GID6XDuROXnWzrxqtg68FyKVqK0xfLkP26IwvV9POW8WeSEL+fY8IgWIOlG6SVXHemPmvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763434075; c=relaxed/simple;
	bh=iP/s5qYv8qzJp03sZXjOTPwZjFnFRlXOcMwvJksQFwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=X7pAjY3iNlOMIqV8DLfRiVj/67p0v1mGQx43Yqe6KFo778EuQ9FM30m2tleWZvUixx7nA1n/eXMS6Z2fsCAVy1ZLRyNk1dfFxu6IHB+kqH6X93s488wFBQo0s8hkiZm4KHCVDDDvxoCZZIw79N9/kUvumvN6Y/V0a+Cqkb7c9qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Pn1p7HR7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763434069;
	bh=0lx16kmnY3RPIX97S8fIvetPL68kxuzsx4q47lPpYmc=;
	h=Date:From:To:Cc:Subject:From;
	b=Pn1p7HR7zjBzyWRaaJE6H/0gj74Sr/3FY3sNHZMpe1seMG65xH+gck/98+3KRGO5l
	 n47V4/16su6VHVm77ibGYuHm8963aeKL/aGRHS1JAProywTAm3xTbTPPK6fMhP86UX
	 7y9Ta9mlZ2drdcbmeD8jW531lmuz56u7mubPbzWqorYTnWuZBosoNG7gHjxzipMq7z
	 qjvzkZbejUwStIOVTGkdAU0O3w4r5aDICtkGINALFZDiY+V5sLqGmNaWol5sV34jot
	 lDa24H6/GV+Y4r8uIHZ1PtGru3lWeGvwr2HsIFazU3yjlvQPd23Z7jkQoCstJYtNCl
	 9RIy0VEyfdHEA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d9TYd1wH4z4wD7;
	Tue, 18 Nov 2025 13:47:49 +1100 (AEDT)
Date: Tue, 18 Nov 2025 13:47:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the gpio-brgl tree
Message-ID: <20251118134748.40f03b9c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mKVVn5_zlZZEX8ymqvbNZ_3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mKVVn5_zlZZEX8ymqvbNZ_3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gpio-brgl tree, today's linux-next build (htmldocs)
produced these warnings:

WARNING: include/linux/string.h:573 function parameter 'str' not described =
in 'strends'
WARNING: include/linux/string.h:573 function parameter 'suffix' not describ=
ed in 'strends'
WARNING: include/linux/string.h:573 function parameter 'str' not described =
in 'strends'
WARNING: include/linux/string.h:573 function parameter 'suffix' not describ=
ed in 'strends'

Introduced by commit

  197b3f3c70d6 ("string: provide strends()")

--=20
Cheers,
Stephen Rothwell

--Sig_/mKVVn5_zlZZEX8ymqvbNZ_3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkb3lQACgkQAVBC80lX
0GzCHgf+NABrodKOXdEIhIVswEdYJ24YBBhJGfC2w5pP2wwvY4jMX3DzxZcj+bIZ
eEYYnJd73Z1amWM4l0rQP8jfB5Ln9DBRD4+KUX601lVJY6cVo1MqfI5gtydjcytZ
nR6sjojysOCVS1jG7xPjMuhBHPaiPZwuQgoM53u+jCcAUJh+GUJmYKQfe86abeaW
HaJ3udMrgJBtUV102nDDGF715EK+EAHlkFB8tjmYJAkg2H+OXFrHWUJcnHIN5N4g
R+WXvbfjtwrG5R8xDHRH09GBuqgT044sb20UTiQ5qjxA5+tG7jwfYBRg8yVp4ivn
a2qcesyD/HWv8a7wbcyCCkgWZOlLSg==
=H7LJ
-----END PGP SIGNATURE-----

--Sig_/mKVVn5_zlZZEX8ymqvbNZ_3--

