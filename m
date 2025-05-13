Return-Path: <linux-next+bounces-6720-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4456DAB4A41
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 05:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C65B863E3D
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 03:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702ED1A0BE1;
	Tue, 13 May 2025 03:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Gewzh6L1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCBB79D0;
	Tue, 13 May 2025 03:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747108528; cv=none; b=qiB7n0RsABh3hLMD528QEP87kqoOEdf1lpakbJvoGPSOnb3PQK+UWI0RTr7MtWt3yZQK3Onq2/TNm4VSUjgfOKLg6wFVWaAGZRTAVBNMJ86tRfk9rs+YNJ+vsJpO8i5nF6fm7NxfbNwFXvfQszDvvBlfjX4Q4M0K4UYClJeZWj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747108528; c=relaxed/simple;
	bh=/o2DtnkczH7KwZjfZ/Cxt9Wkjl+Y2Xl5hK0/Ol0LLAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jRc23aphtCiHEUA1vUBorlb2kkB3MbMYO5vpuXRDvaiu69o4H+Nc77uweOKhiQy8qg69DeMdnaA+921hsu7t+b6cJbwpG8prOQb0Ed71akImAS1AWeQchq3scGE60GAa5m+bDkTmCQJ/ak6+LrdIv3TQAvH0h+YdtF64GmBTfMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Gewzh6L1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747108522;
	bh=tWVMjAO5RkJxMSaf6B38mDETfmsBO15qoaCMdSv9Vrk=;
	h=Date:From:To:Cc:Subject:From;
	b=Gewzh6L1S+NCnPWJ9JmvnSALE+XOmDlO5WyPv2gFClNMaMlp0nb/tjzUszSFWmnPu
	 XSk+4GQ6qIaKW4/kzvZ7ls7/b1BdqIoPCnH/MyWuULep5u9NR9Jlfy+JxUIwLjuKh1
	 e5hrQj+Claey7VwDs2qpej6rWx1zfMHM5EUS7uWPNFHA5RY4MyDU+gA7mbLIvts7QJ
	 sbrlaqQmsRLJGQXw95WNviFmj8yTqGbFvQVBJHP/QS5TsynP4qq6FvvDMZL0gy6BuB
	 UsnFbHShjZSFI6lun7vdGzN5Qn+pHAdx47pBE7njaP1foWt1wWT9FLXiJFJ36owxf1
	 lexnX+D7FLBsA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxN0p1djtz4x5g;
	Tue, 13 May 2025 13:55:22 +1000 (AEST)
Date: Tue, 13 May 2025 13:55:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg
 <a.hindborg@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-nova tree with the configfs
 tree
Message-ID: <20250513135521.44a26953@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VVA=2yHFYQrXT02XcAyLpGK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VVA=2yHFYQrXT02XcAyLpGK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-nova tree got a conflict in:

  samples/rust/Makefile

between commit:

  1bfb10505156 ("rust: configfs: add a sample demonstrating configfs usage")

from the configfs tree and commit:

  96609a1969f4 ("samples: rust: add Rust auxiliary driver sample")

from the drm-nova tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc samples/rust/Makefile
index b3c9178d654a,6a466afd2a21..000000000000
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@@ -8,7 -8,7 +8,8 @@@ obj-$(CONFIG_SAMPLE_RUST_DMA)			+=3D rust
  obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+=3D rust_driver_pci.o
  obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+=3D rust_driver_platform.o
  obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+=3D rust_driver_faux.o
 +obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+=3D rust_configfs.o
+ obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+=3D rust_driver_auxiliary.o
 =20
  rust_print-y :=3D rust_print_main.o rust_print_events.o
 =20

--Sig_/VVA=2yHFYQrXT02XcAyLpGK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgiwqkACgkQAVBC80lX
0GwvMwf9GGmlyzLg7tZbhfyxZqPsJX6EA31tTLyI7vqMZZpMzYZWp4hbXUWcxjfw
LtYTjlthQgnT4UJTZumOPmdSnWES1jiW42oBCbPFEO2r5zfPncSVH3AYH8aEw//t
QMCfneuG0VgQ8NCTpvqElWUI4S71qJPkgs8Qj1zGo4c6i4isrdiAGsc5LUZJHWQB
zm3G5GTdp5Q0TpOv/5BcusYtxDlFp7NwvkxPQM+9nV7vITAJb/XBHUB4XmCGIQPt
YvypnIlfEPaPzgp+SI2l39YnarxVPmE44fuWfdNzmDcQ/ji8jtZyYuDPJcvAaUSK
8gUk/6hnVzmEFzmYOKzU7Qoa1PplzA==
=NJVB
-----END PGP SIGNATURE-----

--Sig_/VVA=2yHFYQrXT02XcAyLpGK--

