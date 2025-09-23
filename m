Return-Path: <linux-next+bounces-8452-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D31B96DC1
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 18:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 379172E6653
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 16:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3BC328589;
	Tue, 23 Sep 2025 16:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVgeFTZD"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F28322DDF;
	Tue, 23 Sep 2025 16:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758645738; cv=none; b=LyBdYADfwGqhglpy051YvIRhxqx5Ms+4ZmOmTQlIMHenpVH+JbDEybLcO97NQsmvyzvRa7h/Ksp+TM8nvsrWLLWI0Iv1nc9DVNbGQTXYFq1hxcFitAxrcky9YZQ+qDh8Rpsm7EHr7e/3ARo4Rn43m39JWYYhV4kL4GuWvsJfrgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758645738; c=relaxed/simple;
	bh=yWyoLu0p0FcWaaxUSL2Z4o3LRyP1+KMa3KR9zIHKT7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CEA7j0c/t6MCQqTMw2snvZ3G8ddWG2+sxL8VUk8FTf8QFDha5rOnr1v1N3rP0eLCwbVA0sHlnT6utJTvh/ziSWoEwuogOR88mAgmECcIxUfmNDtBd+rXXZoiBTWh/YA0CAai7CInU3KEnqPeo0q0yHJQm1B7GD6zvDdcKIkcHWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVgeFTZD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91E2C4CEF5;
	Tue, 23 Sep 2025 16:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758645736;
	bh=yWyoLu0p0FcWaaxUSL2Z4o3LRyP1+KMa3KR9zIHKT7w=;
	h=Date:From:To:Cc:Subject:From;
	b=HVgeFTZD9/DU40/i1D45ZfhLX6DE8LKil6PpapUxsk0DiMfuTTlc3XiT+BuoitKoK
	 svcfflAOJ7xAgrG3zbbdsdg9Du28K+KkBHR/O/8k/9JxKflblZFfEn5Tnz01cWJWvn
	 B5VCIc8zgvj8i/hPsy5bv9XFE0WZPP5KEPaIaNrasQaTuhsdztviH4IeMWYD7i4DNO
	 wlY1Olk5Q5iPBXrImXuUy4HXChvAziNU+CzFT7wWj3NnVF1pbP21D8sjVSI6x5ZDAc
	 9Ez+AN5pfipZxDZxdPB+acaNRcwj2xhW14B//kIYR43vLaSKgeCVc903bDnIpfwo9o
	 pfWbobktKtRqA==
Date: Tue, 23 Sep 2025 18:42:11 +0200
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the drm-nova tree
Message-ID: <aNLN45NdHatkNUwg@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xHYMCEVpDHJPI0dQ"
Content-Disposition: inline


--xHYMCEVpDHJPI0dQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  drivers/gpu/nova-core/vbios.rs

between commit:

  93296e9d9528f ("gpu: nova-core: vbios: store reference to Device where re=
levant")

=66rom the drm-nova tree and commit:

  f3f6b3664302e ("gpu: nova-core: use Alignment for alignment-related opera=
tions")

=66rom the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/nova-core/vbios.rs
index e6a0607142056,091642d6a5a15..0000000000000
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@@ -8,8 -8,9 +8,9 @@@ use crate::firmware::FalconUCodeDescV3
  use core::convert::TryFrom;
  use kernel::device;
  use kernel::error::Result;
 -use kernel::pci;
  use kernel::prelude::*;
+ use kernel::ptr::{Alignable, Alignment};
 +use kernel::types::ARef;
 =20
  /// The offset of the VBIOS ROM in the BAR0 space.
  const ROM_OFFSET: usize =3D 0x300000;

--xHYMCEVpDHJPI0dQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjSzeMACgkQJNaLcl1U
h9B21gf/USI/atSnntv3mz1/WKpe5RPG0qkycqKgqjYl5FPHX9mwivqyLEKw4WHU
ORYiWYn2WsrBpUHRtQZnRHWj83mZgnaMXDpXCs7T4DK379Mc6W/Sa4Ka3ZdJDkmz
eBcHggYI3EEz6ld0HI9sZjIdPHHXujCMd6blv0Pc/P4lhoecl9saMaNmM3IM/FIq
ksBKvBtj8ziaR2LylWTJAeCXrXfSvYSG2UIjv23IKHQO4HJkYoLEBDxYtrNXoBhQ
5z/DYovCmy36EybJVtBjxhFaV6yfRh5xXABNsekjzpO8dg4Imf0g5V0e2XKulvIY
SxHCM3VDyPIuFS/15PnCVnU9qTFyDg==
=xMaW
-----END PGP SIGNATURE-----

--xHYMCEVpDHJPI0dQ--

