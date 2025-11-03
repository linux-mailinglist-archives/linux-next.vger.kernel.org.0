Return-Path: <linux-next+bounces-8806-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1755AC2E7DC
	for <lists+linux-next@lfdr.de>; Tue, 04 Nov 2025 00:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D479A4E2121
	for <lists+linux-next@lfdr.de>; Mon,  3 Nov 2025 23:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68FFD2F12A2;
	Mon,  3 Nov 2025 23:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PH9jXvkV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF8C26B0BE;
	Mon,  3 Nov 2025 23:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762214121; cv=none; b=J8LI5yRGtfGZKpBu8bHZEnyMV7GODdlz6+DVtCWXzCmZC1C/89Eieyh6pzp3hjK/EPE8Rp3JEjjfCD489Eo7bMQCMpWmkcvJbi4D/vr7qcZ6GbWNAeSBEbmtPdwnAh90UqXMnH4eMDnSrLzdN6naJnFugF8dmiu3ySZBUv0MPyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762214121; c=relaxed/simple;
	bh=JJBgM5CvHVCDWAdWTxqUDuJihJDMQJY77z8w4AlpCRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=R97kjJTKswEWZcT0M+i9+6PHrAyEyoXNvJyVwMegd3XdlSzfCKsDu7lItPYvXIuO35WlA1tw44hYfyK0pvgejB5toMWiK5wS6h+N+RLuRmQ5rWQxo9VQ2Jhu29USx5KccNmVs0w8ItILfqHI+7C8v8NMjCHiOCPUXtNHJiyEVQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PH9jXvkV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762214117;
	bh=auoeln3sGEB/pA2yTGvig5iDdccpG3DjuzkFF+RieQc=;
	h=Date:From:To:Cc:Subject:From;
	b=PH9jXvkV+owRtRpGfcVOPyYjWZrE3K2wBDRo4UeMAJ4Sq7clKa76IpfuCKwaTKqCa
	 7KeMO6HZG0y32gwH7Dx7UfG79MLDsGHa4GrQRUpMop74AImefjJ+g3N0S/wBKYn3vY
	 RV/HitaV5QPY0yjkG+tvNoyEnNzPBnhmIBVI4eGelwfxm8l0eHazvr98y0SU+WHGUq
	 KEFVCz5cZ5bxMeJ3fUFkYZX/KeyVnVillRRA42kMDzPdpkADK6Zoa5Y5UsWNTirTV4
	 NQ9rExFf5V5eBYset0zO0F/IlqGK3+/SW3MMAgEleSaQ/OFgWuK9JhKoXwNU6GWTxA
	 m1pr0eGoof8ng==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d0pP0704gz4wBD;
	Tue, 04 Nov 2025 10:55:16 +1100 (AEDT)
Date: Tue, 4 Nov 2025 10:55:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Daniel Gomez
 <da.gomez@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the modules tree
Message-ID: <20251104105516.40fea116@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wUe=rvqNh60xUE/B/Xqx1+9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wUe=rvqNh60xUE/B/Xqx1+9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/str.rs

between commit:

  51d9ee90ea90 ("rust: str: add radix prefixed integer parsing functions")

from the modules tree and commit:

  3b83f5d5e78a ("rust: replace `CStr` with `core::ffi::CStr`")

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

diff --cc rust/kernel/str.rs
index a1a3581eb546,7593d758fbb7..000000000000
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@@ -10,11 -10,11 +10,13 @@@ use crate::
  };
  use core::{
      marker::PhantomData,
-     ops::{self, Deref, DerefMut, Index},
+     ops::{Deref, DerefMut, Index},
  };
 =20
+ pub use crate::prelude::CStr;
+=20
 +pub mod parse_int;
 +
  /// Byte string without UTF-8 validity guarantee.
  #[repr(transparent)]
  pub struct BStr([u8]);

--Sig_/wUe=rvqNh60xUE/B/Xqx1+9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkJQOQACgkQAVBC80lX
0GylnQf9GuT0f6yRBpil/2XW210lgXxsXzfHZg9ZOQ5ZiVfxGqtkSJWIbUE6bXhj
hNs0D1dOKdiuhen52Hs5qLcZvYcVM+D+81APeia4YWJGlFRv3v+zFQM5diD7Pe+9
7yky2vRa3RfS00bbGml3oZ7Oy87LIFA1JQCOHCtN02JVCRRDC1y5R0yVgrRp19LA
mh9d/1mSG4jhsJi9bXNeiUWHXImbgZmmFKve2Mp78pFYxr0i+gttI4/MU00Gl8Ug
L41IHCJ61MOyzKw66g8cd/bI0jOzFe7Dc0ZxcRIdl2CFdO29W7qxyEtXYqQKSg71
44B0EWH+XoQKC7g9QP0K2zz8AbJdRQ==
=JtDj
-----END PGP SIGNATURE-----

--Sig_/wUe=rvqNh60xUE/B/Xqx1+9--

