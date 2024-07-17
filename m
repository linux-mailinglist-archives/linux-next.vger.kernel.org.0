Return-Path: <linux-next+bounces-3046-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F19933506
	for <lists+linux-next@lfdr.de>; Wed, 17 Jul 2024 03:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EED6283BAC
	for <lists+linux-next@lfdr.de>; Wed, 17 Jul 2024 01:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FD01109;
	Wed, 17 Jul 2024 01:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lGy73vM+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AD11C36;
	Wed, 17 Jul 2024 01:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721180526; cv=none; b=qvWSYAnYzARWRWqjw50ZTdZ47oePWGrv8j04BfrFLFa7Nui9F/iW6sbF32qOuW5L5pxWFtCb9p2aJf5IlNOfo6GObmv+2V5CeSgrDywJf2nYMQQD8XSP7qSEnyIvquN2D9rMRaNlEXjnD8YHFwnKh9ygL/UHKnGQqmRto/OlurY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721180526; c=relaxed/simple;
	bh=/Ul2VygiXdWoyFnac5xGFmDC8GcSfHxW8Up301a4fMs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iy4EHw1bfQcxgHnja39bTun3ZwVL4vKdYi9S2QEyHsfT6tBWtB6CmRjJxQwuf+LAOu4sGpV6PK/srjxAKBz4Eenga7Cen5R4dWEwZXVRid+gItXEChBN37AfJvjQeKY2YzlJz9+YfuuDbqF3u8O8h9VSESgWL2tzAPdmteV40LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lGy73vM+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721180518;
	bh=kQ/Hwi3EXSFrZUXZaIgUntWltTsa9Y/2q+B9CpQX1nM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lGy73vM+SWShOLO2TRm4jp2Tg2RGnSw6ZQeBmq+WN6vyi1caA52VFXJxJ2rsV0PuG
	 gyfor2auNxwYR/sU/NELa/S4PESeaY02f126Qv8nLETEJoQTR2AFo5XJsqGl/L5WEu
	 1v6BUkTjweEsz1lwrhVA2LZbvJmO0XdCi0jqMlT+wQr2BSzW2Nsbf0W8KtngKZ2FJO
	 627UJiWytMv1kkdmXJAbLETTkjFtmp3K/ugthC4aMFqwZO/NK2b0s1gEkAosJcp60I
	 nV+ttblpAYlj2pmvCEMURHiuLSGQqFmNMLGbNmuNL5U4Ns4E8raHnhHiG2r7lhsx6T
	 Oxjwee8rgxbIA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WNzFJ2qGqz4wbr;
	Wed, 17 Jul 2024 11:41:56 +1000 (AEST)
Date: Wed, 17 Jul 2024 11:41:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mario Limonciello
 <mario.limonciello@amd.com>, Perry Yuan <perry.yuan@amd.com>, "Rafael J.
 Wysocki" <rafael.j.wysocki@intel.com>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Xiaojian Du <Xiaojian.Du@amd.com>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <20240717114155.1a3d4c07@canb.auug.org.au>
