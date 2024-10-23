Return-Path: <linux-next+bounces-4398-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B61DE9AD87D
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 01:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 778E128352B
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 23:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53DF1A76C6;
	Wed, 23 Oct 2024 23:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="l80aIdu2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D380319AA46;
	Wed, 23 Oct 2024 23:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729726641; cv=none; b=f9EUSyOP0nVapCgw7223YpXmdSjb39ryoIhMvJHhYI33rPXrOxaJ3Bfy6P3K2EGimQe/KTa1tRtXqjoeKAAjOZ8RNyqElhdF6m9WYwwXjbImBGDucZhUYg98x+v7WVgYjXs2E2C6PmzYCRv2NBbPGYfsu4Kahzq0z5iXK3DUnos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729726641; c=relaxed/simple;
	bh=jvEW7M/2Wy1ouSMENyscr8ajCw0EWEl4qsMq71ObCpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=M+EVTMi10QLUoLFiuAu0Ja4XZTFZZY5v/LQHmUQ2qIHf1SGjVmrOChYBfVnlI9hIWxC0jE3BUo6GJD8oETwrxR1TfgOWsLT3jTfrSIWza3etHh78ryE8p0Nck/Kiacp+8S+PlS7zH9VCLBbONlbAu/XERfPhZ8gJjHykonM5VT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=l80aIdu2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729726629;
	bh=DVrwPjlSA8slzRRFdNniClCFcvVjFgkVm2FybuI7RJI=;
	h=Date:From:To:Cc:Subject:From;
	b=l80aIdu2VtySIwdRf8OAkNzORxGIx3zPAyyAcEtCU/ZeJ4nyHAHQAho0r+cPVxxT0
	 1+LwDZ4Pa6oZTTbvICylwNijcTLoTfXDGBN/UxO+mId/4u/DQhea+i/RSwBTneYu2i
	 fRIlIUMrZqRinydpQTkcUCwrqHRyLZ3Sz1uNkPTtq5KmE1zel+MUu9EVq+sVLNaSai
	 lS81KHCO8ZI5IyjMiwE66JY6ktUZktU3SGuvhAPy7P0PeWvtHPeNMx01LRgaFv1aKQ
	 eIhWISYq/p2CqpcEgpZjDEiL0eG57aS0XSVK/XauXOqPBELGKdpz4pmYpt6KsnntQ1
	 6IqJpuXbKYF1Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYlnc6LtQz4w2R;
	Thu, 24 Oct 2024 10:37:08 +1100 (AEDT)
Date: Thu, 24 Oct 2024 10:37:09 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>, Steven Price <steven.price@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>
Subject: linux-next: manual merge of the arm64 tree with the mm tree
Message-ID: <20241024103709.082a6950@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h6KiDNTddnBx2eAO7DM+cSi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/h6KiDNTddnBx2eAO7DM+cSi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/mm/pageattr.c

between commit:

  040ee4186d6c ("arch: introduce set_direct_map_valid_noflush()")

from the mm-unstable branch of the mm tree and commit:

  42be24a4178f ("arm64: Enable memory encrypt for Realms")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/mm/pageattr.c
index 01225900293a,6ae6ae806454..000000000000
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@@ -192,16 -202,86 +202,96 @@@ int set_direct_map_default_noflush(stru
  				   PAGE_SIZE, change_page_range, &data);
  }
 =20
 +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool val=
id)
 +{
 +	unsigned long addr =3D (unsigned long)page_address(page);
 +
 +	if (!can_set_direct_map())
 +		return 0;
 +
 +	return set_memory_valid(addr, nr, valid);
 +}
 +
+ static int __set_memory_enc_dec(unsigned long addr,
+ 				int numpages,
+ 				bool encrypt)
+ {
+ 	unsigned long set_prot =3D 0, clear_prot =3D 0;
+ 	phys_addr_t start, end;
+ 	int ret;
+=20
+ 	if (!is_realm_world())
+ 		return 0;
+=20
+ 	if (!__is_lm_address(addr))
+ 		return -EINVAL;
+=20
+ 	start =3D __virt_to_phys(addr);
+ 	end =3D start + numpages * PAGE_SIZE;
+=20
+ 	if (encrypt)
+ 		clear_prot =3D PROT_NS_SHARED;
+ 	else
+ 		set_prot =3D PROT_NS_SHARED;
+=20
+ 	/*
+ 	 * Break the mapping before we make any changes to avoid stale TLB
+ 	 * entries or Synchronous External Aborts caused by RIPAS_EMPTY
+ 	 */
+ 	ret =3D __change_memory_common(addr, PAGE_SIZE * numpages,
+ 				     __pgprot(set_prot),
+ 				     __pgprot(clear_prot | PTE_VALID));
+=20
+ 	if (ret)
+ 		return ret;
+=20
+ 	if (encrypt)
+ 		ret =3D rsi_set_memory_range_protected(start, end);
+ 	else
+ 		ret =3D rsi_set_memory_range_shared(start, end);
+=20
+ 	if (ret)
+ 		return ret;
+=20
+ 	return __change_memory_common(addr, PAGE_SIZE * numpages,
+ 				      __pgprot(PTE_VALID),
+ 				      __pgprot(0));
+ }
+=20
+ static int realm_set_memory_encrypted(unsigned long addr, int numpages)
+ {
+ 	int ret =3D __set_memory_enc_dec(addr, numpages, true);
+=20
+ 	/*
+ 	 * If the request to change state fails, then the only sensible cause
+ 	 * of action for the caller is to leak the memory
+ 	 */
+ 	WARN(ret, "Failed to encrypt memory, %d pages will be leaked",
+ 	     numpages);
+=20
+ 	return ret;
+ }
+=20
+ static int realm_set_memory_decrypted(unsigned long addr, int numpages)
+ {
+ 	int ret =3D __set_memory_enc_dec(addr, numpages, false);
+=20
+ 	WARN(ret, "Failed to decrypt memory, %d pages will be leaked",
+ 	     numpages);
+=20
+ 	return ret;
+ }
+=20
+ static const struct arm64_mem_crypt_ops realm_crypt_ops =3D {
+ 	.encrypt =3D realm_set_memory_encrypted,
+ 	.decrypt =3D realm_set_memory_decrypted,
+ };
+=20
+ int realm_register_memory_enc_ops(void)
+ {
+ 	return arm64_mem_crypt_ops_register(&realm_crypt_ops);
+ }
+=20
  #ifdef CONFIG_DEBUG_PAGEALLOC
  void __kernel_map_pages(struct page *page, int numpages, int enable)
  {

--Sig_/h6KiDNTddnBx2eAO7DM+cSi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcZiKUACgkQAVBC80lX
0GzXLQgAg+y43CCIGt2sLeBS0FUocmTpxuHfrTFiPdgD856aHp19JoXVFxquXdAg
oRef0V4j6a1yQi+yCdAVT1X12MQaclOiWYLC2rco95oJn9wpBGyRHDxPo2q2lHcc
8KaFx4qKNfak7Pe8NKMkNE4HeeneaOXU+N8XtGwzGUalbNwUCuY2N0A4m0vp7Xyk
iDCa1RjNl+VSVmo2EDR6Kf3T+jqv/0XeHb4EQr2V4XVNFbWzKzwSgiyy3v3gqFPC
uSIhyPOefH3K6Zp7G04gLafibpGF/i8MgmL5Hx0LXe5YXK+fXIpz9aIuRpDmnYUR
GwMmks+PaX2tQ3PVRiDSVkTj0wClqg==
=vK9w
-----END PGP SIGNATURE-----

--Sig_/h6KiDNTddnBx2eAO7DM+cSi--

