Return-Path: <linux-next+bounces-4733-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 134FC9C3858
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 07:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A852628228F
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 06:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF2314D452;
	Mon, 11 Nov 2024 06:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pdmNN5r+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B33A933;
	Mon, 11 Nov 2024 06:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731306593; cv=none; b=ok1DrT6j+PfOqDn1uIiO2c6JE/+1Pn7k5pS12/C+NkwqGyu3g2DX/nHrE7aIDv+hdALt6S3FjbHUF5giHtUEC8oBlXeiYHKnTkTYNXWtE688YZ2zjWFSgJwUgBJQGLdfGjXcY+tIW5Hn0KyOw3jSj6q97snNaVBYQzDfcb/frhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731306593; c=relaxed/simple;
	bh=MsGkDlyRzUvHO9JQvDqb6yalK4ylfTkXZGgxs/CLPTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Hk/1GQQehcPPf4bmjjKgcx9Vy92TfRvQH6S5dGPMbqvGY4Q2YKhBUqgeC7c4X1UUgPVOhRUz4JuvRB9FvhznChKNL+bSg/Umi/mI/xBdR8JYBq8/rEVqy4/TMQ/LC+fqIpVXwG4ckWyhnC8vxDchHAFLX0l/CPCb/21tfFIFERM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pdmNN5r+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731306586;
	bh=7XdyAqAuJIDFhl8oP7a2OYC/KdOeH4Rds6/l++IVPxg=;
	h=Date:From:To:Cc:Subject:From;
	b=pdmNN5r+HTTFwMJY8VTBmoWYuRfPMpOHAaTbWAUbRClELZusrMQbwsVB3xvE0sn8b
	 BopJd6UDy6+RNM/BTo3SZ1cDXyxzc57R2PUgAV/NnpEV2j6ObzND7wh/BDWOwbCo0q
	 xYWMHEi2dWa8a4u1xWafJh1+qCxSAdVPCsT6RnyFp1SiGx4J7KwK+6PxgF5D55Au4h
	 LHUvTskEhuL9P97swLeulqvr9WHT2ISKYuCR8NOldZux2UBbXD1twRkIlRnRYlmfCi
	 Qh8jvdiEVpcnJSrPyZxEvSoWV+dZKS8Cy9FlAFpVYTiUo+l6Fr8FtZ2sZI5GcwTGFT
	 FxngW8TK2/J1w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xn05P5B98z4x8C;
	Mon, 11 Nov 2024 17:29:45 +1100 (AEDT)
Date: Mon, 11 Nov 2024 17:29:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Christian Brauner <brauner@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the vfs-brauner tree
Message-ID: <20241111172947.63ee16dc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rm3mdfZ.4JV1jEEKOhAAubL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rm3mdfZ.4JV1jEEKOhAAubL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/task.rs

between commits:

  e7572e5deaf3 ("rust: types: add `NotThreadSafe`")
  8ad1a41f7e23 ("rust: file: add `Kuid` wrapper")
  e0020ba6cbcb ("rust: add PidNamespace")

from the vfs-brauner tree and commit:

  d072acda4862 ("rust: use custom FFI integer types")

from the rust tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/kernel/task.rs
index 5120dddaf916,5bce090a3869..000000000000
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@@ -4,17 -4,9 +4,17 @@@
  //!
  //! C header: [`include/linux/sched.h`](srctree/include/linux/sched.h).
 =20
+ use crate::ffi::{c_int, c_long, c_uint};
 -use crate::types::Opaque;
 -use core::{marker::PhantomData, ops::Deref, ptr};
 +use crate::{
 +    bindings,
 +    pid_namespace::PidNamespace,
 +    types::{ARef, NotThreadSafe, Opaque},
 +};
 +use core::{
 +    cmp::{Eq, PartialEq},
-     ffi::{c_int, c_long, c_uint},
 +    ops::Deref,
 +    ptr,
 +};
 =20
  /// A sentinel value used for infinite timeouts.
  pub const MAX_SCHEDULE_TIMEOUT: c_long =3D c_long::MAX;

--Sig_/rm3mdfZ.4JV1jEEKOhAAubL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcxpFsACgkQAVBC80lX
0Gwp5AgApYShZHNOTdtNW4KsiZqV2LBP3KcnJx7OZSiihknVnNLyeyeTjWDyuCVw
KCeC4G9ZwA0+gFd1yqlRNkwWl0yok9uo0MJxnGMyoGB+P6UNBLSCOWf2v7gMynd/
gSVTUIUpgUIYnMtp988JRVjnzLNgXqp3TFZfhk/M2tSyD0yO79lerIPPnyssO1Qo
ODeItbB//jV+TF68vwbed2bqkW8gsdtWgiuWY1gUKbHPfzBDQQo8JhcCitUn3Fg+
I/ml2O6IH9xvXEsF9QWz2/t7stqaj+ng0W3YYrDmJTsNxWCg6fc8dvX6Q/QiUoW1
5KNHgttzN4N8Fwho7DEHuJBzYmFfuw==
=7+Ys
-----END PGP SIGNATURE-----

--Sig_/rm3mdfZ.4JV1jEEKOhAAubL--