In-Reply-To: <20240702141555.3494c5a6@canb.auug.org.au>
References: <20240702141555.3494c5a6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.S458T9HSq8+LGb3HtznUdI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.S458T9HSq8+LGb3HtznUdI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 2 Jul 2024 14:15:55 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   arch/x86/include/asm/cpufeatures.h
>=20
> between commits:
>=20
>   c7107750b2ff ("x86/cpufeatures: Add AMD FAST CPPC feature flag")
>   7ea81936b853 ("x86/cpufeatures: Add HWP highest perf change feature fla=
g")
>=20
> from the pm tree and commit:
>=20
>   78ce84b9e0a5 ("x86/cpufeatures: Flip the /proc/cpuinfo appearance logic=
")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/x86/include/asm/cpufeatures.h
> index 0d99515530d3,6007462e03d6..000000000000
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@@ -283,90 -283,89 +283,90 @@@
>    *
>    * Reuse free bits when adding new feature flags!
>    */
> - #define X86_FEATURE_CQM_LLC		(11*32+ 0) /* LLC QoS if 1 */
> - #define X86_FEATURE_CQM_OCCUP_LLC	(11*32+ 1) /* LLC occupancy monitorin=
g */
> - #define X86_FEATURE_CQM_MBM_TOTAL	(11*32+ 2) /* LLC Total MBM monitorin=
g */
> - #define X86_FEATURE_CQM_MBM_LOCAL	(11*32+ 3) /* LLC Local MBM monitorin=
g */
> - #define X86_FEATURE_FENCE_SWAPGS_USER	(11*32+ 4) /* "" LFENCE in user e=
ntry SWAPGS path */
> - #define X86_FEATURE_FENCE_SWAPGS_KERNEL	(11*32+ 5) /* "" LFENCE in kern=
el entry SWAPGS path */
> - #define X86_FEATURE_SPLIT_LOCK_DETECT	(11*32+ 6) /* #AC for split lock =
*/
> - #define X86_FEATURE_PER_THREAD_MBA	(11*32+ 7) /* "" Per-thread Memory B=
andwidth Allocation */
> - #define X86_FEATURE_SGX1		(11*32+ 8) /* "" Basic SGX */
> - #define X86_FEATURE_SGX2		(11*32+ 9) /* "" SGX Enclave Dynamic Memory M=
anagement (EDMM) */
> - #define X86_FEATURE_ENTRY_IBPB		(11*32+10) /* "" Issue an IBPB on kerne=
l entry */
> - #define X86_FEATURE_RRSBA_CTRL		(11*32+11) /* "" RET prediction control=
 */
> - #define X86_FEATURE_RETPOLINE		(11*32+12) /* "" Generic Retpoline mitig=
ation for Spectre variant 2 */
> - #define X86_FEATURE_RETPOLINE_LFENCE	(11*32+13) /* "" Use LFENCE for Sp=
ectre variant 2 */
> - #define X86_FEATURE_RETHUNK		(11*32+14) /* "" Use REturn THUNK */
> - #define X86_FEATURE_UNRET		(11*32+15) /* "" AMD BTB untrain return */
> - #define X86_FEATURE_USE_IBPB_FW		(11*32+16) /* "" Use IBPB during runti=
me firmware calls */
> - #define X86_FEATURE_RSB_VMEXIT_LITE	(11*32+17) /* "" Fill RSB on VM exi=
t when EIBRS is enabled */
> - #define X86_FEATURE_SGX_EDECCSSA	(11*32+18) /* "" SGX EDECCSSA user lea=
f function */
> - #define X86_FEATURE_CALL_DEPTH		(11*32+19) /* "" Call depth tracking fo=
r RSB stuffing */
> - #define X86_FEATURE_MSR_TSX_CTRL	(11*32+20) /* "" MSR IA32_TSX_CTRL (In=
tel) implemented */
> - #define X86_FEATURE_SMBA		(11*32+21) /* "" Slow Memory Bandwidth Alloca=
tion */
> - #define X86_FEATURE_BMEC		(11*32+22) /* "" Bandwidth Monitoring Event C=
onfiguration */
> - #define X86_FEATURE_USER_SHSTK		(11*32+23) /* Shadow stack support for =
user mode applications */
> - #define X86_FEATURE_SRSO		(11*32+24) /* "" AMD BTB untrain RETs */
> - #define X86_FEATURE_SRSO_ALIAS		(11*32+25) /* "" AMD BTB untrain RETs t=
hrough aliasing */
> - #define X86_FEATURE_IBPB_ON_VMEXIT	(11*32+26) /* "" Issue an IBPB only =
on VMEXIT */
> - #define X86_FEATURE_APIC_MSRS_FENCE	(11*32+27) /* "" IA32_TSC_DEADLINE =
and X2APIC MSRs need fencing */
> - #define X86_FEATURE_ZEN2		(11*32+28) /* "" CPU based on Zen2 microarchi=
tecture */
> - #define X86_FEATURE_ZEN3		(11*32+29) /* "" CPU based on Zen3 microarchi=
tecture */
> - #define X86_FEATURE_ZEN4		(11*32+30) /* "" CPU based on Zen4 microarchi=
tecture */
> - #define X86_FEATURE_ZEN1		(11*32+31) /* "" CPU based on Zen1 microarchi=
tecture */
> + #define X86_FEATURE_CQM_LLC		(11*32+ 0) /* "cqm_llc" LLC QoS if 1 */
> + #define X86_FEATURE_CQM_OCCUP_LLC	(11*32+ 1) /* "cqm_occup_llc" LLC occ=
upancy monitoring */
> + #define X86_FEATURE_CQM_MBM_TOTAL	(11*32+ 2) /* "cqm_mbm_total" LLC Tot=
al MBM monitoring */
> + #define X86_FEATURE_CQM_MBM_LOCAL	(11*32+ 3) /* "cqm_mbm_local" LLC Loc=
al MBM monitoring */
> + #define X86_FEATURE_FENCE_SWAPGS_USER	(11*32+ 4) /* LFENCE in user entr=
y SWAPGS path */
> + #define X86_FEATURE_FENCE_SWAPGS_KERNEL	(11*32+ 5) /* LFENCE in kernel =
entry SWAPGS path */
> + #define X86_FEATURE_SPLIT_LOCK_DETECT	(11*32+ 6) /* "split_lock_detect"=
 #AC for split lock */
> + #define X86_FEATURE_PER_THREAD_MBA	(11*32+ 7) /* Per-thread Memory Band=
width Allocation */
> + #define X86_FEATURE_SGX1		(11*32+ 8) /* Basic SGX */
> + #define X86_FEATURE_SGX2		(11*32+ 9) /* SGX Enclave Dynamic Memory Mana=
gement (EDMM) */
> + #define X86_FEATURE_ENTRY_IBPB		(11*32+10) /* Issue an IBPB on kernel e=
ntry */
> + #define X86_FEATURE_RRSBA_CTRL		(11*32+11) /* RET prediction control */
> + #define X86_FEATURE_RETPOLINE		(11*32+12) /* Generic Retpoline mitigati=
on for Spectre variant 2 */
> + #define X86_FEATURE_RETPOLINE_LFENCE	(11*32+13) /* Use LFENCE for Spect=
re variant 2 */
> + #define X86_FEATURE_RETHUNK		(11*32+14) /* Use REturn THUNK */
> + #define X86_FEATURE_UNRET		(11*32+15) /* AMD BTB untrain return */
> + #define X86_FEATURE_USE_IBPB_FW		(11*32+16) /* Use IBPB during runtime =
firmware calls */
> + #define X86_FEATURE_RSB_VMEXIT_LITE	(11*32+17) /* Fill RSB on VM exit w=
hen EIBRS is enabled */
> + #define X86_FEATURE_SGX_EDECCSSA	(11*32+18) /* SGX EDECCSSA user leaf f=
unction */
> + #define X86_FEATURE_CALL_DEPTH		(11*32+19) /* Call depth tracking for R=
SB stuffing */
> + #define X86_FEATURE_MSR_TSX_CTRL	(11*32+20) /* MSR IA32_TSX_CTRL (Intel=
) implemented */
> + #define X86_FEATURE_SMBA		(11*32+21) /* Slow Memory Bandwidth Allocatio=
n */
> + #define X86_FEATURE_BMEC		(11*32+22) /* Bandwidth Monitoring Event Conf=
iguration */
> + #define X86_FEATURE_USER_SHSTK		(11*32+23) /* "user_shstk" Shadow stack=
 support for user mode applications */
