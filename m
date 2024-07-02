Return-Path: <linux-next+bounces-2787-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D0291EDC1
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 06:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88CC21C22606
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 04:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA7A1DA24;
	Tue,  2 Jul 2024 04:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Y/vVo/cM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFF36FCB;
	Tue,  2 Jul 2024 04:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719893766; cv=none; b=ryV95I1S9gv1IyqRFqdgHYZZUCUuRsfO9eTG4Z5KikTWIxkKyoELxSSbRp+ewm3bCkHo7kr9CjB45w4xYxwsAUecCvcUNe4HIP3XUv2tFMEKiWFLJpwe2BLsfqUNmHAyr1llk/intjsg3zk9FYhocv91s87kZTZL9tdpnEayEQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719893766; c=relaxed/simple;
	bh=dsniAQWay6tr/whEvoWyt1Xz55ihppVkwPnO0YM3XSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UZcppWyOZlVujMwDROD3PVHzRbbOrmV9EP5FXvtgmqzXwjB135ReACB6kHgoTjy5jsjEh59B84kv6OqUshPlm0LVEZLjI4+klbPjlTKfhwDsE69ePvfs6vUAL99fPMd8e3EmO8uS6JgyJprdbXYN+tZIJdAN5tzj32jiJoKL300=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Y/vVo/cM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719893758;
	bh=j2GLWw7TPB4X6uS9TTpub8kq0A6hy9CjN6EDLW5DAIM=;
	h=Date:From:To:Cc:Subject:From;
	b=Y/vVo/cMZcLASRDWsXD68GN/Rf380J1xdIslEwBDZmxMjIn6VEWt5ymvtlrn1SuME
	 O4NkFY1qMOLmFJ6YsVIPktr6mqe1RNmC5mkOXloHNGZ1KRUXLZg+DYkBJUmLi9idwU
	 r8dzb4bolZIH7JToN8W7LnKskALZ01nJmTgKrjHPCe4z4P2+SAzdCA8A1a+K8/YSid
	 GP0amjxbORDhE+HpSF0oC7f4cCXq2wImEIt79/dfcM3RtIQBm6+MVfteKVbeQYiLl/
	 TNZ5jFHLPTynwTfuLvIQpQ12TaG7KdKpKmfMMnS/xJllUy7NAuhRJZcK2W8D3ni0Lk
	 FA/Vx3s6qLSYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCqMw65c5z4wbr;
	Tue,  2 Jul 2024 14:15:56 +1000 (AEST)
Date: Tue, 2 Jul 2024 14:15:55 +1000
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
Subject: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <20240702141555.3494c5a6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0U2=0zcqyTt+2jZ_5TTPgGt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0U2=0zcqyTt+2jZ_5TTPgGt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/include/asm/cpufeatures.h

between commits:

  c7107750b2ff ("x86/cpufeatures: Add AMD FAST CPPC feature flag")
  7ea81936b853 ("x86/cpufeatures: Add HWP highest perf change feature flag")

from the pm tree and commit:

  78ce84b9e0a5 ("x86/cpufeatures: Flip the /proc/cpuinfo appearance logic")

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

diff --cc arch/x86/include/asm/cpufeatures.h
index 0d99515530d3,6007462e03d6..000000000000
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@@ -283,90 -283,89 +283,90 @@@
   *
   * Reuse free bits when adding new feature flags!
   */
- #define X86_FEATURE_CQM_LLC		(11*32+ 0) /* LLC QoS if 1 */
- #define X86_FEATURE_CQM_OCCUP_LLC	(11*32+ 1) /* LLC occupancy monitoring =
*/
- #define X86_FEATURE_CQM_MBM_TOTAL	(11*32+ 2) /* LLC Total MBM monitoring =
*/
- #define X86_FEATURE_CQM_MBM_LOCAL	(11*32+ 3) /* LLC Local MBM monitoring =
*/
- #define X86_FEATURE_FENCE_SWAPGS_USER	(11*32+ 4) /* "" LFENCE in user ent=
ry SWAPGS path */
- #define X86_FEATURE_FENCE_SWAPGS_KERNEL	(11*32+ 5) /* "" LFENCE in kernel=
 entry SWAPGS path */
