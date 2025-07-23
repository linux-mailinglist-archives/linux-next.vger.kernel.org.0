Return-Path: <linux-next+bounces-7701-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92618B0E7F8
	for <lists+linux-next@lfdr.de>; Wed, 23 Jul 2025 03:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADACD4E5AF1
	for <lists+linux-next@lfdr.de>; Wed, 23 Jul 2025 01:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCAA1F94A;
	Wed, 23 Jul 2025 01:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UouRloV1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A411853;
	Wed, 23 Jul 2025 01:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753233375; cv=none; b=fPYvQIH3szLWn7nwNyq+2FkAFx9EAMnkHPl4BimaVIs9tZdfzCy1faKPCSnuvZ2Q0Kw3fsBbhPfKYLVyk+L+leC5Gz8LYIYRSyuRpyht48EN+u/j4Kg7Se5VMhRtzb3X8DO0dhvYjxcbuAGBQxCkM5EcMGVPKI29N0Dc9gT0phI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753233375; c=relaxed/simple;
	bh=Cqd8PnsUbAop9GqVz7w/EG0YpUpWI1uMUYP3u7mtVm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lWsOhTfB/Wt4kNbadOX6Wsdch7ZrBmPofLCHXL1Q/3mia/KFzY+qNYH1VQJMJlgcY0+rN6b3SEqQ/HY7JK7uJASZ1gO1ZsSL8MtfaUOYPouJu8nvrR+PnZaKoe9ld6Yo4yVtyFM9p5nR1E8N0RqixSf+hRLfzw+HZ4X45wj4ROM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UouRloV1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753233206;
	bh=N9eu22GkVWsIEv5h6qOhays9Zv7GiZpmfCb5PTS83JQ=;
	h=Date:From:To:Cc:Subject:From;
	b=UouRloV14xNOAcZH7Y5ibNVdiSNj8CJgE+iYqtGyZX/Wjy6o8MV3mpWqZofHVp6ZW
	 5yQB9i+HMAzVXaeoJCWDn2X3abYVTrBIQSSqcGS6qju+Lu2F/cu0M1sk4EeOF3YIl5
	 Vj+94Ll+PWySN1gIOUM0LVP6weApqTuEVdopWaqVO1yZTpzM+JxPk0rbjxRsGuxCmv
	 1QDAEvTHwQDHlQD4u2wChZ6lTC7GxZntW9rlTYYkCTJ6/HylZqg915gF4V7Zwyo/Y+
	 sXKlhrfwjUeQgbQWR8UD3hB9FzGDE+bJVifWabrkrP18NCbPtjmN6XoHlqbtR7z4P5
	 QAd+C9ugX69FA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmx3B07yrz4x21;
	Wed, 23 Jul 2025 11:13:25 +1000 (AEST)
Date: Wed, 23 Jul 2025 11:16:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter
 Zijlstra <peterz@infradead.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the tip tree
Message-ID: <20250723111609.4c7a134c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GIlw9QhLywLd0=7KmHBOiRE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GIlw9QhLywLd0=7KmHBOiRE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  arch/x86/include/asm/bug.h

