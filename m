Return-Path: <linux-next+bounces-4825-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E559D4473
	for <lists+linux-next@lfdr.de>; Thu, 21 Nov 2024 00:27:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9185F28318E
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 23:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC5F1802DD;
	Wed, 20 Nov 2024 23:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VJhbAJqP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6342D2F2A;
	Wed, 20 Nov 2024 23:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732145248; cv=none; b=pIyayhpZAihmvMgdaiLSUfWGeb08v27vbF5EorPnGUmxYAUhPrPHHgFRVfOiyh+fN20LLemESoAQKpxth+qxnHhjtLYbGaOpW38y0jSfW3lxGi/zbWOPMmmh8HWWy/wG/M2fzPmoNqh/DfrK0XcB0+5AsNKMatBdsXn9upT7Xf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732145248; c=relaxed/simple;
	bh=uLiYAKXsG8VaK+cgIcUikicbqVIlg9Ca0l9K+9LHoa8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DlRifAxTbnquMWSNSkb+AJIQj76FgtcxBeW99vDA1U+oBUnokiLyq06wf1Qk+8nKAvVHapG8zOAENw1ZhOltWFNs6nu8Hv+LDIeRSlQXZJzAwSNSMf44PVJKi2DZzmq9OH5WrYjGGM3Mk1Ejnvyc+8hJyaEl5kLS81AY4XO8WSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VJhbAJqP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732145240;
	bh=+YSQEd3q7fygoQalTO+87OZtrZtg4dX9obtqWzCL/KM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VJhbAJqPJS66DtpTzp1tvz+e5z1F0ugaJQpwDjfq+tjqHAk5pLg5rLglTS4HdBCXZ
	 TUwLWJU8tCsrCaTqTkQhSBm44+7/b4fhdBwQNnAJMKh+u9vJzmRIflR4RnT4kSPbgX
	 eOIbj8pcwXFHtZQ71xQP1R2CfE44GegT5D7k+obvDDejaLFeXF7JXW8yPaNtiM3etY
	 GMHt2Th8OhLz/6Mx28vl47QP2MT086bir5VXhfC9GPaGJHx90rQB3hpXRc8pd+dhts
	 lXRzwzm3LCPLKkVGotf9fpUQqE6PsykAa3VIFISHBWU7tOgtzeQssh9O1zefiCzVqB
	 wNz/vRrjLLwQA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XtyFN1HgHz4wbr;
	Thu, 21 Nov 2024 10:27:19 +1100 (AEDT)
Date: Thu, 21 Nov 2024 10:27:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Naveen N Rao <naveen@kernel.org>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the ftrace tree
Message-ID: <20241121102721.63ed1c05@canb.auug.org.au>
In-Reply-To: <20241106140414.760b502c@canb.auug.org.au>
References: <20241106140414.760b502c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FIE00dymjcaY7df1kFG/KuE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FIE00dymjcaY7df1kFG/KuE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 6 Nov 2024 14:04:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> After merging the ftrace tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> In file included from include/linux/ftrace.h:23,
>                  from include/linux/kvm_host.h:32,
>                  from arch/powerpc/include/asm/kvm_ppc.h:19,
>                  from arch/powerpc/include/asm/dbell.h:17,
>                  from arch/powerpc/kernel/asm-offsets.c:36:
> arch/powerpc/include/asm/ftrace.h: In function 'arch_ftrace_set_direct_ca=
ller':
> arch/powerpc/include/asm/ftrace.h:141:38: error: invalid use of undefined=
 type 'struct ftrace_regs'
>   141 |         struct pt_regs *regs =3D &fregs->regs;
>       |                                      ^~
>=20
> Caused by commit
>=20
>   7888af4166d4 ("ftrace: Make ftrace_regs abstract from direct use")
>=20
> interacting with commit
>=20
>   a52f6043a223 ("powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_DIRE=
CT_CALLS")
>=20
> from the powerpc tree.
>=20
> I have applied the following merge fix patch for today.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 6 Nov 2024 13:33:53 +1100
> Subject: [PATCH] fix up for "ftrace: Make ftrace_regs abstract from direc=
t use"
>=20
> from the ftrace tree interacting with "powerpc/ftrace: Add support for
> DYNAMIC_FTRACE_WITH_DIRECT_CALLS" from the powerpc tree
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/include/asm/ftrace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm=
/ftrace.h
> index bb2c90997618..db481b336bca 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -138,7 +138,7 @@ unsigned long ftrace_call_adjust(unsigned long addr);
>   */
>  static inline void arch_ftrace_set_direct_caller(struct ftrace_regs *fre=
gs, unsigned long addr)
>  {
> -	struct pt_regs *regs =3D &fregs->regs;
> +	struct pt_regs *regs =3D &arch_ftrace_regs(fregs)->regs;
> =20
>  	regs->orig_gpr3 =3D addr;
>  }

This patch is now needed when the powerpc tree is merged with Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/FIE00dymjcaY7df1kFG/KuE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc+cFkACgkQAVBC80lX
0Gye0AgAodgxJy4R0rW9HUNlTNnWc+YqfTilmXVKX4MuAVUCW065K3YcOlCjYjs9
usP0rq+X3rVRs1+1xm5G6HiLoAe8E0na+THm20Uvm0MgZFcU8UdBSRz0bfyLUAB4
r7wJYESLQVeSuPB0VMEYb3loRzQzQCkrq78bGXBadHVklc6xr8aTbwgMqV9yqu4I
ac39x8taNOIHiIprW0nQssJqW0Z6Lqel32KnQmM1Yd8lWrQNr402h8qVs5SnCuaT
moMZDlR3s2kMli4wbzN+dKu9TQU9ECLk4a4XItUlfCyfQFH0gr0dH3Rj07tmOUO+
m0rvRpoP4PXzRGug4gaRiKOufMXU/Q==
=HWsg
-----END PGP SIGNATURE-----

--Sig_/FIE00dymjcaY7df1kFG/KuE--