- #define X86_FEATURE_SPLIT_LOCK_DETECT	(11*32+ 6) /* #AC for split lock */
- #define X86_FEATURE_PER_THREAD_MBA	(11*32+ 7) /* "" Per-thread Memory Ban=
dwidth Allocation */
- #define X86_FEATURE_SGX1		(11*32+ 8) /* "" Basic SGX */
- #define X86_FEATURE_SGX2		(11*32+ 9) /* "" SGX Enclave Dynamic Memory Man=
agement (EDMM) */
- #define X86_FEATURE_ENTRY_IBPB		(11*32+10) /* "" Issue an IBPB on kernel =
entry */
- #define X86_FEATURE_RRSBA_CTRL		(11*32+11) /* "" RET prediction control */
- #define X86_FEATURE_RETPOLINE		(11*32+12) /* "" Generic Retpoline mitigat=
ion for Spectre variant 2 */
- #define X86_FEATURE_RETPOLINE_LFENCE	(11*32+13) /* "" Use LFENCE for Spec=
tre variant 2 */
- #define X86_FEATURE_RETHUNK		(11*32+14) /* "" Use REturn THUNK */
- #define X86_FEATURE_UNRET		(11*32+15) /* "" AMD BTB untrain return */
- #define X86_FEATURE_USE_IBPB_FW		(11*32+16) /* "" Use IBPB during runtime=
 firmware calls */
- #define X86_FEATURE_RSB_VMEXIT_LITE	(11*32+17) /* "" Fill RSB on VM exit =
when EIBRS is enabled */
- #define X86_FEATURE_SGX_EDECCSSA	(11*32+18) /* "" SGX EDECCSSA user leaf =
function */
- #define X86_FEATURE_CALL_DEPTH		(11*32+19) /* "" Call depth tracking for =
RSB stuffing */
- #define X86_FEATURE_MSR_TSX_CTRL	(11*32+20) /* "" MSR IA32_TSX_CTRL (Inte=
l) implemented */
- #define X86_FEATURE_SMBA		(11*32+21) /* "" Slow Memory Bandwidth Allocati=
on */
- #define X86_FEATURE_BMEC		(11*32+22) /* "" Bandwidth Monitoring Event Con=
figuration */
- #define X86_FEATURE_USER_SHSTK		(11*32+23) /* Shadow stack support for us=
er mode applications */
- #define X86_FEATURE_SRSO		(11*32+24) /* "" AMD BTB untrain RETs */
- #define X86_FEATURE_SRSO_ALIAS		(11*32+25) /* "" AMD BTB untrain RETs thr=
ough aliasing */
- #define X86_FEATURE_IBPB_ON_VMEXIT	(11*32+26) /* "" Issue an IBPB only on=
 VMEXIT */
- #define X86_FEATURE_APIC_MSRS_FENCE	(11*32+27) /* "" IA32_TSC_DEADLINE an=
d X2APIC MSRs need fencing */
- #define X86_FEATURE_ZEN2		(11*32+28) /* "" CPU based on Zen2 microarchite=
cture */
- #define X86_FEATURE_ZEN3		(11*32+29) /* "" CPU based on Zen3 microarchite=
cture */
- #define X86_FEATURE_ZEN4		(11*32+30) /* "" CPU based on Zen4 microarchite=
cture */
- #define X86_FEATURE_ZEN1		(11*32+31) /* "" CPU based on Zen1 microarchite=
cture */
+ #define X86_FEATURE_CQM_LLC		(11*32+ 0) /* "cqm_llc" LLC QoS if 1 */
+ #define X86_FEATURE_CQM_OCCUP_LLC	(11*32+ 1) /* "cqm_occup_llc" LLC occup=
ancy monitoring */
+ #define X86_FEATURE_CQM_MBM_TOTAL	(11*32+ 2) /* "cqm_mbm_total" LLC Total=
 MBM monitoring */
+ #define X86_FEATURE_CQM_MBM_LOCAL	(11*32+ 3) /* "cqm_mbm_local" LLC Local=
 MBM monitoring */
