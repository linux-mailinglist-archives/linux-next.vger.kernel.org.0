Return-Path: <linux-next+bounces-8904-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C55C44B83
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 02:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B3CE4E2FC5
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 01:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55400200C2;
	Mon, 10 Nov 2025 01:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OdNLKC5U"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713501448E3;
	Mon, 10 Nov 2025 01:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762737875; cv=none; b=L0+/p73pmgVlkjTAESqu4fOeXLac5/sVpC7bviJzoWzJtwvkSM7JjomTjFhed0cYMmy7rebEHrRFjqKBbzETiqQ6/UPPym0m0bYIQ5x8Fs8NzM7ZtKpWMZbXR8m6MI04eP2qce3KnzmjOkfFf76rSNkCEPO689filNFNCQCP1Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762737875; c=relaxed/simple;
	bh=pbwqRoLlDdZW5TPirzy/3ZIPjCfsTFyPCARgjqG1Zh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aCP1+N31K0sM1/pE7QBEwFDUgqarAZzpnptds7B7uwhA5jsFVh7v0Ck0JXkWONs316xCjkg+AI0GQPK8QLp22TkmGsrugE4oWXsD1d9AB4DutD+cL66W+g5opz8r4QKYJEomgz/fWovdAo83TKwdyBa1z/RDys05ApqB7IRD51I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OdNLKC5U; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762737868;
	bh=nNZVf4kE7EkE7536+zgUqcMM+W+ZX+bSv1a+ITVMQTk=;
	h=Date:From:To:Cc:Subject:From;
	b=OdNLKC5UGePv/Mb1lXGBPiho0n430DHp7JHz8aUAvaAOg2k98Sx8SFcOfayO0oHAH
	 QWo47k9Sagd66o/fia9We3FDXFiSKIVM6lwDcARsJJGZyEUjgCZ4hH53ky05H9y+88
	 OdBa1hbUIvpCgcjI4RD2wVIu4b26FEMiL0hjhC6DtC9RL0cObwTc8Gza9TQLSJ20i5
	 KJwRuOfHsxJpp/llVfPN/uo+ulsRrC2HFab79+rPsgnfpWBydBNOxGrU/lPsL1PN87
	 h38mkZYmXtunAT3hHTNWnQ+ss5sgUfOA8koDJWH4NTXHFUrxOAsYFtywVkFKv1QVW1
	 Q4QzMB+t6JYvQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d4X574t6Lz4w9Z;
	Mon, 10 Nov 2025 12:24:27 +1100 (AEDT)
Date: Mon, 10 Nov 2025 12:24:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Danilo
 Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <20251110122426.76ef487d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/63+4At2td.JMTvZO2W2Lox0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/63+4At2td.JMTvZO2W2Lox0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/debugfs/file_ops.rs

between commit:

  9c804d9cf2db ("rust: debugfs: support for binary large objects")

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

diff --cc rust/kernel/debugfs/file_ops.rs
index 6c8928902a0b,9ad5e3fa6f69..000000000000
--- a/rust/kernel/debugfs/file_ops.rs
+++ b/rust/kernel/debugfs/file_ops.rs
@@@ -1,9 -1,9 +1,10 @@@
  // SPDX-License-Identifier: GPL-2.0
  // Copyright (C) 2025 Google LLC.
 =20
 -use super::{Reader, Writer};
 +use super::{BinaryReader, BinaryWriter, Reader, Writer};
  use crate::debugfs::callback_adapters::Adapter;
+ use crate::fmt;
 +use crate::fs::file;
  use crate::prelude::*;
  use crate::seq_file::SeqFile;
  use crate::seq_print;

--Sig_/63+4At2td.JMTvZO2W2Lox0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkRPsoACgkQAVBC80lX
0GxXTwf/QN84PWbXIFMfprWhju88SjXYtiYLjnc9gR1ZtYCoZPovnmHUD0GAEt0m
M048VnYCMDZXfwWzHRt7PykLorVyURw3xHh+LZmWN+8t5l5Y8J/JsRxkVr7OrTYY
tKOpWRcIVx13VQoJjNqSOJtPpXMsC4uYUAu7Mofg8l/feG61dFbAkpwkzubqvwuf
JPEPmmgg4ZdYkqwItYIryj7GThC7mMPaBjIcRGP1uF9gDb6K1QrCFOr1pgRVbI7L
zTNoTp0P0jO3/KdFLFJSSpVCUzg//bXvqRZHyWBk+do09kkh+EpQYokUEWGiuKEl
wXioQvoOQgcQiW7FxM2mens8iZ8mDA==
=71KH
-----END PGP SIGNATURE-----

--Sig_/63+4At2td.JMTvZO2W2Lox0--

