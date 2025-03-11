Return-Path: <linux-next+bounces-5727-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B43A5BBDB
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 10:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA737188C8C5
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 09:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2972B22B8AB;
	Tue, 11 Mar 2025 09:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="beWikhIv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7460D1D8E07;
	Tue, 11 Mar 2025 09:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741684657; cv=none; b=fOljxF+lJUQJyncse3xb+LImxoovXuMB0RH9qYh+CC1tqKW17VhdyHnIQxl8T8vLm+DB35D0sxhfcEPVqgKljaK09dxd/d7kfH7MkNnLUxpSt8CQXC1U09PK5N2NJbGGHEK+dCVhjVBSQTEwAJFnIHDnzyROaY2DLR3VC4URz1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741684657; c=relaxed/simple;
	bh=mo2VOE5Pdost2IrWBbeMn+NGtDeyaW/lhYvg8WhS0/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mTGXRj9jAXBi91Q2xANceq+FIKBXDFudn2ZcV/cnlQOHdNSbUY36xggDMRzxGlSw3hMi76TCGchu/ZtKKIK4F+nplmujoak2lQIe7hOY3q3vAXLwmbRx+IaFEh63j20p/pv4OrXcBtwYR7JiDs+0ss8BkafEA6fdmF9esU1adVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=beWikhIv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741684649;
	bh=+7rgICWy4cnzwX384jJ8pJ+8ukLphTwXiqmF9tmuYq0=;
	h=Date:From:To:Cc:Subject:From;
	b=beWikhIvVfDpgOHMSRKU+GaukBeI+pGQvSxaxfWyKXfTtM6G4uJh4535HoKathiRY
	 jOaLixcdE/RtxGl8W/6hSbpoj3W4qgZOyPjXSScwJzVlcPHywi0uqlruAwNnunGOIE
	 XU4Ua0PBlBmcDnlD3BX8+xT+JasPZ/wZr8+8rxoQn9+zW490Z1rmIXMxge7uDUkhr6
	 JaCGwkZsABkHpI1e33srrA1rF72uvkmxR1YEOF0fmK2i+DWkapNVHDx3LmaC/wJD+C
	 Jf/lm1wEIeLOjdo2ufN+GK+BuwkQHv/iMAfN06XBv1lZXkTxWmqp3v44HLpnnmTTHB
	 CVMEpAf13Ee+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBp7X62VWz4x3p;
	Tue, 11 Mar 2025 20:17:27 +1100 (AEDT)
Date: Tue, 11 Mar 2025 20:17:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Dave Airlie <airlied@redhat.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Jocelyn Falempe
 <jfalempe@redhat.com>, DRI <dri-devel@lists.freedesktop.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the drm tree
Message-ID: <20250311201726.3f45cc67@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WRC61WYquP.DU.LnirxUgyK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WRC61WYquP.DU.LnirxUgyK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  drivers/gpu/drm/drm_panic_qr.rs

between commit:

  dbed4a797e00 ("drm/panic: Better binary encoding in QR code")

from the drm tree and commit:

  fc2f191f850d ("panic_qr: use new #[export] macro")

from the rust tree.

I fixed it up (I guess - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/drm_panic_qr.rs
index 5d21f6d10bcb,ecd87e8ffe05..000000000000
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@@ -27,7 -26,8 +27,7 @@@
  //! * <https://github.com/erwanvivien/fast_qr>
  //! * <https://github.com/bjguillot/qr>
 =20
- use kernel::str::CStr;
 -use core::cmp;
+ use kernel::{prelude::*, str::CStr};
 =20
  #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
  struct Version(usize);

--Sig_/WRC61WYquP.DU.LnirxUgyK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfP/6YACgkQAVBC80lX
0GwUWAf/cQViY4ylwkS/1xzQYSshSANM8Mdpc2O/hl93LFKTqI8CF5tz1s3Dnsxv
2Ds3e0pQED2VnOw2OAStVpKgJg/Mq48TCIiCpXV/5LYZ+/3pcChKI1X67KfXo6Cc
ZP9DPeJ6UoVQytvYSzzzAbvPm/HUHlIEkygRcTFvS/VhzsdnQ20w2JtcCqWGkv5D
P05bDe2xfremGB0zndwq8/GgQImITGSfQXaKy9htzlDqHubY270OYZlvqM/hYYbx
J9z/Dx4nPQnTQ5QtMKeVXPkYN+uIU235nebW+hQznrn8BV85Z026T9nuLROYwWmX
KVEgdPK6N7NJeHXiOqM5YO4JpIMfSg==
=O7nl
-----END PGP SIGNATURE-----

--Sig_/WRC61WYquP.DU.LnirxUgyK--

