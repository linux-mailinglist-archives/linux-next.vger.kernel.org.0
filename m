Return-Path: <linux-next+bounces-5816-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF3AA649C0
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 11:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F0FE1895675
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 10:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB5623816F;
	Mon, 17 Mar 2025 10:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Inc2k5Oo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FE12E3373;
	Mon, 17 Mar 2025 10:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742206854; cv=none; b=HRSLVWYQyR/zRRudD1d1gVTE06NpttYbdp2iN0fBO5jFbpomJ3cn4f7ucHE1OQ3ItAOOSJxBYiu8cYyC9Ct7nZDp32oUDaWbCagZJto5XxvnfL+dj+7USEyFtC1jgWlSRlWtzuR2eB2Dw18dm82erPSIXJnilJKa5I1pd8Fkkn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742206854; c=relaxed/simple;
	bh=Vfxm/VS6MThIEmj1NooHYgGirDykhwnBgrzXiaYLB2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=caLhYFf4iK4Rzijazjf1IkkbqFW8+yTSRpX0TKz+6H4n+LIQWokOQ9xvZaGs+JbhL116RFe1mbnuaJpyCoq/yVRPVtX5XrsTOtIEW76EFrkaLR8EPQopvzpA6SXveqFjlCFbMjdEYl9ITR5QlJi39jGu0gzNPlHfiiUzK/P23Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Inc2k5Oo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742206849;
	bh=vBkrHPBpB5I3CJhiuvURGb6f9Nt1C7x4BoMDG32F5UM=;
	h=Date:From:To:Cc:Subject:From;
	b=Inc2k5OoCtFF2szEBd9Q+0pVyCJ/Lswukx3A47XeqJw/Ib8imtg+OKP/HcQ2GwFuT
	 tScMQmIqYdCWo01KqIc7xCkk1IcMY8QvBUxGie7dqSdK+2mmBzmpmIFToGuAxP98+Y
	 k9qCAaBxBgszuUIZmFv+luFVE1DLihlm4D1XeBmqPEziP7dFV6LjtAHgHNh7plODLt
	 MAKEZGlRRy5EMtJzMxCWujTv76l+SekV8vlTnv86EYUnV0gLFTSjbNLjCl8At5M4Bj
	 jkjIsXf4vxR+Gc27VJ5+2R8kmlACdoxdcgYdNags8ELX4lQmUIJ9ua7WliNB+qbVB7
	 yB0yRJpGXBGJw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGWFr4MB9z4wcD;
	Mon, 17 Mar 2025 21:20:48 +1100 (AEDT)
Date: Mon, 17 Mar 2025 21:20:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alban Kurti <kurti@invicto.ai>, Benno Lossin <benno.lossin@proton.me>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with Linus' tree
Message-ID: <20250317212047.46580935@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cO5x9zXH8CKLxgbbSVBJH8s";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cO5x9zXH8CKLxgbbSVBJH8s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/init.rs
  rust/pin-init/src/macros.rs

between commits:

  df27cef15360 ("rust: init: fix `Zeroable` implementation for `Option<NonN=
ull<T>>` and `Option<KBox<T>>`")
  6933c1067fe6 ("rust: init: add missing newline to pr_info! calls")

from Linus' tree and commit:

  fbf8fb328d1b ("rust: move pin-init API into its own directory")

and following ones from the rust tree.

I fixed it up (I just used the latter version and applied the following
patch) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

More (or less) may be needed :-(

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 17 Mar 2025 21:16:57 +1100
Subject: [PATCH] fix up for "rust: init: fix `Zeroable` implementation for
 `Option<NonNull<T>>` and `Option<KBox<T>>`"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 rust/pin-init/src/lib.rs | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index f36b8f8e8730..9cd822388ba2 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1446,16 +1446,14 @@ macro_rules! impl_zeroable {
     // SAFETY: `T: Zeroable` and `UnsafeCell` is `repr(transparent)`.
     {<T: ?Sized + Zeroable>} UnsafeCell<T>,
=20
-    // SAFETY: All zeros is equivalent to `None` (option layout optimizati=
on guarantee).
+    // SAFETY: All zeros is equivalent to `None` (option layout optimizati=
on guarantee:
+    // https://doc.rust-lang.org/stable/std/option/index.html#representati=
on).
     Option<NonZeroU8>, Option<NonZeroU16>, Option<NonZeroU32>, Option<NonZ=
eroU64>,
     Option<NonZeroU128>, Option<NonZeroUsize>,
     Option<NonZeroI8>, Option<NonZeroI16>, Option<NonZeroI32>, Option<NonZ=
eroI64>,
     Option<NonZeroI128>, Option<NonZeroIsize>,
=20
-    // SAFETY: All zeros is equivalent to `None` (option layout optimizati=
on guarantee).
-    //
-    // In this case we are allowed to use `T: ?Sized`, since all zeros is =
the `None` variant.
-    {<T: ?Sized>} Option<NonNull<T>>,
+    {<T>} Option<NonNull<T>>,
=20
     // SAFETY: `null` pointer is valid.
     //
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/cO5x9zXH8CKLxgbbSVBJH8s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfX938ACgkQAVBC80lX
0GxnUQf7BCSCxl1e3GF7AI+lxNe5WpKLr14HVCPFiKPwhwBxVyqVvZx1T4AAbP0Q
PDgFQfxUF9wFE/UTevetK53jDPlM6x1fiTIP3z249yMYnXiY1xQNoOGCQNWsiDA5
UesM58qbJtXMJm81OpdzpJbfKD0odUF8qanlb+mDUBU9G9R0wQluuERBSQMyrlWQ
uwa5kg7uNZrA7kP744GiKlrbPzmJDvbwsZsEn05f91K1FzJQcl7itNJ9Z9+4iw4E
N1XooxSVEp4IZg3QWZXqr20lmXSBf8D2eKIM4GBPyUblpODsc+OSDFm3gxQoWBCU
ASjAKbw7zDC5SclLaSTiXY+YIHYXaQ==
=+ka5
-----END PGP SIGNATURE-----

--Sig_/cO5x9zXH8CKLxgbbSVBJH8s--

