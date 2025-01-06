Return-Path: <linux-next+bounces-5037-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8610CA01E5D
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 04:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F57B7A151D
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 03:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6A135962;
	Mon,  6 Jan 2025 03:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ju5MOa5L"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B201FB3;
	Mon,  6 Jan 2025 03:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736135596; cv=none; b=lQCMRSokBJOJmwVlqY3ucouYmgupKiVujzptJVrVt3AWqsFSIs3IcIwD2kRdFGyaSMnnWQvltttEubLXuwmRJYVzItc72bVdw/W7OSz6xQ6YKNYwN8flHU4Aod8k2Y/X/lJt9fz+cgdMgmZx7OK5xzmhtB5peJSuDFILtkxRwiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736135596; c=relaxed/simple;
	bh=RyG+vQ665wUThqcHA9frIZaxWKDkPzHbExz5CtYTl/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=azQ/XqL/PB5Oz6NJONu/9UdiezJcUfMIzB3vq6z5iI7FT3NvRgLlZ3vsdfjPtqy4nHWW/QQCEZtuTn7WkSQKJJXR/7e5zpQPgLTh8evuoCesdNVADKJ8ucfEBVSZFU022ZdFm15kQDmMXWgOeLANhAAdsA7CJTTwQwG0QbUEC14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ju5MOa5L; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736135579;
	bh=kaKGY/Oo7W2ooCg7+OLWBU2cQdT4iGLCvnUxUmP8S80=;
	h=Date:From:To:Cc:Subject:From;
	b=Ju5MOa5LEd7drFw1a24OG7b7oIEXrEXEkdItNpP/ux2RxyBR/OmPkECZeN7oAqvu3
	 kg9uaoEL7HOkiPZB+RcEmsz9GFPh2K3jmq3Z+mpZvfvZLNivGpTMA7X7rVGPXvVf88
	 q6ICWMIa+djqVBmuOKhQWIEFnXPmXHF8aLi2KbHBMLBE1rwpVf/850ofPJ01ntYYFt
	 K9ul6rmXBnduxLAPAZWgA/VhxV+T1eZjdoJMCfsGLTvm87lU5u6/hHNWifDQEw4/C0
	 O9OGevURS+M82k9UnHXBlWf2WCUEyq+wqsV382mQzbrn1EDT6qIGlUdAyTnuKZE3+d
	 1hYpYieUAQemQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRKyf5MhGz4wbR;
	Mon,  6 Jan 2025 14:52:57 +1100 (AEDT)
Date: Mon, 6 Jan 2025 14:53:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <20250106145303.47c2bef4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/25=wCiX=8Fzgy8nj+l+4lRI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/25=wCiX=8Fzgy8nj+l+4lRI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got conflicts in:

  arch/arm64/include/asm/kvm_emulate.h
  arch/arm64/kvm/fpsimd.c
  arch/arm64/kvm/hyp/nvhe/pkvm.c
  arch/arm64/kvm/hyp/nvhe/switch.c

between commit:

  e5ecedcd7cc2 ("arm64/sysreg: Get rid of CPACR_ELx SysregFields")

