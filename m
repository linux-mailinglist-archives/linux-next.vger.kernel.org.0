Return-Path: <linux-next+bounces-6725-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C69EAAB4C3A
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 08:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8379A7AE9B4
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 06:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E9F1EE007;
	Tue, 13 May 2025 06:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CiwQN8uX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E32618EAB;
	Tue, 13 May 2025 06:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747118732; cv=none; b=k0S/0QqxmEOdnIzAZE6Qj2ziuDO41hKfXtn6YmzbtcdgUuIIkNBvARpYoot3/sw994Q3HEI0ZQUPZ1DJVZLpIEgdQ6ysxcq8IlzpBUGQARy2tzNUCQodKJfy6twromL0oNV9RRh9EsLGkM7Ts7WhQZifAIMQPKdOtdmKemWDKUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747118732; c=relaxed/simple;
	bh=2xmwwcL2oaMePqVbbFwFB0i/T366hXCChLhpFXQBMjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AtaO8Y3VXFhmdgHW5zdu4yP/Lg9EoeFEUuuyK3Z1VEx7TkBMmtbTwz6VpZDl9UGZrADERAfu12am4oHJX2jDjY6x2evZZOxrV/i04hcEZtHKuLl51b+hms6Uqds26uxjNCPO39tLwGNRqIGNIQp9xbZfzBk13e7Pel2MZ5p4gB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CiwQN8uX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747118725;
	bh=2VUGV3HBx1hJVvW91i5+JHhDl6fxehgaZIIGbW/EnkE=;
	h=Date:From:To:Cc:Subject:From;
	b=CiwQN8uXMTcr12vw5H0FxvejG+blAxWrNW60dH3i+GlrURaXeMN1o24lp/riesQU6
	 bmNdXQT6hcxtplwamC/8eidABAlyEbejSn8sHJbAnE/BR48LITPcjEeq2kQf9Gas9f
	 BVSYvowDZkuIQIqk502z83Ek+EjL8B4PVuEXxeM2kWnp4DMyFWLHO8RZtrCKBU4UH1
	 oU3VgAD56Bf67HZqeu3Wk6poF6GyczbYy1Lm2euPPPniwNZlIKaSvAYPd7b3jrO6w+
	 5akFkH3wtCtsu5Ud8tnKzMvmsSVwO7F1Guuceut34WzFZEWF+DsSCbjB8VoQjJuukY
	 p1hDPntC8VEyg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxRn04z7zz4wj2;
	Tue, 13 May 2025 16:45:23 +1000 (AEST)
Date: Tue, 13 May 2025 16:45:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, David Kaplan <david.kaplan@amd.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20250513164523.094d87a1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6VJrlUvfvm_EXkj5o1fkwAL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6VJrlUvfvm_EXkj5o1fkwAL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/kernel/cpu/bugs.c

between commits:

  073fdbe02c69 ("x86/bhi: Do not set BHI_DIS_S in 32-bit mode")
  f4818881c47f ("x86/its: Enable Indirect Target Selection mitigation")

