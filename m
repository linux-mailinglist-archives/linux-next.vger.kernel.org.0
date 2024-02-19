Return-Path: <linux-next+bounces-1221-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B019085A748
	for <lists+linux-next@lfdr.de>; Mon, 19 Feb 2024 16:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3321BB240A1
	for <lists+linux-next@lfdr.de>; Mon, 19 Feb 2024 15:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478EB383A1;
	Mon, 19 Feb 2024 15:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nodrPi+d"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2085C1DDD5;
	Mon, 19 Feb 2024 15:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708356138; cv=none; b=Av8eRyjlcUcuOFSkikbyq7POv7shvueuXd6WkliCUfmR5yhyLPkIGLaF1lBc9eb4YKXPL8hc7HPmhLHWfGtAPo3KkJCoemn1Lu8paPb1qyyX8HK1YeqHJCVDmwXIbCPEA05sFr1+IxoujwVYqNc+kZjIRJz5BOJJbKK0JWj7GMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708356138; c=relaxed/simple;
	bh=QtXcqGVFjbpkLijulf1Jvx0SGObayq7E4jSw5dE3KbU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qQICNoXl/ylfBTKqNOzNG2yGEOLvmnhr46fGinD8wfq/cy8dGbkRRP8kXXD9klp+Tkh3u3QYp+OCC7KR9MM/7Llfqj0pXj0vvxv/sKTBtgEvgqr0/D3Jvq36f0THRN9E4EJGR7Mou/wJD6W+g0Nmu/5/gXkTJ8v87kF3hrTb18I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nodrPi+d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1ACC433C7;
	Mon, 19 Feb 2024 15:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708356137;
	bh=QtXcqGVFjbpkLijulf1Jvx0SGObayq7E4jSw5dE3KbU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nodrPi+d7WMMOoJB3CMa0XgFli2qSb9CuSyqNzE5UVMeXiZYDkoffoNDDG4Ph40o5
	 RLFllnVOSbQbfPokkdRKQHeNISnKfo/cg0ratiJB0rYli/EZUgB7sB5qvhP0UqP8Ew
	 l5OAUx3iZ6KRBKcw7WTwha+XIe54zwuLbEDImUBXA/wUqRNiGNHCR0P7odTQp9jA5u
	 4ZFHskoOl7aa6s8JOV94sLfxhvFZO4QbEsVpiU5I2wuZtERYCCDFlal+fQNbiHKb1A
	 p7X3hNKxr+qM8O1y5CzvL5dVFHycBvXPcF//D5cn93FB5kObIvZrbobTU6/GGuCUEa
	 DJM0tT1b21fTg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1rc5TD-004cLo-Bp;
	Mon, 19 Feb 2024 15:22:15 +0000
Date: Mon, 19 Feb 2024 15:22:14 +0000
Message-ID: <86bk8c4gyh.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Christoffer Dall <cdall@cs.columbia.edu>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Ard Biesheuvel <ardb@kernel.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm64 tree
In-Reply-To: <ZdNGGrUDWfvqCudV@arm.com>
References: <20240219135805.1c4138a3@canb.auug.org.au>
	<ZdNGGrUDWfvqCudV@arm.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: catalin.marinas@arm.com, sfr@canb.auug.org.au, cdall@cs.columbia.edu, will@kernel.org, ardb@kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, oliver.upton@linux.dev, ardb@kernel.org, will@kernel.org, mark.rutland@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Mon, 19 Feb 2024 12:14:18 +0000,