> + #define X86_FEATURE_SRSO		(11*32+24) /* AMD BTB untrain RETs */
> + #define X86_FEATURE_SRSO_ALIAS		(11*32+25) /* AMD BTB untrain RETs thro=
ugh aliasing */
> + #define X86_FEATURE_IBPB_ON_VMEXIT	(11*32+26) /* Issue an IBPB only on =
VMEXIT */
> + #define X86_FEATURE_APIC_MSRS_FENCE	(11*32+27) /* IA32_TSC_DEADLINE and=
 X2APIC MSRs need fencing */
> + #define X86_FEATURE_ZEN2		(11*32+28) /* CPU based on Zen2 microarchitec=
ture */
> + #define X86_FEATURE_ZEN3		(11*32+29) /* CPU based on Zen3 microarchitec=
ture */
> + #define X86_FEATURE_ZEN4		(11*32+30) /* CPU based on Zen4 microarchitec=
ture */
> + #define X86_FEATURE_ZEN1		(11*32+31) /* CPU based on Zen1 microarchitec=
ture */
>  =20
>   /* Intel-defined CPU features, CPUID level 0x00000007:1 (EAX), word 12 =
*/
> - #define X86_FEATURE_AVX_VNNI		(12*32+ 4) /* AVX VNNI instructions */
> - #define X86_FEATURE_AVX512_BF16		(12*32+ 5) /* AVX512 BFLOAT16 instruct=
ions */
> - #define X86_FEATURE_CMPCCXADD           (12*32+ 7) /* "" CMPccXADD inst=
ructions */
> - #define X86_FEATURE_ARCH_PERFMON_EXT	(12*32+ 8) /* "" Intel Architectur=
al PerfMon Extension */
> - #define X86_FEATURE_FZRM		(12*32+10) /* "" Fast zero-length REP MOVSB */
> - #define X86_FEATURE_FSRS		(12*32+11) /* "" Fast short REP STOSB */
> - #define X86_FEATURE_FSRC		(12*32+12) /* "" Fast short REP {CMPSB,SCASB}=
 */