+ #define X86_FEATURE_FENCE_SWAPGS_USER	(11*32+ 4) /* LFENCE in user entry =
SWAPGS path */
+ #define X86_FEATURE_FENCE_SWAPGS_KERNEL	(11*32+ 5) /* LFENCE in kernel en=
try SWAPGS path */
+ #define X86_FEATURE_SPLIT_LOCK_DETECT	(11*32+ 6) /* "split_lock_detect" #=
AC for split lock */
+ #define X86_FEATURE_PER_THREAD_MBA	(11*32+ 7) /* Per-thread Memory Bandwi=
dth Allocation */
+ #define X86_FEATURE_SGX1		(11*32+ 8) /* Basic SGX */
+ #define X86_FEATURE_SGX2		(11*32+ 9) /* SGX Enclave Dynamic Memory Manage=
ment (EDMM) */
+ #define X86_FEATURE_ENTRY_IBPB		(11*32+10) /* Issue an IBPB on kernel ent=
ry */
+ #define X86_FEATURE_RRSBA_CTRL		(11*32+11) /* RET prediction control */
+ #define X86_FEATURE_RETPOLINE		(11*32+12) /* Generic Retpoline mitigation=
 for Spectre variant 2 */
+ #define X86_FEATURE_RETPOLINE_LFENCE	(11*32+13) /* Use LFENCE for Spectre=
 variant 2 */
+ #define X86_FEATURE_RETHUNK		(11*32+14) /* Use REturn THUNK */
+ #define X86_FEATURE_UNRET		(11*32+15) /* AMD BTB untrain return */
+ #define X86_FEATURE_USE_IBPB_FW		(11*32+16) /* Use IBPB during runtime fi=
rmware calls */
+ #define X86_FEATURE_RSB_VMEXIT_LITE	(11*32+17) /* Fill RSB on VM exit whe=
n EIBRS is enabled */
+ #define X86_FEATURE_SGX_EDECCSSA	(11*32+18) /* SGX EDECCSSA user leaf fun=
ction */
+ #define X86_FEATURE_CALL_DEPTH		(11*32+19) /* Call depth tracking for RSB=
 stuffing */
+ #define X86_FEATURE_MSR_TSX_CTRL	(11*32+20) /* MSR IA32_TSX_CTRL (Intel) =
implemented */
+ #define X86_FEATURE_SMBA		(11*32+21) /* Slow Memory Bandwidth Allocation =
*/
+ #define X86_FEATURE_BMEC		(11*32+22) /* Bandwidth Monitoring Event Config=
uration */
+ #define X86_FEATURE_USER_SHSTK		(11*32+23) /* "user_shstk" Shadow stack s=
upport for user mode applications */
+ #define X86_FEATURE_SRSO		(11*32+24) /* AMD BTB untrain RETs */
+ #define X86_FEATURE_SRSO_ALIAS		(11*32+25) /* AMD BTB untrain RETs throug=
h aliasing */
+ #define X86_FEATURE_IBPB_ON_VMEXIT	(11*32+26) /* Issue an IBPB only on VM=
EXIT */
+ #define X86_FEATURE_APIC_MSRS_FENCE	(11*32+27) /* IA32_TSC_DEADLINE and X=
2APIC MSRs need fencing */
+ #define X86_FEATURE_ZEN2		(11*32+28) /* CPU based on Zen2 microarchitectu=
re */
+ #define X86_FEATURE_ZEN3		(11*32+29) /* CPU based on Zen3 microarchitectu=
re */
+ #define X86_FEATURE_ZEN4		(11*32+30) /* CPU based on Zen4 microarchitectu=
re */
+ #define X86_FEATURE_ZEN1		(11*32+31) /* CPU based on Zen1 microarchitectu=
re */
 =20
  /* Intel-defined CPU features, CPUID level 0x00000007:1 (EAX), word 12 */
- #define X86_FEATURE_AVX_VNNI		(12*32+ 4) /* AVX VNNI instructions */
- #define X86_FEATURE_AVX512_BF16		(12*32+ 5) /* AVX512 BFLOAT16 instructio=
ns */
- #define X86_FEATURE_CMPCCXADD           (12*32+ 7) /* "" CMPccXADD instru=
ctions */
- #define X86_FEATURE_ARCH_PERFMON_EXT	(12*32+ 8) /* "" Intel Architectural=
 PerfMon Extension */
