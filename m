Return-Path: <linux-next+bounces-5769-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 918AFA5D923
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 10:19:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F119B173E3D
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 09:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D328923A57F;
	Wed, 12 Mar 2025 09:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tM5MvYFG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE61323A986;
	Wed, 12 Mar 2025 09:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741771143; cv=none; b=DThoczZMi34A5INyRXDuqonL0j22UtAsRWyazK0x5ZnqbSqGphlW9h7woqPzGbQrg0yDwICx3ZqjK7qECEr5AdXO8w9NSwNFMlmb96RF1EWrEfXWIGDBi6Hh/AOQ9rQ51vLa1JT1oZZk9sryC3Q+bMMVwt6CG0PixC+r1T4ZV1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741771143; c=relaxed/simple;
	bh=Hz4PGmHktukDVkUSR6HeErSQ2T1cv335qUES06oxJH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YyihwejM51g3kmXKN59RpfGFMSBx069lJN6tuyICNiw7TeZECiyBgwqAnWkoR41L9bCiGPVvmbpczmUTFQM/X0ne8u62kKdmO9xATURM5cMs6o6VU4bWHSpGyy1dOI9/SWR0kVrY+aakHalSy9Zciah/OPNY9ar7rMYKK6PXsx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tM5MvYFG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741771136;
	bh=k51t/txi++gxDD01EOFRlarxmT4bBJZAjptolAVZJhk=;
	h=Date:From:To:Cc:Subject:From;
	b=tM5MvYFGdeCej6dXXG1R6SQILuUSp40XhstTS32DQUW1CgKMPfMh8qpAzDmW5BQtc
	 /py/nPv6wDug8M5GICASdNTXHWxO4I8gpCj/VCNMo3gCmuCHSSCu8i3HnfnnqfY41A
	 HbZ3WTH6DBn44V7iIJzqhCCSo/ea6h1FfnD1DNIfJSpK2RM1yLBLpKX7KtYTljZkGQ
	 wJAx20eNT9bH8711bj1tTUi5Gt96uYG6L8GMm18gcLH7fLe9FOJIBev9M7BC/eHRKg
	 D+uFMUO8fsqIqs8MT2ve/Jc4eWSGW3TykAgHQUK8R+lnfZ/sHmisL00X6Rd9i/mQHK
	 6iL3AxUW9H+8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZCQ6l5FQbz4x1V;
	Wed, 12 Mar 2025 20:18:55 +1100 (AEDT)
Date: Wed, 12 Mar 2025 20:18:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, "Rob Herring (Arm)" <robh@kernel.org>
Subject: linux-next: manual merge of the kvm-arm tree with the arm-perf tree
Message-ID: <20250312201853.0d75d9fe@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PvqKvpwcWMMPRuxUUNo8Xz0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PvqKvpwcWMMPRuxUUNo8Xz0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  drivers/perf/apple_m1_cpu_pmu.c

between commit:

  c2e793da59fc ("perf: apple_m1: Don't disable counter in m1_pmu_enable_eve=
nt()")

from the arm-perf tree and commit:

  75ecffc361bb ("drivers/perf: apple_m1: Refactor event select/filter confi=
guration")

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

diff --cc drivers/perf/apple_m1_cpu_pmu.c
index 39349ecec3c1,6be703619a97..000000000000
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@@ -396,7 -428,11 +428,7 @@@ static void m1_pmu_enable_event(struct=20
  	user =3D event->hw.config_base & M1_PMU_CFG_COUNT_USER;
  	kernel =3D event->hw.config_base & M1_PMU_CFG_COUNT_KERNEL;
 =20
- 	m1_pmu_configure_counter(event->hw.idx, evt, user, kernel);
 -	m1_pmu_disable_counter_interrupt(event->hw.idx);
 -	m1_pmu_disable_counter(event->hw.idx);
 -	isb();
 -
+ 	m1_pmu_configure_counter(event->hw.idx, event->hw.config_base);
  	m1_pmu_enable_counter(event->hw.idx);
  	m1_pmu_enable_counter_interrupt(event->hw.idx);
  	isb();

--Sig_/PvqKvpwcWMMPRuxUUNo8Xz0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfRUX0ACgkQAVBC80lX
0GwXvQgAi9OZHjPyvOsUTr1x27DFTzIWYCHQjzw8ewsw0R3crYaFmkvaKiIlUR3G
oQkZI41+2JyuWX1K7yic7RsbNVMnoJ0ykNFIHS0yBQeMQCgxv9N782bJRhujA2fB
KNZwCNF97rvF7faVz/p6IP64+f0Kg/YA8cN7NS3SmKgYTz07svzbgOyZTHLWWLip
1xKKLxQ9qCHwUSccbaIyCg6AJkNlVnAIMGWaAWB1g/r3vCq1+rn177miuzZxBVZ3
mX89W2l9btrwjV1e8UYZcfB6O4vJ3Is3qjhcIqmQRNpHdthzIZ36cZobvisRY2Hx
akx9D73hgA0qtxgRWH/vrZcbNmtpXA==
=8PdF
-----END PGP SIGNATURE-----

--Sig_/PvqKvpwcWMMPRuxUUNo8Xz0--

