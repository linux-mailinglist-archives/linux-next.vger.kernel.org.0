Return-Path: <linux-next+bounces-9529-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1FBCF1A70
	for <lists+linux-next@lfdr.de>; Mon, 05 Jan 2026 03:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7DC230012E9
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 02:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1D731AAB8;
	Mon,  5 Jan 2026 02:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YecCtn4l"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61E331AA9B;
	Mon,  5 Jan 2026 02:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767580699; cv=none; b=rLmQGrKRtDk/94xD3UPg0sA/X+WjL2vJgf/5Yhs3HQRYOGLXFoM/Ec5PdJst9jZ4rhrl7+kKQk9WB6ylOgIVzjQQpDoUVjurtf0ve3ph5VYBmqOz5ORURoGYubUMUPX2n5Z/siExiaDbtkf4/4iUe/wAVggOv0uPbfsvk9sH0lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767580699; c=relaxed/simple;
	bh=52wZE7gO6QMm5QpQWnFBi0J8PIBlhOyqamynRmIEAnE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VH/IidzJg7tZNPJVTerec4gnSDkxXWIqrFnDhxFrx/BySUk7v/LUHm17vn15npCDf4cFlSP3GCVkgwz5Cialy/TX8+T+/gVsejT7QhINbJ2nLN2UsJpwvrVyyxdWOSDLj9Y9od/58ScGsW+3vhB2d0aNd/SZ/t9VKDhj7VYgUBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YecCtn4l; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767580693;
	bh=IvYy8+SFlgXlbORH+cWUW3xw4G5yJ/9fCeS0Hqh1sp0=;
	h=Date:From:To:Cc:Subject:From;
	b=YecCtn4lZWPl2/CxzT1PQFFCeIEUX8nqnb3G1ESLdM96VWg2fnglUhUpDbz7u/SjB
	 7sbeTk1T6lWaxNAE0bo5nO0E+pg1PDjGuWo+JgvNjGw1RNNE6zsDVUfh1nq9F5VCEZ
	 kfxXHqOtjfV/6DMBacZBD2BV+Cy8V4kukRxMbTJc63JT+l76UE/o3X8FMlsCJ4HruK
	 OEjA9rKtp5zgiFTKS9JD7geYISm5aoQlQrrRO1QQSlPSIt8J8FpfT4kM8oNhgW56xf
	 i7It/JMwvusm7hz0o+Fcf7E0F+rMqKba6lZGqT5a4bliwYuVf03RF/ZmN5z6lrXCLo
	 q1XzKHUmRLayA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dkz4N15Hbz4w0H;
	Mon, 05 Jan 2026 13:38:11 +1100 (AEDT)
Date: Mon, 5 Jan 2026 13:38:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Helge Deller <deller@gmx.de>, Dave Airlie <airlied@redhat.com>
Cc: Jani Nikula <jani.nikula@intel.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Prasanna Kumar T S M
 <ptsm@linux.microsoft.com>
Subject: linux-next: manual merge of the fbdev tree with the drm tree
Message-ID: <20260105133810.37a2af1d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nHn4+IosAIeOIutk54cEsVY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nHn4+IosAIeOIutk54cEsVY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fbdev tree got a conflict in:

  drivers/gpu/drm/Kconfig

between commit:

  6d2b55f7d701 ("drm/hyperv: move Kconfig under driver directory")

from the drm tree and commit:

  18e7e9aa3237 ("drm/hyperv: Remove reference to hyperv_fb driver")

from the fbdev tree.

I fixed it up (I used the former version of this files and applied the
following merge resolution patch) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 5 Jan 2026 13:29:10 +1100
Subject: [PATCH] fix up for "drm/hyperv: Remove reference to hyperv_fb driv=
er"

interacting with commit

  6d2b55f7d701 ("drm/hyperv: move Kconfig under driver directory")

from the drm tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/hyperv/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/hyperv/Kconfig b/drivers/gpu/drm/hyperv/Kconfig
index 86234f6a73f2..e48e35fb7f8b 100644
--- a/drivers/gpu/drm/hyperv/Kconfig
+++ b/drivers/gpu/drm/hyperv/Kconfig
@@ -8,7 +8,6 @@ config DRM_HYPERV
 	help
 	 This is a KMS driver for Hyper-V synthetic video device. Choose this
 	 option if you would like to enable drm driver for Hyper-V virtual
-	 machine. Unselect Hyper-V framebuffer driver (CONFIG_FB_HYPERV) so
-	 that DRM driver is used by default.
+	 machine.
=20
 	 If M is selected the module will be called hyperv_drm.
--=20
2.52.0

--=20
Cheers,
Stephen Rothwell

--Sig_/nHn4+IosAIeOIutk54cEsVY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlbJBIACgkQAVBC80lX
0GxIZQgAiTumsYcrtsyrScYPxFmTY7cwgpIcZQzhRdDCtx4Uc27G4SSwycGqmQ7o
4v7hiVq2H5HxWydZhwhmj+No52YCE72Dd8A6g4Z8zk9TOwYoudOaho8l+/NsEqE1
d3vbT3TSQMWvjOlZObPp+1Tfj4ql6q9qDKqyCcLXsvMy+PnozgM9HITk0vaFSSLd
KcjCF1ZL+6I5dJuH2l5TvVWKc70ha6IJuGGO4ykGCOX0+HuCQeocCVBQJEzKG/n2
FH1x2QWIDjRogOyu7547CSGPwCL2jIMF8rV51ln71w94cjjtBYui+RMOTWc0Zoz9
yDnB7FZbXo8qYnBo727swWbfocklsA==
=LyDh
-----END PGP SIGNATURE-----

--Sig_/nHn4+IosAIeOIutk54cEsVY--

