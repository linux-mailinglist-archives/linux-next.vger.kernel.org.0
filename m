Return-Path: <linux-next+bounces-5667-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A13A54264
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 06:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9CBE1891695
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 05:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B051B43166;
	Thu,  6 Mar 2025 05:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LOWQrZRO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0572A94F;
	Thu,  6 Mar 2025 05:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741239984; cv=none; b=B6VPJJOomHFa79m6/CwKdyue0b73Z74KPiWs3GUT2Z29Jb1ahTUonImW/NNZZSeKEEIeRhCgHvjND0WCUeXfbNJeBda94bUnJrPJecZN9lZQxsecEG/juWK4LcskiGPnRt7rNzgzR255cYZG/pZ4PvYmX4pIc/IjVGFPSv6Fbi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741239984; c=relaxed/simple;
	bh=TkXuSBHDQCJ0Fz1ik67eopqiJSwSqicNJj6BYDgpPac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=W8pMkJfT89fBRERV7rUwV2dlzZrA9Ml/ehc+oFTbJNoM0GlrPjT56XLVr00J5wj5WZimERKyhbvAXLzgXWYUKDhD/84MU7SB1L+1ug2T45+bH/4xI1G/5PnN7kZuLtqvbjLTgR9vd+t4mpzCfY5z42uH2P1lXjSVjTq8AKuCWys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LOWQrZRO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741239978;
	bh=HT9J4u8LRbvP9nAG5i7xwB5f8r4a6a4s7uuwfrIdGUc=;
	h=Date:From:To:Cc:Subject:From;
	b=LOWQrZROqCLGlqMVhUne4PE+2mqmc8gLS1DT5Yt4scP+LvVp9Z+5WYc8xGD5bNoBP
	 B9EKz6ofM2A7lcGCT6Q2A7f4T/FpZ/i5DXlSU0TXQRVN84FruKqbpu+wUK6d0mBoZg
	 nwpphB7u/HOkeRM3KtgtfY1d+9SsPW93Va1bew6f9sVycQtCk7ALlZ+OZnBtrq5nIp
	 OVVeWZbE9MlR3fLIbJoG4FqeqkFxB/Mx7cCsOKlVu687xmTeWse2bveC8kcrSUmjUo
	 dHFDAN3bj/kfWkO7hhdyw/sbJAFDMDdY/wRhYm/8l1AKXC48pGaYa5fOd96iOuxDVx
	 4EbVkPhYstEXg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z7dh91w8Nz4wcr;
	Thu,  6 Mar 2025 16:46:16 +1100 (AEDT)
Date: Thu, 6 Mar 2025 16:46:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kvm-arm tree
Message-ID: <20250306164614.4ccb2e9d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pn6UoCbK5x_KLMs_7uge/FX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Pn6UoCbK5x_KLMs_7uge/FX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kvm-arm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/firmware/smccc/kvm_guest.c:58:14: warning: no previous prototype fo=
r 'kvm_arm_target_impl_cpu_init' [-Wmissing-prototypes]
   58 | void  __init kvm_arm_target_impl_cpu_init(void)
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/firmware/smccc/kvm_guest.c: In function 'kvm_arm_target_impl_cpu_in=
it':
drivers/firmware/smccc/kvm_guest.c:89:39: error: invalid application of 'si=
zeof' to incomplete type 'struct target_impl_cpu'
   89 |         target =3D memblock_alloc(sizeof(*target) * max_cpus,  __al=
ignof__(*target));
      |                                       ^
drivers/firmware/smccc/kvm_guest.c:89:62: error: invalid application of '__=
alignof__' to incomplete type 'struct target_impl_cpu'
   89 |         target =3D memblock_alloc(sizeof(*target) * max_cpus,  __al=
ignof__(*target));
      |                                                              ^~~~~~=
~~~~~
drivers/firmware/smccc/kvm_guest.c:102:23: error: invalid use of undefined =
type 'struct target_impl_cpu'
  102 |                 target[i].midr =3D res.a1;
      |                       ^
drivers/firmware/smccc/kvm_guest.c:102:26: error: invalid use of undefined =
type 'struct target_impl_cpu'
  102 |                 target[i].midr =3D res.a1;
      |                          ^
drivers/firmware/smccc/kvm_guest.c:103:23: error: invalid use of undefined =
type 'struct target_impl_cpu'
  103 |                 target[i].revidr =3D res.a2;
      |                       ^
drivers/firmware/smccc/kvm_guest.c:103:26: error: invalid use of undefined =
type 'struct target_impl_cpu'
  103 |                 target[i].revidr =3D res.a2;
      |                          ^
drivers/firmware/smccc/kvm_guest.c:104:23: error: invalid use of undefined =
type 'struct target_impl_cpu'
  104 |                 target[i].aidr =3D res.a3;
      |                       ^
drivers/firmware/smccc/kvm_guest.c:104:26: error: invalid use of undefined =
type 'struct target_impl_cpu'
  104 |                 target[i].aidr =3D res.a3;
      |                          ^
drivers/firmware/smccc/kvm_guest.c:107:14: error: implicit declaration of f=
unction 'cpu_errata_set_target_impl' [-Wimplicit-function-declaration]
  107 |         if (!cpu_errata_set_target_impl(max_cpus, target)) {
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/firmware/smccc/kvm_guest.c:116:37: error: invalid application of 's=
izeof' to incomplete type 'struct target_impl_cpu'
  116 |         memblock_free(target, sizeof(*target) * max_cpus);
      |                                     ^

Caused by commit

  86edf6bdcf05 ("smccc/kvm_guest: Enable errata based on implementation CPU=
s")

I have used the kvm-arm tree from next-20250305 for today.



--=20
Cheers,
Stephen Rothwell

--Sig_/Pn6UoCbK5x_KLMs_7uge/FX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfJNqYACgkQAVBC80lX
0Gz48wf/aVT632J+l/k269S8syRs5dboivc+SbrniWTDxLMwAHvO3ZjTkh/BAjTW
KOchZ8hciIweBtIpTPGPz7RU1TBzB1YEbAqXE1V7xZb8LZIXv0tpuwPF3hr2S2T7
Jh/lcop0/wFyQQR02clbvY3zQou4YsuXpvd/NObhN7F3Kj7Zb7rPoTli/cYKgkll
3PneX+AoQEn98IUSEflZP7Y6XiEKqG3ucJraE4TIrnwR2oTFreI2aVkddfRTyGkQ
LLNXlRzXKbbs9Okm2C+lyBGD3o7ICOgvN7uqvIMEuZ0GG8n91HdpyVUELfRkrW+s
x4m3FXN10gGdIGbM2RDUjOtgwujNrg==
=o31s
-----END PGP SIGNATURE-----

--Sig_/Pn6UoCbK5x_KLMs_7uge/FX--

