Return-Path: <linux-next+bounces-7700-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69302B0E7E7
	for <lists+linux-next@lfdr.de>; Wed, 23 Jul 2025 03:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99C8A5478DA
	for <lists+linux-next@lfdr.de>; Wed, 23 Jul 2025 01:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5D413C816;
	Wed, 23 Jul 2025 01:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MmvjZ5He"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E4578F26;
	Wed, 23 Jul 2025 01:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753232750; cv=none; b=KIupa7H388JTwlrGwTGzvwXSVQIQg13zEm0ov4sJ/rABchtgiCcfOcVt6XZpX/tAefV9PI/6XFWnZlymbXTVAyz7XBHDGPjwMxuSO+15paD/SyGGh79/SwVujU6MDtCysT1OoT7Nqhq/i69aXqUv91ph/5eJKW02RtWjRfu/qjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753232750; c=relaxed/simple;
	bh=uDmRq8t9XRoRhO1OAebfQB+Ws3e6AEexmKlB6Fylils=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=a69NUCbph2A5a06QOEXjyipoUkF5gG11SQYsHX8qwEBpY03HVmvtMCrkJd9VVn7mRwwH41QlA9Vvp9szphqPibHV9Kz3JTr+s1ILiTLvCvtm4K/VbX9Vd33rxzKA88pM0a1Gn4PmeQeLx0yPXHONvg7OcNcXliD6eEhYhXFbjo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MmvjZ5He; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753232578;
	bh=PXwMWtQ39L8fSo5fzcgFYa5Ai/cV2/GKAOM3EVjj0DQ=;
	h=Date:From:To:Cc:Subject:From;
	b=MmvjZ5HefXYwMabdXnDyA4BfEimMb11/zR/euzEtAfj9s3brvk9w8rFzrzKqaSzT2
	 KQdUvQ2NF6eiiRUoOj6knNgjEMsqx4jTN39jeBX3vEQArfxCHTZ3OPmTTg/TE8Ap2M
	 x1ekxYHbFRX+HHFA6btH0QWLtMv33F7PmjH6VHGfbMTVIxb78VoJVyr/SgWU7cmFgs
	 apZiaFjtpWemOjqaQaQt4HyKpZr8sT1brsY+DYITEagTh9sNEEbb1Jxl9E59Rm+Uf3
	 rzrAWdWzKFwEYOJP26T/2cfhEdkik0jq9jII719LjNvaG/5GG8qTrWo38ntEJoR3hZ
	 75xx+SU5WWqpQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmwq20f6qz4wbb;
	Wed, 23 Jul 2025 11:02:54 +1000 (AEST)
Date: Wed, 23 Jul 2025 11:05:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter
 Zijlstra <peterz@infradead.org>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the tip tree
Message-ID: <20250723110537.5d5de415@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AsJsKcGCti/LbaOC_tUDi68";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AsJsKcGCti/LbaOC_tUDi68
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  arch/riscv/include/asm/bug.h

between commit:

  ac2655438eb5 ("bugs/riscv: Pass in 'cond_str' to __BUG_FLAGS()")

from the tip tree and commit:

  8ad470d4e3dc ("riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code s=
haring with Rust")

from the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/riscv/include/asm/bug.h
index da9b8e83934d,4c03e20ad11f..000000000000
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@@ -57,16 -56,22 +56,22 @@@ typedef u32 bug_insn_t
  			"ebreak\n"				\
  			".pushsection __bug_table,\"aw\"\n\t"	\
  		"2:\n\t"					\
- 			__BUG_ENTRY "\n\t"			\
- 			".org 2b + %3\n\t"                      \
+ 		__BUG_ENTRY(file, line, flags) "\n\t"		\
+ 			".org 2b + " size "\n\t"                \
  			".popsection"				\
+=20
 -#define __BUG_FLAGS(flags)					\
++#define __BUG_FLAGS(cond_str, flags)				\
+ do {								\
+ 	__asm__ __volatile__ (					\
+ 		ARCH_WARN_ASM("%0", "%1", "%2", "%3")		\
  		:						\
 -		: "i" (__FILE__), "i" (__LINE__),		\
 +		: "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
  		  "i" (flags),					\
  		  "i" (sizeof(struct bug_entry)));              \
  } while (0)
+=20
  #else /* CONFIG_GENERIC_BUG */
 -#define __BUG_FLAGS(flags) do {					\
 +#define __BUG_FLAGS(cond_str, flags) do {			\
  	__asm__ __volatile__ ("ebreak\n");			\
  } while (0)
  #endif /* CONFIG_GENERIC_BUG */
@@@ -76,8 -81,10 +81,10 @@@
  	unreachable();						\
  } while (0)
 =20
 -#define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
 +#define __WARN_FLAGS(cond_str, flags) __BUG_FLAGS(cond_str, BUGFLAG_WARNI=
NG|(flags))
 =20
+ #define ARCH_WARN_REACHABLE
+=20
  #define HAVE_ARCH_BUG
 =20
  #include <asm-generic/bug.h>

--Sig_/AsJsKcGCti/LbaOC_tUDi68
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiANWEACgkQAVBC80lX
0Gyu0wgAlueynouS+PPq687HrU7qLBRzVEqWVKjS2y2iPHAO36M6LCzwRawGgCP4
FujhYi6eB25RMwS9SIVQFvZjtkLWrVrQuuA6dk+n4cO1ftVM1bsTqPjlWAE/1/64
XtpELYuFsVvPBkgGo/CmYEfc38zg/iI/uHpQKT2YJiMTqNfPRYhEKPL5mrb8btvy
tTpqSWGBTUlid/lCpi0aXJz8IClldlqzEornSJrAAjSKd/sJTzZYIel0T6j+EtRu
hp2R/qqvstuGBDADRCm/sEbihw/g6O0ibDy4fJDibeOUcmJbpKAidU4K35Atpw52
j7D2hMvySwsehPnSbinJdu7xTQCK2Q==
=wCxg
-----END PGP SIGNATURE-----

--Sig_/AsJsKcGCti/LbaOC_tUDi68--

