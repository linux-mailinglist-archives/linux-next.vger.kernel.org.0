Return-Path: <linux-next+bounces-2255-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8248C1DB8
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 07:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60F331C20C50
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 05:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11AD015252E;
	Fri, 10 May 2024 05:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dtE2Rcvi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3F415217A;
	Fri, 10 May 2024 05:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715319146; cv=none; b=mvQ/Eg8ti+otlApSXlqH5By+biE8RWD0ZJJvddJShLGQGBcQbvk4fVbsQKyFK42GsZrj12myx1062HEw3dfe8pMXXKQ4jufv1s0qYVF3CyxqN8+2mkMldefD4L8Bbkw0SYCkTvnFNq5AWkfUBguxFSXRFiRrON/Dla17CObaYZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715319146; c=relaxed/simple;
	bh=jZ8gwTVmhaBRz8n+h7+NmOek7PFEzWa402VzG3HQH28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RsHnYFLi9Pz1AzeOiF33lOt05RcnaJFqbrDQWnI+sNIgAtSx++PqxJuPLehw1CwM6AXuythfl32pGVMr5QA2lvjqmBdDdryFDkgfIXFUFzQ3PresKWpmBzDx5ZDgUbsoMMqAXoSGpD8eTV7F4woEtR2jMAilp4dIwONmMbwrtIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dtE2Rcvi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715319134;
	bh=cwLIXMNgU1FGVrh+rk26YLS9e6oCxXMxOFW2oRXuj8M=;
	h=Date:From:To:Cc:Subject:From;
	b=dtE2RcviFRHSGSXsHg9T7OlthXEMPywu5g4mer3RUM0OlO6Qm24FoJBvpgAN5Vfa3
	 17DbcPN+qaX+RszEuvr+bcYPU+kpGP/qjOlzbClSpA01hJvtb688VDy8ofipXE8h+4
	 7DCwb/2evx0xWtluma8nRFmHpfS6QQM3LJdg86De9eTNpdMo1PBPAqY0lwfd7nv0kY
	 6kzNcWCaSP6ClOll1wjnE7iq/bn8Q5vAoIrQrUT0YKU9O24GaO+p6zxugrw1CS+RBN
	 H49lw7TDJIa+GnmD7H73Hbz5qnxn5uglYUdWc4C4MuuONbVTjM1ju+Hqj/1hDMQHed
	 pGby2+Nrjw7wQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VbHZQ3FZVz4wyf;
	Fri, 10 May 2024 15:32:14 +1000 (AEST)
Date: Fri, 10 May 2024 15:32:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the gpio-brgl tree with the
 gpio-brgl-fixes tree
Message-ID: <20240510153212.246fbf31@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qDmjeN_OLM+6fY5xnP1mEb7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qDmjeN_OLM+6fY5xnP1mEb7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  drivers/gpio/gpiolib.h

between commit:

  7765ffed533d ("gpiolib: use a single SRCU struct for all GPIO descriptors=
")

from the gpio-brgl-fixes tree and commit:

  8a7a61032587 ("gpiolib: Get rid of never false gpio_is_valid() calls")

from the gpio-brgl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpio/gpiolib.h
index 8e0e211ebf08,7f94580efdbc..000000000000
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@@ -62,8 -61,7 +62,8 @@@ struct gpio_device=20
  	struct module		*owner;
  	struct gpio_chip __rcu	*chip;
  	struct gpio_desc	*descs;
 +	struct srcu_struct	desc_srcu;
- 	int			base;
+ 	unsigned int		base;
  	u16			ngpio;
  	bool			can_sleep;
  	const char		*label;

--Sig_/qDmjeN_OLM+6fY5xnP1mEb7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY9sVwACgkQAVBC80lX
0GzFNAf+MmtJTSA3Za1cWQQhnKBBjAH3PvfH0ZJdJoD5w370zKPTEgTHudbbf3p3
V27fpplfKFyKp+nFtZCHpyOTnuXkI+GskHCwTsdx1vcnLn4E64xyAooNakISPpzY
3QgJ+3+M62MmeJdm21wpQ3NlV9NXRya3zR6/9/W4GDXgXq/ozFFTK7pYXHkKVL5A
jbF9THeEhifpO7Q8OgX1pJ/oEqyerQRGXT0tvNxagtwV8eYeocP9PEFv+hYyojDB
n2pQmgBCvQP1RNwKibQhAgvbIwsVTVp4S/F0L3ROI2lR111V0Q33ON9+Sssu3pVn
hPNUjgfPT27D+fzgJOWTuaN9im5MZA==
=JeJb
-----END PGP SIGNATURE-----

--Sig_/qDmjeN_OLM+6fY5xnP1mEb7--