from Linus' tree and commits:

  559c758bc722 ("x86/bugs: Restructure MDS mitigation")
  bdd7fce7a816 ("x86/bugs: Restructure TAA mitigation")
  4a5a04e61d7f ("x86/bugs: Restructure MMIO mitigation")
  203d81f8e167 ("x86/bugs: Restructure RFDS mitigation")
  2178ac58e176 ("x86/bugs: Restructure SRBDS mitigation")
  9dcad2fb31bd ("x86/bugs: Restructure GDS mitigation")
  46d5925b8eb8 ("x86/bugs: Restructure spectre_v1 mitigation")
  e3b78a7ad5ea ("x86/bugs: Restructure retbleed mitigation")
  ddfca9430a61 ("x86/bugs: Restructure spectre_v2_user mitigation")
  efe313827c98 ("x86/bugs: Restructure BHI mitigation")
  480e803dacf8 ("x86/bugs: Restructure spectre_v2 mitigation")
  5ece59a2fca6 ("x86/bugs: Restructure SSB mitigation")
  d43ba2dc8eee ("x86/bugs: Restructure L1TF mitigation")
  1f4bb068b498 ("x86/bugs: Restructure SRSO mitigation")
  4e2c719782a8 ("x86/cpu: Help users notice when running old Intel microcod=
e")

from the tip tree.

I fixed it up (see below - but probably not completely) and can carry
the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/kernel/cpu/bugs.c
index 8596ce85026c,a938fb4add65..000000000000
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@@ -34,22 -34,63 +34,64 @@@
 =20
  #include "cpu.h"
 =20
+ /*
+  * Speculation Vulnerability Handling
+  *
+  * Each vulnerability is handled with the following functions:
+  *   <vuln>_select_mitigation() -- Selects a mitigation to use.  This sho=
uld
+  *				   take into account all relevant command line
+  *				   options.
+  *   <vuln>_update_mitigation() -- This is called after all vulnerabiliti=
es have
+  *				   selected a mitigation, in case the selection
+  *				   may want to change based on other choices
+  *				   made.  This function is optional.
+  *   <vuln>_apply_mitigation() -- Enable the selected mitigation.
+  *
+  * The compile-time mitigation in all cases should be AUTO.  An explicit
+  * command-line option can override AUTO.  If no such option is
+  * provided, <vuln>_select_mitigation() will override AUTO to the best
+  * mitigation option.
+  */
+=20
  static void __init spectre_v1_select_mitigation(void);
+ static void __init spectre_v1_apply_mitigation(void);
  static void __init spectre_v2_select_mitigation(void);
+ static void __init spectre_v2_update_mitigation(void);
+ static void __init spectre_v2_apply_mitigation(void);
  static void __init retbleed_select_mitigation(void);
+ static void __init retbleed_update_mitigation(void);
+ static void __init retbleed_apply_mitigation(void);
  static void __init spectre_v2_user_select_mitigation(void);
+ static void __init spectre_v2_user_update_mitigation(void);
+ static void __init spectre_v2_user_apply_mitigation(void);
  static void __init ssb_select_mitigation(void);
+ static void __init ssb_apply_mitigation(void);
  static void __init l1tf_select_mitigation(void);
+ static void __init l1tf_apply_mitigation(void);
  static void __init mds_select_mitigation(void);
- static void __init md_clear_update_mitigation(void);
- static void __init md_clear_select_mitigation(void);
+ static void __init mds_update_mitigation(void);
+ static void __init mds_apply_mitigation(void);
  static void __init taa_select_mitigation(void);
+ static void __init taa_update_mitigation(void);
+ static void __init taa_apply_mitigation(void);
  static void __init mmio_select_mitigation(void);
+ static void __init mmio_update_mitigation(void);
+ static void __init mmio_apply_mitigation(void);
+ static void __init rfds_select_mitigation(void);
+ static void __init rfds_update_mitigation(void);
+ static void __init rfds_apply_mitigation(void);
  static void __init srbds_select_mitigation(void);
+ static void __init srbds_apply_mitigation(void);
  static void __init l1d_flush_select_mitigation(void);
  static void __init srso_select_mitigation(void);
+ static void __init srso_update_mitigation(void);
+ static void __init srso_apply_mitigation(void);
  static void __init gds_select_mitigation(void);
+ static void __init gds_apply_mitigation(void);
 +static void __init its_select_mitigation(void);
+ static void __init bhi_select_mitigation(void);
+ static void __init bhi_update_mitigation(void);
+ static void __init bhi_apply_mitigation(void);
 =20
  /* The base value of the SPEC_CTRL MSR without task-specific bits set */
  u64 x86_spec_ctrl_base;
@@@ -172,22 -204,56 +213,57 @@@ void __init cpu_select_mitigations(void
  	spectre_v2_user_select_mitigation();
  	ssb_select_mitigation();
  	l1tf_select_mitigation();
- 	md_clear_select_mitigation();
+ 	mds_select_mitigation();
+ 	taa_select_mitigation();
+ 	mmio_select_mitigation();
+ 	rfds_select_mitigation();
  	srbds_select_mitigation();
  	l1d_flush_select_mitigation();
-=20
- 	/*
- 	 * srso_select_mitigation() depends and must run after
- 	 * retbleed_select_mitigation().
- 	 */
  	srso_select_mitigation();
  	gds_select_mitigation();
+ 	bhi_select_mitigation();
 +	its_select_mitigation();
+=20
+ 	/*
+ 	 * After mitigations are selected, some may need to update their
+ 	 * choices.
+ 	 */
+ 	spectre_v2_update_mitigation();
+ 	/*
+ 	 * retbleed_update_mitigation() relies on the state set by
+ 	 * spectre_v2_update_mitigation(); specifically it wants to know about
+ 	 * spectre_v2=3Dibrs.
+ 	 */
+ 	retbleed_update_mitigation();
+=20
+ 	/*
+ 	 * spectre_v2_user_update_mitigation() depends on
+ 	 * retbleed_update_mitigation(), specifically the STIBP
+ 	 * selection is forced for UNRET or IBPB.
+ 	 */
+ 	spectre_v2_user_update_mitigation();
+ 	mds_update_mitigation();
+ 	taa_update_mitigation();
+ 	mmio_update_mitigation();
+ 	rfds_update_mitigation();
+ 	bhi_update_mitigation();
+ 	/* srso_update_mitigation() depends on retbleed_update_mitigation(). */
+ 	srso_update_mitigation();
+=20
+ 	spectre_v1_apply_mitigation();
+ 	spectre_v2_apply_mitigation();
+ 	retbleed_apply_mitigation();
+ 	spectre_v2_user_apply_mitigation();
+ 	ssb_apply_mitigation();
+ 	l1tf_apply_mitigation();
+ 	mds_apply_mitigation();
+ 	taa_apply_mitigation();
+ 	mmio_apply_mitigation();
+ 	rfds_apply_mitigation();
+ 	srbds_apply_mitigation();
+ 	srso_apply_mitigation();
+ 	gds_apply_mitigation();
+ 	bhi_apply_mitigation();
  }
 =20
  /*
@@@ -1173,169 -1323,8 +1333,147 @@@ static void __init retbleed_apply_mitig
  	if (mitigate_smt && !boot_cpu_has(X86_FEATURE_STIBP) &&
  	    (retbleed_nosmt || cpu_mitigations_auto_nosmt()))
  		cpu_smt_disable(false);
-=20
- 	/*
- 	 * Let IBRS trump all on Intel without affecting the effects of the
- 	 * retbleed=3D cmdline option except for call depth based stuffing
- 	 */
- 	if (boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_INTEL) {
- 		switch (spectre_v2_enabled) {
- 		case SPECTRE_V2_IBRS:
- 			retbleed_mitigation =3D RETBLEED_MITIGATION_IBRS;
- 			break;
- 		case SPECTRE_V2_EIBRS:
- 		case SPECTRE_V2_EIBRS_RETPOLINE:
- 		case SPECTRE_V2_EIBRS_LFENCE:
- 			retbleed_mitigation =3D RETBLEED_MITIGATION_EIBRS;
- 			break;
- 		default:
- 			if (retbleed_mitigation !=3D RETBLEED_MITIGATION_STUFF)
- 				pr_err(RETBLEED_INTEL_MSG);
- 		}
- 	}
-=20
- 	pr_info("%s\n", retbleed_strings[retbleed_mitigation]);
  }
 =20
 +#undef pr_fmt
 +#define pr_fmt(fmt)     "ITS: " fmt
 +
 +enum its_mitigation_cmd {
 +	ITS_CMD_OFF,
 +	ITS_CMD_ON,
 +	ITS_CMD_VMEXIT,
 +	ITS_CMD_RSB_STUFF,
 +};
 +
 +enum its_mitigation {
 +	ITS_MITIGATION_OFF,
 +	ITS_MITIGATION_VMEXIT_ONLY,
 +	ITS_MITIGATION_ALIGNED_THUNKS,
 +	ITS_MITIGATION_RETPOLINE_STUFF,
 +};
 +
 +static const char * const its_strings[] =3D {
 +	[ITS_MITIGATION_OFF]			=3D "Vulnerable",
 +	[ITS_MITIGATION_VMEXIT_ONLY]		=3D "Mitigation: Vulnerable, KVM: Not affe=
cted",
 +	[ITS_MITIGATION_ALIGNED_THUNKS]		=3D "Mitigation: Aligned branch/return =
thunks",
 +	[ITS_MITIGATION_RETPOLINE_STUFF]	=3D "Mitigation: Retpolines, Stuffing R=
SB",
 +};
 +
 +static enum its_mitigation its_mitigation __ro_after_init =3D ITS_MITIGAT=
