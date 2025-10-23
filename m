Return-Path: <linux-next+bounces-8687-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8351BFEDFF
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 03:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 974463A5D3E
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 01:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436B51B4156;
	Thu, 23 Oct 2025 01:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZNBtLAKK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6597F1D5CD4;
	Thu, 23 Oct 2025 01:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761184177; cv=none; b=UhZVZZF00v555nBj+QzPaSvl1HZYA1xfWe4X74HWP+oMR2vbShWaFdSLuGLTplioLom7sXfucaEvkqHKBOTpDjXKG7I+rCWGxCPTgmg+wjbH0OVxO+yvOlstpTZ/LL/35dCjB6B1oHhBb+HFXaZnWAGmGg6aOrapNDaVndU/AQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761184177; c=relaxed/simple;
	bh=S1DOqqWSiY6Dz61buKuaUtvlzI+lDYeWZn2sNfrlvz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TXrUxc/zKAGhmAPTRaBLLLV0stmuJDeeUgwPfF7hNIDh9mlSy3ARdvQUO8dhPAClQpf22p3UY9lqa+4YNDJC+uoX3gRE9GrRU+d6Jsg2Z+MlNBf2jkJw2fUURUdw+96DZz53H23S+oFMvVlPok5xu9r1vd4uLOGwpSRi/MDqClw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZNBtLAKK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761184168;
	bh=DzXqa0GHAdk9vTQEToZZlnXPd1395FSg8a/MsxVu13E=;
	h=Date:From:To:Cc:Subject:From;
	b=ZNBtLAKKFgQfFAqJ47fbdBmDKhar3EF9J7YBCjxrrOI0Lj9PTX0rDo7OBZG0/AMFb
	 L69uNPVTFdFU5Qlzayq6wuOJyUz1yCa5k3VN18LZUWv2lxOF5BrjV+aULHOCElrB0E
	 cJa8dQxtvaL26LRNmS5icS4zW+W29MzkaLNkr5qB7EeR7ybVCuUrlo3K2qg+oa1baK
	 qESMurN4dHrPNennGemOPgWOaqqeKo/4qupZUhcakN5s86nXUynq7tGNvzbg9XE+Uh
	 9eJBL0/5+PSrXy+Y76UIz0KwKNkSEOWun4vTlf3SIn+5kQxbjdBOM0iZ3m+3w049XV
	 OLU9ga8rKNiGg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4csTVJ1Rhlz4wCX;
	Thu, 23 Oct 2025 12:49:28 +1100 (AEDT)
Date: Thu, 23 Oct 2025 12:49:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Tamir Duberstein
 <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the opp tree
Message-ID: <20251023124926.35a9ded0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8S+Q1YVndG3qLwsm5aLdD4/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8S+Q1YVndG3qLwsm5aLdD4/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/opp.rs

between commit:

  e6fdbe8feace ("rust: opp: fix broken rustdoc link")

from the opp tree and commit:

  965a39a9627b ("rust: opp: use `CStr::as_char_ptr`")

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

diff --cc rust/kernel/opp.rs
index 04472a8de3ff,9d6c58178a6f..000000000000
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@@ -87,8 -87,8 +87,8 @@@ use core::{marker::PhantomData, ptr}
 =20
  use macros::vtable;
 =20
 -/// Creates a null-terminated slice of pointers to [`Cstring`]s.
 +/// Creates a null-terminated slice of pointers to [`CString`]s.
- fn to_c_str_array(names: &[CString]) -> Result<KVec<*const u8>> {
+ fn to_c_str_array(names: &[CString]) -> Result<KVec<*const c_char>> {
      // Allocated a null-terminated vector of pointers.
      let mut list =3D KVec::with_capacity(names.len() + 1, GFP_KERNEL)?;
 =20

--Sig_/8S+Q1YVndG3qLwsm5aLdD4/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj5iacACgkQAVBC80lX
0GzMswf/dwMP84811Myp5HkoBbZkRCxlDzo+aauGjA+a8pS3YCHZIyxiX/nDr+WV
j4TObZu2IlxGglDm8KI7p6AElHHKBWCe9CgbV8RtZyWGaSN7ZVJQzLnS/qOyKxgk
2zFB0LXf3lFKnm99PCXZyawRnsTWY8DspSLH816cotX+bv++luEnIGU6ndHT0FHi
R1kbhFBdNat80CgBkY5yklxQaiZurRYBpiypTn8ap4cX/RZD3e9pmnpMl8IKXG4C
dg9+9Pxl96dcOZr4EHkpL7BuioBIa+UPp9ky8bbs+6fS3KLOGWe557tVsgwV5wrd
DmB3yNihyY9xrMJtWfQyGyrVcINKLw==
=Omlx
-----END PGP SIGNATURE-----

--Sig_/8S+Q1YVndG3qLwsm5aLdD4/--

