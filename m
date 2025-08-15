Return-Path: <linux-next+bounces-7955-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2008B27675
	for <lists+linux-next@lfdr.de>; Fri, 15 Aug 2025 05:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C8FA567428
	for <lists+linux-next@lfdr.de>; Fri, 15 Aug 2025 03:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5613127AC32;
	Fri, 15 Aug 2025 03:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mLEHdXck"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E203526AF3;
	Fri, 15 Aug 2025 03:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755227158; cv=none; b=N2xc8WblWE/PuWKq4pQSxdOk92FE45o5mFzbPravg16W+adMSkVtB2OeEKetEQYZY08LjxhNpd8rJHnGlfAJJMqEGzNiREPgIofH67y040opTuY95AIqdxSbrz66YwJFnIMghsGEIyee2b4qsPeHj5xERXB+w1uP81nG5A454uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755227158; c=relaxed/simple;
	bh=b4zHBI2+pf27VFS+Vi8naqMys1qCuA8w3Yvh9ogNlgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=svjkCuGARfZArSZ7cW7f9qfy4h36DcVlgU10L4sucQNPD3bAdnmgzUljQho/+pYURsLGvaPHKwJahuOW+UbG70AEzymfpGKglmQqTIOl7xYzZ+LgEoS4fGUMbXhhB4qwfT6MgelSyTUJ1HhmH8X/9Rtl2bmbAVJ/8pXQ5gMNIjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mLEHdXck; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755227144;
	bh=sai+f5ZM+SaZrB5rzQ6nDiet5Sd8Fwy/41BiKNKv4xY=;
	h=Date:From:To:Cc:Subject:From;
	b=mLEHdXckvfEXPR7XLVknALmuRSSANBA2gyOdY5AxylJgc22Gdko0NcTi73pXeXe4i
	 TYM9dN0lU0s9VUZuCHudml7VuwQ0MkLxyRyiu21uas0thPnvZa9yj0RizgxRWSF5Wb
	 RuZoOLLJbBpZ0rtN5t+2a+JWo5PZN/JKFA3Itt7+Vwv3kdR8vaCOjevdhRRFjyViTm
	 1zezO27ErbxCoZT4NS+kdhTDp9U3OVvf8/TqnGaWmfiAYxvSo+3oDYsHt3q18GUc7L
	 /i/3yQkX2XwstJSIT79L37b7bHXh1cA27zwUdAOUK45Wb6CK2ObhlTDSsY3LvYgcGt
	 ZUdszYH/nBFng==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c36S83Vzlz4wbn;
	Fri, 15 Aug 2025 13:05:44 +1000 (AEST)
Date: Fri, 15 Aug 2025 13:05:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>
Cc: Dongsheng Yang <dongsheng.yang@linux.dev>, Mikulas Patocka
 <mpatocka@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the device-mapper tree
Message-ID: <20250815130543.3112144e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nYzBKBF7BSRP70jifWY8Kfq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nYzBKBF7BSRP70jifWY8Kfq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the device-mapper tree, today's linux-next build (htmldocs)
failed like this:

Sphinx parallel build error:
docutils.utils.SystemMessage: Documentation/admin-guide/device-mapper/dm-pc=
ache.rst:27: (SEVERE/4) Title overline & underline mismatch.

---------------------------------------------------------------------------=
----
Constructor
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Caused by commit

  6fb8fbbaf147 ("dm-pcache: add persistent cache target in device-mapper")

I have applied the following fix patch for today (there may be better).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 15 Aug 2025 13:01:51 +1000
Subject: [PATCH] fix up for "dm-pcache: add persistent cache target in
 device-mapper"

Sphinx parallel build error:
docutils.utils.SystemMessage: Documentation/admin-guide/device-mapper/dm-pc=
ache.rst:27: (SEVERE/4) Title overline & underline mismatch.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 Documentation/admin-guide/device-mapper/dm-pcache.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/admin-guide/device-mapper/dm-pcache.rst b/Docume=
ntation/admin-guide/device-mapper/dm-pcache.rst
index e6433fab7bd6..550026219a6f 100644
--- a/Documentation/admin-guide/device-mapper/dm-pcache.rst
+++ b/Documentation/admin-guide/device-mapper/dm-pcache.rst
@@ -25,6 +25,7 @@ Quick feature summary
 * *Log-structured write-back* that preserves backend crash-consistency
=20
 --------------------------------------------------------------------------=
-----
+
 Constructor
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -58,6 +59,7 @@ The first time a pmem device is used, dm-pcache formats i=
t automatically
 (super-block, cache_info, etc.).
=20
 --------------------------------------------------------------------------=
-----
+
 Status line
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -98,6 +100,7 @@ Field meanings
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
=20
 --------------------------------------------------------------------------=
-----
+
 Messages
 =3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -108,6 +111,7 @@ Messages
    dmsetup message <dev> 0 gc_percent <0-90>
=20
 --------------------------------------------------------------------------=
-----
+
 Theory of operation
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -152,6 +156,7 @@ range when it is inserted and stores it in the on-media=
 key.  Reads
 validate the CRC before copying to the caller.
=20
 --------------------------------------------------------------------------=
-----
+
 Failure handling
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -164,6 +169,7 @@ Failure handling
   use-after-free keys.
=20
 --------------------------------------------------------------------------=
-----
+
 Limitations & TODO
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -173,6 +179,7 @@ Limitations & TODO
 * Discard planned.
=20
 --------------------------------------------------------------------------=
-----
+
 Example workflow
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -197,5 +204,6 @@ Example workflow
    dmsetup remove pcache_sdb
=20
 --------------------------------------------------------------------------=
-----
+
 ``dm-pcache`` is under active development; feedback, bug reports and patch=
es
 are very welcome!
--=20
2.50.1

--=20
Cheers,
Stephen Rothwell

--Sig_/nYzBKBF7BSRP70jifWY8Kfq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiepAcACgkQAVBC80lX
0GzJyQf9GgfxFmFvN9sKgIEi9K4S8GZ8iGAclxTlsm4Rh9aqKVSvDiy3dgMqKjwP
pzwTNyaji3FdGfzhpbiA/gdUb6wXX3cUC3ac2ECyhSTUdM/Bj4IIP/A0M1sqfv5u
T7GmZtGNAwapTHSWJJ+48bi/PYfYJgJmLi46FpQcLmxLVsMxK7kDeomOhwacn+hV
0EyVl6b/obBFuIjMhGjP+Z5xws1z+bCiFdcdHQDXmceclu49gFAm7MFUPINHwy79
sF/WvuF2zmwpRrYlUdpoxyDml6xei4vkpu/mGsyvzI1rQHuL4pbFB2djyt2YHpK8
CgLWXbE+KfJiUxxpkZd9tOmkWz39mA==
=E7hz
-----END PGP SIGNATURE-----

--Sig_/nYzBKBF7BSRP70jifWY8Kfq--