- #define X86_FEATURE_FZRM		(12*32+10) /* "" Fast zero-length REP MOVSB */
- #define X86_FEATURE_FSRS		(12*32+11) /* "" Fast short REP STOSB */
- #define X86_FEATURE_FSRC		(12*32+12) /* "" Fast short REP {CMPSB,SCASB} */
- #define X86_FEATURE_FRED		(12*32+17) /* Flexible Return and Event Deliver=
y */
- #define X86_FEATURE_LKGS		(12*32+18) /* "" Load "kernel" (userspace) GS */
- #define X86_FEATURE_WRMSRNS		(12*32+19) /* "" Non-serializing WRMSR */
- #define X86_FEATURE_AMX_FP16		(12*32+21) /* "" AMX fp16 Support */
- #define X86_FEATURE_AVX_IFMA            (12*32+23) /* "" Support for VPMA=
DD52[H,L]UQ */
- #define X86_FEATURE_LAM			(12*32+26) /* Linear Address Masking */
+ #define X86_FEATURE_AVX_VNNI		(12*32+ 4) /* "avx_vnni" AVX VNNI instructi=
ons */
+ #define X86_FEATURE_AVX512_BF16		(12*32+ 5) /* "avx512_bf16" AVX512 BFLOA=
T16 instructions */
+ #define X86_FEATURE_CMPCCXADD           (12*32+ 7) /* CMPccXADD instructi=
ons */
+ #define X86_FEATURE_ARCH_PERFMON_EXT	(12*32+ 8) /* Intel Architectural Pe=
rfMon Extension */
+ #define X86_FEATURE_FZRM		(12*32+10) /* Fast zero-length REP MOVSB */
+ #define X86_FEATURE_FSRS		(12*32+11) /* Fast short REP STOSB */
+ #define X86_FEATURE_FSRC		(12*32+12) /* Fast short REP {CMPSB,SCASB} */
+ #define X86_FEATURE_FRED		(12*32+17) /* "fred" Flexible Return and Event =
Delivery */
+ #define X86_FEATURE_LKGS		(12*32+18) /* Load "kernel" (userspace) GS */
+ #define X86_FEATURE_WRMSRNS		(12*32+19) /* Non-serializing WRMSR */
+ #define X86_FEATURE_AMX_FP16		(12*32+21) /* AMX fp16 Support */
+ #define X86_FEATURE_AVX_IFMA            (12*32+23) /* Support for VPMADD5=
2[H,L]UQ */
+ #define X86_FEATURE_LAM			(12*32+26) /* "lam" Linear Address Masking */
 =20
  /* AMD-defined CPU features, CPUID level 0x80000008 (EBX), word 13 */
- #define X86_FEATURE_CLZERO		(13*32+ 0) /* CLZERO instruction */
- #define X86_FEATURE_IRPERF		(13*32+ 1) /* Instructions Retired Count */
- #define X86_FEATURE_XSAVEERPTR		(13*32+ 2) /* Always save/restore FP erro=
r pointers */
- #define X86_FEATURE_RDPRU		(13*32+ 4) /* Read processor register at user =
level */
- #define X86_FEATURE_WBNOINVD		(13*32+ 9) /* WBNOINVD instruction */
- #define X86_FEATURE_AMD_IBPB		(13*32+12) /* "" Indirect Branch Prediction=
 Barrier */
- #define X86_FEATURE_AMD_IBRS		(13*32+14) /* "" Indirect Branch Restricted=
 Speculation */
- #define X86_FEATURE_AMD_STIBP		(13*32+15) /* "" Single Thread Indirect Br=
anch Predictors */
- #define X86_FEATURE_AMD_STIBP_ALWAYS_ON	(13*32+17) /* "" Single Thread In=
direct Branch Predictors always-on preferred */
- #define X86_FEATURE_AMD_PPIN		(13*32+23) /* Protected Processor Inventory=
 Number */
- #define X86_FEATURE_AMD_SSBD		(13*32+24) /* "" Speculative Store Bypass D=
isable */
- #define X86_FEATURE_VIRT_SSBD		(13*32+25) /* Virtualized Speculative Stor=
e Bypass Disable */
- #define X86_FEATURE_AMD_SSB_NO		(13*32+26) /* "" Speculative Store Bypass=
 is fixed in hardware. */
- #define X86_FEATURE_CPPC		(13*32+27) /* Collaborative Processor Performan=
ce Control */
- #define X86_FEATURE_AMD_PSFD            (13*32+28) /* "" Predictive Store=
 Forwarding Disable */
