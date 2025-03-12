Return-Path: <linux-next+bounces-5770-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 223A0A5DB15
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 12:10:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 643EF174F43
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 11:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1064823F360;
	Wed, 12 Mar 2025 11:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oh7EfyC2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D340923E352;
	Wed, 12 Mar 2025 11:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741777800; cv=none; b=AjIxcYMPeoXfnW/UkcrqUJAVbPCTBqXAEP78SUoDt4bekOZ/B+hBpRpMvd6ulj9Vx38BCfDKTfsS54m5/XT+X3JncYvsFT0I1HUsAUrjlCgvrlels7wPKdDJGqG97QRY03XsPW2QOQEFzQBi1dMk8mQvmuG9lEASFSOPepNBruI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741777800; c=relaxed/simple;
	bh=wv5s42yPi9QGrxUPxSOMsjtaRdV5W7LGMFdHVhCovvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DOdEcIzyQ5EG6PKQGKg28nXBLbT4Pxn73bB19o8U6PkUVZpLmmhaYK6pESl8xDPdFEzxTxc7y4RpWKB7Y4Kw/MXMu8IGS2RPApLG47OeOucrZS/pKOcJTF5f5WP+dimQxwGYD6mSCAueLYDtcxiXk25UKtkdVap9sALalKDfHLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oh7EfyC2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741777793;
	bh=MUVInfsigzT38UIGbx6GR6B45El4Vkp9vrI5fdtqPuc=;
	h=Date:From:To:Cc:Subject:From;
	b=oh7EfyC2jL0852xQHz3/yU2iRYCB06WB2GpqwxIgN2XsLOSnwv/apgsry/6IZbtCf
	 kMU+X0BnR21y7bE8m8I7v8zaStYBGKV6cG7vtWwAOXfOjvza/s/nDlFYnu/emZMlT6
	 +Kt5jx4dQWEVHOkzBQjEizS0s5n6WpJ2M92kuPOehH83eMCtWnzMXYUdmYWiyWP0Hr
	 noetBx1DUbAykbnp9LadwwLTnc+EHnyxzOVKPJAYukGYYBg/Mrnakyw82WNrWHjsNr
	 78TYagIqGdVuBtSzUwvc6McTaocvOowB+AWsehIJd/Zw6/ReMQxmNa1FA7lL0+skCe
	 AFhndUx+S1szQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZCSZl6VYcz4x89;
	Wed, 12 Mar 2025 22:09:51 +1100 (AEDT)
Date: Wed, 12 Mar 2025 22:09:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Fiona Behrens <me@kloenk.dev>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the driver-core tree
Message-ID: <20250312220950.28ed9ad7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ORfN9Fqhk=duj9LJIM/WLvz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ORfN9Fqhk=duj9LJIM/WLvz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the driver-core tree, today's linux-next build (x86_64
allmodconfig) failed like this:

error[E0599]: no method named `readl` found for reference `&Bar<8>` in the =
current scope
  --> drivers/gpu/nova-core/regs.rs:38:18
   |
38 |         Self(bar.readl(BOOT0_OFFSET))
   |                  ^^^^^
   |
help: there is a method `read8` with a similar name
   |
38 |         Self(bar.read8(BOOT0_OFFSET))
   |                  ~~~~~

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0599`.

Caused by commit

  354fd6e86fac ("rust: io: rename `io::Io` accessors")

interacting with commit

  54e6baf123fd ("gpu: nova-core: add initial driver stub")

from the drm-nova tree.

I applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 12 Mar 2025 21:36:48 +1100
Subject: [PATCH] fix up for "rust: io: rename `io::Io` accessors"

interacting with "gpu: nova-core: add initial driver stub"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/nova-core/regs.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 50aefb150b0b..b1a25b86ef17 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -35,7 +35,7 @@
 impl Boot0 {
     #[inline]
     pub(crate) fn read(bar: &Bar0) -> Self {
-        Self(bar.readl(BOOT0_OFFSET))
+        Self(bar.read32(BOOT0_OFFSET))
     }
=20
     #[inline]
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/ORfN9Fqhk=duj9LJIM/WLvz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfRa34ACgkQAVBC80lX
0Gxzgwf/TSBmxtCTVVxQ0r+4Q69UZMvsI0udHxcwB7WIR4Izd+4ntY5aZmH24rhP
g+6DJ3/yxiRnaGScgzPneHSRm9IDPbTorRIQhfMXrGsY9QtA/xfXlSd7eqqjrG56
bodobNpgFb4fwUlEInVHUUgnMjZMaW5+XptxxoYlTjWwBcZgqA8G4//JqckBUHC6
mRRF3fq85bbEVMkojYOZUI0Hq+Zs9NyIz3DSar6tJaFDstP1Z+2hauBdUghWoB5X
LgYCIM1c5lz2O/YJBB1s6U68qciTTVrNLQeS/43aptdPTvd1uvCrYsb0pG0XJ6P2
Qx2ysuuG4E3fhAUnO8wNYEGnCbG3GA==
=I+cW
-----END PGP SIGNATURE-----

--Sig_/ORfN9Fqhk=duj9LJIM/WLvz--