Catalin Marinas <catalin.marinas@arm.com> wrote:
>=20
> On Mon, Feb 19, 2024 at 01:58:05PM +1100, Stephen Rothwell wrote:
> > diff --cc arch/arm64/kernel/cpufeature.c
> > index 0be9296e9253,f309fd542c20..000000000000
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@@ -721,13 -754,12 +756,14 @@@ static const struct __ftr_reg_entry=20
> >   			       &id_aa64isar2_override),
> >  =20
> >   	/* Op1 =3D 0, CRn =3D 0, CRm =3D 7 */
> >  -	ARM64_FTR_REG(SYS_ID_AA64MMFR0_EL1, ftr_id_aa64mmfr0),
> >  +	ARM64_FTR_REG_OVERRIDE(SYS_ID_AA64MMFR0_EL1, ftr_id_aa64mmfr0,
> >  +			       &id_aa64mmfr0_override),
> >   	ARM64_FTR_REG_OVERRIDE(SYS_ID_AA64MMFR1_EL1, ftr_id_aa64mmfr1,
> >   			       &id_aa64mmfr1_override),
> >  -	ARM64_FTR_REG(SYS_ID_AA64MMFR2_EL1, ftr_id_aa64mmfr2),
> >  +	ARM64_FTR_REG_OVERRIDE(SYS_ID_AA64MMFR2_EL1, ftr_id_aa64mmfr2,
> >  +			       &id_aa64mmfr2_override),
> >   	ARM64_FTR_REG(SYS_ID_AA64MMFR3_EL1, ftr_id_aa64mmfr3),
> > + 	ARM64_FTR_REG(SYS_ID_AA64MMFR4_EL1, ftr_id_aa64mmfr4),
> >  =20
> >   	/* Op1 =3D 1, CRn =3D 0, CRm =3D 0 */
> >   	ARM64_FTR_REG(SYS_GMID_EL1, ftr_gmid),
> > @@@ -2701,33 -2817,13 +2779,40 @@@ static const struct arm64_cpu_capabi=
lit
> >   		.type =3D ARM64_CPUCAP_SYSTEM_FEATURE,
> >   		.matches =3D has_lpa2,
> >   	},
> >  +#ifdef CONFIG_ARM64_VA_BITS_52
> >  +	{
> >  +		.capability =3D ARM64_HAS_VA52,
> >  +		.type =3D ARM64_CPUCAP_BOOT_CPU_FEATURE,
> >  +		.matches =3D has_cpuid_feature,
> >  +		.field_width =3D 4,
> >  +#ifdef CONFIG_ARM64_64K_PAGES
> >  +		.desc =3D "52-bit Virtual Addressing (LVA)",
> >  +		.sign =3D FTR_SIGNED,
> >  +		.sys_reg =3D SYS_ID_AA64MMFR2_EL1,
> >  +		.field_pos =3D ID_AA64MMFR2_EL1_VARange_SHIFT,
> >  +		.min_field_value =3D ID_AA64MMFR2_EL1_VARange_52,
> >  +#else
> >  +		.desc =3D "52-bit Virtual Addressing (LPA2)",
> >  +		.sys_reg =3D SYS_ID_AA64MMFR0_EL1,
> >  +#ifdef CONFIG_ARM64_4K_PAGES
> >  +		.sign =3D FTR_SIGNED,
> >  +		.field_pos =3D ID_AA64MMFR0_EL1_TGRAN4_SHIFT,
> >  +		.min_field_value =3D ID_AA64MMFR0_EL1_TGRAN4_52_BIT,
> >  +#else
> >  +		.sign =3D FTR_UNSIGNED,
> >  +		.field_pos =3D ID_AA64MMFR0_EL1_TGRAN16_SHIFT,
> >  +		.min_field_value =3D ID_AA64MMFR0_EL1_TGRAN16_52_BIT,
> >  +#endif
> >  +#endif
> >  +	},
> >  +#endif
> > + 	{
> > + 		.desc =3D "NV1",
> > + 		.capability =3D ARM64_HAS_HCR_NV1,
> > + 		.type =3D ARM64_CPUCAP_SYSTEM_FEATURE,
> > + 		.matches =3D has_nv1,
> > + 		ARM64_CPUID_FIELDS_NEG(ID_AA64MMFR4_EL1, E2H0, NI_NV1)
> > + 	},
> >   	{},
> >   };
>=20
> Thanks Stephen. It looks fine.