- #define X86_FEATURE_BTC_NO		(13*32+29) /* "" Not vulnerable to Branch Typ=
e Confusion */
- #define X86_FEATURE_BRS			(13*32+31) /* Branch Sampling available */
+ #define X86_FEATURE_CLZERO		(13*32+ 0) /* "clzero" CLZERO instruction */
+ #define X86_FEATURE_IRPERF		(13*32+ 1) /* "irperf" Instructions Retired C=
ount */
+ #define X86_FEATURE_XSAVEERPTR		(13*32+ 2) /* "xsaveerptr" Always save/re=
store FP error pointers */
+ #define X86_FEATURE_RDPRU		(13*32+ 4) /* "rdpru" Read processor register =
at user level */
+ #define X86_FEATURE_WBNOINVD		(13*32+ 9) /* "wbnoinvd" WBNOINVD instructi=
on */
+ #define X86_FEATURE_AMD_IBPB		(13*32+12) /* Indirect Branch Prediction Ba=
rrier */
+ #define X86_FEATURE_AMD_IBRS		(13*32+14) /* Indirect Branch Restricted Sp=
eculation */
+ #define X86_FEATURE_AMD_STIBP		(13*32+15) /* Single Thread Indirect Branc=
h Predictors */
+ #define X86_FEATURE_AMD_STIBP_ALWAYS_ON	(13*32+17) /* Single Thread Indir=
ect Branch Predictors always-on preferred */
+ #define X86_FEATURE_AMD_PPIN		(13*32+23) /* "amd_ppin" Protected Processo=
r Inventory Number */
+ #define X86_FEATURE_AMD_SSBD		(13*32+24) /* Speculative Store Bypass Disa=
ble */
+ #define X86_FEATURE_VIRT_SSBD		(13*32+25) /* "virt_ssbd" Virtualized Spec=
ulative Store Bypass Disable */
+ #define X86_FEATURE_AMD_SSB_NO		(13*32+26) /* Speculative Store Bypass is=
 fixed in hardware. */
+ #define X86_FEATURE_CPPC		(13*32+27) /* "cppc" Collaborative Processor Pe=
rformance Control */
+ #define X86_FEATURE_AMD_PSFD            (13*32+28) /* Predictive Store Fo=
rwarding Disable */
+ #define X86_FEATURE_BTC_NO		(13*32+29) /* Not vulnerable to Branch Type C=
onfusion */
+ #define X86_FEATURE_BRS			(13*32+31) /* "brs" Branch Sampling available */
 =20
  /* Thermal and Power Management Leaf, CPUID level 0x00000006 (EAX), word =
14 */
- #define X86_FEATURE_DTHERM		(14*32+ 0) /* Digital Thermal Sensor */
- #define X86_FEATURE_IDA			(14*32+ 1) /* Intel Dynamic Acceleration */
- #define X86_FEATURE_ARAT		(14*32+ 2) /* Always Running APIC Timer */
- #define X86_FEATURE_PLN			(14*32+ 4) /* Intel Power Limit Notification */
- #define X86_FEATURE_PTS			(14*32+ 6) /* Intel Package Thermal Status */
- #define X86_FEATURE_HWP			(14*32+ 7) /* Intel Hardware P-states */
- #define X86_FEATURE_HWP_NOTIFY		(14*32+ 8) /* HWP Notification */
- #define X86_FEATURE_HWP_ACT_WINDOW	(14*32+ 9) /* HWP Activity Window */
- #define X86_FEATURE_HWP_EPP		(14*32+10) /* HWP Energy Perf. Preference */
- #define X86_FEATURE_HWP_PKG_REQ		(14*32+11) /* HWP Package Level Request =
*/
- #define X86_FEATURE_HWP_HIGHEST_PERF_CHANGE (14*32+15) /* "" HWP Highest =
perf change */
- #define X86_FEATURE_HFI			(14*32+19) /* Hardware Feedback Interface */
+ #define X86_FEATURE_DTHERM		(14*32+ 0) /* "dtherm" Digital Thermal Sensor=
 */
