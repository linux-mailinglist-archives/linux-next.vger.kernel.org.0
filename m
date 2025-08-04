Return-Path: <linux-next+bounces-7833-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF43B19A15
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 04:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 014001893741
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 02:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BCF11E1DE3;
	Mon,  4 Aug 2025 02:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UeF0AXzD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EBA33993;
	Mon,  4 Aug 2025 02:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754273385; cv=none; b=qYhI+0tKiWAnhwFeWJydJGpd+mol5fCYL8pwmmVUiS16dl22mB3lu3MHdeBqDULSO9UZucJ8JXGMKygizTL9xQEqIAaODZBOfQo2nWWvUBW/QyDsUvAQNukmi3yODhcR/JthVO2rxF8OUb93KpfFCa6rbSuftP+6o8P8KqFiXFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754273385; c=relaxed/simple;
	bh=65PMUJ5Z8Gr10DdQ5YBJXBJRT/7lh4jShModlIrL7as=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rW7Dg02gmSGJ5R+st1OOtA01radvlokW18kBpskPM+gE8ERnfkbeBnkJ2hPFXJEVKaVanT2VZOu8M/u/N/HkptDZikb/G8XyXi8X0liUKbvdwemfmM25LtQaI21bhBzJdnj0O8Pt4zvlWXnCK3hrMYdkX2pA9Uxwxsa8U3QqdA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UeF0AXzD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754273376;
	bh=nw3M83ahXlcnKpOqFloXudpWhYgAbB55PxCHPyfwhQ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UeF0AXzD3iuoP5xq5Qm5zCMahcXkbgjNFIvyeUuIZbZX9ayD3MmFjcUx7MBsSNkUx
	 5ZilB0tDgc4rnQ6QqIy3yVRc+1TpEjMijOSfOm9jLichyagnQk48tnfSEIhePVU4rg
	 ZbDaxmxZoY16+Z7Qwjz81Dz39XIPBCqOrwQUx/cbIg2CfxlV18llIzVZvfA/KOZLU2
	 tKhw96LZ0kKTPShREftsvO69veP+akuLDp55fUB7Y8WJ3hRlsqrLIc4hYA9bYRZLFh
	 DPIekGSJ3tgwz7pPJdteS5z6/Xp73OxQKPHkhMZsOABvDHwFWtOa/TeC36DbqIquWF
	 fIgU/LuL9j5Zw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bwKkQ6QJKz4x21;
	Mon,  4 Aug 2025 12:09:34 +1000 (AEST)
Date: Mon, 4 Aug 2025 12:09:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the tip tree
Message-ID: <20250804120933.2bb0ec2e@canb.auug.org.au>
In-Reply-To: <20250723110537.5d5de415@canb.auug.org.au>
References: <20250723110537.5d5de415@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/24Tyuu9IJ0dl=FJa3bycqMX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/24Tyuu9IJ0dl=FJa3bycqMX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 23 Jul 2025 11:05:37 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>=20
>   arch/riscv/include/asm/bug.h
>=20
> between commit:
>=20
>   ac2655438eb5 ("bugs/riscv: Pass in 'cond_str' to __BUG_FLAGS()")
>=20
> from the tip tree and commit:
>=20
>   8ad470d4e3dc ("riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code=
 sharing with Rust")
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
> diff --cc arch/riscv/include/asm/bug.h
> index da9b8e83934d,4c03e20ad11f..000000000000
> --- a/arch/riscv/include/asm/bug.h
> +++ b/arch/riscv/include/asm/bug.h
> @@@ -57,16 -56,22 +56,22 @@@ typedef u32 bug_insn_t
>   			"ebreak\n"				\
>   			".pushsection __bug_table,\"aw\"\n\t"	\
>   		"2:\n\t"					\
> - 			__BUG_ENTRY "\n\t"			\
> - 			".org 2b + %3\n\t"                      \
> + 		__BUG_ENTRY(file, line, flags) "\n\t"		\
> + 			".org 2b + " size "\n\t"                \
>   			".popsection"				\
> +=20
>  -#define __BUG_FLAGS(flags)					\
> ++#define __BUG_FLAGS(cond_str, flags)				\
> + do {								\
> + 	__asm__ __volatile__ (					\
> + 		ARCH_WARN_ASM("%0", "%1", "%2", "%3")		\
>   		:						\
>  -		: "i" (__FILE__), "i" (__LINE__),		\
>  +		: "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
>   		  "i" (flags),					\
>   		  "i" (sizeof(struct bug_entry)));              \
>   } while (0)
> +=20
>   #else /* CONFIG_GENERIC_BUG */
>  -#define __BUG_FLAGS(flags) do {					\
>  +#define __BUG_FLAGS(cond_str, flags) do {			\
>   	__asm__ __volatile__ ("ebreak\n");			\
>   } while (0)
>   #endif /* CONFIG_GENERIC_BUG */
> @@@ -76,8 -81,10 +81,10 @@@
>   	unreachable();						\
>   } while (0)
>  =20
>  -#define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
>  +#define __WARN_FLAGS(cond_str, flags) __BUG_FLAGS(cond_str, BUGFLAG_WAR=
NING|(flags))
>  =20
> + #define ARCH_WARN_REACHABLE
> +=20
>   #define HAVE_ARCH_BUG
>  =20
>   #include <asm-generic/bug.h>

This is now a conflict between the tip tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/24Tyuu9IJ0dl=FJa3bycqMX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiQFl0ACgkQAVBC80lX
0GwqXAgAjg4LW1UVChs9fujDqQ2P8cw4/xECK5ZCEnd7GIPEtHwhts/5zr/8xaRZ
2vab5R4z/NqGOSPF/lOHkRWTV33iOzIKEsE/3BUClQsd0P2C27sme8Mb/fvFpUIY
wma9Gq2chaL6SAGjToYxNDXZL+MKpRMu+QyruBlCIQNHdukoVW8i204OzcX3A2Sz
X3S/KP9Ljhr/kaJuOERNwoY45Yaip2V6p0mgFwIYjb9oxR2/QsjuCkqLWrVBE1C+
RKduI2yu24rueozXT8J/dzTHWfpIsChfvrxXiYNePYF1oAHUdECsXd2pIbglytcD
idFMqWfnGx+xE1jFI4aHLbOoluTO4Q==
=okwF
-----END PGP SIGNATURE-----

--Sig_/24Tyuu9IJ0dl=FJa3bycqMX--

