Return-Path: <linux-next+bounces-6279-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 584B2A9120C
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 05:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ECC03AFA18
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 03:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB551C84D4;
	Thu, 17 Apr 2025 03:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GAmlPfmF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4E13D994;
	Thu, 17 Apr 2025 03:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744861407; cv=none; b=iewSzIj1sqqqBp0EJOmW219LQ2Fq309tgQi+YPa3tkLrYTBO+DKvoCXOqY9au3ldOVK7YynWxVkI9lPdpbXWrOqUqaJzRJkUrKpp3/N31NRdqZwUiWdsp6InY/s6UGQ9kT5Rc57MFLz+Ehe1GkTOXBwUaOwW+lI0CfzmmZLWDSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744861407; c=relaxed/simple;
	bh=5YsPtHQVET6UOmT0G9jLviPcM3Ddk/H757x+xvnX5/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RtYw7MqJ24yyJmRLKVb98HpZpYSKCbhBcKpxtHzQHj4jGMWbv8QoyBx3XXZEB5AR7tGbZs89wN796VaCBRuRIh1xICtiIHvVL1moVrA7kaWdg9Kh0Qjrl51i8y1tLR/1qlh36sL8kf80sK8hF1HYECgMxcJHEkZi7o5EIA5kobE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GAmlPfmF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744861395;
	bh=GPP/Lmjt4MiPH1Wde/+yE8U14WRwTq5UhBb2MQrmlkE=;
	h=Date:From:To:Cc:Subject:From;
	b=GAmlPfmF/ytlX2Mjdqd5w1KEZgd1E69odH1rGwS0q+/qNQ5S9nYq3xlyE6Fkfm9cD
	 xNzMoxuZ63pIwvrY4U+OViANuMwbePIBKdI2Hh4d4ddMhX5ogAhy6GPoRBTaxKbzHq
	 LZr55AAJt6ta1aUPVUMATTocs245Z/p4iLfZncV4xOfUpYcgp7TsoGQBmACFffSBvQ
	 V6nM1Lcto/QsYSbUnwk7bJHxGVPZHXCYGUoJ3gd4Fc3A2x57Km+No/UTSFXED7hEJH
	 pXjodPxyntCgSO5unU0cocq7PPn40qgDJEzVXgS0jl4Bqm+AZ3MAj6bmPydgdI79+R
	 wX55xCEl3xLeg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZdNyn5r2tz4xRB;
	Thu, 17 Apr 2025 13:43:13 +1000 (AEST)
Date: Thu, 17 Apr 2025 13:43:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Ingo Molnar <mingo@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, Viresh Kumar <viresh.kumar@linaro.org>
Subject: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <20250417134312.6892d237@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WUW=oNglpiXE1jIpo=9zSLl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WUW=oNglpiXE1jIpo=9zSLl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/cpufreq/acpi-cpufreq.c

between commit:

  395b8b5c8f67 ("cpufreq: ACPI: Don't enable boost on policy exit")

from the pm tree and commit:

  78255eb23973 ("x86/msr: Rename 'wrmsrl()' to 'wrmsrq()'")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/cpufreq/acpi-cpufreq.c
index 85b5a88f723f,8bc08f3b0d5d..000000000000
--- a/drivers/cpufreq/acpi-cpufreq.c
+++ b/drivers/cpufreq/acpi-cpufreq.c
@@@ -108,17 -107,25 +108,17 @@@ static void boost_set_msr_each(void *p_
  		msr_mask =3D MSR_K7_HWCR_CPB_DIS;
  		break;
  	default:
 -		return -EINVAL;
 +		return;
  	}
 =20
- 	rdmsrl(msr_addr, val);
+ 	rdmsrq(msr_addr, val);
 =20
  	if (enable)
  		val &=3D ~msr_mask;
  	else
  		val |=3D msr_mask;
 =20
- 	wrmsrl(msr_addr, val);
+ 	wrmsrq(msr_addr, val);
 -	return 0;
 -}
 -
 -static void boost_set_msr_each(void *p_en)
 -{
 -	bool enable =3D (bool) p_en;
 -
 -	boost_set_msr(enable);
  }
 =20
  static int set_boost(struct cpufreq_policy *policy, int val)

--Sig_/WUW=oNglpiXE1jIpo=9zSLl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgAeNAACgkQAVBC80lX
0Gx4oAf/X5Qan91RaoZ1l6h8Foky2fCb0eKrOFnPwu2mvLD1TXlIiwo2o5bSECld
j4WdpE93n0c9thyhDuC/0fQPY1DVDlu1T0Afd7xLm4nK7Q1X9uORWMAT6dMH1Nwk
GF12xH6YXWKGhzo714qusmcKWktwmi0ot10uvOjHW/s10TlrdtoRcofWq669M01n
M72T55/SN/XEIN6UNv8tZl9MYNGsfRvmbmgYJ0vHUiXeGR+9SiHF8LPiN6iTjTgN
M4TsUzvsXUzqkwX37F1t1zOWtlaSQEWHgo4PlGEjJOVaTEkHiFUj6xOCKTxmXN4X
bwhhEF6HFZnD0X/xE8f/PiCtpuVh3Q==
=DCBF
-----END PGP SIGNATURE-----

--Sig_/WUW=oNglpiXE1jIpo=9zSLl--

