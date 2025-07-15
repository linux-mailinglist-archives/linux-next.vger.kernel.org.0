Return-Path: <linux-next+bounces-7548-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B6FB05431
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 10:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59D2F189D4CA
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 08:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6A0273D9E;
	Tue, 15 Jul 2025 08:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nl0nrpet"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416B825F973;
	Tue, 15 Jul 2025 08:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752566963; cv=none; b=n84EXXjx9YvhEg7aEOuPx0Uo2k83n/xXEF6K1d7Ppwb4Hj0fQ7fYKH7Em1DeXHHVzjXTC/DpvMGtvUJlWmybF2TnPZToqVKpdPmWzUQqCRzesNyiKGrPggB/EUwifH4xVnfQEKST/GXoWKXqNftHJaBHNQhNzrVLUhX1mY8V6Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752566963; c=relaxed/simple;
	bh=3Zyn9HVYtyw7yXCCIVpPE9tPz00/LwmlnuBvmjHTsa8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fm3pQw8QnsRWdzsCvoXbifWzFK3TNL5vzOXtfrBSAJcPLoc588CwD6Jh6qM4ekNgX9uvppnlmJzrFBrHvKvKND2N/bGHUbTkbLpTuHWW617J0zHlTqdqB+pOO7/H3/WHE//pEohurMt680rZqkxJmiW5FZuTWEC8pkoyT3cd66Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nl0nrpet; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752566847;
	bh=QQ0tD5imMyAL0toAFcHFfi09tCDrUEj69vcNf/Rfziw=;
	h=Date:From:To:Cc:Subject:From;
	b=nl0nrpetxkSjEc4gx2aFm75B16YmiUZzFkdoAAH1Zj+jvZ8+bfOOVlUSwjiDr4u2s
	 AHHpR49NRdR0pbLQs2/Tv4YNL8u6Jb8EtnDw8eiqJmUdCErENP0FYPlHbDaAUjaTzF
	 UNQuPz9E4s+I7iGUbAOEXBlAb5jwOJUVSibR75dZ9P+Ly8wTW8sHzc5YkNINLK7hqJ
	 jhKO8AsdoZFOkwLedWlKo3IMHOgP/X9HjvaynUBLzDafeE36ovXFUO7QmYg29Tf5un
	 RInBSXs3blzEGECiQDN5ikFbya6zxNZi57er65mBpvl3cY82Z4f+wzPycXhCE6WyZl
	 CCn90wHUOmtIQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhBcZ3G0Qz4wbr;
	Tue, 15 Jul 2025 18:07:26 +1000 (AEST)
Date: Tue, 15 Jul 2025 18:09:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Krishna Ketan Rai
 <prafulrai522@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Remo Senekowitsch <remo@buenzli.dev>
Subject: linux-next: manual merge of the rust tree with the vfs-brauner,
 driver-core trees
Message-ID: <20250715180913.735698ce@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wauebLlk=scjzd4dJbcdS/D";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wauebLlk=scjzd4dJbcdS/D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/helpers/helpers.c

between commits:

  6efbf978891b ("poll: rust: allow poll_table ptrs to be null")
  a2801affa710 ("rust: device: Create FwNode abstraction for accessing devi=
ce properties")

from the vfs-brauner, driver-core trees and commit:

  8ffb945647f8 ("rust: helpers: sort includes alphabetically")

from the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/helpers/helpers.c
index 2d2ea06000e9,d3867d09e356..000000000000
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@@ -28,13 -28,10 +28,13 @@@
  #include "kunit.c"
  #include "mm.c"
  #include "mutex.c"
 +#include "of.c"
  #include "page.c"
- #include "platform.c"
  #include "pci.c"
  #include "pid_namespace.c"
+ #include "platform.c"
 +#include "poll.c"
 +#include "property.c"
  #include "rbtree.c"
  #include "rcu.c"
  #include "refcount.c"

--Sig_/wauebLlk=scjzd4dJbcdS/D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh2DKkACgkQAVBC80lX
0GwQYgf/StBADAFkrfSZIaeafvtFPdVXYXd+HvdFE4aRWttu/+MrsjNJOyOZCCVe
e0MhwgFMplT2mybPGaBpOL/BfBwL+C8LupsGnbImbgYxawKtwtqv5vt9AW8tUm1R
+bLpAvcUJ4x/6dFQ21i5XRzcSYbssFpxXgcK6pC+YBTl1NSM933Z2MAHAWnN8NS6
B4NHUbFK7FbwBQfkK4Jmh3f3NmGpcglLm8lfonI7+Yp/PqvytvWD/tfQBsy/Vjmu
DYztIjZze3Z3kEI7Ewiy8UyMOwxk/eG/JGPpSreE8V7xsKodRjxJWAxXD+iI5yyE
K7LtNmt+1iXyS/lFjjyxV6i8Sh8Z4A==
=ZA8W
-----END PGP SIGNATURE-----

--Sig_/wauebLlk=scjzd4dJbcdS/D--

