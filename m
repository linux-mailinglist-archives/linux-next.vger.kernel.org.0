Return-Path: <linux-next+bounces-4734-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4779C3875
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 07:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 794A81F2200D
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 06:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D320C15533B;
	Mon, 11 Nov 2024 06:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gBvS6qrS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D4014F9F8;
	Mon, 11 Nov 2024 06:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731306905; cv=none; b=GmMmm7LKKBwuJtsPpiuo04r67Zew5zOy9MJ0Wok5fdClzMr+RRcuJ31KDAOgmSm1uG5DUHCHPqZl2HBkMtor0sI3NaWoIxtWPToj7+oN9Sx7O5rq3STwy6vGIVk4sqTSpVw0Gf+15VuXU7FPionHi0r8Xq/8MKMSGXQrmFSwjKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731306905; c=relaxed/simple;
	bh=Ch0f7NofSlQP/lO8vheMHhgSna8alrNuunGxDtOYuA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Q33qkdSV90Q2p12lmI3+39l6eXbk1mAw9Y4zQx12z5dl42JPyM3H9jluZ38GZlGzXDnEy6z7va4GEWIwZfitEcq7Rd3EcAD4Bt0dE+BDiEWUOqeptqRvZ7O+rieG5i2Z5QVQ2h9uwFdWnwuAhCm/uqXbecJtq454Zkw1/65epiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gBvS6qrS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731306898;
	bh=0tNaVeY1YVlUI8jHkrHJWvQnhhN2woCW7W3Az2C0gp4=;
	h=Date:From:To:Cc:Subject:From;
	b=gBvS6qrSVTmxWkCPZ+iOxNZrdKxKXePqPO/h6O1Z460GAuIgihiWgeqpfDNPpZtoT
	 fAqRR3BituWCPqKB07hcuXolYbriJPPWONexOEeexNdpimwmu8x8MyNuXCyZEdwZ/i
	 Tlh7q6jiN1l44QKCQSbiuA6EhvdPch2rkQNfVztdSo+XKlB4ISq72LAdNjdoB5SlPT
	 yWSnH84522UgQnvjQFKvdEegRW6Q8Fzd10AlAGuCVEiTXoUqWhZwBX+DeUSX0ge8b7
	 KOcK4vIPXCv+B2y7Nb6s/PxNQF4Z4jitF0kwOwyjvck2zGs3E36EAFF/P5xdRTSSFL
	 9c2tQJzhbCpLw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xn0CP2YHpz4wbp;
	Mon, 11 Nov 2024 17:34:57 +1100 (AEDT)
Date: Mon, 11 Nov 2024 17:34:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Arnd Bergmann
 <arnd@arndb.de>
Cc: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Wedson Almeida Filho <walmeida@microsoft.com>
Subject: linux-next: manual merge of the rust tree with the char-misc tree
Message-ID: <20241111173459.2646d4af@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gQlbsfWmH_MKIiWP6n2p=+i";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gQlbsfWmH_MKIiWP6n2p=+i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/macros/module.rs

between commit:

  7f15c46a57c3 ("rust: introduce `InPlaceModule`")

from the char-misc tree and commit:

  d072acda4862 ("rust: use custom FFI integer types")

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

diff --cc rust/macros/module.rs
index a03266a78cfb,e7a087b7e884..000000000000
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@@ -332,15 -330,21 +332,15 @@@ pub(crate) fn module(ts: TokenStream) -
                      /// # Safety
                      ///
                      /// This function must only be called once.
-                     unsafe fn __init() -> core::ffi::c_int {{
+                     unsafe fn __init() -> kernel::ffi::c_int {{
 -                        match <{type_} as kernel::Module>::init(&super::s=
uper::THIS_MODULE) {{
 -                            Ok(m) =3D> {{
 -                                // SAFETY: No data race, since `__MOD` ca=
n only be accessed by this
 -                                // module and there only `__init` and `__=
exit` access it. These
 -                                // functions are only called once and `__=
exit` cannot be called
 -                                // before or during `__init`.
 -                                unsafe {{
 -                                    __MOD =3D Some(m);
 -                                }}
 -                                return 0;
 -                            }}
 -                            Err(e) =3D> {{
 -                                return e.to_errno();
 -                            }}
 +                        let initer =3D
 +                            <{type_} as kernel::InPlaceModule>::init(&sup=
er::super::THIS_MODULE);
 +                        // SAFETY: No data race, since `__MOD` can only b=
e accessed by this module
 +                        // and there only `__init` and `__exit` access it=
. These functions are only
 +                        // called once and `__exit` cannot be called befo=
re or during `__init`.
 +                        match unsafe {{ initer.__pinned_init(__MOD.as_mut=
_ptr()) }} {{
 +                            Ok(m) =3D> 0,
 +                            Err(e) =3D> e.to_errno(),
                          }}
                      }}
 =20

--Sig_/gQlbsfWmH_MKIiWP6n2p=+i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcxpZMACgkQAVBC80lX
0GwmUQf/T1YTaxbVTgmgElmCsEkIi7D6Y2IbGU9m8vz9BwTBTDa13bv0ZsX4DjcK
XqDE1hjABzXTPrcVB1LUMCC/ojZvyLWVDqGXMw1PtfAGOvp8sD9AI3qwMDXUT0Fh
/FadT2tqeE7ikInQQdMMPkFJVG8qpfYtuiK1KBFcG2xUYGMpZIyC3QKakWZwinVn
+tdGIYrVKzlln3SZYQqmjUvPzLXy+rkx4lHbZ5bTQtTxHFh7fJBw9ezspLb+lMWz
t4M4zx9EXoIYBN2Ya3djS6KqCDcHhKOBQeA5tH2KWJH0zdoGhgZjJpwVfDdml0Yb
aQVpikQPELcntCQj92ippvOZwBebZw==
=swMW
-----END PGP SIGNATURE-----

--Sig_/gQlbsfWmH_MKIiWP6n2p=+i--

