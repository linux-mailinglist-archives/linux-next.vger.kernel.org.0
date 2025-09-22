Return-Path: <linux-next+bounces-8417-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 321F1B8FDD9
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 11:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DB443AABDB
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 09:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67002F1FD6;
	Mon, 22 Sep 2025 09:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z60jwgxz"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F69F286D56;
	Mon, 22 Sep 2025 09:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758535005; cv=none; b=uODHL8g9F7XpHRizmWppv6re23ThT3P5gNWTG/uyFyXM91EMfKIK+g7qOwEBqhY/QtquqH3qpHyS0pMFdFQjnghnSGSrvfZuRg7sphPsDQ0cFHNgyISS/C5cXfW5wKbhBWTHA8ZC5OZ+mohjA3TTed64/TX79wyjh7qxk/2G78g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758535005; c=relaxed/simple;
	bh=m/OLSdJWaYDeAMGOOFQ4RYAla1sMj7NBkGFJg1S74x8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oMUpjNySgwQKkfTUkiqZ8jb8BntBvACs/Wf+z8/mTJfDcOidcKmhvXzbcolXVHrCMuN+oTY7HHjuWSHuU/AUqTw5Vrc23/sv62v6WTnHUKicef14T0d0LX9qRQrU5DEacIr4/MOlsPAhX4Iq7n+9KCnu1Ktmv++SIPidNde+aTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z60jwgxz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D97C4CEF0;
	Mon, 22 Sep 2025 09:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758535005;
	bh=m/OLSdJWaYDeAMGOOFQ4RYAla1sMj7NBkGFJg1S74x8=;
	h=Date:From:To:Cc:Subject:From;
	b=Z60jwgxzz5GqMl9g62yiRNOxo6UsPJ6AFq6WgfKvlzCPKqkYXrRD42ESLJ9wwhGNf
	 VgQf+CdPbOYDpByHySRNSTLGfwElw/y0z6bwTljlsabopCF/C93BDamxOIoWz8g5mo
	 B2JNCAR5rO9ZnQ+whTdY9T40khVIsM9O5UArM3n8WY1j6gmV+AaekUd8JpzGQXpYzr
	 DokFQ16Yeh2pD/D/R+bFVJ0WwYFCXKap9CTlPm1du/pSkzo1HlcfpOrKRvspSy3Oae
	 rVjrcoLNSrudVF+wV213wnVTEBemQ3zuNDkyMGu7UL66YX0GN97hcSKRqmWigwf97k
	 nVzZ2uLVaQEeg==
Date: Mon, 22 Sep 2025 10:56:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matt Gilbride <mattgilbride@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Subject: linux-next: manual merge of the char-misc tree with the tip tree
Message-ID: <aNEdWOS8s6U0c5pz@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TgbA+hGrLDR1xZeJ"
Content-Disposition: inline


--TgbA+hGrLDR1xZeJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  rust/helpers/helpers.c

between commit:

  d9ea5a41cef80 ("rust: sync: Add memory barriers")

=66rom the tip tree and commit:

  eafedbc7c050c ("rust_binder: add Rust Binder driver")

=66rom the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/helpers/helpers.c
index 1c6096f53a6fe,8e8277bdddcae..0000000000000
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@@ -7,9 -7,8 +7,10 @@@
   * Sorted alphabetically.
   */
 =20
 +#include "atomic.c"
  #include "auxiliary.c"
 +#include "barrier.c"
+ #include "binder.c"
  #include "blk.c"
  #include "bug.c"
  #include "build_assert.c"

--TgbA+hGrLDR1xZeJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjRHVEACgkQJNaLcl1U
h9Bh1wf/QMmRAXg2dHBAxXdM5GRY1gcRE6ije1ifFUlnI5Sp+dfWeqQR7ttpzJB0
rmRD6mnTpi6BCHG5nOP8uF9iPHjeV5gRgG6fWgqMthGdplWWUY/BOQi44c2TM/GQ
MLMYoHR3pQJijn0lfpw+rqw1fBV2vNRD7TibhOfDSB0VhZcM18gzuZ/4AxPGwSWx
YQGw7PdRuGllScuI3t4l76U6jfFaHTNVp0ohNHGDP8h2TcupATyrG92WSjp/g55G
+fNrqRE7PjJ67SDGEf7+KatgSzCcj9sggRo+HkaTyiruqpW1s5WQHT9x88QkL8EV
YFZF7vOtkQRBIThDP34LlLgQgw4f8Q==
=OqGz
-----END PGP SIGNATURE-----

--TgbA+hGrLDR1xZeJ--