+ #define X86_FEATURE_IDA			(14*32+ 1) /* "ida" Intel Dynamic Acceleration =
*/
+ #define X86_FEATURE_ARAT		(14*32+ 2) /* "arat" Always Running APIC Timer =
*/
+ #define X86_FEATURE_PLN			(14*32+ 4) /* "pln" Intel Power Limit Notificat=
ion */
+ #define X86_FEATURE_PTS			(14*32+ 6) /* "pts" Intel Package Thermal Statu=
s */
+ #define X86_FEATURE_HWP			(14*32+ 7) /* "hwp" Intel Hardware P-states */
+ #define X86_FEATURE_HWP_NOTIFY		(14*32+ 8) /* "hwp_notify" HWP Notificati=
on */
+ #define X86_FEATURE_HWP_ACT_WINDOW	(14*32+ 9) /* "hwp_act_window" HWP Act=
ivity Window */
+ #define X86_FEATURE_HWP_EPP		(14*32+10) /* "hwp_epp" HWP Energy Perf. Pre=
ference */
+ #define X86_FEATURE_HWP_PKG_REQ		(14*32+11) /* "hwp_pkg_req" HWP Package =
Level Request */
++#define X86_FEATURE_HWP_HIGHEST_PERF_CHANGE (14*32+15) /* HWP Highest per=
f change */
+ #define X86_FEATURE_HFI			(14*32+19) /* "hfi" Hardware Feedback Interface=
 */
 =20
  /* AMD SVM Feature Identification, CPUID level 0x8000000a (EDX), word 15 =
*/
- #define X86_FEATURE_NPT			(15*32+ 0) /* Nested Page Table support */
- #define X86_FEATURE_LBRV		(15*32+ 1) /* LBR Virtualization support */
+ #define X86_FEATURE_NPT			(15*32+ 0) /* "npt" Nested Page Table support */
+ #define X86_FEATURE_LBRV		(15*32+ 1) /* "lbrv" LBR Virtualization support=
 */
  #define X86_FEATURE_SVML		(15*32+ 2) /* "svm_lock" SVM locking MSR */
  #define X86_FEATURE_NRIPS		(15*32+ 3) /* "nrip_save" SVM next_rip save */
  #define X86_FEATURE_TSCRATEMSR		(15*32+ 4) /* "tsc_scale" TSC scaling sup=
port */
@@@ -466,12 -466,11 +467,12 @@@
   *
   * Reuse free bits when adding new feature flags!
   */
- #define X86_FEATURE_AMD_LBR_PMC_FREEZE	(21*32+ 0) /* AMD LBR and PMC Free=
ze */
- #define X86_FEATURE_CLEAR_BHB_LOOP	(21*32+ 1) /* "" Clear branch history =
at syscall entry using SW loop */
- #define X86_FEATURE_BHI_CTRL		(21*32+ 2) /* "" BHI_DIS_S HW control avail=
able */
- #define X86_FEATURE_CLEAR_BHB_HW	(21*32+ 3) /* "" BHI_DIS_S HW control en=
abled */
- #define X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT (21*32+ 4) /* "" Clear branc=
h history at vmexit using SW loop */
- #define X86_FEATURE_FAST_CPPC		(21*32 + 5) /* "" AMD Fast CPPC */
+ #define X86_FEATURE_AMD_LBR_PMC_FREEZE	(21*32+ 0) /* "amd_lbr_pmc_freeze"=
 AMD LBR and PMC Freeze */
+ #define X86_FEATURE_CLEAR_BHB_LOOP	(21*32+ 1) /* Clear branch history at =
syscall entry using SW loop */
+ #define X86_FEATURE_BHI_CTRL		(21*32+ 2) /* BHI_DIS_S HW control availabl=
e */
+ #define X86_FEATURE_CLEAR_BHB_HW	(21*32+ 3) /* BHI_DIS_S HW control enabl=
ed */
+ #define X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT (21*32+ 4) /* Clear branch h=
istory at vmexit using SW loop */
++#define X86_FEATURE_FAST_CPPC		(21*32 + 5) /* AMD Fast CPPC */
 =20
  /*
   * BUG word(s)

--Sig_/0U2=0zcqyTt+2jZ_5TTPgGt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaDfvsACgkQAVBC80lX
0Gx5SQf+LPzF8Ka4851H23x0zQ93J83TQppx6sUxnAKHu93l4xnzKTXhbvLCoHuN
s203/7+GFdqL0LDEVrQm/UaYYIAiP7u1/yacPpUgXBrUELR4s257PhoI/KX6nRY9
YzkvcAJT00AF7ASBb+IGqxi3ROfmVXmvdxJiTdu7mQKerLQXJJ6kcCwAvmSaCJUU
+PqExucNhKJDAoEEm5svbAngYTEUECWLpY5vNgOvApIOt1GPHnxlEKLV4lDyz+1c
5/Qiwd9ZBNiBUOfrJe66zV4b+k2XPyMAZhXsdzFyZgxPmzgYWtZzRJ807PHGExsV
KiS6Y7/esrkwf7SjDiEpS3IRPKy89A==
=z7x7
-----END PGP SIGNATURE-----

--Sig_/0U2=0zcqyTt+2jZ_5TTPgGt--