Actually, it breaks 52bit support in a "subtle" way (multiple reports
on the list and IRC, all pointing to failures on QEMU). The KVM tree
adds support for feature ranges, which this code is totally unaware
of, and only provides the min value and not the max. Things go wrong
from there.

I propose to fix it like below, which makes it robust against the KVM
changes (patch applies to arm64/for-next/core). I have tested it in
combination with kvmarm/next, with 4kB and 16kB (LVA2), as well as
64kB (LVA).

Thanks,

	M.

=46rom f24638a5f41424faf47f3d9035e6dcbd3800fcb6 Mon Sep 17 00:00:00 2001
From: Marc Zyngier <maz@kernel.org>
Date: Mon, 19 Feb 2024 15:13:22 +0000
Subject: [PATCH] arm64: Use Signed/Unsigned enums for TGRAN{4,16,64} and
 VARange

Open-coding the feature matching parameters for LVA/LVA2 leads to
issues with upcoming changes to the cpufeature code.

By making TGRAN{4,16,64} and VARange signed/unsigned as per the
architecture, we can use the existing macros, making the feature
match robust against those changes.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 15 +++------------
 arch/arm64/tools/sysreg        |  8 ++++----
 2 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 8f9665e8774b..2119e9dd0c4e 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2791,24 +2791,15 @@ static const struct arm64_cpu_capabilities arm64_fe=
atures[] =3D {
 		.capability =3D ARM64_HAS_VA52,
 		.type =3D ARM64_CPUCAP_BOOT_CPU_FEATURE,
 		.matches =3D has_cpuid_feature,
-		.field_width =3D 4,
 #ifdef CONFIG_ARM64_64K_PAGES
 		.desc =3D "52-bit Virtual Addressing (LVA)",
-		.sign =3D FTR_SIGNED,
-		.sys_reg =3D SYS_ID_AA64MMFR2_EL1,
-		.field_pos =3D ID_AA64MMFR2_EL1_VARange_SHIFT,
-		.min_field_value =3D ID_AA64MMFR2_EL1_VARange_52,
+		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, VARange, 52)
 #else
 		.desc =3D "52-bit Virtual Addressing (LPA2)",
-		.sys_reg =3D SYS_ID_AA64MMFR0_EL1,
 #ifdef CONFIG_ARM64_4K_PAGES
-		.sign =3D FTR_SIGNED,
-		.field_pos =3D ID_AA64MMFR0_EL1_TGRAN4_SHIFT,
-		.min_field_value =3D ID_AA64MMFR0_EL1_TGRAN4_52_BIT,
+		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, TGRAN4, 52_BIT)
 #else
-		.sign =3D FTR_UNSIGNED,
-		.field_pos =3D ID_AA64MMFR0_EL1_TGRAN16_SHIFT,
-		.min_field_value =3D ID_AA64MMFR0_EL1_TGRAN16_52_BIT,
+		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, TGRAN16, 52_BIT)
 #endif
 #endif
 	},
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index fa3fe0856880..670a33fca3bc 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1540,16 +1540,16 @@ Enum	35:32	TGRAN16_2
 	0b0010	IMP
 	0b0011	52_BIT
 EndEnum
-Enum	31:28	TGRAN4
+SignedEnum	31:28	TGRAN4
 	0b0000	IMP
 	0b0001	52_BIT
 	0b1111	NI
 EndEnum
-Enum	27:24	TGRAN64
+SignedEnum	27:24	TGRAN64
 	0b0000	IMP
 	0b1111	NI
 EndEnum
-Enum	23:20	TGRAN16
+UnsignedEnum	23:20	TGRAN16
 	0b0000	NI
 	0b0001	IMP
 	0b0010	52_BIT
@@ -1697,7 +1697,7 @@ Enum	23:20	CCIDX
 	0b0000	32
 	0b0001	64
 EndEnum
-Enum	19:16	VARange
+UnsignedEnum	19:16	VARange
 	0b0000	48
 	0b0001	52
 EndEnum
--=20
2.39.2


--=20
Without deviation from the norm, progress is not possible.

