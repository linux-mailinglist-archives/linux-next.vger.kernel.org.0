Return-Path: <linux-next+bounces-5808-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25219A6414C
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 07:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE4993B09EB
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 06:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191732192EE;
	Mon, 17 Mar 2025 06:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VBVWs58v"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9F721507F;
	Mon, 17 Mar 2025 06:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742192468; cv=none; b=E/ItV7Pb0LU0ALvVOFnPLKCIPO8hgRZV1YwNHK2Mb52LxGHbvKy6PoYpyOhXEhZN2rRY6FbTnHGWu/tCpwkVWLNWJ1u3ASha19R7Me4WKprTSfq4Ile3x/9HVSUcQyPF58hP49R8fQUsspH81yEpr2T+/ng7lW1Kzft0uORSUjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742192468; c=relaxed/simple;
	bh=DY65S/eaAe0lSaaJe6wGzBroVX8E0H+aFgkQHZa2Xqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kPh67Ip+gNFmvF67+FmTVjBALMyMbwnEPX6b13qRGHQw2WNdOZEElN5JyUdxeG32b5sj0MrtbmBklqn5Z5P1rxLcGL+q4ERJoVItdMF5wo+fa+k7zxq+6XztW6xso/fZQ5NQhIo7ZPyTAkIWpbOm9EAf6EGOSnHMSKOfp67v1hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VBVWs58v; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742192464;
	bh=08Bj1pjXMDLtnB6VIdIazoGwkx7T89OS5iY+pYk8VpM=;
	h=Date:From:To:Cc:Subject:From;
	b=VBVWs58vqx+z0nbuT+UdVV3x0+h3wJ3/ztYzJbsCKCXN1DNB/0l914NW2WlgXp6t2
	 UuQyedE/7rSyGcG1BnGJZVzg6c4cPdEr253TMA34Ivd1dLEwxtQyE+/BdUP1F1Pj28
	 ajd//kASBGZ/ihnyJPmjyOELHkaTV13xcF3MXMtwC6Z1SI6bq7ZhjTa9CjAQm3f5ZW
	 ZhoifK446J8X67aulaSdjMaTuHiKXW/rC9bQZN4ank+Wc+iTtV+WLmVTG5CoA6waXf
	 Fx8DiDi84/q1K+X+lU+RKh4Ggm7jL0XyTz3n1njftrS8BeLSLq5cUQgUDMNc7PKMXi
	 WiCJi7G6aPnIQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGPxC5b7xz4wcj;
	Mon, 17 Mar 2025 17:21:03 +1100 (AEDT)
Date: Mon, 17 Mar 2025 17:21:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Oliver Upton <oliver.upton@linux.dev>, Shameer
 Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <20250317172102.55f7c4d9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z02MV.EVBK30+_Gr6zIYge9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/z02MV.EVBK30+_Gr6zIYge9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/kvm/hypercalls.c

between commit:

  d2c173acbf93 ("KVM: arm64: expose SMCCC_ARCH_WORKAROUND_4 to guests")

from the arm64 tree and commit:

  c0000e58c74e ("KVM: arm64: Introduce KVM_REG_ARM_VENDOR_HYP_BMAP_2")

from the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/kvm/hypercalls.c
index 876e6f29a73e,569941eeb3fe..000000000000
--- a/arch/arm64/kvm/hypercalls.c
+++ b/arch/arm64/kvm/hypercalls.c
@@@ -397,7 -391,7 +401,8 @@@ static const u64 kvm_arm_fw_reg_ids[]=20
  	KVM_REG_ARM_STD_BMAP,
  	KVM_REG_ARM_STD_HYP_BMAP,
  	KVM_REG_ARM_VENDOR_HYP_BMAP,
+ 	KVM_REG_ARM_VENDOR_HYP_BMAP_2,
 +	KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_4,
  };
 =20
  void kvm_arm_init_hypercalls(struct kvm *kvm)

--Sig_/z02MV.EVBK30+_Gr6zIYge9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfXv04ACgkQAVBC80lX
0GxgTwf9HpbUNwt5ZTf46Tr9hnSnm//YMmUxHdPjui/lSdIEdyF6zTNCijc32NkK
56lSXMZGMMzTeOMOQyxbGZo+VJg77s+4aDxmVRoY+KHdlzVVZpkvPZ7UnofXpfon
tfIK5RojMFJ3KPVNfPOyJHWnbXs2JbzZOkELro+C39aPkZHHKySm7ExpTnYMKQ8H
TmaBXLyZUepkp402nC6jYiAD1lVXxLqohsu+8wI3rvgG1SNTU5B3gvvhId/RfX2N
nB0Kc+IEFE9VRGS3ZFXmM5LMzz5hoXPq3B8i4Kk0/07jzx3PncbsbMXDEw93IF5a
2S3cNvBeONz+G6AeALhxrFyIRFgWig==
=lYBZ
-----END PGP SIGNATURE-----

--Sig_/z02MV.EVBK30+_Gr6zIYge9--

