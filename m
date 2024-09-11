Return-Path: <linux-next+bounces-3744-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 708739749EC
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 07:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28B7A287792
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 05:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804CB73477;
	Wed, 11 Sep 2024 05:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FZTMjzZg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885D126AFB;
	Wed, 11 Sep 2024 05:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726033415; cv=none; b=H74KMgSb3CVBNjrzsaTQla5ZQWiEG9axa3E9x96JEGhholJLaEch/297nK04YPeb0FRGhZZanIoJaWExmbP77ezMpJ8Xr4gefr4bV3nrLkREEnkFvVYzqURfsXTU6ICY8DzpNDCIJ+VAa0FarJ9KeUjzu4V98FlsxViE6HbZA4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726033415; c=relaxed/simple;
	bh=VlS3NsZIzAMxM7KXIII+8oLkym7W/vjEz+ZoPT3s0MU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EFIP0NoO7tkkUWLgWwl3vzs3p2nrnu5XyrPanSBnxhNSNcOxs3cZjD9D/ASg68w9ovK1qOwwvlVnUmYpMfm1B9M7SPmt9zxcswLEpEmEisHu7KSPe7dL/a6FC40cS7+p7155hcjSaCNBjU0ZSiI69fD9PmyUe5dB3W77+UVEVC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FZTMjzZg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726033409;
	bh=+q4kqaN7a+lvp4ahjs/Kx5nw4NwssQDJorY5CGfUBlU=;
	h=Date:From:To:Cc:Subject:From;
	b=FZTMjzZg0EkSNcgLc02KUq+4PHTv3Wnc1oo17OFb81HA570p7Bjg1vNEzF3u58Shm
	 DA8jT/zYtRltT1Kzu/+3Vjdz142EaFMkmpgw8pWtolxFFL9AIm3vXBDA0F2CyooTvy
	 2kKLM+2bvaZxtOqkVR/REV+PzG11Zy4t6CNqHgJt2geXhJTkbaroi/AJmbFAfiOn5J
	 DvBmbtyQSlZGUlI5GGLkehnOoH5hnyvCm7AsS0wfJBcy2e9d4Lb65gdLxKdBg8Uh4A
	 km7gJrOIw6Qm+ygjne3EmEwkWKi0ZwzETubOdaKNKjpMN0dZj9R2L9dSzS75jKCu7V
	 uLZe6p7yd0zEg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3Ty930ZRz4wj1;
	Wed, 11 Sep 2024 15:43:29 +1000 (AEST)
Date: Wed, 11 Sep 2024 15:43:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sean Christopherson <seanjc@google.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Janosch Frank <frankja@linux.ibm.com>
Cc: Christoph Schlameuss <schlameuss@linux.ibm.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kvm-x86 tree with the kvm6390 tree
Message-ID: <20240911154328.0ad45c38@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Di1oPHrlNlMz.2k9WYF75V+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Di1oPHrlNlMz.2k9WYF75V+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  tools/testing/selftests/kvm/.gitignore

between commit:

  011901fc2224 ("selftests: kvm: s390: Add s390x ucontrol test suite with h=
page test")

from the kvm6390 tree and commit:

  9d15171f39f0 ("KVM: selftests: Explicitly include committed one-off asset=
s in .gitignore")

from the kvm-x86 tree.

I fixed it up (the latter includes the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Di1oPHrlNlMz.2k9WYF75V+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhLgAACgkQAVBC80lX
0GxgMAf/SAmS14BcGLwOtXE6Zr2g76PZoXrGXLKH1JiI2e3uUfTgig1yh9rF3OZX
VXkNoyiU86rh+u4vgRHxo0rVw6hPPoKPB/XkymlVM6FU3/UbV1YQdBQgsEVcpbeA
bBHs/v9+tloHPZRbMgiZgvflRHj84ndewWGOA5PbNS3HMi6K/zdOgJ8sCXuchias
XZ/5ZnHYc7lZlOBuUcpkr6UtxxBxYwtmvJMTfWvTwfQ9mMXLe3iSu1cPaek+8jH8
ogS0m0UvGettixlaG81mgq2nnE2/UfHFuqDhD/EzKfMG1JuZhOR039aNntTNEDP+
zRCLaYZJnS54SGbuZBirBgG2YZigZQ==
=SUMK
-----END PGP SIGNATURE-----

--Sig_/Di1oPHrlNlMz.2k9WYF75V+--

