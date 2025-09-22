Return-Path: <linux-next+bounces-8416-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DDFB8FDAE
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 11:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59B9A7A46F9
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 09:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344EC2EE27D;
	Mon, 22 Sep 2025 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amzS7D9U"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF9D296BAA;
	Mon, 22 Sep 2025 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758534829; cv=none; b=WkbQPN+sRnnSLJChwnhzBL6rv6tLtzVKG3J0ibrC0OSOEBvLPdgcJj1+TVRswR8rOPQSJM4TeLzyG+GKggdj1O6rwQy2iWPgb46fDvFLRxyFHQfxxrT5Z0rHvu9shH+TPdUhvLzCSIlCG9PlcCz1jYvc9+D6dpteJ4kH+ClJlYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758534829; c=relaxed/simple;
	bh=2QF7uKBvTtUL406kDFC/otZNDadH3y23jxIfXW4hXCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PF9BvWDxknWKDjaOmDIY7glFLtWdag68MfaYMCCI+G/174iVzaeoTCLpkq6R9BeTJc0hhcPOMjk3L4g2w2ElyazLzm7pxz+s7drCKOv7ehEnWYJj92owZ/4cotwj0qhRCIsG1JW/WwYNpDUU9QBl7wSLKdu7HT3L1ALYzdTyrMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amzS7D9U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB659C4CEF0;
	Mon, 22 Sep 2025 09:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758534828;
	bh=2QF7uKBvTtUL406kDFC/otZNDadH3y23jxIfXW4hXCI=;
	h=Date:From:To:Cc:Subject:From;
	b=amzS7D9UCB7brMiIXIWt59JW5dDzq/C6RxCnT9+0G9835qC+Zql+nkZlaUp9kP9Ln
	 Q2RSyDIbCxYL8nHcRS7bKhIuaegVFBwvLexKvrNvQy3WYVevtk+55roJaWhFfCR4Sh
	 6TMQsgCY84j/9DwQ24rAmm5o9FLS7v5yGHfg9MeEKBgnfMm6FYHioWd4paGXMY9PA5
	 6Svi5ZJ+Ri+rph9oYhCAtdCedZRwcHacNxQ5ynDoMDLjBGtqyL91T7bBOtRt75kLse
	 SdNmOgyB73+TACxLaOPUY1MADZhAvumjkv/mT7ZVrp/ySjUko6skvzvkpKGLpF5xDe
	 4Cdg9vhUvm0/w==
Date: Mon, 22 Sep 2025 10:53:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Carsten Haitzler <carsten.haitzler@foss.arm.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matt Gilbride <mattgilbride@google.com>,
	Rob Herring <robh@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Subject: linux-next: manual merge of the char-misc tree with the drm tree
Message-ID: <aNEcp1CglKxMEe92@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Kgz0SjSZOPFmFmQw"
Content-Disposition: inline


--Kgz0SjSZOPFmFmQw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  rust/uapi/uapi_helper.h

between commit:

  cf4fd52e32360 ("rust: drm: Introduce the Tyr driver for Arm Mali GPUs")

=66rom the drm tree and commit:

  eafedbc7c050c ("rust_binder: add Rust Binder driver")

=66rom the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/uapi/uapi_helper.h
index d4a239cf2a64f,de3562b08d0c3..0000000000000
--- a/rust/uapi/uapi_helper.h
+++ b/rust/uapi/uapi_helper.h
@@@ -9,7 -9,7 +9,8 @@@
  #include <uapi/asm-generic/ioctl.h>
  #include <uapi/drm/drm.h>
  #include <uapi/drm/nova_drm.h>
 +#include <uapi/drm/panthor_drm.h>
+ #include <uapi/linux/android/binder.h>
  #include <uapi/linux/mdio.h>
  #include <uapi/linux/mii.h>
  #include <uapi/linux/ethtool.h>

--Kgz0SjSZOPFmFmQw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjRHKYACgkQJNaLcl1U
h9A9sQf+MHUD66OiHT9O6z2SXrd8H16WDhMEAlZjOB0+w638c4bGkUv1ogaDnkch
vfqXXEKqWyd7tLI4Q5v4ZXjzIKYbccNOSuy0zWXIc98n47YUpn685MDmmUtoH6FU
w9nSnOCVrS9l8PGUuvjtnZ5vOF+I9rVIqlRfwJQaY97ox+MmSeP9xMYsCd1GfGtx
JAfJpo81wt7q3mloCxPV+/7IxcrzVazn/EvyDAJ7MN5DoACEX/QRBc9hcnN7GEQh
uEvSlJi+AaH3TtH3pDCT4SHLBI95q/gke1j9OHrACTEvvR76FLRLPLfttKRZ/C6z
s78oSFVjQA4Qya5mRkAqgmkPjGvxig==
=5hGp
-----END PGP SIGNATURE-----

--Kgz0SjSZOPFmFmQw--

