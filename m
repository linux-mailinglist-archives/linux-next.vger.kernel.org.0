Return-Path: <linux-next+bounces-5905-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0931CA6A2BB
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 10:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BBB58A5FA6
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 09:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BE2222574;
	Thu, 20 Mar 2025 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bimXV2Oz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41C5224251;
	Thu, 20 Mar 2025 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742463131; cv=none; b=Eam8y2qjyOyFuVrWlWC3MsnMbTiRbjGqjWhK0lsJi350ZZlyARQCgrt8/98T/JzhyPpPQAizjYtTfopTFUsgyDyRl/x16qm3XNnWKwZsaZmJcOIgBTJfXNeDHDFAsOwGdmcpFrOYDQd8IrkkQm+lQYRPprH3Zz7559Dmp69ZW4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742463131; c=relaxed/simple;
	bh=tHuvJnP4uRK63orzy6zArkuxjyWYWccb/DmPEXCqXuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ECDbMPL4KhWrlxnGnYHDGL+qg6eTdDwAVLvgAQpFAC8tF+ypPsbF5VfiQ2OBODDViEFlcFTPr8jsx9oBUEBsBwPweAQMJf+5fcfiqhJ+SvR70cX7GqmpV3ximYCSSN6RjA0kXEUrVMvxQWTlXTqh0htS9Et5dFVjW4Rr9iaaD88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bimXV2Oz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742463125;
	bh=8uxhXqcFzCfeFQ8k22+d/lRU0NYGv1JJCI64sK3b1sY=;
	h=Date:From:To:Cc:Subject:From;
	b=bimXV2Oz/et+qpkp60c153GCGITWCqyp7W96swbvTLvv3SeK3fXRCuFM2mRAgQaIR
	 V1QClx42tVLdzp+WxpfwZLxkCwVuGsvVwgSbSCo9P2N8Zc0FpC55za7dmAJs0O3TmM
	 gHQnpN9rcUgOhRa7m7ZFpol2C7kpEnedCLkVQ89INQ/X00o3Ggh3rCfcifw7gxTfqq
	 8vITmqNBOZER1QZTkMV99zPkF9HHAddnHLar0iODi2BqHcbIehtzpmcmosXBqRxPrj
	 /4CV5zdxv8AruO7EuaYh519gBeZEiCxPHgwY6oYI+vAAWBRmNMP2c/g/vFu2g5smYf
	 AX1n+qMgHH8lw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZJL2F0Vwkz4wj2;
	Thu, 20 Mar 2025 20:32:04 +1100 (AEDT)
Date: Thu, 20 Mar 2025 20:32:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kvm-arm tree
Message-ID: <20250320203203.1de92b98@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//o_m+Z2CJp8xH/O=gM6kZ0E";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//o_m+Z2CJp8xH/O=gM6kZ0E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kvm-arm tree, today's linux-next build (arm64 defconfig)
failed like this:

arch/arm64/kernel/cpu_errata.c: In function 'has_impdef_pmuv3':
arch/arm64/kernel/cpu_errata.c:279:38: error: passing argument 1 of 'is_mid=
r_in_range_list' makes pointer from integer without a cast [-Wint-conversio=
n]
  279 |         return is_midr_in_range_list(read_cpuid_id(), impdef_pmuv3_=
cpus);
      |                                      ^~~~~~~~~~~~~~~
      |                                      |
      |                                      u32 {aka unsigned int}
arch/arm64/kernel/cpu_errata.c:47:53: note: expected 'const struct midr_ran=
ge *' but argument is of type 'u32' {aka 'unsigned int'}
   47 | bool is_midr_in_range_list(struct midr_range const *ranges)
      |                            ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
arch/arm64/kernel/cpu_errata.c:279:16: error: too many arguments to functio=
n 'is_midr_in_range_list'
  279 |         return is_midr_in_range_list(read_cpuid_id(), impdef_pmuv3_=
cpus);
      |                ^~~~~~~~~~~~~~~~~~~~~
arch/arm64/kernel/cpu_errata.c:47:6: note: declared here
   47 | bool is_midr_in_range_list(struct midr_range const *ranges)
      |      ^~~~~~~~~~~~~~~~~~~~~

Caused by commit

  1f561ad4b8f5 ("Merge branch 'kvm-arm64/pv-cpuid' into new-next")

The merge missed fixing up this instance from commit

  e1231aacb065 ("arm64: Enable IMP DEF PMUv3 traps on Apple M*")

I have applied the following patch for today (but this should go into
the kvm-arm tree (perhaps squashed into the above merge).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 20 Mar 2025 20:24:04 +1100
Subject: [PATCH] fix up for "Merge branch 'kvm-arm64/pv-cpuid' into new-nex=
t"

interacting with "arm64: Enable IMP DEF PMUv3 traps on Apple M*"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm64/kernel/cpu_errata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index caac9e10a5bb..b55f5f705750 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -276,7 +276,7 @@ static bool has_impdef_pmuv3(const struct arm64_cpu_cap=
abilities *entry, int sco
 	if (pmuver !=3D ID_AA64DFR0_EL1_PMUVer_IMP_DEF)
 		return false;
=20
-	return is_midr_in_range_list(read_cpuid_id(), impdef_pmuv3_cpus);
+	return is_midr_in_range_list(impdef_pmuv3_cpus);
 }
=20
 static void cpu_enable_impdef_pmuv3_traps(const struct arm64_cpu_capabilit=
ies *__unused)
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_//o_m+Z2CJp8xH/O=gM6kZ0E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfb4JMACgkQAVBC80lX
0GxKiQf/RRuXAMkWtwGPAX+9PZUo3jkIm6O1I/mDrWFBkDJoRclHtCVkWIBE5ZJ8
8SMXolqy+tjPajY6pkdBQnB8Lgs8AOSpDRBa6zUmhgrGMtbyzwUxF5Cxz90qaW5z
njfwCgJwFJYei6dRfPVytGnJvmNZx1pgCNVwIjTKTV9/QMudPgCn8z0NIRIB0qG6
uqYhhE+a/di8rEODjJlcjJ3V45p1U0XGkiAX5HM9D/gQlnHMvBcT9TfcMyFl4vDD
f3MExx9srYsPl6xroMiNsH//23g0guLZD3OQg2ETsz3N4PNjU5ooqDXJw6fGyW1U
orCIy20EEpamtKSkefVn1ynP4LD0Sg==
=6dJ7
-----END PGP SIGNATURE-----

--Sig_//o_m+Z2CJp8xH/O=gM6kZ0E--

