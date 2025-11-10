Return-Path: <linux-next+bounces-8905-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 037A8C44BB0
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 02:31:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A4EB2345E8A
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 01:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195D2194A73;
	Mon, 10 Nov 2025 01:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JHaFh2nH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273F953A7;
	Mon, 10 Nov 2025 01:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762738265; cv=none; b=e8bqkRbwxFHI2UcoQa+puxuy6VoxTFMa6A/EAqAGv0CxSFT4pOuqx5SK9v45LVokV+5f856C50bhpf6xASyF7LxtG9AvV74PyhNmwLNqhxTTUw9PXkYuQl8onc4EsY7DA2ntb9u633XHw+GMX6QospAERulGUndWKRUpZ8IjRHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762738265; c=relaxed/simple;
	bh=s+K1BU9ws9l6CryO/JtcaSrSjg4oUYng2IG5CJHKaIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rq1UTQhZNk7Qg+dU6ElZ5VHc+Q4PHbra2vlJc/b0VYyiTq7IOvteiReKSpZYxML1VMjuQxyak9KVSvOT5qptRn4hkFx7y3uJtdVk/wETfLEYeX2PHsW4OtYiQVkobxDiy1G4bfQs346IDM5kZAuo2vvSjupAI0JunZRd3W8In8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JHaFh2nH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762738261;
	bh=qmlQp3nkb3LRE8RSEK+SfxE9+VzJFQ0GX8+c8koJCy8=;
	h=Date:From:To:Cc:Subject:From;
	b=JHaFh2nHL0IKZfr+f17Hu3TNdzlgdi/8Bi8NXh/87IMk46YaRkvcSpopPWOi52SKM
	 SPE4CRX4NAnFDoZMGBZPUcOA23GRoZaDXO48AA3srVWPB5zJyHUhjIYDGgB7itAlxS
	 GiwLWM5AzKb6ZypNfOuwMwbgpCckxAnpUK53x2b5SjPq1tKeoDHp0OBUtJ4mBjtxmm
	 3CJNf/P55An1yX2fiPl/xoLrnA6eXJ/PbCT2K7zoXiv3o84ViL9oWKy7U5EqdPBdy0
	 XNVAQW+Sp1AFM3+7iLnBTm1hV8y8XGm6mtWej6N4PPEeaFCMmP3Y2Tknx+NMd5K94D
	 ubMuUEuHB27eA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d4XDh6wCmz4wCy;
	Mon, 10 Nov 2025 12:31:00 +1100 (AEDT)
Date: Mon, 10 Nov 2025 12:31:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Danilo
 Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <20251110123100.106b59d1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B5rlU4oE0svFK2Do9ZSCg4F";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/B5rlU4oE0svFK2Do9ZSCg4F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/debugfs/traits.rs

between commits:

  9c804d9cf2db ("rust: debugfs: support for binary large objects")
  a9fca8a7b2c5 ("rust: debugfs: support blobs from smart pointers")

from the driver-core tree and commit:

  3f0dd5fad9ac ("rust: debugfs: use `kernel::fmt`")

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

diff --cc rust/kernel/debugfs/traits.rs
index 510f9e0a5325,ad33bfbc7669..000000000000
--- a/rust/kernel/debugfs/traits.rs
+++ b/rust/kernel/debugfs/traits.rs
@@@ -3,15 -3,10 +3,15 @@@
 =20
  //! Traits for rendering or updating values exported to DebugFS.
 =20
 +use crate::alloc::Allocator;
+ use crate::fmt;
 +use crate::fs::file;
  use crate::prelude::*;
 +use crate::sync::Arc;
  use crate::sync::Mutex;
 -use crate::uaccess::UserSliceReader;
 +use crate::transmute::{AsBytes, FromBytes};
 +use crate::uaccess::{UserSliceReader, UserSliceWriter};
- use core::fmt::{self, Debug, Formatter};
 +use core::ops::{Deref, DerefMut};
  use core::str::FromStr;
  use core::sync::atomic::{
      AtomicI16, AtomicI32, AtomicI64, AtomicI8, AtomicIsize, AtomicU16, At=
omicU32, AtomicU64,

--Sig_/B5rlU4oE0svFK2Do9ZSCg4F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkRQFQACgkQAVBC80lX
0GxYYwgAl7YivDSCpsJzXMNkGbPvgPECFTCxu5v93KPT3llMtgtQjj3mYoittyCV
msvCcXX5SFK1n1MU0qD5Ir5g6dklemZ4vx0WaKILxgcoPLs4VcoVQKbopuJcKQ4r
RKTa9AjVtv3ZhPZMsbJprRGjpJh+l7lVT3z/TiRFffXrjTmaiRzcSAXmNMBNmMc/
5qek2XOMBzPu9bDqIfmcj2LjLKQhJybk18TOkxmVxM4a4uTKavsClE36eSH9LOsE
Qe5mF80G5duMNt0B2TSWRJytcNMeUyv61UsfdtuaNARZ1aQT5bZFjWnIR0KH+yRU
aO5NkjPLpPivp6GUPvzA6RY3fswFkQ==
=G8O/
-----END PGP SIGNATURE-----

--Sig_/B5rlU4oE0svFK2Do9ZSCg4F--