> - #define X86_FEATURE_FRED		(12*32+17) /* Flexible Return and Event Deliv=
ery */
> - #define X86_FEATURE_LKGS		(12*32+18) /* "" Load "kernel" (userspace) GS=
 */
> - #define X86_FEATURE_WRMSRNS		(12*32+19) /* "" Non-serializing WRMSR */
> - #define X86_FEATURE_AMX_FP16		(12*32+21) /* "" AMX fp16 Support */
> - #define X86_FEATURE_AVX_IFMA            (12*32+23) /* "" Support for VP=
MADD52[H,L]UQ */
> - #define X86_FEATURE_LAM			(12*32+26) /* Linear Address Masking */
> + #define X86_FEATURE_AVX_VNNI		(12*32+ 4) /* "avx_vnni" AVX VNNI instruc=
tions */
> + #define X86_FEATURE_AVX512_BF16		(12*32+ 5) /* "avx512_bf16" AVX512 BFL=
OAT16 instructions */
> + #define X86_FEATURE_CMPCCXADD           (12*32+ 7) /* CMPccXADD instruc=
tions */
> + #define X86_FEATURE_ARCH_PERFMON_EXT	(12*32+ 8) /* Intel Architectural =
PerfMon Extension */
> + #define X86_FEATURE_FZRM		(12*32+10) /* Fast zero-length REP MOVSB */
> + #define X86_FEATURE_FSRS		(12*32+11) /* Fast short REP STOSB */
> + #define X86_FEATURE_FSRC		(12*32+12) /* Fast short REP {CMPSB,SCASB} */
> + #define X86_FEATURE_FRED		(12*32+17) /* "fred" Flexible Return and Even=
t Delivery */
> + #define X86_FEATURE_LKGS		(12*32+18) /* Load "kernel" (userspace) GS */
> + #define X86_FEATURE_WRMSRNS		(12*32+19) /* Non-serializing WRMSR */
> + #define X86_FEATURE_AMX_FP16		(12*32+21) /* AMX fp16 Support */
> + #define X86_FEATURE_AVX_IFMA            (12*32+23) /* Support for VPMAD=
D52[H,L]UQ */
> + #define X86_FEATURE_LAM			(12*32+26) /* "lam" Linear Address Masking */
>  =20
>   /* AMD-defined CPU features, CPUID level 0x80000008 (EBX), word 13 */
> - #define X86_FEATURE_CLZERO		(13*32+ 0) /* CLZERO instruction */
> - #define X86_FEATURE_IRPERF		(13*32+ 1) /* Instructions Retired Count */
> - #define X86_FEATURE_XSAVEERPTR		(13*32+ 2) /* Always save/restore FP er=
ror pointers */
> - #define X86_FEATURE_RDPRU		(13*32+ 4) /* Read processor register at use=
r level */
> - #define X86_FEATURE_WBNOINVD		(13*32+ 9) /* WBNOINVD instruction */
> - #define X86_FEATURE_AMD_IBPB		(13*32+12) /* "" Indirect Branch Predicti=
on Barrier */
> - #define X86_FEATURE_AMD_IBRS		(13*32+14) /* "" Indirect Branch Restrict=
ed Speculation */
> - #define X86_FEATURE_AMD_STIBP		(13*32+15) /* "" Single Thread Indirect =
Branch Predictors */
> - #define X86_FEATURE_AMD_STIBP_ALWAYS_ON	(13*32+17) /* "" Single Thread =
Indirect Branch Predictors always-on preferred */
> - #define X86_FEATURE_AMD_PPIN		(13*32+23) /* Protected Processor Invento=
ry Number */
> - #define X86_FEATURE_AMD_SSBD		(13*32+24) /* "" Speculative Store Bypass=
 Disable */
