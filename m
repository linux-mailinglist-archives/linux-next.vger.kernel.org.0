Return-Path: <linux-next+bounces-5807-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E437BA6410D
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 07:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC2767A29F0
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 06:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38483218E96;
	Mon, 17 Mar 2025 06:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YcC7B322"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76D1290F;
	Mon, 17 Mar 2025 06:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742192231; cv=none; b=B4GA0R2C+ODRujuEc1CRrdCt67s671eKdUDuMdRr/xouJhdm7xzUerR8N4OMvrU+dZ9xkVd6Jr9Y2seKWyI2JTkgBJ4XH1Rd9ABbWkwvBuU51fMUPEaX+81ojveHtY8lO56PXpAZLCljnQJGMEpcBx29Uq0A/uqM2IFV8fQHYts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742192231; c=relaxed/simple;
	bh=ag2I3Z6QwQfbm8LXO+zVW/LeJnpXJZRawJhY1voh77A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kM1aN5sVlc91cwdsxHXnmIa+tmoMq2E2riWklvR0QCVV50KpMrbtPXy7UgGKyPq1cbv4K9uT4O36Fb8qsJwoOdj5jgJjnN2mVo7BnBbbU/t4p7ynP8v4FA1irdTKmpqqimKwnZfgIGqXCwaKruYQZOl1MVDtGmh1TzQLfHXRUJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YcC7B322; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742192224;
	bh=uzr6N2j9JwgdCojr5RBgum8Z5ZbFaXwyt/EUAwMk8oM=;
	h=Date:From:To:Cc:Subject:From;
	b=YcC7B3220EZYlGBTgYNwHbBJoUAKrNXpns9oiBOnwZJ6lKsm9QR6M4iOsovHjrzKo
	 fN5P3ERe53bRZBN/9QiyDfcH0jSVyVToVyTuSoNN0k0F4+gs0bPYuXdX0gSyX8ILhy
	 855St7SQAMhlkrdUhha7LhrAxEVsm+8D2dv/OhT+OQMhJ7TQOxXGDIUzctkjZixNEk
	 08pIEqqb5K0leSDgVzWdwc6IA/reO2vqxSVIgJdvrrc8/ovu8RdGTrfJM6+jQtKZcK
	 SH8P0M5zE97SOMjl+EOTsce1TYY8h04/jXaZGPwS2KNeyR25I3wwti9tkX/J9rG9gM
	 azvZREvuRJItw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGPrb0ncRz4wcn;
	Mon, 17 Mar 2025 17:17:02 +1100 (AEDT)
Date: Mon, 17 Mar 2025 17:17:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <20250317171701.71c8677a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C2/R6dTjtzY/cpnU2J8rCu1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/C2/R6dTjtzY/cpnU2J8rCu1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/kernel/proton-pack.c

between commits:

  e403e8538359 ("arm64: errata: Assume that unknown CPUs _are_ vulnerable t=
o Spectre BHB")
  a5951389e58d ("arm64: errata: Add newer ARM cores to the spectre_bhb_loop=
_affected() lists")

from the arm64 tree and commit:

  e3121298c7fc ("arm64: Modify _midr_range() functions to read MIDR/REVIDR =
internally")

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

diff --cc arch/arm64/kernel/proton-pack.c
index 0f51fd10b4b0,a573fa40d4b6..000000000000
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@@ -845,86 -845,52 +845,86 @@@ static unsigned long system_bhb_mitigat
   * This must be called with SCOPE_LOCAL_CPU for each type of CPU, before =
any
   * SCOPE_SYSTEM call will give the right answer.
   */
 -u8 spectre_bhb_loop_affected(int scope)
 +static bool is_spectre_bhb_safe(int scope)
 +{
 +	static const struct midr_range spectre_bhb_safe_list[] =3D {
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A35),
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A53),
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A55),
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A510),
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520),
 +		MIDR_ALL_VERSIONS(MIDR_BRAHMA_B53),
 +		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_SILVER),
 +		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_SILVER),
 +		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
 +		{},
 +	};
 +	static bool all_safe =3D true;
 +
 +	if (scope !=3D SCOPE_LOCAL_CPU)
 +		return all_safe;
 +