from the arm64 tree and commits:

  41d6028e28bd ("KVM: arm64: Convert the SVE guest vcpu flag to a vm flag")
  d381e53384a6 ("KVM: arm64: Move host SME/SVE tracking flags to host data")
  f50758260bff ("KVM: arm64: Group setting traps for protected VMs by contr=
ol register")
  2fd5b4b0e7b4 ("KVM: arm64: Calculate cptr_el2 traps on activating traps")
(and maybe others)

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

diff --cc arch/arm64/include/asm/kvm_emulate.h
index 4f1d99725f6b,2d91fb88298a..000000000000
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@@ -628,12 -629,12 +629,12 @@@ static __always_inline void __kvm_reset
  		if (cpus_have_final_cap(ARM64_SME))
  			val |=3D CPACR_EL1_SMEN_EL1EN;
  	} else if (has_hvhe()) {
 -		val =3D CPACR_ELx_FPEN;
 +		val =3D CPACR_EL1_FPEN;
 =20
- 		if (!vcpu_has_sve(vcpu) || !guest_owns_fp_regs())
+ 		if (!kvm_has_sve(kvm) || !guest_owns_fp_regs())
 -			val |=3D CPACR_ELx_ZEN;
 +			val |=3D CPACR_EL1_ZEN;
  		if (cpus_have_final_cap(ARM64_SME))
 -			val |=3D CPACR_ELx_SMEN;
 +			val |=3D CPACR_EL1_SMEN;
  	} else {
  		val =3D CPTR_NVHE_EL2_RES1;
 =20
diff --cc arch/arm64/kvm/fpsimd.c
index 98718bd65bf1,0e0f37d1990a..000000000000
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@@ -168,8 -168,8 +168,8 @@@ void kvm_arch_vcpu_put_fp(struct kvm_vc
  	 */
  	if (has_vhe() && system_supports_sme()) {
  		/* Also restore EL0 state seen on entry */
- 		if (vcpu_get_flag(vcpu, HOST_SME_ENABLED))
+ 		if (host_data_test_flag(HOST_SME_ENABLED))
 -			sysreg_clear_set(CPACR_EL1, 0, CPACR_ELx_SMEN);
 +			sysreg_clear_set(CPACR_EL1, 0, CPACR_EL1_SMEN);
  		else
  			sysreg_clear_set(CPACR_EL1,
  					 CPACR_EL1_SMEN_EL0EN,
diff --cc arch/arm64/kvm/hyp/nvhe/pkvm.c
index 73e319891327,918d8142da8f..000000000000
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
diff --cc arch/arm64/kvm/hyp/nvhe/switch.c
index 0f6b01b3da5c,0ebf84a9f9e2..000000000000
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@@ -36,33 -35,46 +35,46 @@@ DEFINE_PER_CPU(unsigned long, kvm_hyp_v
 =20
  extern void kvm_nvhe_prepare_backtrace(unsigned long fp, unsigned long pc=
);
 =20
- static void __activate_traps(struct kvm_vcpu *vcpu)
+ static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
  {
- 	u64 val;
+ 	u64 val =3D CPTR_EL2_TAM;	/* Same bit irrespective of E2H */
 =20
- 	___activate_traps(vcpu, vcpu->arch.hcr_el2);
- 	__activate_traps_common(vcpu);
+ 	if (has_hvhe()) {
 -		val |=3D CPACR_ELx_TTA;
++		val |=3D CPACR_EL1_TTA;
 =20
- 	val =3D vcpu->arch.cptr_el2;
- 	val |=3D CPTR_EL2_TAM;	/* Same bit irrespective of E2H */
- 	val |=3D has_hvhe() ? CPACR_EL1_TTA : CPTR_EL2_TTA;
- 	if (cpus_have_final_cap(ARM64_SME)) {
- 		if (has_hvhe())
- 			val &=3D ~CPACR_EL1_SMEN;
- 		else
- 			val |=3D CPTR_EL2_TSM;
+ 		if (guest_owns_fp_regs()) {
 -			val |=3D CPACR_ELx_FPEN;
++			val |=3D CPACR_EL1_FPEN;
+ 			if (vcpu_has_sve(vcpu))
 -				val |=3D CPACR_ELx_ZEN;
++				val |=3D CPACR_EL1_ZEN;
+ 		}
+ 	} else {
+ 		val |=3D CPTR_EL2_TTA | CPTR_NVHE_EL2_RES1;
+=20
+ 		/*
+ 		 * Always trap SME since it's not supported in KVM.
+ 		 * TSM is RES1 if SME isn't implemented.
+ 		 */
+ 		val |=3D CPTR_EL2_TSM;
+=20
+ 		if (!vcpu_has_sve(vcpu) || !guest_owns_fp_regs())
+ 			val |=3D CPTR_EL2_TZ;
+=20
+ 		if (!guest_owns_fp_regs())
+ 			val |=3D CPTR_EL2_TFP;
  	}
 =20
- 	if (!guest_owns_fp_regs()) {
- 		if (has_hvhe())
- 			val &=3D ~(CPACR_EL1_FPEN | CPACR_EL1_ZEN);
- 		else
- 			val |=3D CPTR_EL2_TFP | CPTR_EL2_TZ;
-=20
+ 	if (!guest_owns_fp_regs())
  		__activate_traps_fpsimd32(vcpu);
- 	}
 =20
  	kvm_write_cptr_el2(val);
+ }
+=20
+ static void __activate_traps(struct kvm_vcpu *vcpu)
+ {
+ 	___activate_traps(vcpu, vcpu->arch.hcr_el2);
+ 	__activate_traps_common(vcpu);
+ 	__activate_cptr_traps(vcpu);
+=20
  	write_sysreg(__this_cpu_read(kvm_hyp_vector), vbar_el2);
 =20
  	if (cpus_have_final_cap(ARM64_WORKAROUND_SPECULATIVE_AT)) {

--Sig_/25=wCiX=8Fzgy8nj+l+4lRI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7U58ACgkQAVBC80lX
0Gx1GQf/XAqvygIEXEx07gEKG3A0+Ic0En4MOAc2Pswk1aTKo2RQDBfaR8UbHwzN
te0X4JL58Wy2J/zYc/fKIZ1pPnfyp0/9uJRnGT5bAaAdppmbFkJOfQUEN8DwSKjF
lHsnMgICyYxqDYmvTpb8ljavLbYe2Lzw4PGQACR0Nv0AVdGY15uQrK6Ov9REkbac
1cX00fJy7wnUhAfNnanB3VIgvfHMdoBrbvkJo/fW15Dwkl/dPxveulqOAv5S8qKg
LymgBmPT9Rv+L7JcYrDfkLH3lGGHyJceZIo0ncc7mGugm64DT3/bd1J5/n0y8hef
6VIaqBmJgB/iEjRy0MHWu9L2eXlIVA==
=WNVk
-----END PGP SIGNATURE-----

--Sig_/25=wCiX=8Fzgy8nj+l+4lRI--