> - #define X86_FEATURE_VIRT_SSBD		(13*32+25) /* Virtualized Speculative St=
ore Bypass Disable */
> - #define X86_FEATURE_AMD_SSB_NO		(13*32+26) /* "" Speculative Store Bypa=
ss is fixed in hardware. */
> - #define X86_FEATURE_CPPC		(13*32+27) /* Collaborative Processor Perform=
ance Control */
> - #define X86_FEATURE_AMD_PSFD            (13*32+28) /* "" Predictive Sto=
re Forwarding Disable */
> - #define X86_FEATURE_BTC_NO		(13*32+29) /* "" Not vulnerable to Branch T=
ype Confusion */
> - #define X86_FEATURE_BRS			(13*32+31) /* Branch Sampling available */
> + #define X86_FEATURE_CLZERO		(13*32+ 0) /* "clzero" CLZERO instruction */
> + #define X86_FEATURE_IRPERF		(13*32+ 1) /* "irperf" Instructions Retired=
 Count */
> + #define X86_FEATURE_XSAVEERPTR		(13*32+ 2) /* "xsaveerptr" Always save/=
restore FP error pointers */
> + #define X86_FEATURE_RDPRU		(13*32+ 4) /* "rdpru" Read processor registe=
r at user level */
> + #define X86_FEATURE_WBNOINVD		(13*32+ 9) /* "wbnoinvd" WBNOINVD instruc=
tion */
> + #define X86_FEATURE_AMD_IBPB		(13*32+12) /* Indirect Branch Prediction =
Barrier */
> + #define X86_FEATURE_AMD_IBRS		(13*32+14) /* Indirect Branch Restricted =
Speculation */
> + #define X86_FEATURE_AMD_STIBP		(13*32+15) /* Single Thread Indirect Bra=
nch Predictors */
> + #define X86_FEATURE_AMD_STIBP_ALWAYS_ON	(13*32+17) /* Single Thread Ind=
irect Branch Predictors always-on preferred */
> + #define X86_FEATURE_AMD_PPIN		(13*32+23) /* "amd_ppin" Protected Proces=
sor Inventory Number */
> + #define X86_FEATURE_AMD_SSBD		(13*32+24) /* Speculative Store Bypass Di=
sable */
> + #define X86_FEATURE_VIRT_SSBD		(13*32+25) /* "virt_ssbd" Virtualized Sp=
eculative Store Bypass Disable */
> + #define X86_FEATURE_AMD_SSB_NO		(13*32+26) /* Speculative Store Bypass =
is fixed in hardware. */
> + #define X86_FEATURE_CPPC		(13*32+27) /* "cppc" Collaborative Processor =
Performance Control */
> + #define X86_FEATURE_AMD_PSFD            (13*32+28) /* Predictive Store =
Forwarding Disable */
> + #define X86_FEATURE_BTC_NO		(13*32+29) /* Not vulnerable to Branch Type=
 Confusion */
