Return-Path: <linux-next+bounces-5806-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DF0A64096
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 07:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FD7616C83C
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 06:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1578219A8B;
	Mon, 17 Mar 2025 06:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SIQygUy1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867E51459F7;
	Mon, 17 Mar 2025 06:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742191452; cv=none; b=f8ME5K9Updl1yiP8LSGJ+ucFfRyLUSX1uyeIt0HMOh76+i/6KqGVcumpTpJbBgJqmEv6037i/l8pHEL7k8x/ZULvqzhjzAcx2yz/7UUAmVNtf1+QTTzYwXQ5/iNFv0E8025nbo9N/SGfw6P32lbeXCkwmHRaQvNzJ+YPwJd9M90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742191452; c=relaxed/simple;
	bh=MSbgezf+uWKm9OnBadZ4wxifQx2zec1fdEbK61jVGa0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=L1fc0fz6ZkPJ2GmJS5h4CTC46cHCTFV6cd33u9F47Ft97/P70/iB+Lx46G8ptJLOYU23LUJVP1w3DGQWZA8BScoKZqftyEsqcrulL7FTDEfqbXSjRDtSfgT0SPuhJNew4io4VKVuAj8N6JkroGJL9SCxzNiCQcFXgPSuJcv4T/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SIQygUy1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742191446;
	bh=VRN5xYfpqR4+9fIF8y4DrwFpD1z+sCyIqoqSvaovC/8=;
	h=Date:From:To:Cc:Subject:From;
	b=SIQygUy1N3/2BrpBZvuQYtucwAcLw/GugkcDsYSKr8LWsqxuI/3S9rrNENgmxjbif
	 bvSL6ut4NRc7pja2dQ6OGjlrUgIXHbhRoUpikq3bVEGFFExAFprwJdarx04ZWcf8SY
	 kOqnbu9fxlRhUrVvHbyCeQwWdPewnPD+55UgLxw7TRj2QkxN88O5UMqhZVbzGNkWwP
	 VoNa2ITnQ0hTL8qWyd9kI8lMN/SYE/qrPjacP+6456fEYA4IxyA6If/xX9vI+H8R3w
	 LWU9f9JYfAzOgKWZ58vIIcUg8QdHhSOu+U1qj2pr74okSwXKePZrPo96PfNvgNBJQ5
	 BoiMBhT2txGdw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGPYd3rfgz4wcZ;
	Mon, 17 Mar 2025 17:04:04 +1100 (AEDT)
Date: Mon, 17 Mar 2025 17:04:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Oliver Upton <oliver.upton@linux.dev>, Shameer
 Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <20250317170404.733b119c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w07Lwe91=U2TS+49ppJugyt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/w07Lwe91=U2TS+49ppJugyt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/kernel/cpufeature.c

between commits:

  f4fe70cd8522 ("arm64: cpufeature: factor out cpu_is_meltdown_safe()")
  837dfd070e94 ("arm64: cpufeature: mitigate CVE-2024-7881")

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

diff --cc arch/arm64/kernel/cpufeature.c
index f5ca9a535eba,9c4d6d552b25..000000000000
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@@ -1787,63 -1791,15 +1789,63 @@@ static bool cpu_is_meltdown_safe(void
  		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
  		{ /* sentinel */ }
  	};
 +
- 	if (is_midr_in_range_list(read_cpuid_id(), meltdown_safe_list))
++	if (is_midr_in_range_list(meltdown_safe_list))
 +		return true;
 +
 +	/*
 +	 * ID_AA64PFR0_EL1.CSV3 > 0 indicates that this CPU is not vulnerable
 +	 * to meltdown.
 +	 */
 +	pfr0 =3D __read_sysreg_by_encoding(SYS_ID_AA64PFR0_EL1);
 +	if (cpuid_feature_extract_unsigned_field(pfr0, ID_AA64PFR0_EL1_CSV3_SHIF=
T))
 +		return true;
 +
 +	return false;
 +}
 +
 +static bool cpu_has_leaky_prefetcher(void)
 +{
 +	struct arm_smccc_res res;
 +
 +	/* CPUs which are affected by CVE-2024-7881 */
 +	static const struct midr_range leaky_prefetcher_list[] =3D {
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_X3),
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_X4),
 +		MIDR_ALL_VERSIONS(MIDR_CORTEX_X925),
 +		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
 +		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3),
 +		{ /* sentinel */ }
 +	};
 +
- 	if (!is_midr_in_range_list(read_cpuid_id(), leaky_prefetcher_list))
++	if (!is_midr_in_range_list(leaky_prefetcher_list))
 +		return false;
 +
 +	/*
 +	 * If ARCH_WORKAROUND_4 is implemented, then the firmware mitigation is
 +	 * present. There is no need to call ARCH_WORKAROUND_4 itself.
 +	 */
 +	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
 +			     ARM_SMCCC_ARCH_WORKAROUND_4, &res);
 +	if (res.a0 =3D=3D SMCCC_RET_SUCCESS)
 +		return false;
 +
 +	return true;
 +}
 +
 +static bool __meltdown_safe =3D true;
 +static bool __leaky_prefetch_safe =3D true;
 +static int __kpti_forced; /* 0: not forced, >0: forced on, <0: forced off=
 */
 +
 +static bool needs_kpti(const struct arm64_cpu_capabilities *entry, int sc=
ope)
 +{
  	char const *str =3D "kpti command line option";
  	bool meltdown_safe;
 +	bool prefetcher_safe;
 =20
 -	meltdown_safe =3D is_midr_in_range_list(kpti_safe_list);
 -
 -	/* Defer to CPU feature registers */
 -	if (has_cpuid_feature(entry, scope))
 -		meltdown_safe =3D true;
 +	WARN_ON(scope !=3D SCOPE_LOCAL_CPU);
 =20
 +	meltdown_safe =3D cpu_is_meltdown_safe();
  	if (!meltdown_safe)
  		__meltdown_safe =3D false;
 =20

--Sig_/w07Lwe91=U2TS+49ppJugyt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfXu1QACgkQAVBC80lX
0GzNfgf9GGeB2uQbbkYuvs2ok5le95utX5Xw2Ho6m1zUdLgD9ntlJfmFdVJulWb9
ljbY0yVADCtSXaYo2kMORPSyfAP50Q4DFnjzT5E2dl68hDXxb4dZSxTzewGirIIy
J4NwPRgw17Zg3QOaA09vQA9RSRfXj3twBMU9/VEctL/SBp1SulDg/BPcIWWrDc9l
ZnZra13SbRtBSIBCJv4e6n8foJQDLIE81cofKscB7LaTB/g+a8L3F5LZhaoLSzPq
kqx4A3wWZXs6Zr3q5iGfbM1J/ClnCzKSpPejG/F83/JpVblZumI+uFvEGZ73cVIj
YVdnnIwLeXSDNJfhtPuvqg/K4MpApw==
=Hcez
-----END PGP SIGNATURE-----

--Sig_/w07Lwe91=U2TS+49ppJugyt--

