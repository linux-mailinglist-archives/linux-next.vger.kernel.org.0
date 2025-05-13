Return-Path: <linux-next+bounces-6726-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26538AB4C4E
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 08:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B5753A5564
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 06:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CFA1EB1A1;
	Tue, 13 May 2025 06:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YED6rAlb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F851624DE;
	Tue, 13 May 2025 06:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747118992; cv=none; b=PBcvqheohypV1BDByS/YrO6gopTYab2KtlGX2lUXU03mhuUFp3OM1/r6UqIx92fZqJC7UDMjePItfIrQjjm+tqzKSycL35uahA41m8ggEUadvS6zIkY1HrBVfSHacgou1KGk0fnlMXEoMaxeLd1wpqAQIMoqvx7FuquryQa4jqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747118992; c=relaxed/simple;
	bh=BXWB8zNavMAl3WMTjnI7LufQdPvdSW2k0ZKKtaKjfZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=taUWmUZHVaR1PKnknYNZHWgsJ75BqHSn2uXRy/nitJVUoIOrghP2Z8TyEsBuNpf0n1uXGii522V6zgUjfGgcsNTk2H0I4SHrOXMlyhhONQJMSjdI9g8j9NwBO/tj5cFMA825dAKP5J7AbRDYTwhEmSFRyQ1jWWI1xWexfQqf27A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YED6rAlb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747118986;
	bh=4EOFzNASd2caVAAQ1gSVE9u1ytolKtCfb8RI2m0uwDo=;
	h=Date:From:To:Cc:Subject:From;
	b=YED6rAlb9YT/GIY774fqCXXqYC4qEj0BIVXHkfeVyy//ZwKJLbIYS2y0fAUJAf7EF
	 V6QaqtGkl6KmGuH66JPrfwGeOlmsgb9Z8HTdWAD9wq6J0KV4nbJ/GXqjgHB7LnRgK9
	 iVt8oo+HE4PJT5ErorenlNM0l1/IbWUn/M+HXYjfsnlfstpAACJwJVBP8VVpARAKeg
	 Gqfw4JsRWOXbOrfMkCwW60hk1WAvaD5hn1jp5/99udsG0b07yDpZ031JPhAQfASCBJ
	 HLA52VtiZKRy691dJkla5F575w2r/iI9Lb/kO9V1113qZjL29QG+703eqqSKgoNt8t
	 8s+aQlKjVwbIQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxRt163v1z4wbx;
	Tue, 13 May 2025 16:49:45 +1000 (AEST)
Date: Tue, 13 May 2025 16:49:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20250513164944.462eec63@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cS1NLVhcu5+AeH+R=ZW56Vk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cS1NLVhcu5+AeH+R=ZW56Vk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/kernel/cpu/common.c

between commit:

  159013a7ca18 ("x86/its: Enumerate Indirect Target Selection (ITS) bug")

from Linus' tree and commit:

  4e2c719782a8 ("x86/cpu: Help users notice when running old Intel microcod=
e")

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

diff --cc arch/x86/kernel/cpu/common.c
index 0ff057ff11ce,34efb9d2519a..000000000000
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@@ -1325,32 -1320,42 +1327,68 @@@ static bool __init vulnerable_to_rfds(u
  	return cpu_matches(cpu_vuln_blacklist, RFDS);
  }
 =20
 +static bool __init vulnerable_to_its(u64 x86_arch_cap_msr)
 +{
 +	/* The "immunity" bit trumps everything else: */
 +	if (x86_arch_cap_msr & ARCH_CAP_ITS_NO)
 +		return false;
 +	if (boot_cpu_data.x86_vendor !=3D X86_VENDOR_INTEL)
 +		return false;
 +
 +	/* None of the affected CPUs have BHI_CTRL */
 +	if (boot_cpu_has(X86_FEATURE_BHI_CTRL))
 +		return false;
 +
 +	/*
 +	 * If a VMM did not expose ITS_NO, assume that a guest could
 +	 * be running on a vulnerable hardware or may migrate to such
 +	 * hardware.
 +	 */
 +	if (boot_cpu_has(X86_FEATURE_HYPERVISOR))
 +		return true;
 +
 +	if (cpu_matches(cpu_vuln_blacklist, ITS))
 +		return true;
 +
 +	return false;
 +}
 +
+ static struct x86_cpu_id cpu_latest_microcode[] =3D {
+ #include "microcode/intel-ucode-defs.h"
+ 	{}
+ };
+=20
+ static bool __init cpu_has_old_microcode(void)
+ {
+ 	const struct x86_cpu_id *m =3D x86_match_cpu(cpu_latest_microcode);
+=20
+ 	/* Give unknown CPUs a pass: */
+ 	if (!m) {
+ 		/* Intel CPUs should be in the list. Warn if not: */
+ 		if (boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_INTEL)
+ 			pr_info("x86/CPU: Model not found in latest microcode list\n");
+ 		return false;
+ 	}
+=20
+ 	/*
+ 	 * Hosts usually lie to guests with a super high microcode
+ 	 * version. Just ignore what hosts tell guests:
+ 	 */
+ 	if (boot_cpu_has(X86_FEATURE_HYPERVISOR))
+ 		return false;
+=20
+ 	/* Consider all debug microcode to be old: */
+ 	if (boot_cpu_data.microcode & BIT(31))
+ 		return true;
+=20
+ 	/* Give new microcode a pass: */
+ 	if (boot_cpu_data.microcode >=3D m->driver_data)
+ 		return false;
+=20
+ 	/* Uh oh, too old: */
+ 	return true;
+ }
+=20
  static void __init cpu_set_bug_bits(struct cpuinfo_x86 *c)
  {
  	u64 x86_arch_cap_msr =3D x86_read_arch_cap_msr();

--Sig_/cS1NLVhcu5+AeH+R=ZW56Vk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgi64gACgkQAVBC80lX
0GxYaAf+NdKpcNTo7rSBgTj3XHWhGBTcR8A0fASJY4jphE7sE5sVa6Y6MreMlpqI
3lZ3+wHAwRYR67mf5RV75cbct37wcDO/w8SJUzb6x7OppOii/aOGStFZeYiOE0ik
manfGTp0Yvs960eVt4MHM4QfK7yLBc8hXjZOBr662kRaw43tTTeoNyC4qQ5G6fH2
a6OiRnvhFFxrmwm0t9LqYx/3S87tct7IiSMckV3PsweNduT0D6qSiCj99pqxPwMC
egRZsF8HJx5DlxHuPWa1XCxWnqgtxW3rx+3VNZQx1IOiV8lpv6kDq7VQ7081F62n
GazrDCRpHZozXS0oL51i7CGtJw74Ew==
=YTnK
-----END PGP SIGNATURE-----

--Sig_/cS1NLVhcu5+AeH+R=ZW56Vk--

