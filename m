Return-Path: <linux-next+bounces-5190-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73112A0FFEF
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 05:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00BA43A77D6
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 04:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3AF314A0A3;
	Tue, 14 Jan 2025 04:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="eat51aZp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAF624022A;
	Tue, 14 Jan 2025 04:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736829462; cv=none; b=MkhkzbaKpJaWuO6kvvyVSToGEWc+YdeAXh8TjWtk/Kxm+1Fgm5B8373wEQtQRXx3FWjwwBZdgJ2wxrZT+vh4o6WTm69+WlIPE/xDkN3sTUBe2S4si8llqlZTatCllesMk4R17Dp/bkH/8gNR6tulLS+RHQJxnxm53CfS7BpNtyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736829462; c=relaxed/simple;
	bh=pywLTlRCz9jcubVMAowpd7Fa8EzvOoHPNNZ31Bncd6I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pY3bLKvUa6MNjZ2pT6B/3w9yY+qpAsh/cZSKYcbpMFAKYscR1MD/p2JbJpfqXxw6Guh/UTdub21Sp+VXlNClF6qiiCEq2PjX1qkav8XkEQLbfwIx/SGmWXAqKKy41seU7twmmovPu/Ftf/aV9RPhkV3rbnjrCfzCH/G6EcBaDjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eat51aZp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736829448;
	bh=PKMdJ5xlPrhcouDAsjWLXjXgGsPlonAdd6ifyGXdfVc=;
	h=Date:From:To:Cc:Subject:From;
	b=eat51aZpGH5EY/Tcmx2YuEVjRehD8GmCz929NiilOYDZeqrloBh/y3O5YkoWAjPzz
	 z2mSsLy6VmfwHrxykxDXieyLk6rCWnkr6o5UJK0GgX+1Lpev0lwv+7MB6sYSlHR/q9
	 DpDWbux+39sEj9tc5Ad0BOV/j5HVbYR2sj3HunkzyooUjxW3n2v9Wguwzh9nx6YNDJ
	 NNrrZpLd7AwD6zHfrZdC1fgOerKTc04qRu+q43Fu76ypVueJvPCC/bEgW0klceSu7C
	 kW054nQkptVMdCtvtpAcGJ1DUIWE7Dub30Wkth0rZxpEoqkvyEEtCdUUJo6JoH3IHP
	 pHpUpbrXryYoQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXGZH3gBZz4x2g;
	Tue, 14 Jan 2025 15:37:27 +1100 (AEDT)
Date: Tue, 14 Jan 2025 15:37:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Fabien Parent
 <fabien.parent@linaro.org>, Gary Guo <gary@garyguo.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <20250114153733.1b73c3df@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AaumeZPheMEvx.sldgbltXJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AaumeZPheMEvx.sldgbltXJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/lib.rs

between commit:

  9b90864bb42b ("rust: implement `IdArray`, `IdTable` and `RawDeviceId`")

from the driver-core tree and commit:

  47cb6bf7860c ("rust: use derive(CoercePointee) on rustc >=3D 1.84.0")

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

diff --cc rust/kernel/lib.rs
index b11fa08de3c0,545d1170ee63..000000000000
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@@ -13,16 -13,12 +13,17 @@@
 =20
  #![no_std]
  #![feature(arbitrary_self_types)]
- #![feature(coerce_unsized)]
- #![feature(dispatch_from_dyn)]
+ #![cfg_attr(CONFIG_RUSTC_HAS_COERCE_POINTEE, feature(derive_coerce_pointe=
e))]
+ #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(coerce_unsized)=
)]
+ #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(dispatch_from_d=
yn))]
+ #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(unsize))]
  #![feature(inline_const)]
  #![feature(lint_reasons)]
- #![feature(unsize)]
 +// Stable in Rust 1.83
 +#![feature(const_maybe_uninit_as_mut_ptr)]
 +#![feature(const_mut_refs)]
 +#![feature(const_ptr_write)]
 +#![feature(const_refs_to_cell)]
 =20
  // Ensure conditional compilation based on the kernel configuration works;
  // otherwise we may silently break things like initcall handling.
@@@ -37,12 -33,10 +38,13 @@@ pub use ffi
  pub mod alloc;
  #[cfg(CONFIG_BLOCK)]
  pub mod block;
- mod build_assert;
+ #[doc(hidden)]
+ pub mod build_assert;
  pub mod cred;
  pub mod device;
 +pub mod device_id;
 +pub mod devres;
 +pub mod driver;
  pub mod error;
  #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
  pub mod firmware;

--Sig_/AaumeZPheMEvx.sldgbltXJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeF6g0ACgkQAVBC80lX
0Gzpswf7BBF8JVtdnhtg6OX32n63O3/My5nwJMi4PbbrP4pgexzkp2hjyXlmZ0ZK
JjXgqaJK+l43L416dtbVHDZExC0Vm9p3naFcsJL8z2HUk1JNrjDvFUce/y+3h6tC
f6FTVCxIdHg3rkxveZpgxu0hq4gclkqIoPl6MsivJFPj5AWYq9VA8VBXoIN7MWni
Ksd+L/gHMJP7TgaWK1OROG8te3He6uFqsXwrpI73pNfta3qGbdKRXDjL3i8deKiB
eOxqQpMnLETp/3Y38HPTbdej4ik02EONEHV0Rm3uaSpUCwOAezYbr5ZZ92KvqCD3
cdCRoyC6bnyBSah0TYROMQaWIJ2cHg==
=WPtn
-----END PGP SIGNATURE-----

--Sig_/AaumeZPheMEvx.sldgbltXJ--

