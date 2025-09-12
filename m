Return-Path: <linux-next+bounces-8276-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C95B9B54134
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 05:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F1EC177FE9
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 03:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA46E258ED9;
	Fri, 12 Sep 2025 03:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sBHycMbn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93403398B;
	Fri, 12 Sep 2025 03:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757649113; cv=none; b=VQm3je5TTbdeixovnaJl5L+rn7PbRYfM1JOQtVbF856czod/m6gHu9M8MJqoE0uyrIiNVBCgjg7ef3tqKP5gV0ap+hJlwd9a+dbk+7d6HZKuW3XkSC2czMFyiJazkVEaJfqmUq03G6ztElyNAsjTwkU7cfX6OTfv/0os/vp4JrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757649113; c=relaxed/simple;
	bh=Lke6B8VnbpwAIO8FV4RcPocAWafVIdJzBdkm3skzNys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aSxntc7tFfGG6hkZ89UsS/mxBDAiKlCOr9QHNkUArzgxgoYPIJmEMaSAAURgLjX6brMUZDHPhvC2LPjRfY1husZX5kk7q0uNOURN+O0CBhN3UIvDAA5J+E56bnrkhG3zsawkZtcS4ERxiYfr8Hc3vAS8bOyJFl/7UrbEZHaHpnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sBHycMbn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757649107;
	bh=xdlNIi70W6j9AD8vtMNAyTE1QiqUADYtnXh78eSRV1w=;
	h=Date:From:To:Cc:Subject:From;
	b=sBHycMbnzHVEMEWIjkz+sA22rxLiVhkIHuVsBwxdDddiCLGgXM2r39db4lylJQVPD
	 towHP7WrKxYoGDVF2i6m9xzq4c4dXrF6gtvspxOeVBZVu/NkO+hsOHnBb9Ks8Jj4GA
	 8we8UOCQaBndJay9DV/AXhn1wSlsoGcmc9AxIazzKBgjr1yysxMDOH5rwXYE0mcoj+
	 YofOs4Xfa0dCW0P4lWOcKOGAA4BsNaaKLw2HOMgdxSlytzqPbrHcy2BkyXm82svOX4
	 a3ukEnC+clCFfFM8rfdFfngplbgj4lPff+ni7CMR2LGlUk/5IrYI0y5zjQM1WUrIPH
	 lDK7RSPcpCTBA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cNL8M0KpFz4w90;
	Fri, 12 Sep 2025 13:51:47 +1000 (AEST)
Date: Fri, 12 Sep 2025 13:51:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust-pin-init tree with Linus' tree
Message-ID: <20250912135146.0c3ea18f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IFJ/fZTfDO===p5aB=huIuZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IFJ/fZTfDO===p5aB=huIuZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust-pin-init tree got a conflict in:

  rust/kernel/devres.rs

between commit:

  75a7b151e808 ("rust: devres: fix leaking call to devm_add_action()")

from Linus' tree and commit:

  42415d163e5d ("rust: pin-init: add references to previously initialized f=
ields")

from the rust-pin-init tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/kernel/devres.rs
index 132545962218,91dbf3f4b166..000000000000
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@@ -135,21 -134,11 +135,19 @@@ impl<T: Send> Devres<T>=20
          T: 'a,
          Error: From<E>,
      {
-         let callback =3D Self::devres_callback;
-=20
          try_pin_init!(&this in Self {
              dev: dev.into(),
-             callback,
+             callback: Self::devres_callback,
              // INVARIANT: `inner` is properly initialized.
 -            inner <- {
 +            inner <- Opaque::pin_init(try_pin_init!(Inner {
 +                    devm <- Completion::new(),
 +                    revoke <- Completion::new(),
 +                    data <- Revocable::new(data),
 +            })),
 +            // TODO: Replace with "initializer code blocks" [1] once avai=
lable.
 +            //
 +            // [1] https://github.com/Rust-for-Linux/pin-init/pull/69
 +            _add_action: {
                  // SAFETY: `this` is a valid pointer to uninitialized mem=
ory.
                  let inner =3D unsafe { &raw mut (*this.as_ptr()).inner };
 =20
@@@ -160,14 -149,14 +158,14 @@@
                  //    properly initialized, because we require `dev` (i.e=
. the *bound* device) to
                  //    live at least as long as the returned `impl PinInit=
<Self, Error>`.
                  to_result(unsafe {
-                     bindings::devm_add_action(dev.as_raw(), Some(callback=
), inner.cast())
+                     bindings::devm_add_action(dev.as_raw(), Some(*callbac=
k), inner.cast())
 -                })?;
 +                }).inspect_err(|_| {
 +                    let inner =3D Opaque::cast_into(inner);
 =20
 -                Opaque::pin_init(try_pin_init!(Inner {
 -                    devm <- Completion::new(),
 -                    revoke <- Completion::new(),
 -                    data <- Revocable::new(data),
 -                }))
 +                    // SAFETY: `inner` is a valid pointer to an `Inner<T>=
` and valid for both reads
 +                    // and writes.
 +                    unsafe { core::ptr::drop_in_place(inner) };
 +                })?;
              },
          })
      }

--Sig_/IFJ/fZTfDO===p5aB=huIuZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjDmNIACgkQAVBC80lX
0GyA9Qf+NC/NXrD9V0aSTfwP6ZZ/5nzf1OKTQLnWibGIpMzTEIY/scNN3veeDu9q
Mlx+94VossjECbz3xdyVjtnuUo1ZZeuIegv5SCnLyF5ibwK73i5wHDWcvxXHdOHd
C68e84PxUawOnJNSt+o/X7Rraq9nUcboadoVw8Aea6nYQRSrVHijP7D4tXlXdo17
z86CFSTj00vOqTIKj8EabdgLFy2dH2QWYRiSgPjcHFqMThUt/jTrSJs12Hcn8mHO
PAHBhwk2oPsa8nmoMi6SnH+r4ZXoqzsj/Y33e7p1H/QrB/eGzNTb8qq67Q8i+S75
hlYPB14ycUisuS5LB99zkUWFTuKFpQ==
=kO7s
-----END PGP SIGNATURE-----

--Sig_/IFJ/fZTfDO===p5aB=huIuZ--

