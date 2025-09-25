Return-Path: <linux-next+bounces-8487-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6575BB9F468
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 14:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 520684E363C
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 12:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2962030A;
	Thu, 25 Sep 2025 12:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVECrwdM"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CF44A21;
	Thu, 25 Sep 2025 12:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758803738; cv=none; b=f8sNj+WY0nHwPRsyAWRtSc7H1dctc3y+15eCnQlBnvz9nNxrvuAWXb26rDOcwjzVASdkrFGJ0N6RZQ7sfHX3HoYQEIAAnyT+bNuA9PnppETE1SmlA7uqctoDMplC8AWmUmOs2CF5ywOBgOnEZbpTZyfCP3KjUI3zFAdco2pqXBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758803738; c=relaxed/simple;
	bh=CQinFZPBqMvNcFP8gCdr/mqUbTX/fLhBgi5qrltU+QA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=thpn3O4W3W+xyCmxSROMyYAf5dDj0FKNK90RGM7+6IBPtqb+Cthhy8XnY5IKnmgDkWam0OIwn+n+TyXW9Fx7BgMbevI9KgrbFIpmd9cJcyT+LDkwOFw4pdaZNHaiNsu2O76sj/zmPaxk6cEityzmxqZoyLmT4U12L0e0wJtBqAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVECrwdM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14214C4CEF0;
	Thu, 25 Sep 2025 12:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758803738;
	bh=CQinFZPBqMvNcFP8gCdr/mqUbTX/fLhBgi5qrltU+QA=;
	h=Date:From:To:Cc:Subject:From;
	b=NVECrwdM2R05bvC3f8oZtL4YmQG/ICSQg8G5x0BRFhCZnb2rmR/AQ7/MhfOIAZbmR
	 2o0K4/MrwWQoHc6+RMRoUL5mMCTTBQE6QSx8cXRxpxsyRUo6va7moluz/vdtPqv9ia
	 XbfuhhXDxHyH/GHotqxzI1WLAds8WElu9WcMvWtFKz8DmG3HR8gmo5C1s/oJ9LqXsx
	 GeBTIh2TiP7KP0WO1AM5vRKFSdacuaVvyoYcJ6rD25JbtMl3QyeHjC2kXrQgfRcYHF
	 8PX+6F9e8d6IGT5AiFy2Ok9iE3Fwm2qaOZL3FPrntyhH+xdBwufVD4BMCmXWnXrehP
	 dMuNemayz9ODA==
Date: Thu, 25 Sep 2025 13:35:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	NeilBrown <neil@brown.name>
Subject: linux-next: manual merge of the vfs tree with the vfs-brauner tree
Message-ID: <aNU3FtEZ3w_NcYwI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dz8LxaG2G962ookz"
Content-Disposition: inline


--Dz8LxaG2G962ookz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  Documentation/filesystems/porting.rst

between commit:

  3d18f80ce181b ("VFS: rename kern_path_locked() and related functions.")

=66rom the vfs-brauner tree and commit:

  b28f9eba12a49 ("change the calling conventions for vfs_parse_fs_string()")

=66rom the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/filesystems/porting.rst
index 78c3d07c0c08e,ab48ab3f6eb21..0000000000000
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@@ -1290,10 -1290,10 +1290,22 @@@ parameters for the file system to set t
 =20
  **mandatory**
 =20
 +Several functions are renamed:
 +
 +-  kern_path_locked -> start_removing_path
 +-  kern_path_create -> start_creating_path
 +-  user_path_create -> start_creating_user_path
 +-  user_path_locked_at -> start_removing_user_path_at
 +-  done_path_create -> end_creating_path
++
++---
++
++**mandatory**
++
+ Calling conventions for vfs_parse_fs_string() have changed; it does *not*
+ take length anymore (value ? strlen(value) : 0 is used).  If you want
+ a different length, use
+=20
+ 	vfs_parse_fs_qstr(fc, key, &QSTR_LEN(value, len))
+=20
+ instead.

--Dz8LxaG2G962ookz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjVNxUACgkQJNaLcl1U
h9AcfAf/RH1DAMSonisfukSbVNWu0DCMip3MRxPvp577BW1X1Px5Ody7qpZPwQPb
2HhyLGgePt8n42nktFTQTJ1TFOzD0aXhObX2NMsEX87D0GjlWIqlUAt9LzOfjPUt
93MY4pgMrEzRcpUR20BC8jBsp2jKFCq4Tp0bd73Jc1wRHNj5MA6s281PnFFeuXzL
JcU0j1GqvsmOI4Y76bc+Xu/TL/CQhW88lRaCXhKre80BMndK4jI2HfPUzzQcCmbp
d+qpzI9ZVVw64gq+ALDTL9S0BaQk36lsmt7Brr4zAYMp/SjpoOpOwbO38C76cB9h
OlZWsnlOuTOkDryVjHzt8wU7qbnOJQ==
=2m7w
-----END PGP SIGNATURE-----

--Dz8LxaG2G962ookz--

