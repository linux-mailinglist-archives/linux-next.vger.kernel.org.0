Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 168C8E69C0
	for <lists+linux-next@lfdr.de>; Sun, 27 Oct 2019 22:39:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbfJ0VjV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 27 Oct 2019 17:39:21 -0400
Received: from ozlabs.org ([203.11.71.1]:40195 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727590AbfJ0VjV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 27 Oct 2019 17:39:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 471WT11xJdz9sPc;
        Mon, 28 Oct 2019 08:39:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572212357;
        bh=ndBgOhZf/D6XwAlfefZuH5KMHOfbmKdSetrEPq5Lbg4=;
        h=Date:From:To:Cc:Subject:From;
        b=ZeTH6N69SRpkqDd4RDe55MK2igEilsOURnJmbTIYvwCu2uMjaUi+0/jaFXDeZAl93
         gV+4HnfHoJi2ZTjdxPxVCuCeJwSqSQ69QrtFlKOBJmk4Y0ctKR7GeLrxL+IvEsVDpM
         Hsf4PtRzvfBca1HbWbbaMhj5h0KbUQBWP6optyXP1rcgaCTKIGyUhLwGKQg/AHCF8F
         ojvuDbSqhcSIQsKhodua7N77O5UlvC1omgUtvOJ2bfW+NJ4sUqEvFJGxO0UP08P+9R
         Ruo9sU4jzlUn85vzPjRzzi/T6j6i063xAA961FE2IBO0j8pBYh0SdM0x99aZH+Vjab
         QY3wfcdGvQIYw==
Date:   Mon, 28 Oct 2019 08:39:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        James Morse <james.morse@arm.com>
Subject: linux-next: manual merge of the arm64 tree with Linus' tree
Message-ID: <20191028083914.4735554b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1bZsxFniZkOe9y3iv70AYfl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1bZsxFniZkOe9y3iv70AYfl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got conflicts in:

  arch/arm64/include/asm/cpucaps.h
  arch/arm64/kernel/cpu_errata.c

between commits:

  d3ec3a08fa70 ("arm64: KVM: Trap VM ops when ARM64_WORKAROUND_CAVIUM_TX2_2=
19_TVM is set")
  93916beb7014 ("arm64: Enable workaround for Cavium TX2 erratum 219 when r=
unning SMT")
  9405447ef79b ("arm64: Avoid Cavium TX2 erratum 219 when switching TTBR")

from Linus' tree and commit:

  05460849c3b5 ("arm64: errata: Hide CTR_EL0.DIC on systems affected by Neo=
verse-N1 #1542419")

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

diff --cc arch/arm64/include/asm/cpucaps.h
index ac1dbca3d0cd,f05afaec18cd..000000000000
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@@ -52,9 -52,8 +52,10 @@@
  #define ARM64_HAS_IRQ_PRIO_MASKING		42
  #define ARM64_HAS_DCPODP			43
  #define ARM64_WORKAROUND_1463225		44
 -#define ARM64_WORKAROUND_1542419		45
 +#define ARM64_WORKAROUND_CAVIUM_TX2_219_TVM	45
 +#define ARM64_WORKAROUND_CAVIUM_TX2_219_PRFM	46
++#define ARM64_WORKAROUND_1542419		47
 =20
- #define ARM64_NCAPS				47
 -#define ARM64_NCAPS				46
++#define ARM64_NCAPS				48
 =20
  #endif /* __ASM_CPUCAPS_H */
diff --cc arch/arm64/kernel/cpu_errata.c
index 6c3b10a41bd8,bf29b59e096f..000000000000
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@@ -624,30 -618,18 +619,42 @@@ check_branch_predictor(const struct arm
  	return (need_wa > 0);
  }
 =20
 +static const __maybe_unused struct midr_range tx2_family_cpus[] =3D {
 +	MIDR_ALL_VERSIONS(MIDR_BRCM_VULCAN),
 +	MIDR_ALL_VERSIONS(MIDR_CAVIUM_THUNDERX2),
 +	{},
 +};
 +
 +static bool __maybe_unused
 +needs_tx2_tvm_workaround(const struct arm64_cpu_capabilities *entry,
 +			 int scope)
 +{
 +	int i;
 +
 +	if (!is_affected_midr_range_list(entry, scope) ||
 +	    !is_hyp_mode_available())
 +		return false;
 +
 +	for_each_possible_cpu(i) {
 +		if (MPIDR_AFFINITY_LEVEL(cpu_logical_map(i), 0) !=3D 0)
 +			return true;
 +	}
 +
 +	return false;
 +}
 +
+ static bool __maybe_unused
+ has_neoverse_n1_erratum_1542419(const struct arm64_cpu_capabilities *entr=
y,
+ 				int scope)
+ {
+ 	u32 midr =3D read_cpuid_id();
+ 	bool has_dic =3D read_cpuid_cachetype() & BIT(CTR_DIC_SHIFT);
+ 	const struct midr_range range =3D MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1);
+=20
+ 	WARN_ON(scope !=3D SCOPE_LOCAL_CPU || preemptible());
+ 	return is_midr_in_range(midr, &range) && has_dic;
+ }
+=20
  #ifdef CONFIG_HARDEN_EL2_VECTORS
 =20
  static const struct midr_range arm64_harden_el2_vectors[] =3D {
@@@ -877,18 -859,15 +884,28 @@@ const struct arm64_cpu_capabilities arm
  		.matches =3D has_cortex_a76_erratum_1463225,
  	},
  #endif
 +#ifdef CONFIG_CAVIUM_TX2_ERRATUM_219
 +	{
 +		.desc =3D "Cavium ThunderX2 erratum 219 (KVM guest sysreg trapping)",
 +		.capability =3D ARM64_WORKAROUND_CAVIUM_TX2_219_TVM,
 +		ERRATA_MIDR_RANGE_LIST(tx2_family_cpus),
 +		.matches =3D needs_tx2_tvm_workaround,
 +	},
 +	{
 +		.desc =3D "Cavium ThunderX2 erratum 219 (PRFM removal)",
 +		.capability =3D ARM64_WORKAROUND_CAVIUM_TX2_219_PRFM,
 +		ERRATA_MIDR_RANGE_LIST(tx2_family_cpus),
 +	},
++#endif
+ #ifdef CONFIG_ARM64_ERRATUM_1542419
+ 	{
+ 		/* we depend on the firmware portion for correctness */
+ 		.desc =3D "ARM erratum 1542419 (kernel portion)",
+ 		.capability =3D ARM64_WORKAROUND_1542419,
+ 		.type =3D ARM64_CPUCAP_LOCAL_CPU_ERRATUM,
+ 		.matches =3D has_neoverse_n1_erratum_1542419,
+ 		.cpu_enable =3D cpu_enable_trap_ctr_access,
+ 	},
  #endif
  	{
  	}

--Sig_/1bZsxFniZkOe9y3iv70AYfl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl22DoIACgkQAVBC80lX
0GyCMgf9HH6gIGnO9X6lzqk1JiKMhgwnk/F0M4dqv4KSj2Hhi+mRU+zyXjY0OLiF
CIK7io8y9uapU1QoenXBLgIMLqi9FnK3Ms1F9pm0E23HbBnMn5yj4LzbUTGtpYpZ
0iWrS4jjej4xIVsOuppww8jSknlQWJtZb4Dxf3nzgbhaUQOkBD+rcBPgu5KoSkIM
7URjTHzlKFVoYbxNwz+nZjYQv6N13AsyN+vhqZsAvUe5U3q8HqLs4ECmm3xsLCG8
p5v0VctbWOmHjAUJhGYYnfxZIS0qxw1dc8aA7s+MTgnVFNEOTP86F2vOvL6S7Q9m
w7TQTwd6HxyKrmNXVYZyw11Pnuz14w==
=//Rj
-----END PGP SIGNATURE-----

--Sig_/1bZsxFniZkOe9y3iv70AYfl--
