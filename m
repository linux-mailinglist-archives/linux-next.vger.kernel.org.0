Return-Path: <linux-next+bounces-2313-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7618C6011
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 07:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BA6CB20917
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 05:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB764381DF;
	Wed, 15 May 2024 05:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VzsYDhCl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0080F1E4B1;
	Wed, 15 May 2024 05:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715749887; cv=none; b=RuctR5i7nDrUin0dgp3b0yuioGsnqZUJDEc4mbEtpZjwT+IiiNxAm5ZcnV2758V1YXDJkPlyn1WAheJap05032aJj05omySSY89ou4sqpRovs7ZjCwX/oWkEB2ePQi5xRxo8s3mShUhUmRt7rkkzFS/ggesQHLI/m0WbR/0uZwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715749887; c=relaxed/simple;
	bh=6VJAwN4E2XFEEf+Hz8jdIe0tpUB/ZS+bO5bAVBuor9s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IOF2tKkgCzRN6rJohs6zmFAXnF+wNzN9VcqNVFhnb2FpvLLUL4ghn+wJ81DR6/gp4hwhErKXmaPHUfQT9KyQ6Juozy9Mfmno/euwRtrnKVDkWbk4mibIvriawCeAP3izdQgUstBnLewag1S8ZOSOxLzfICllxMKidSAAjJEwgac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VzsYDhCl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715749877;
	bh=IflpgsExsihGANChDA/xTmAjxDDg49UabEJp9N22G+8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VzsYDhCl348NnTfhFTdQcTG0pvqASVfzoUU1CaYyj5wvjSuhsXnBggZcAePZDBDrr
	 Udl6LxT14sfUjFssF78rbbnFX6maS9IvQ3bz1IwA9iQHjrYQobM8GRWQrNbN+w/tkF
	 RnJcEfDIvPXh0rJ5a0vXviq+pdVH5MqGfFfSaNI98qXZxk4GMoLV+JQu6bu82hnJCH
	 gt7BF9gUu41StNYLxkBTFdnQ5ToDofUJZ5lm3nTyWtvefbcs863Xe2kv7bI32XiETJ
	 bBZeIcHqQht1bG4aFGfHu2uQa0l0e76PJFPqkjnsa+VrwYcjUjl6UWZrdbOmCQHFrY
	 cpp76jH7U0vnw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VfLsw6Lq6z4wc1;
	Wed, 15 May 2024 15:11:16 +1000 (AEST)
Date: Wed, 15 May 2024 15:11:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <20240515151114.3a3c541e@canb.auug.org.au>
In-Reply-To: <20240515124808.06279d04@canb.auug.org.au>
References: <20240515124808.06279d04@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DsK3OMMd1Y6l1.FfxP7HtZk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DsK3OMMd1Y6l1.FfxP7HtZk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 15 May 2024 12:48:08 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the ftrace tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>=20
> In file included from arch/powerpc/include/asm/page.h:332,
>                  from arch/powerpc/include/asm/mmu.h:144,
>                  from arch/powerpc/include/asm/paca.h:18,
>                  from arch/powerpc/include/asm/current.h:13,
>                  from include/linux/thread_info.h:23,
>                  from include/asm-generic/preempt.h:5,
>                  from ./arch/powerpc/include/generated/asm/preempt.h:1,
>                  from include/linux/preempt.h:79,
>                  from include/linux/alloc_tag.h:11,
>                  from include/linux/percpu.h:5,
>                  from include/linux/context_tracking_state.h:5,
>                  from include/linux/hardirq.h:5,
>                  from include/linux/interrupt.h:11,
>                  from include/linux/trace_recursion.h:5,
>                  from kernel/trace/ring_buffer.c:7:
> kernel/trace/ring_buffer.c: In function '__rb_map_vma':
> kernel/trace/ring_buffer.c:6286:72: warning: passing argument 1 of 'virt_=
to_pfn' makes pointer from integer without a cast [-Wint-conversion]
>  6286 |                 struct page *page =3D virt_to_page(cpu_buffer->su=
bbuf_ids[s]);
>       |                                                  ~~~~~~~~~~~~~~~~=
~~~~~~^~~
>       |                                                                  =
      |
>       |                                                                  =
      long unsigned int
> include/asm-generic/memory_model.h:37:45: note: in definition of macro '_=
_pfn_to_page'
>    37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
>       |                                             ^~~
> kernel/trace/ring_buffer.c:6286:37: note: in expansion of macro 'virt_to_=
page'
>  6286 |                 struct page *page =3D virt_to_page(cpu_buffer->su=
bbuf_ids[s]);
>       |                                     ^~~~~~~~~~~~
> arch/powerpc/include/asm/page.h:228:53: note: expected 'const void *' but=
 argument is of type 'long unsigned int'
>   228 | static inline unsigned long virt_to_pfn(const void *kaddr)
>       |                                         ~~~~~~~~~~~~^~~~~
>=20
> Introduced by commit
>=20
>   117c39200d9d ("ring-buffer: Introducing ring-buffer mapping functions")
>=20
> My arm multi_v7_defconfig build produced a similar warning.

This became a build failure on my powerpc allyesconfig build, so I have
used the ftrace tree from next-20240414 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/DsK3OMMd1Y6l1.FfxP7HtZk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZEQ/IACgkQAVBC80lX
0Gzn+Af+MbfnQzI5pyLSBCKciRFdJiuhxOOLWXThPr2QSv90d+jdQ06DMLkxAcUT
xaqEh7H/OIR69Ksmj8r9MKEjcyVcdRrsCEp9LLklAupEZm5QSe7vUgq8pMubTEwY
DtmITYURqnfVpuVajEzvpM7H+r1nhvEBoOUKJ0UF6r9zvbJ6c4o2j7+DSxbqe7yo
H5QTTAaUWBrAOnS4VLDI1Vh+uaJ88YtZky+Ev22d/6fMeTwmwhr3RBjtISunkWCn
kBXnSFwbuioj58L+ttvH+shLJtiyf6IBWcByCz8zcREcq/4ISBA+E+kp7ARKqPMh
hbGgf7kAyRgXFGeauzCOPZighNCuNA==
=mQ1E
-----END PGP SIGNATURE-----

--Sig_/DsK3OMMd1Y6l1.FfxP7HtZk--

