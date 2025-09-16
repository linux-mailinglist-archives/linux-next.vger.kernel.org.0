Return-Path: <linux-next+bounces-8333-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4C3B59718
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 15:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 581017B4D05
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 13:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86FF306B16;
	Tue, 16 Sep 2025 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t8QXL0U4"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16D53019BE;
	Tue, 16 Sep 2025 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758028200; cv=none; b=MQybbOVkQm5+JaGbLGj55dG24yoKPs25Qx9WwwYmrTLUGyKj5RaBgJRCnjMiiAiC1vlYQxW9cJedYCrWOHJgcwfy0yQBwzYLDU4oDogwUvG3AiUDTmXmoxLbxbfCWe2udP5F2OBevFmXWV86juWu8Wx6n48z/o9WoGVtsGcEX34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758028200; c=relaxed/simple;
	bh=JfnbUyOXxXuZP7KeNYZ4F9btUQDCypXExEHwkTv5H30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bWRtq7Yjx5cQOQp5NouMU9HW/Ng2K/V/jYw5Wc2OUGSy/rNWmkg2ZNk7jMnbOGL6/WQR7rXhNuBGRRbZP7IDg0Z/9CpdoCbZbmA07LWDI5uipEsfI98UAN/d87z6DzA1KmrNUn1u2nNs27Tvkg0SgPNqiPcy1XMooURSyY1A9H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t8QXL0U4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC81C4CEEB;
	Tue, 16 Sep 2025 13:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758028200;
	bh=JfnbUyOXxXuZP7KeNYZ4F9btUQDCypXExEHwkTv5H30=;
	h=Date:From:To:Cc:Subject:From;
	b=t8QXL0U4/Yqzinre9DcXmIpFRMm9ShhN8jeIgx3tLGdARqtD4o9/YhAulSpT1L2xi
	 TvfSmILtanPYJramBrjfM1lOaFxJsBn1rJUjc1zsjh7GblPto1bUZTmL0I+ySrS799
	 E0w1wH9mkYfymMgGqN8ba+l4Rp2ph+A6ye7hEFGmZw4jql9KaReVXrB12Wz3+q2Ptk
	 w38p9s8wMEP0+VW7lMVBSj0gLDn2+tIf798A6e1l5T5zIq2z0Va3deSAjp6HFlht4k
	 I+TyyyWl2jlLz92Wxi13njJO4Oi2iEffaHszqalDUc5Xd3F+avD/tpT8Ez6zz0g9cf
	 8uH6q88ScJB4g==
Date: Tue, 16 Sep 2025 14:09:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the drm-rust tree
Message-ID: <aMlhpIhjbrDR4C8L@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bjxim9GexlkTfTNm"
Content-Disposition: inline


--bjxim9GexlkTfTNm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/alloc/kvec.rs

between commit:

  779db37373a38 ("rust: alloc: kvec: implement AsPageIter for VVec")

=66rom the drm-rust tree and commit:

  1f96115f502ab ("rust: alloc: use `kernel::{fmt,prelude::fmt!}`")

=66rom the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/alloc/kvec.rs
index 38ed271b1d045,dfc101e03f358..0000000000000
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@@ -3,14 -3,13 +3,14 @@@
  //! Implementation of [`Vec`].
 =20
  use super::{
 -    allocator::{KVmalloc, Kmalloc, Vmalloc},
 +    allocator::{KVmalloc, Kmalloc, Vmalloc, VmallocPageIter},
      layout::ArrayLayout,
 -    AllocError, Allocator, Box, Flags,
 +    AllocError, Allocator, Box, Flags, NumaNode,
  };
 +use crate::page::AsPageIter;
+ use crate::fmt;
  use core::{
      borrow::{Borrow, BorrowMut},
-     fmt,
      marker::PhantomData,
      mem::{ManuallyDrop, MaybeUninit},
      ops::Deref,

--bjxim9GexlkTfTNm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjJYaMACgkQJNaLcl1U
h9B3lQf9FABvWloM/fSwnVkkxDiXEPfqF6FwQoA2CWc8EMQOonfD6+ZzhRZcPruJ
CIbLm8jrRyISSTLs3b6AwvKvQlY9ng+fyVr0wRAVevdpkz4n65TjT8aqYyyIGFTf
0merjI82xsVm37OiMG19F6p5QrrRq6WicK17w3AxuFE+61Asi7uxa2TlOOPAp+nl
zasSdf7etU4A+Ftquso0GxZT4V7D7se4bpEa1ah+I1u8iiggcpwejX6XHoJiuCiB
iK4JuGESvrBnQ5vojOVpDCU+2/ox7Uari0bREjVuZluINLGA+yOeO7tE8rkS9/99
YGIVRqJ3RR60O/QsjSfVOJeZnvPoaw==
=EYEA
-----END PGP SIGNATURE-----

--bjxim9GexlkTfTNm--