> + #define X86_FEATURE_BRS			(13*32+31) /* "brs" Branch Sampling available=
 */
>  =20
>   /* Thermal and Power Management Leaf, CPUID level 0x00000006 (EAX), wor=
d 14 */
> - #define X86_FEATURE_DTHERM		(14*32+ 0) /* Digital Thermal Sensor */
> - #define X86_FEATURE_IDA			(14*32+ 1) /* Intel Dynamic Acceleration */
> - #define X86_FEATURE_ARAT		(14*32+ 2) /* Always Running APIC Timer */
> - #define X86_FEATURE_PLN			(14*32+ 4) /* Intel Power Limit Notification =
*/
> - #define X86_FEATURE_PTS			(14*32+ 6) /* Intel Package Thermal Status */
> - #define X86_FEATURE_HWP			(14*32+ 7) /* Intel Hardware P-states */
> - #define X86_FEATURE_HWP_NOTIFY		(14*32+ 8) /* HWP Notification */
> - #define X86_FEATURE_HWP_ACT_WINDOW	(14*32+ 9) /* HWP Activity Window */
> - #define X86_FEATURE_HWP_EPP		(14*32+10) /* HWP Energy Perf. Preference =
*/
> - #define X86_FEATURE_HWP_PKG_REQ		(14*32+11) /* HWP Package Level Reques=
t */
> - #define X86_FEATURE_HWP_HIGHEST_PERF_CHANGE (14*32+15) /* "" HWP Highes=
t perf change */
> - #define X86_FEATURE_HFI			(14*32+19) /* Hardware Feedback Interface */
> + #define X86_FEATURE_DTHERM		(14*32+ 0) /* "dtherm" Digital Thermal Sens=
or */
> + #define X86_FEATURE_IDA			(14*32+ 1) /* "ida" Intel Dynamic Acceleratio=
n */
> + #define X86_FEATURE_ARAT		(14*32+ 2) /* "arat" Always Running APIC Time=
r */
> + #define X86_FEATURE_PLN			(14*32+ 4) /* "pln" Intel Power Limit Notific=
ation */
> + #define X86_FEATURE_PTS			(14*32+ 6) /* "pts" Intel Package Thermal Sta=
tus */
> + #define X86_FEATURE_HWP			(14*32+ 7) /* "hwp" Intel Hardware P-states */
> + #define X86_FEATURE_HWP_NOTIFY		(14*32+ 8) /* "hwp_notify" HWP Notifica=
tion */
> + #define X86_FEATURE_HWP_ACT_WINDOW	(14*32+ 9) /* "hwp_act_window" HWP A=
ctivity Window */
> + #define X86_FEATURE_HWP_EPP		(14*32+10) /* "hwp_epp" HWP Energy Perf. P=
reference */
> + #define X86_FEATURE_HWP_PKG_REQ		(14*32+11) /* "hwp_pkg_req" HWP Packag=
e Level Request */
> ++#define X86_FEATURE_HWP_HIGHEST_PERF_CHANGE (14*32+15) /* HWP Highest p=
erf change */
> + #define X86_FEATURE_HFI			(14*32+19) /* "hfi" Hardware Feedback Interfa=
ce */
>  =20
>   /* AMD SVM Feature Identification, CPUID level 0x8000000a (EDX), word 1=
5 */
> - #define X86_FEATURE_NPT			(15*32+ 0) /* Nested Page Table support */
> - #define X86_FEATURE_LBRV		(15*32+ 1) /* LBR Virtualization support */
> + #define X86_FEATURE_NPT			(15*32+ 0) /* "npt" Nested Page Table support=
 */