ION_ALIGNED_THUNKS;
 +
 +static enum its_mitigation_cmd its_cmd __ro_after_init =3D
 +	IS_ENABLED(CONFIG_MITIGATION_ITS) ? ITS_CMD_ON : ITS_CMD_OFF;
 +
 +static int __init its_parse_cmdline(char *str)
 +{
 +	if (!str)
 +		return -EINVAL;
 +
 +	if (!IS_ENABLED(CONFIG_MITIGATION_ITS)) {
 +		pr_err("Mitigation disabled at compile time, ignoring option (%s)", str=
);
 +		return 0;
 +	}
 +
 +	if (!strcmp(str, "off")) {
 +		its_cmd =3D ITS_CMD_OFF;
 +	} else if (!strcmp(str, "on")) {
 +		its_cmd =3D ITS_CMD_ON;
 +	} else if (!strcmp(str, "force")) {
 +		its_cmd =3D ITS_CMD_ON;
 +		setup_force_cpu_bug(X86_BUG_ITS);
 +	} else if (!strcmp(str, "vmexit")) {
 +		its_cmd =3D ITS_CMD_VMEXIT;
 +	} else if (!strcmp(str, "stuff")) {
 +		its_cmd =3D ITS_CMD_RSB_STUFF;
 +	} else {
 +		pr_err("Ignoring unknown indirect_target_selection option (%s).", str);
 +	}
 +
 +	return 0;
 +}
 +early_param("indirect_target_selection", its_parse_cmdline);
 +
 +static void __init its_select_mitigation(void)
 +{
 +	enum its_mitigation_cmd cmd =3D its_cmd;
 +
 +	if (!boot_cpu_has_bug(X86_BUG_ITS) || cpu_mitigations_off()) {
 +		its_mitigation =3D ITS_MITIGATION_OFF;
 +		return;
 +	}
 +
 +	/* Retpoline+CDT mitigates ITS, bail out */
 +	if (boot_cpu_has(X86_FEATURE_RETPOLINE) &&
 +	    boot_cpu_has(X86_FEATURE_CALL_DEPTH)) {
 +		its_mitigation =3D ITS_MITIGATION_RETPOLINE_STUFF;
 +		goto out;
 +	}
 +
 +	/* Exit early to avoid irrelevant warnings */
 +	if (cmd =3D=3D ITS_CMD_OFF) {
 +		its_mitigation =3D ITS_MITIGATION_OFF;
 +		goto out;
 +	}
 +	if (spectre_v2_enabled =3D=3D SPECTRE_V2_NONE) {
 +		pr_err("WARNING: Spectre-v2 mitigation is off, disabling ITS\n");
 +		its_mitigation =3D ITS_MITIGATION_OFF;
 +		goto out;
 +	}
 +	if (!IS_ENABLED(CONFIG_MITIGATION_RETPOLINE) ||
 +	    !IS_ENABLED(CONFIG_MITIGATION_RETHUNK)) {
 +		pr_err("WARNING: ITS mitigation depends on retpoline and rethunk suppor=
t\n");
 +		its_mitigation =3D ITS_MITIGATION_OFF;
 +		goto out;
 +	}
 +	if (IS_ENABLED(CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B)) {
 +		pr_err("WARNING: ITS mitigation is not compatible with CONFIG_DEBUG_FOR=
CE_FUNCTION_ALIGN_64B\n");
 +		its_mitigation =3D ITS_MITIGATION_OFF;
 +		goto out;
 +	}
 +	if (boot_cpu_has(X86_FEATURE_RETPOLINE_LFENCE)) {
 +		pr_err("WARNING: ITS mitigation is not compatible with lfence mitigatio=
n\n");
 +		its_mitigation =3D ITS_MITIGATION_OFF;
 +		goto out;
 +	}
 +
 +	if (cmd =3D=3D ITS_CMD_RSB_STUFF &&
 +	    (!boot_cpu_has(X86_FEATURE_RETPOLINE) || !IS_ENABLED(CONFIG_MITIGATI=
ON_CALL_DEPTH_TRACKING))) {
 +		pr_err("RSB stuff mitigation not supported, using default\n");
 +		cmd =3D ITS_CMD_ON;
 +	}
 +
 +	switch (cmd) {
 +	case ITS_CMD_OFF:
 +		its_mitigation =3D ITS_MITIGATION_OFF;
 +		break;
 +	case ITS_CMD_VMEXIT:
 +		if (boot_cpu_has_bug(X86_BUG_ITS_NATIVE_ONLY)) {
 +			its_mitigation =3D ITS_MITIGATION_VMEXIT_ONLY;
 +			goto out;
 +		}
 +		fallthrough;
 +	case ITS_CMD_ON:
 +		its_mitigation =3D ITS_MITIGATION_ALIGNED_THUNKS;
 +		if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
 +			setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_ITS);
 +		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
 +		set_return_thunk(its_return_thunk);
 +		break;
 +	case ITS_CMD_RSB_STUFF:
 +		its_mitigation =3D ITS_MITIGATION_RETPOLINE_STUFF;
 +		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
 +		setup_force_cpu_cap(X86_FEATURE_CALL_DEPTH);
 +		set_return_thunk(call_depth_return_thunk);
 +		if (retbleed_mitigation =3D=3D RETBLEED_MITIGATION_NONE) {
 +			retbleed_mitigation =3D RETBLEED_MITIGATION_STUFF;
 +			pr_info("Retbleed mitigation updated to stuffing\n");
 +		}
 +		break;
 +	}
 +out:
 +	pr_info("%s\n", its_strings[its_mitigation]);
 +}
 +
  #undef pr_fmt
  #define pr_fmt(fmt)     "Spectre V2 : " fmt
 =20
@@@ -2833,8 -2806,52 +2955,52 @@@ static void __init srso_apply_mitigatio
  	if (srso_mitigation !=3D SRSO_MITIGATION_BP_SPEC_REDUCE)
  		setup_clear_cpu_cap(X86_FEATURE_SRSO_BP_SPEC_REDUCE);
 =20
- 	if (srso_mitigation !=3D SRSO_MITIGATION_NONE)
- 		pr_info("%s\n", srso_strings[srso_mitigation]);
+ 	if (srso_mitigation =3D=3D SRSO_MITIGATION_NONE) {
+ 		if (boot_cpu_has(X86_FEATURE_SBPB))
+ 			x86_pred_cmd =3D PRED_CMD_SBPB;
+ 		return;
+ 	}
+=20
+ 	switch (srso_mitigation) {
+ 	case SRSO_MITIGATION_SAFE_RET:
+ 	case SRSO_MITIGATION_SAFE_RET_UCODE_NEEDED:
+ 		/*
+ 		 * Enable the return thunk for generated code
+ 		 * like ftrace, static_call, etc.
+ 		 */
+ 		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
+ 		setup_force_cpu_cap(X86_FEATURE_UNRET);
+=20
+ 		if (boot_cpu_data.x86 =3D=3D 0x19) {
+ 			setup_force_cpu_cap(X86_FEATURE_SRSO_ALIAS);
 -			x86_return_thunk =3D srso_alias_return_thunk;
++			set_return_thunk(srso_alias_return_thunk);
+ 		} else {
+ 			setup_force_cpu_cap(X86_FEATURE_SRSO);
 -			x86_return_thunk =3D srso_return_thunk;
++			set_return_thunk(srso_return_thunk);
+ 		}
+ 		break;
+ 	case SRSO_MITIGATION_IBPB:
+ 		setup_force_cpu_cap(X86_FEATURE_ENTRY_IBPB);
+ 		/*
+ 		 * IBPB on entry already obviates the need for
+ 		 * software-based untraining so clear those in case some
+ 		 * other mitigation like Retbleed has selected them.
+ 		 */
+ 		setup_clear_cpu_cap(X86_FEATURE_UNRET);
+ 		setup_clear_cpu_cap(X86_FEATURE_RETHUNK);
+ 		fallthrough;
+ 	case SRSO_MITIGATION_IBPB_ON_VMEXIT:
+ 		setup_force_cpu_cap(X86_FEATURE_IBPB_ON_VMEXIT);
+ 		/*
+ 		 * There is no need for RSB filling: entry_ibpb() ensures
+ 		 * all predictions, including the RSB, are invalidated,
+ 		 * regardless of IBPB implementation.
+ 		 */
+ 		setup_clear_cpu_cap(X86_FEATURE_RSB_VMEXIT);
+ 		break;
+ 	default:
+ 		break;
+ 	}
  }
 =20
  #undef pr_fmt
@@@ -2949,11 -2963,14 +3112,19 @@@ static ssize_t rfds_show_state(char *bu
  	return sysfs_emit(buf, "%s\n", rfds_strings[rfds_mitigation]);
  }
 =20
 +static ssize_t its_show_state(char *buf)
 +{
 +	return sysfs_emit(buf, "%s\n", its_strings[its_mitigation]);
 +}
 +
+ static ssize_t old_microcode_show_state(char *buf)
+ {
+ 	if (boot_cpu_has(X86_FEATURE_HYPERVISOR))
+ 		return sysfs_emit(buf, "Unknown: running under hypervisor");
+=20
+ 	return sysfs_emit(buf, "Vulnerable\n");
+ }
+=20
  static char *stibp_state(void)
  {
  	if (spectre_v2_in_eibrs_mode(spectre_v2_enabled) &&
@@@ -3136,9 -3152,9 +3306,12 @@@ static ssize_t cpu_show_common(struct d
  	case X86_BUG_RFDS:
  		return rfds_show_state(buf);
 =20
 +	case X86_BUG_ITS:
 +		return its_show_state(buf);
 +
+ 	case X86_BUG_OLD_MICROCODE:
+ 		return old_microcode_show_state(buf);
+=20
  	default:
  		break;
  	}
@@@ -3219,10 -3232,10 +3389,15 @@@ ssize_t cpu_show_reg_file_data_sampling
  	return cpu_show_common(dev, attr, buf, X86_BUG_RFDS);
  }
 =20
 +ssize_t cpu_show_indirect_target_selection(struct device *dev, struct dev=
ice_attribute *attr, char *buf)
 +{
 +	return cpu_show_common(dev, attr, buf, X86_BUG_ITS);
 +}
++
+ ssize_t cpu_show_old_microcode(struct device *dev, struct device_attribut=
e *attr, char *buf)
+ {
+ 	return cpu_show_common(dev, attr, buf, X86_BUG_OLD_MICROCODE);
+ }
  #endif
 =20
  void __warn_thunk(void)

--Sig_/6VJrlUvfvm_EXkj5o1fkwAL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgi6oMACgkQAVBC80lX
0Gx5xwf/crAe9B54HyjO0e2Tdaq3jVwDSnoH3aIlW/50HJ8bx32FTj9iwhRO3sn+
sskk2b3cT1kctHl5khgM0gQXWoecPXAKr713UtplZmrigyfLN/qyogl65JX+2Lkv
bV/vW7bPBFbUgIC3kKlepGAbMcDYb7nnTm1fHy03vyO3Si/LXMWBU1uh65Z8K2eO
YnLQC5WzJS1BE1v1mjdc9xthtzgeE9NzMKU+5lW9OfFCCki36Rbtuzrgq3Qvp2cF
NH1Qg2g49sffgqzdHqRFpnXi28PZqqumpeIoiTO9cPZtC+azGZZcHkxcNC8vnhVf
WzUbyH4u9oMcRYz/eQRB54vZUBv2cg==
=Y/pJ
-----END PGP SIGNATURE-----

--Sig_/6VJrlUvfvm_EXkj5o1fkwAL--

