Return-Path: <linux-next+bounces-8315-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B292B58754
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 00:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEE664C5527
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 22:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C56A2C027A;
	Mon, 15 Sep 2025 22:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TrVIcQYt"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AE12BF006;
	Mon, 15 Sep 2025 22:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757974734; cv=none; b=HpImzm1kT4UwNS4xep8/MnB7EaWe1np/HeeOUM92K6ZlscfWKe0L8bA9nRP4/6lojZ8YIah5xwSHpHpu6h8M0x+c9fkVfKKNK6ulY04x+m6qhaX4+361UepmXOokK0Np2RdeYi4swMt8E89Q5H7ZYSXGWMrgp1Ejib89hbzKck8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757974734; c=relaxed/simple;
	bh=GBVGutzOm/5GaShiFeo3Q28vRMzuauGYMvz6NFBS724=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AK3YDT3kJwlCFr1pTILc7loHtdPe5KBi7/knEZPbKiCKQDhpJlD93EVqu+WgE/CFeLj1yyCbVtHC8xxqkxTXJvc1MobqwSjgY8aKAiV5lanVo5w4i4I+w5l0EKswumldZluHpVrg1+xi8YMEbTNIrTE0l4gvqkmF5XGhAeQhINE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TrVIcQYt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FB9C4CEF1;
	Mon, 15 Sep 2025 22:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757974734;
	bh=GBVGutzOm/5GaShiFeo3Q28vRMzuauGYMvz6NFBS724=;
	h=Date:From:To:Cc:Subject:From;
	b=TrVIcQYtXTtv3zB/w6+IBbKkL1zc3GumkfzAR2F+QWGh5mdlPnWEOInSN4jBSJjqy
	 53Fg6NH9Z356ZkXGIZh2VRBz9VA1tJ0SZMJCVSadPkcnwHQZLeN7woYXSX1LCN30GQ
	 Zg1+ZSolyC10X1vFDr+4SrC2gtnueIzcnRwrpHpPcO0CaeSVf5U/XgVKpWEBDT72r1
	 dy3FrirtA78OUdZLJ6+4Sb2UANMzbeFTyPWRbDdD/LHwOZIEh/sJe/h+Z/nRHU+koN
	 QVyO/KQtRB9GmOElcTAOrA/6kdXMQaG41+OqIymC64bFjECoUTrFbTyUQADs2zm8uB
	 cZREkligKuYNg==
Date: Mon, 15 Sep 2025 23:18:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the origin tree
Message-ID: <aMiQym27AQtvHZF4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I1vlnUjixT2C8oOM"
Content-Disposition: inline


--I1vlnUjixT2C8oOM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got conflicts in:

  drivers/gpu/drm/xe/tests/xe_bo.c
  drivers/gpu/drm/xe/xe_bo.c
  drivers/gpu/drm/xe/xe_bo.h
  drivers/gpu/drm/xe/xe_dma_buf.c
  drivers/gpu/drm/xe/xe_exec.c
  drivers/gpu/drm/xe/xe_vm.c

between commit:

  5c87fee3c96ce ("drm/xe: Attempt to bring bos back to VRAM after eviction")

=66rom the origin tree and commits:

  cb3d7b3b46b79 ("drm/xe: Attempt to bring bos back to VRAM after eviction")
  0131514f97890 ("drm/xe: Pass down drm_exec context to validation")
  8f25e5abcbfb9 ("drm/xe: Convert existing drm_exec transactions for exhaus=
tive eviction")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/tests/xe_bo.c
index 7b40cc8be1c9c,2294cf89f3e11..0000000000000
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
diff --cc drivers/gpu/drm/xe/xe_bo.c
index 870f433472811,8422f3cab1139..0000000000000
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
diff --cc drivers/gpu/drm/xe/xe_bo.h
index cfb1ec266a6da,a77af42b5f9ea..0000000000000
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
diff --cc drivers/gpu/drm/xe/xe_dma_buf.c
index 95d06bd65b0f1,607c3f4ef3b92..0000000000000
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
diff --cc drivers/gpu/drm/xe/xe_exec.c
index 374c831e691b2,7715e74bb9454..0000000000000
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
diff --cc drivers/gpu/drm/xe/xe_vm.c
index c00a5ff318176,0cacab20ff852..0000000000000
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c

--I1vlnUjixT2C8oOM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjIkMkACgkQJNaLcl1U
h9D7xAf+KfdxYydkIcx05/o2bSzdvlfnAKJX2ncpmuTtt0awnSihQAql9M/8g6Ds
pAANugXfHVmLa6mMDBVruOrceDIVLzCUOd2G7QlsbIdMdiz/8Q1qrSrNVCQflRXB
Ek4NBv3VoserQ9c/u5jojD55GfC5/iTafUuC7x9tAEA2ezcSN+gMAQsuSZMTlJp8
b6NpXI4HNLW8ul6u/G5S8FyuM5dBd6oOuVByVNq8NuZmFUazeZUQZNyfdrUUU/6p
/75Igrq2iqSCs1Iy93vI/MZvP6IgN7fixtIOSyGqXFINm0xBstrBYQkFhmKmykT2
lMQEZ2t//Zp75FOax/Lq9yAygoLI4g==
=lTeh
-----END PGP SIGNATURE-----

--I1vlnUjixT2C8oOM--

