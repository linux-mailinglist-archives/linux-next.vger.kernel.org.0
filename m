Return-Path: <linux-next+bounces-6208-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CD2A8759C
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 03:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EAE53AC263
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 01:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549FE155342;
	Mon, 14 Apr 2025 01:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Yvnf9NyR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE3033FD;
	Mon, 14 Apr 2025 01:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744595889; cv=none; b=evgOtGUKixcmlD1OLiehnC4u8Pi5YNjO958PamsJWvJ4pQdoz9WuG4KoHNmltDqDmDdRItS+VoUzMlpuMSr4YWQtOT+G4kKvNjxOoj7vG3PEPh5/FazCwyXBF1iCxC7vXMzFY+eykbJCdga2GgrQRyDaaIfVQuW6LxVsYQchX0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744595889; c=relaxed/simple;
	bh=up2H718IA2eVzuQDOzs48GUwrnmnLrmtzLTi+ZBJKqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Td8DBAexMgAcS/zX0Hj1SP57BRJjkBsWZ2R5XOWktBLlZEAqHUyELB4gJiddbyrEvlbmkXRJOgo25gngABg05KGYAhI34QzNwFKh6VaaQnZJV26OQkYLaJkTu232ixG9yxb0isc67Lh6HR2/65+cyDP2sti/2vjN0nScyFZyKH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Yvnf9NyR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744595881;
	bh=gn0zKrUvypIS6O63hM9nvBalG5DnjrJx8PhcMe4y/rc=;
	h=Date:From:To:Cc:Subject:From;
	b=Yvnf9NyR7DP2kkU0MWY/bJoGzdxWcDabURglS51QvxMdGWFKU5/1yicRB5auD+4CU
	 7H0ag8W5437tDPVKdxRJ+s/DLdzldn+kBuA3ax4NEN4ljUO5Yu+GrR6CELLMLscuvf
	 +N2k0fr4XmbubwxRJKPRf2VVeq3hyvDk7EBK5cXBVKmy3muuk80U8Q15iEbLkH54oU
	 mG8PaDanmi/w4y5XmchMNfLQM+K3zdpNrMYyIl7nb4/BsqkDPH3GO/wFQbu70BVVsu
	 ijkh3+7xuCBECG5w+JIHv6bPBx832UIRSge7n4EV8uuB6LKA8TTRBTFrj7qUvWtfWG
	 BJoOSKwIAD01A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZbVmm72bhz4wcd;
	Mon, 14 Apr 2025 11:58:00 +1000 (AEST)
Date: Mon, 14 Apr 2025 11:57:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pm tree
Message-ID: <20250414115759.3e203c23@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nFO/mVufHI2pV2XN0UiaxKI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nFO/mVufHI2pV2XN0UiaxKI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/cpuidle/cpuidle-psci.c:453:53: error: expected ')' before '(' token
  453 | module_faux_driver(psci_cpuidle, psci_cpuidle_probe, NULL, true);
      |                                                     ^
      |                                                     )
drivers/cpuidle/cpuidle-psci.c:426:12: warning: 'psci_cpuidle_probe' define=
d but not used [-Wunused-function]
  426 | static int psci_cpuidle_probe(struct faux_device *fdev)
      |            ^~~~~~~~~~~~~~~~~~

Caused by commit

  a60e3d71e4d4 ("cpuidle: psci: Transition to the faux device interface")

I have used the pm tree from next-20250411 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/nFO/mVufHI2pV2XN0UiaxKI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf8a6cACgkQAVBC80lX
0GwlBQf/R8isLntstMjaCSJtyjS1bmWyU88ruPJtTTjotWNbsJ/2I8CFa/2ySKdW
d3XRd4ZECeDtmc2fxo2rMAW1UB5dAYfVqPJgwk2EGG8VdHvWf2JV0zLdrdqGjUJ/
kmROFsxKAfnXPkvICkpjQLcwOUDKOu86gLkc4yzWW5+72irD+LzOjqfWo3OrQsnu
pQ/vlBviYpGF7l1ehjJVzMFjrc7fr3ZFCdXmXpddWpBItL28gzUXZn149Gfn0Nl6
4RKuHVKYzvlBon5KsfAkDlQ18IfmGL9qEtg+8jch5NWz7lgJUmYfa3aSLT/4I9uY
5vT42RqPMetNWFle1Dng2Gjaea4QFw==
=mGQH
-----END PGP SIGNATURE-----

--Sig_/nFO/mVufHI2pV2XN0UiaxKI--

