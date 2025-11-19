Return-Path: <linux-next+bounces-9088-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D49BFC716D3
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 00:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C76AC351838
	for <lists+linux-next@lfdr.de>; Wed, 19 Nov 2025 23:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1BE3327204;
	Wed, 19 Nov 2025 23:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YJkSoHgS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20C732ABC3;
	Wed, 19 Nov 2025 23:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763594088; cv=none; b=hX2l/ZXzDzZ66Fh2vXYraP1Gyoqk3P6TNarhRpra5HqRWtaE6KCcXnwsgI2ZKBpXeJMpX7Q/pTNDbZfbw2OixQdwvZqi9zOMZc/PQirIZwwVykxHG53a+J4LAPGcnUyKmi5x892c9E0fnmLhHf7y1o7v+UdJzejAi25TeSlg4t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763594088; c=relaxed/simple;
	bh=IU+Shwiye5O1PbFJZaWmReBuagxVm78M6o5RH5ixAug=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bEvr9UHCZeh/jYeiZsT+0SjTZ9rXFKjfiVEjm8FBvK8qcynmZDVxzIXDrgD+YuKYjrhHqTAijIqkos6Juwxc51jN2zYb1Xq2akNPT44M2adYNwgmIhmcCsR2nskEA8zvjxv0Wr+RyCdgvPTC7HQ5PiMZSYOxDS7UJVaz5ut7vGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YJkSoHgS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763594081;
	bh=PUY/fEF1kraDl6HEc5vi/vg3taNPmA5BlGHENdz8TG8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YJkSoHgSK0bkKE3g3bMiABIjWPNPiOafmpqCp26cjv8cqEjGqZ3DYLvtOV/i0PEE5
	 n7i2xqxZYpjgj8DppM4m0n8VCP9Wv2uRQAV/Iaokllp08xsyXQyBM+AH5lIrQSF0Wk
	 uY0MZi5flvdJM/xcaD8BGkxxn2Jn19eY+/N/quwuhhiw6XN6mY+m2lGt/3lHdmBTAk
	 Y6tahJndtDJEQNRBF5ufklZVYBUwQjWE0B+sAxmr0Qr6w8rLxxQsAwOUOJc37K6M3r
	 usB0DnLV2owo/CglzwtmlYNRTYBalFy3DdXs9tsETKlSxv9DvcwzA4j63aq8orqUiq
	 xEf95iSrf+ScA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dBckn3JWDz4wD1;
	Thu, 20 Nov 2025 10:14:41 +1100 (AEDT)
Date: Thu, 20 Nov 2025 10:14:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Eric Dumazet <edumazet@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Wedson
 Almeida Filho <wedsonaf@gmail.com>
Subject: Re: linux-next: build failure after merge of the mm-nonmm-unstable
 tree
Message-ID: <20251120101440.0f41ca9b@canb.auug.org.au>
In-Reply-To: <20251117102310.58ecfdb4@canb.auug.org.au>
References: <20251117102310.58ecfdb4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LdQxNIX_j2SdhN5WOwTQprO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LdQxNIX_j2SdhN5WOwTQprO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 17 Nov 2025 10:23:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the mm-nonmm-unstable tree, today's linux-next build
> (x86_64 allmodconfig) failed like this:
>=20
> error[E0425]: cannot find function `rb_first` in crate `bindings`
>    --> rust/kernel/rbtree.rs:209:42 =20
>     |
> 209 |                 next: unsafe { bindings::rb_first(&self.root) },
>     |                                          ^^^^^^^^ not found in `bin=
dings`
>=20
> error[E0425]: cannot find function `rb_first` in crate `bindings`
>    --> rust/kernel/rbtree.rs:224:42 =20
>     |
> 224 |                 next: unsafe { bindings::rb_first(from_mut(&mut sel=
f.root)) },
>     |                                          ^^^^^^^^ not found in `bin=
dings`
>=20
> error[E0425]: cannot find function `rb_first` in crate `bindings`
>    --> rust/kernel/rbtree.rs:249:42 =20
>     |
> 249 |         let current =3D unsafe { bindings::rb_first(root) };
>     |                                          ^^^^^^^^ not found in `bin=
dings`
>=20
> error[E0425]: cannot find function `rb_last` in crate `bindings`
>      --> rust/kernel/rbtree.rs:264:42 =20
>       |
> 264   |         let current =3D unsafe { bindings::rb_last(root) };
>       |                                          ^^^^^^^ help: a function=
 with a similar name exists: `sg_last`
>       |
>      ::: rust/bindings/bindings_generated.rs:90155:5
>       |
> 90155 |     pub fn sg_last(s: *mut scatterlist, arg1: ffi::c_uint) -> *mu=
t scatterlist;
>       |     -------------------------------------------------------------=
-------------- similarly named function `sg_last` defined here
>=20
> error: aborting due to 4 previous errors
>=20
> For more information about this error, try `rustc --explain E0425`.
>=20
> Caused by commit
>=20
>   84aa8c5fc414 ("rbtree: inline rb_first()")
>=20
> I have reverted that commit and the following one for today.

I am still reverting those commits.

--=20
Cheers,
Stephen Rothwell

--Sig_/LdQxNIX_j2SdhN5WOwTQprO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkeT2AACgkQAVBC80lX
0GyIcgf/S7xI7vSoJEffP6BFE+6nRJEdztphClp4gKr5I/jbggjHL7vJK0ODEHTu
pjY0F8fRfB6lgYkIkReKbXk8v7GQDH76HzYcckpufxUF917+sbSIKgwwPPZvBP88
H73i3dvj9Prq9UFrMpr+8E78crqOZMqg5sin3lJfvy1euMGXTXaf4gJY95xX6Ii1
SaJI1x1SA7Z1bsaVfE8r8msZaCdL8V8Fk1CxIkI5pLzrSUrTWXHRtJu350U5utsa
UoP8O+cmsF0G+0iIN1ZSxj6g2dxq35GXeIi6aYfYbQGASmnys7E8eUvcM8FSL7le
T5XfuITDZwkkERoVqi7clFn4oS7JHA==
=lkqA
-----END PGP SIGNATURE-----

--Sig_/LdQxNIX_j2SdhN5WOwTQprO--