> + #define X86_FEATURE_LBRV		(15*32+ 1) /* "lbrv" LBR Virtualization suppo=
rt */
>   #define X86_FEATURE_SVML		(15*32+ 2) /* "svm_lock" SVM locking MSR */
>   #define X86_FEATURE_NRIPS		(15*32+ 3) /* "nrip_save" SVM next_rip save =
*/
>   #define X86_FEATURE_TSCRATEMSR		(15*32+ 4) /* "tsc_scale" TSC scaling s=
upport */
> @@@ -466,12 -466,11 +467,12 @@@
>    *
>    * Reuse free bits when adding new feature flags!
>    */
> - #define X86_FEATURE_AMD_LBR_PMC_FREEZE	(21*32+ 0) /* AMD LBR and PMC Fr=
eeze */
> - #define X86_FEATURE_CLEAR_BHB_LOOP	(21*32+ 1) /* "" Clear branch histor=
y at syscall entry using SW loop */
> - #define X86_FEATURE_BHI_CTRL		(21*32+ 2) /* "" BHI_DIS_S HW control ava=
ilable */
> - #define X86_FEATURE_CLEAR_BHB_HW	(21*32+ 3) /* "" BHI_DIS_S HW control =
enabled */
> - #define X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT (21*32+ 4) /* "" Clear bra=
nch history at vmexit using SW loop */
> - #define X86_FEATURE_FAST_CPPC		(21*32 + 5) /* "" AMD Fast CPPC */
> + #define X86_FEATURE_AMD_LBR_PMC_FREEZE	(21*32+ 0) /* "amd_lbr_pmc_freez=
e" AMD LBR and PMC Freeze */
> + #define X86_FEATURE_CLEAR_BHB_LOOP	(21*32+ 1) /* Clear branch history a=
t syscall entry using SW loop */
> + #define X86_FEATURE_BHI_CTRL		(21*32+ 2) /* BHI_DIS_S HW control availa=
ble */
> + #define X86_FEATURE_CLEAR_BHB_HW	(21*32+ 3) /* BHI_DIS_S HW control ena=
bled */
> + #define X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT (21*32+ 4) /* Clear branch=
 history at vmexit using SW loop */
> ++#define X86_FEATURE_FAST_CPPC		(21*32 + 5) /* AMD Fast CPPC */
>  =20
>   /*
>    * BUG word(s)

This is now a conflict between the pm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/.S458T9HSq8+LGb3HtznUdI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaXIWMACgkQAVBC80lX
0Gz64ggAnhUN9UDYt1rWyzE5SkE1yWMy5Xu04M6TbFp6oEvQP/GFRsYn+DPKaIMF
if54/hNhsMwmJa/NtAnIZ+X7T7L3O0YU004Mt+BVUco5sGpi4RzaycMgy1pDiedb
FTqcxkzrn5xpCtGhvaL1hiYHppU4YP0TDSFxAbvIJgKDATaPQeIWKC0yQ0JAl73H
Gw6k9gC0kIK8gmZcloijhQEkRdZYpLaqKuO7asuP37MSxNghX+WwfGOmVV9fRoT0
ZYDwEIipKH+gYAnDL+TMoNImx0ES4ufiiwT/dTO3leUS2VDTpYJEc+KLo06OpbJO
mtemOngXQtuWJwA2XNhnU/I+nI9gaw==
=8gJP
-----END PGP SIGNATURE-----

--Sig_/.S458T9HSq8+LGb3HtznUdI--

