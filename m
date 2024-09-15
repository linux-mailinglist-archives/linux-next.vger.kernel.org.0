Return-Path: <linux-next+bounces-3861-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6140597997B
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 01:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FA921C21E65
	for <lists+linux-next@lfdr.de>; Sun, 15 Sep 2024 23:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D248977117;
	Sun, 15 Sep 2024 23:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fgCO3qvW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E350F2BCF5;
	Sun, 15 Sep 2024 23:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726442196; cv=none; b=UnWT6hOqITcB9sXTRjiRRU2Zjt92OaXHn7nmuG+Q3advoUT32/Pf1waIokgUl837HV8G3Gw3HhnmZg2TpNlOGt3GmuE+/C3JJTqKKt2iRaZSKP6hquFVi+LfuaPDoomBc0AOey8IXypjcFngGExKO0WhSHLW65HfSPtckZyl8Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726442196; c=relaxed/simple;
	bh=S98u6b+jnTKVchO45vkryN5wsioS5RnrF+zIsm6MueI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zt72E78Mi5i+GX2dldJMDgLJ7fhx0MgIpvCfTbR9SroiXDuhJ6iONvHcYGdXc22lz7sOYqplL3Oc85fhnkYJlCV8QNi/NQ4DOwOYaTfrhhCpYAQuTWaJvxiyLyXiWYRWxDTIcy+ttCcw7Xwiqem4DP4ETbVOPmiCGzYKY1dDK8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fgCO3qvW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726442190;
	bh=+YkVivKQKXh9KKj1Omgtn8LMDpfsrjbXlXEgwIeN1hE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fgCO3qvWOlr9OTwlOusdn8iUf0yu02AoLXYOivGbuBk24bZFEixS/E+KN76lga+SC
	 2plihgbd/GqAxnBjdmR97NYPsHOZdSwYbRhO70zhneakfXKa7At3TySWusd87eNlbG
	 hojE7jDQAZvSniNMO5pw8AeRdO0RYEJxUe2/ftklWw8fcn4lZndpG4TRmwm18+bBf5
	 MbIYpYWwZ1P5rOWnNEYmG2WT5+mLw6eYesBEC6pxzMrIwt77FXYoOWLlHqdg6SZSYU
	 OJUiHTYclSOszHBKzAm6lwIKEXeyoXfAIrYJ9B7wdFj2zzrXfvdxnenm5SgOkThmNt
	 q2uoCWA22wDSQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X6P7H4RWKz4xCT;
	Mon, 16 Sep 2024 09:16:27 +1000 (AEST)
Date: Mon, 16 Sep 2024 09:16:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, <linuxppc-dev@lists.ozlabs.org>, Matthew
 Wilcox <willy@infradead.org>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
Message-ID: <20240916091627.7517d5b1@canb.auug.org.au>
In-Reply-To: <87jzffq9ge.fsf@mail.lhotse>
References: <20240913213351.3537411-1-almasrymina@google.com>
	<87jzffq9ge.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wvWGET07=F0qHFq0Pov_C+c";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wvWGET07=F0qHFq0Pov_C+c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sat, 14 Sep 2024 12:02:09 +1000 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> Mina Almasry <almasrymina@google.com> writes:
> > Building net-next with powerpc with GCC 14 compiler results in this
> > build error:
> >
> > /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> > /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
> > not a multiple of 4)
> > make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
> > net/core/page_pool.o] Error 1
> >
> > Root caused in this thread:
> > https://lore.kernel.org/netdev/913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-=
soprasteria.com/ =20
>=20
> Sorry I'm late to this, the original report wasn't Cc'ed to linuxppc-dev =
:D

Yeah, sorry about that.

> I think this is a bug in the arch/powerpc inline asm constraints.
>=20
> Can you try the patch below, it fixes the build error for me.
>=20
> I'll run it through some boot tests and turn it into a proper patch over
> the weekend.
>=20
> cheers
>=20
>=20
> diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm=
/atomic.h
> index 5bf6a4d49268..0e41c1da82dd 100644
> --- a/arch/powerpc/include/asm/atomic.h
> +++ b/arch/powerpc/include/asm/atomic.h
> @@ -23,6 +23,12 @@
>  #define __atomic_release_fence()					\
>  	__asm__ __volatile__(PPC_RELEASE_BARRIER "" : : : "memory")
> =20
> +#ifdef CONFIG_CC_IS_CLANG
> +#define DS_FORM_CONSTRAINT "Z<>"
> +#else
> +#define DS_FORM_CONSTRAINT "YZ<>"
> +#endif
> +
>  static __inline__ int arch_atomic_read(const atomic_t *v)
>  {
>  	int t;
> @@ -197,7 +203,7 @@ static __inline__ s64 arch_atomic64_read(const atomic=
64_t *v)
>  	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
>  		__asm__ __volatile__("ld %0,0(%1)" : "=3Dr"(t) : "b"(&v->counter));
>  	else
> -		__asm__ __volatile__("ld%U1%X1 %0,%1" : "=3Dr"(t) : "m<>"(v->counter));
> +		__asm__ __volatile__("ld%U1%X1 %0,%1" : "=3Dr"(t) : DS_FORM_CONSTRAINT=
 (v->counter));
> =20
>  	return t;
>  }
> @@ -208,7 +214,7 @@ static __inline__ void arch_atomic64_set(atomic64_t *=
v, s64 i)
>  	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
>  		__asm__ __volatile__("std %1,0(%2)" : "=3Dm"(v->counter) : "r"(i), "b"=
(&v->counter));
>  	else
> -		__asm__ __volatile__("std%U0%X0 %1,%0" : "=3Dm<>"(v->counter) : "r"(i)=
);
> +		__asm__ __volatile__("std%U0%X0 %1,%0" : "=3D" DS_FORM_CONSTRAINT (v->=
counter) : "r"(i));
>  }
> =20
>  #define ATOMIC64_OP(op, asm_op)						\

I have applied this by hand to my fixes branch for today and will
remove it when it (or something better) is applied somewhere appropriate.

--=20
Cheers,
Stephen Rothwell

--Sig_/wvWGET07=F0qHFq0Pov_C+c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbnassACgkQAVBC80lX
0GwtGwgAjDVCZvPbYm3Kwv1z8+t74EffqYKMdcX5DcnmbMkaPV3rLXAKXr0KVymx
/kggi6dj2sFS8NnsgSFbzQkIMF3Kh5iSCxiTzcGPpL29qOYI5S5r/qEV8SL70Ufd
mMEPuZm5/xE4dHw9QUrZfPPdCrmLCMl17cLiVl2anqeS6WO2X6MC6sH+rIq5k4x6
BpEMayzkSIoJrxSfBkj3kyWVzIrXJ2vnOzQr9/4eChhLBzt6BOqOHCyze6TIE+aV
USLfDeVtJqO0PR0B7DajAkUUaAlBv2dqSFUY8PVlmCT+2XawhvUQp0s4xFag/mUX
gVGPsrNGlnkqUmfk+nc88OS/JI4Bcg==
=GsuB
-----END PGP SIGNATURE-----

--Sig_/wvWGET07=F0qHFq0Pov_C+c--

