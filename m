Return-Path: <linux-next+bounces-7834-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17824B19A17
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 04:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A06D27A6153
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 02:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9971F473A;
	Mon,  4 Aug 2025 02:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KaC30Qog"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039EC1F4634;
	Mon,  4 Aug 2025 02:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754273463; cv=none; b=SusmdxhLlJDwoqUQ8ZpdWUqPgUzDB7YVw8H02kavIx3mhtmMY9fk5g1UIXpQwXehSWn0mAm7un6idPYob+sxklRD78KBXybnpgpUO9O/Ztw5hsAF4Mo/X78sgQpNAEm1poCw5j+S9QTJckiwJThlizwK0dtUj4M4se6gXnd098c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754273463; c=relaxed/simple;
	bh=aYiwsP9Htol3ja1kPFLRhHwXi9peycfdLPAc+cQjNQw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t0oQU8rRMCpfNQu57f02tHHj3WRrCMOy7ip8iN58Ik+eBia2drHCb0y7U4ajZnlK5dOJ4OD2P6FkalPptuDiRmKJJ7vbAFRiXGgxS5mlOC5SQz6VDJ1UWk+sRs789w9SxzZCB1osHRt56wf29678/qTaFZk5tSmPkHC5zEuYyek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KaC30Qog; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754273459;
	bh=OtP9dawDNErVUdU4QYvKLUgxrty3F+S8VdoftHpWNzA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KaC30QogRvH8vHCIrUCU5VMC7X1dIDAptlfGkb1eAuFwPSMAcTYEU5ifqPDxxkkZ9
	 eDmIruavgZIJANgJlf81yqBr871vXeLa3Y3zylEmXs+CnvtFzw+SfGLdgFckabZGqF
	 uQXtU/1KnjGAjXaBJmCW2nNbVnbDZMnYZ3K+ZgQjkIDFINAw8Fl4XyyjS5i7U6VRsi
	 /Uit2KP/ocUWfqONs+v6wDt+60qMYSbJY0Ko5amnhXPTWpmiDEnaaReR3+XC9mPG0x
	 Um+JFY4vb8P0k6zReKrS+Yghtviy/iBU76HXLpEKsyd7cbDnGlIK0sGZX4APjvv9Tg
	 v4T4jaSNprEMA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bwKm31yhPz4wcn;
	Mon,  4 Aug 2025 12:10:59 +1000 (AEST)
Date: Mon, 4 Aug 2025 12:10:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter
 Zijlstra <peterz@infradead.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the tip tree
