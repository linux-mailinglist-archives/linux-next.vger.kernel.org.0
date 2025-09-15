Return-Path: <linux-next+bounces-8309-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 795C7B585C2
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 22:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34FDB4C165A
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 20:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A771A2877E9;
	Mon, 15 Sep 2025 20:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t8Btn4AG"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAC02747B;
	Mon, 15 Sep 2025 20:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757967247; cv=none; b=FhoD795vgwTbiWoA2W8gyYtCSZMHpUG0tNRXY1KkSC+9zK+CG2vc26Tk3PfAWZIyWmX/v9hWhHMxale2x96q6/0CEtKFGXUEii0gHybukAv992P8yTAyUqrF6oBx8fslH2Y0hrJCJXh75k7Fksp2/IgOKbgj2BFTBthLhXzVKdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757967247; c=relaxed/simple;
	bh=ilJWNxayMThwb1eakcWmL389I9ycMd+B4CpHlsqDUns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N39nO4ZcT3IvVWeI4MP1doo6egk8iMGlBgpVA7cqCqbXjHEig3gpSMkNhz6y0cTSOv+gt+8ZbSO4WciBkNC6BBMuELOXjsBlthRS5NexeLKsI3ViSk2y5Bdalb+TzRzVrbdxBaKCnKMGEcniN4s7ls1sXxB+VDIsOr1QXwpB9hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t8Btn4AG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19046C4CEF1;
	Mon, 15 Sep 2025 20:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757967247;
	bh=ilJWNxayMThwb1eakcWmL389I9ycMd+B4CpHlsqDUns=;
	h=Date:From:To:Cc:Subject:From;
	b=t8Btn4AGX624oRNqXDwTHnU3jPEwCss5S9TQ3VYUW/Wcrx4HRy4AjiVmUBQ0CJI7P
	 smuviIyBwbe7BJf7pw7vhn29glDqakqvWIqy/X1MwqBff+X1/dLw656zwtne3TSr/O
	 dZD9wlra5C8wCwdgDDtVR5UKve2SabnvVvOPXqWXUVg/FiCA2PoP9M5hENgwdjPu2Q
	 X4e5VWfQL9H88rfqga8q4vpemOWWxBGP9CTGsDnRDKsbGNVD6+Eq1zRDSYx5PDbuAT
	 wb5jFkQgQGG6LbYB5XAo72DrJoy/L4Ny1JFnrXAyVr04vuSXJlfTrQ+Pdv9fnEHIR4
	 AvHuBJglIeZaw==
Date: Mon, 15 Sep 2025 21:14:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Amir Goldstein <amir73il@gmail.com>,
	buildfailureaftermergeofthevfstree@sirena.org.uk,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in the vfs tree
Message-ID: <aMhzi0WpakpN7oH5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g22mec4zZxJjSZ1x"
Content-Disposition: inline


--g22mec4zZxJjSZ1x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (arm64 defconfig)
failed like this:

/tmp/next/build/fs/nsfs.c:582:27: error: initialization of 'struct file * (=
*)(const struct path *, unsigned int)' from incompatible pointer type 'stru=
ct file * (*)(struct path *, unsigned int)' [-Wincompatible-pointer-types]
  582 |         .open           =3D nsfs_export_open,
      |                           ^~~~~~~~~~~~~~~~
/tmp/next/build/fs/nsfs.c:582:27: note: (near initialization for 'nsfs_expo=
rt_operations.open')

Caused by an interaction with commit

  06c4ff965e95b ("nsfs: support file handles")

=66rom the vfs-brauner tree and

  efa6ab3688a54 ("export_operations->open(): constify path argument")

I've fixed it up as below and can carry as required.

=46rom 56e625f1566ee6e3940c625a393b3b4e75806b3f Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Mon, 15 Sep 2025 21:03:13 +0100
Subject: [PATCH] nsfs: Fix up merge

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 fs/nsfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nsfs.c b/fs/nsfs.c
index 8484bc4dd3deb..32cb8c835a2ba 100644
--- a/fs/nsfs.c
+++ b/fs/nsfs.c
@@ -571,7 +571,7 @@ static int nsfs_export_permission(struct handle_to_path=
_ctx *ctx,
 	return 0;
 }
=20
-static struct file *nsfs_export_open(struct path *path, unsigned int oflag=
s)
+static struct file *nsfs_export_open(const struct path *path, unsigned int=
 oflags)
 {
 	return file_open_root(path, "", oflags, 0);
 }
--=20
2.47.2

=2E

--g22mec4zZxJjSZ1x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjIc4oACgkQJNaLcl1U
h9CyAwf/VLSSwom0yUiU0ih6pUDDmQsXUANoiHBgFLtBv1EPp6uIm9/vjX/u1WW1
C75Tf8jV9uT+DvRqbVstxEauaZcW+Sohz675XvWHpikrRZe6ONqZW0IPwqY/U0VV
ehiD23h/GYtT/js21M8+uzNu23I73pWVFQwENN7rwxnD0szbIvvqal53Ng6M+aRh
5xWWroFo69mg2Mi+P4IxGLzI8OyeW/E/eU42Gig1nNPEAFqIMUw5756CvMNHYvVT
ECE+VTlFVbG67nquOgMj1NQcOsm9snkgPOweTrSI0/LeEV2q9hHNfHrDDthZ20xt
p19yy4sHRoYTcUBa3lP5bayJrkI1MQ==
=gb/M
-----END PGP SIGNATURE-----

--g22mec4zZxJjSZ1x--