between commits:

  aec58b48517c ("bugs/core: Extend __WARN_FLAGS() with the 'cond_str' param=
eter")
  407b9076c147 ("bugs/x86: Extend _BUG_FLAGS() with the 'cond_str' paramete=
r")
  48ede5be5c07 ("bugs/x86: Augment warnings output by concatenating 'cond_s=
tr' with the regular __FILE__ string in _BUG_FLAGS()")

from the tip tree and commit:

  8c8efa93db68 ("x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sha=
ring with Rust")

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

diff --cc arch/x86/include/asm/bug.h
index 8593976b32cb,20fcb8507ad1..000000000000
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@@ -38,19 -38,30 +38,30 @@@
  #endif
 =20
  #ifdef CONFIG_DEBUG_BUGVERBOSE
+ #define __BUG_ENTRY(file, line, flags)					\
+ 	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
+ 	"\t" __BUG_REL(file)   "\t# bug_entry::file\n"			\
+ 	"\t.word " line        "\t# bug_entry::line\n"			\
+ 	"\t.word " flags       "\t# bug_entry::flags\n"
+ #else
+ #define __BUG_ENTRY(file, line, flags)					\
+ 	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
+ 	"\t.word " flags       "\t# bug_entry::flags\n"
+ #endif
+=20
+ #define _BUG_FLAGS_ASM(ins, file, line, flags, size, extra)		\
+ 	"1:\t" ins "\n"							\
+ 	".pushsection __bug_table,\"aw\"\n"				\
+ 	__BUG_ENTRY(file, line, flags)					\
+ 	"\t.org 2b + " size "\n"					\
+ 	".popsection\n"							\
+ 	extra
 =20
 -#define _BUG_FLAGS(ins, flags, extra)					\
 +#define _BUG_FLAGS(cond_str, ins, flags, extra)				\
  do {									\
- 	asm_inline volatile("1:\t" ins "\n"				\
- 		     ".pushsection __bug_table,\"aw\"\n"		\
- 		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
- 		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
- 		     "\t.word %c1"        "\t# bug_entry::line\n"	\
- 		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
- 		     "\t.org 2b+%c3\n"					\
- 		     ".popsection\n"					\
- 		     extra						\
+ 	asm_inline volatile(_BUG_FLAGS_ASM(ins, "%c0",			\
+ 					   "%c1", "%c2", "%c3", extra)	\
 -		     : : "i" (__FILE__), "i" (__LINE__),		\
 +		     : : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),		\
  			 "i" (flags),					\
  			 "i" (sizeof(struct bug_entry)));		\
  } while (0)
@@@ -92,11 -89,14 +89,14 @@@ do {							=09
   * were to trigger, we'd rather wreck the machine in an attempt to get the
   * message out than not know about it.
   */
+=20
+ #define ARCH_WARN_REACHABLE	ANNOTATE_REACHABLE(1b)
+=20
 -#define __WARN_FLAGS(flags)					\
 +#define __WARN_FLAGS(cond_str, flags)				\
  do {								\
  	__auto_type __flags =3D BUGFLAG_WARNING|(flags);		\
  	instrumentation_begin();				\
- 	_BUG_FLAGS(cond_str, ASM_UD2, __flags, ANNOTATE_REACHABLE(1b)); \
 -	_BUG_FLAGS(ASM_UD2, __flags, ARCH_WARN_REACHABLE);	\
++	_BUG_FLAGS(cond_str, ASM_UD2, __flags, ARCH_WARN_REACHABLE);	\
  	instrumentation_end();					\
  } while (0)
 =20

--Sig_/GIlw9QhLywLd0=7KmHBOiRE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiAN9kACgkQAVBC80lX
0GznDQf/b8irnA+Ox1nPVrrfwUYvc0B2iGgu6oMK1WoshZwzviL4OV9A+roE1qoy
u7Mf8SaH2rNOD42M6z2virqQwPbaevBJt/icJ/wLAd28viowShTsS6TxfJ7y5RSd
e/KhdaBbX+4fmfpUxVtyztgPcXC6ysguTWZrKcX92ZGpzQIXsldWB1gmT1+ngt+T
zUM7KMu0yL9tQ8ARy2Uus0xvEBQZvZxFGDcuDDrDVV2mQRqeTA06wUN9I29WIBQB
vrmR+SkBhSvkSFxswdU1uug2/OCdxoeM1WKQtUjUlFXomRdeoT+A7nALYKCbATzo
gPU/l6f3nqIdDlIPIFrRZUwhQBPVvg==
=wUsT
-----END PGP SIGNATURE-----

--Sig_/GIlw9QhLywLd0=7KmHBOiRE--