Message-ID: <20250804121058.2fd15d2e@canb.auug.org.au>
In-Reply-To: <20250723111609.4c7a134c@canb.auug.org.au>
References: <20250723111609.4c7a134c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G3OK9U3+Q0bPCCGt=bzXpD7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/G3OK9U3+Q0bPCCGt=bzXpD7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 23 Jul 2025 11:16:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the rust tree got a conflict in:
>=20
>   arch/x86/include/asm/bug.h
>=20
> between commits:
>=20
>   aec58b48517c ("bugs/core: Extend __WARN_FLAGS() with the 'cond_str' par=
ameter")
>   407b9076c147 ("bugs/x86: Extend _BUG_FLAGS() with the 'cond_str' parame=
ter")
>   48ede5be5c07 ("bugs/x86: Augment warnings output by concatenating 'cond=
_str' with the regular __FILE__ string in _BUG_FLAGS()")
>=20
> from the tip tree and commit:
>=20
>   8c8efa93db68 ("x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code s=
haring with Rust")
>=20
> from the rust tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc arch/x86/include/asm/bug.h
> index 8593976b32cb,20fcb8507ad1..000000000000
> --- a/arch/x86/include/asm/bug.h
> +++ b/arch/x86/include/asm/bug.h
> @@@ -38,19 -38,30 +38,30 @@@
>   #endif
>  =20
>   #ifdef CONFIG_DEBUG_BUGVERBOSE
> + #define __BUG_ENTRY(file, line, flags)					\
> + 	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
> + 	"\t" __BUG_REL(file)   "\t# bug_entry::file\n"			\
> + 	"\t.word " line        "\t# bug_entry::line\n"			\
> + 	"\t.word " flags       "\t# bug_entry::flags\n"
> + #else
> + #define __BUG_ENTRY(file, line, flags)					\
> + 	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
> + 	"\t.word " flags       "\t# bug_entry::flags\n"
> + #endif
> +=20
> + #define _BUG_FLAGS_ASM(ins, file, line, flags, size, extra)		\
> + 	"1:\t" ins "\n"							\
> + 	".pushsection __bug_table,\"aw\"\n"				\
> + 	__BUG_ENTRY(file, line, flags)					\
> + 	"\t.org 2b + " size "\n"					\
> + 	".popsection\n"							\
> + 	extra
>  =20
>  -#define _BUG_FLAGS(ins, flags, extra)					\
>  +#define _BUG_FLAGS(cond_str, ins, flags, extra)				\
>   do {									\
> - 	asm_inline volatile("1:\t" ins "\n"				\
> - 		     ".pushsection __bug_table,\"aw\"\n"		\
> - 		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
> - 		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
> - 		     "\t.word %c1"        "\t# bug_entry::line\n"	\
> - 		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
> - 		     "\t.org 2b+%c3\n"					\
> - 		     ".popsection\n"					\
> - 		     extra						\
> + 	asm_inline volatile(_BUG_FLAGS_ASM(ins, "%c0",			\
> + 					   "%c1", "%c2", "%c3", extra)	\
>  -		     : : "i" (__FILE__), "i" (__LINE__),		\
>  +		     : : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),=
		\
>   			 "i" (flags),					\
>   			 "i" (sizeof(struct bug_entry)));		\
>   } while (0)
> @@@ -92,11 -89,14 +89,14 @@@ do {							=09
>    * were to trigger, we'd rather wreck the machine in an attempt to get =
the
>    * message out than not know about it.
>    */
> +=20
> + #define ARCH_WARN_REACHABLE	ANNOTATE_REACHABLE(1b)
> +=20
>  -#define __WARN_FLAGS(flags)					\
>  +#define __WARN_FLAGS(cond_str, flags)				\
>   do {								\
>   	__auto_type __flags =3D BUGFLAG_WARNING|(flags);		\
>   	instrumentation_begin();				\
> - 	_BUG_FLAGS(cond_str, ASM_UD2, __flags, ANNOTATE_REACHABLE(1b)); \
>  -	_BUG_FLAGS(ASM_UD2, __flags, ARCH_WARN_REACHABLE);	\
> ++	_BUG_FLAGS(cond_str, ASM_UD2, __flags, ARCH_WARN_REACHABLE);	\
>   	instrumentation_end();					\
>   } while (0)
>  =20

This is now a conflict between the tip tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/G3OK9U3+Q0bPCCGt=bzXpD7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiQFrIACgkQAVBC80lX
0GyCIwf+K4waqq5OJStA5e8xMl/OzCSlrOoTSoXACLlFn1xgN6wpUwZfgMrkT4lM
eCypNebSKhFGvedDkml+6iKUKIRWRW7vlNLqXfgrjmI564VrWoTtjx1YvyTH2YBK
vxuJ/FWb3A3VBhxOdIQiXjRf6aMb/GjViShxQYnGGm+kU5wTi/+cE2fJ3e6+QGBx
nyXBLr0ixZRjxpBBZl5mSoR0r5tDpYVb8XFoFFT0baB357V9yUBl99/zdUcFEOYc
rnf+sAacOtIM12ePe/OluL1qYpu1SrNFvUKobERfQOzbgSE0eJXdSuPJQa+3FVEN
i/82zyDfcBuvtXXpLswGFGGjAKgIPw==
=ePIJ
-----END PGP SIGNATURE-----

--Sig_/G3OK9U3+Q0bPCCGt=bzXpD7--