- 	if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_safe_list))
++	if (is_midr_in_range_list(spectre_bhb_safe_list))
 +		return true;
 +
 +	all_safe =3D false;
 +
 +	return false;
 +}
 +
 +static u8 spectre_bhb_loop_affected(void)
  {
  	u8 k =3D 0;
 -	static u8 max_bhb_k;
 =20
 -	if (scope =3D=3D SCOPE_LOCAL_CPU) {
 -		static const struct midr_range spectre_bhb_k32_list[] =3D {
 -			MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
 -			MIDR_ALL_VERSIONS(MIDR_CORTEX_A78AE),
 -			MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
 -			MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
 -			MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
 -			MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
 -			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
 -			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
 -			{},
 -		};
 -		static const struct midr_range spectre_bhb_k24_list[] =3D {
 -			MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
 -			MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
 -			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
 -			{},
 -		};
 -		static const struct midr_range spectre_bhb_k11_list[] =3D {
 -			MIDR_ALL_VERSIONS(MIDR_AMPERE1),
 -			{},
 -		};
 -		static const struct midr_range spectre_bhb_k8_list[] =3D {
 -			MIDR_ALL_VERSIONS(MIDR_CORTEX_A72),
 -			MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
 -			{},
 -		};
 +	static const struct midr_range spectre_bhb_k132_list[] =3D {
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_X3),
 +		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
 +	};
 +	static const struct midr_range spectre_bhb_k38_list[] =3D {
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
 +	};
 +	static const struct midr_range spectre_bhb_k32_list[] =3D {
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78AE),
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
 +		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
 +		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
 +		{},
 +	};
 +	static const struct midr_range spectre_bhb_k24_list[] =3D {
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A76AE),
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
 +		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
 +		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
 +		{},
 +	};
 +	static const struct midr_range spectre_bhb_k11_list[] =3D {
 +		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
 +		{},
 +	};
 +	static const struct midr_range spectre_bhb_k8_list[] =3D {
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A72),
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
 +		{},
 +	};
 =20
- 	if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k132_list))
 -		if (is_midr_in_range_list(spectre_bhb_k32_list))
 -			k =3D 32;
 -		else if (is_midr_in_range_list(spectre_bhb_k24_list))
 -			k =3D 24;
 -		else if (is_midr_in_range_list(spectre_bhb_k11_list))
 -			k =3D 11;
 -		else if (is_midr_in_range_list(spectre_bhb_k8_list))
 -			k =3D  8;
 -
 -		max_bhb_k =3D max(max_bhb_k, k);
 -	} else {
 -		k =3D max_bhb_k;
 -	}
++	if (is_midr_in_range_list(spectre_bhb_k132_list))
 +		k =3D 132;
- 	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k38_list))
++	else if (is_midr_in_range_list(spectre_bhb_k38_list))
 +		k =3D 38;
- 	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
++	else if (is_midr_in_range_list(spectre_bhb_k32_list))
 +		k =3D 32;
- 	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k24_list))
++	else if (is_midr_in_range_list(spectre_bhb_k24_list))
 +		k =3D 24;
- 	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k11_list))
++	else if (is_midr_in_range_list(spectre_bhb_k11_list))
 +		k =3D 11;
- 	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k8_list))
++	else if (is_midr_in_range_list(spectre_bhb_k8_list))
 +		k =3D  8;
 =20
  	return k;
  }

--Sig_/C2/R6dTjtzY/cpnU2J8rCu1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfXvl0ACgkQAVBC80lX
0GwiLQf/cMkKaN3oXT+rh0glxXgQAJzx55wpr4vPLmuUFlug2gcAn9CmQRKP2Lk9
e6akFhDCvRfW6RGFpKe6fFa8Qax9Ka7osFJ0kvVqCjOSwgCHgQIDGX9dDoOPU7N7
ou/3u9BkVSLdYKoNi/qS0CTMDqxIonxflcQ/JYCZ3x+QQ01LlJHhIRkGjPeBAEVs
5QmhsCDbV7PBt1HqmdTWuNeVSFTLK6P3fJLKiFFMoh+hkbolGCf5nSNdK3ugs4W2
IWWsxOefsqvZKp9Zhk5NBB/+As10ztxnEsXYVTDjZZIwXD7iIR/INg8lLyOBt9kE
4jv6U/JPz0R50RZZUsyXD6rdrylLKw==
=WidW
-----END PGP SIGNATURE-----

--Sig_/C2/R6dTjtzY/cpnU2J8rCu1--

