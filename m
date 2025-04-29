Return-Path: <linux-next+bounces-6430-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A76AA040F
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 09:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D44216682D
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 07:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275C813A3F7;
	Tue, 29 Apr 2025 07:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AAN8du7r"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E6A78F29;
	Tue, 29 Apr 2025 07:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745910481; cv=none; b=SrDCY7PTMGTKuASBwvA8gODMOoD1neK7XGsH5RKA1QV0/xrRC0JnLrg53ofN44XfBbufuG1y0ppwFuMJn3YZ6HVAN9tYuXspd5QNdBCY9HV6XCDMm4DhPvuX0/QTJ4HBU9mvasaLMauv0n+Cy5S06t9ism7IHDQSgxbZXrKD67s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745910481; c=relaxed/simple;
	bh=/agbpIEpvL1dYIcwFxxAnWwncnBkSjlhCa3SZj7TMTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qbG3KAmwE34pUDBkMbDcSRVrzn7tA/6QbbGKqw/OKmSW0XHBwlGi+dqC3+WYqIFvauiArVPCrc7UZi379bbVNp8ExuS+5q2l7FXz4ee1bBGb+FlHyq/eD2Zsvs2rsfgB4yXz6DWomFUC8VyhDsO3YLkj7SiAZ5H0dwycDYBnNVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AAN8du7r; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745910475;
	bh=1qxqL3IB8/tukQnoKsoGEv4OQYEuGNd0wnjScgTy4iY=;
	h=Date:From:To:Cc:Subject:From;
	b=AAN8du7rxxYhOdg+t/ELoxOXipkkK24grnKb5o74PbrdXITwfqLaerueG9CIOpdoZ
	 7jq3x2PolPVW7jfKfniO7Vdc3rHkGYvRXjsMiVUIDBvUomeMYcIu0qjXhZf1+wW12A
	 bWB6MWnEjmIvWmqk1SkorLqT/6kjdzmkwPTQ2jPLX+6UVHqYwfQvhb/V9jiZubpcbo
	 h1Om5kQRkOJxWUl8wnpDdKOf2FR36CAL4PfGqOJ3yBIK+iktt3kUlJCFmIbdpp5HSa
	 G4UuyRwPanBUqAuyKNsuw3AQiZZmjCRCfdwG+qo0y9TnQrv2CyFbM+5DvOrp9q05Rx
	 J4D04/ugT7h7Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZmrxR01Nfz4wj2;
	Tue, 29 Apr 2025 17:07:53 +1000 (AEST)
Date: Tue, 29 Apr 2025 17:07:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andreas Hindborg <a.hindborg@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>
Cc: Asahi Lina <lina+kernel@asahilina.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the rust-xarray tree with the drm-nova
 tree
Message-ID: <20250429170752.27fddb30@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j7x18WCNzSCqfamaCICR9SI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/j7x18WCNzSCqfamaCICR9SI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust-xarray tree got a conflict in:

  rust/bindings/bindings_helper.h

between commit:

  c284d3e42338 ("rust: drm: gem: Add GEM object abstraction")

from the drm-nova tree and commit:

  dea08321b98e ("rust: xarray: Add an abstraction for XArray")

from the rust-xarray tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/bindings/bindings_helper.h
index e0676ba99d37,e0bcd130b494..000000000000
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@@ -61,4 -56,8 +62,9 @@@ const gfp_t RUST_CONST_HELPER___GFP_ZER
  const gfp_t RUST_CONST_HELPER___GFP_HIGHMEM =3D ___GFP_HIGHMEM;
  const gfp_t RUST_CONST_HELPER___GFP_NOWARN =3D ___GFP_NOWARN;
  const blk_features_t RUST_CONST_HELPER_BLK_FEAT_ROTATIONAL =3D BLK_FEAT_R=
OTATIONAL;
 +const fop_flags_t RUST_CONST_HELPER_FOP_UNSIGNED_OFFSET =3D FOP_UNSIGNED_=
OFFSET;
+=20
+ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT =3D XA_PRESENT;
+=20
+ const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
+ const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;

--Sig_/j7x18WCNzSCqfamaCICR9SI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgQesgACgkQAVBC80lX
0Gz0oQf9Fw9e2fvAi0Gizsq0TZ7Ft6d9VyH/ISZttdJIMviSd3BAJypLMsdGx182
1TMDabMUMGLJIuKAvNKQZfvLAl0r6TFVF926mIIrqy+iz1qI0hCg4Bvuu48O9YNj
OKoNj82HYyezRJhzD1EdUkzYv7iqCDgh64qDQMfB1z0PWctEdCRhVXMi8YAOyszs
teyhTwGJBXni6mWbeFecSSeW9WDwGDliWPD9kqPe/vxZ/2JNuXcHXWjlI+DuzHhe
u2OtwlulDLA/rCjD4G+wzWTuZ+ATdE/BBsRZPxnNGuoqanHwWozeubwKXoMmvJCj
y+2eTZj93MwkzLpfohpUZnjqyKbEIQ==
=a5NJ
-----END PGP SIGNATURE-----

--Sig_/j7x18WCNzSCqfamaCICR9SI--

