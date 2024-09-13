Return-Path: <linux-next+bounces-3826-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A93C977DDF
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 12:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05FB7B23861
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 10:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468B51D7E22;
	Fri, 13 Sep 2024 10:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XyxoIQDE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186701B9826;
	Fri, 13 Sep 2024 10:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726224107; cv=none; b=tzqnljHX9RUjktaO8VpXWjnf+LDlJPo9H4kfY0DeUxPf7j/hbjrpcxCWLR5yW6XFP5KMAWtQVYUmTJGWlliDcQJ1Gyg4DUgMhrcjARrvh3H+J5NqmAWYrtj16AdVpdczoLvlxuf3QNhJwfYJbl7TXEbPij++LkxpOPkDYlRowFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726224107; c=relaxed/simple;
	bh=JICNTVqX1nbtOb/rRWVWNUiKb0VIP6ogub7x0oZyFeM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sbz3n+j32br+qpLbXrp+ccDQt2wlXIkx/HVH9wH9nF1S0A18OAqhMJ1eQ1cSoGEmbqyidU2aCdGQj3ugVSgnJMDLP36jvJvIkzzOe1bK2AfXKdlT6xYV37fhWwulvWyUS07fSFmwt/NxTVh4bxBXXbeyjWubqu2i80JSZFKz6WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XyxoIQDE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726224100;
	bh=KqjBufrxC1T+9UNimGFrPXe7rI3jiWjqihf9xX0aIeg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XyxoIQDErSA1qKR62zcOAPzg2joowjqZfj8xhd1SPLWne9anPPVLrnPsDtdLjyoNn
	 mDBKHofLzOlr+o4Yv0XXu42U9nlvcGc7VPrEQOCeYvtRMqGiqpWGkEyMbt7BSV0oYo
	 qJedo1H2i9/RxPhw6Ztz+KT519n6LmAMgFDLzp1CmnODXfXswnnwzZDI00nB+GnQm1
	 n0wlbV8LMRnAy9heSAeCDSvY6qymWPXzCBx5naFxQWj2o4Lhxru0H/VPgvQBx0+LA9
	 O6cu0X31e1nCzU/gocznUcF+tuswkBy3NU+BX8vfHL/y2U0uXUOXSy6+5jMz1/sQQK
	 n1H41yt0vrHyw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X4rTH3Yq1z4xD7;
	Fri, 13 Sep 2024 20:41:39 +1000 (AEST)
Date: Fri, 13 Sep 2024 20:41:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jakub Kicinski <kuba@kernel.org>
Cc: David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Mina Almasry <almasrymina@google.com>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the net-next tree
Message-ID: <20240913204138.7cdb762c@canb.auug.org.au>
In-Reply-To: <20240912200543.2d5ff757@kernel.org>
References: <20240913125302.0a06b4c7@canb.auug.org.au>
	<20240912200543.2d5ff757@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OqNqPcdJGXr8HswA1u3OcDh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OqNqPcdJGXr8HswA1u3OcDh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

On Thu, 12 Sep 2024 20:05:43 -0700 Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Fri, 13 Sep 2024 12:53:02 +1000 Stephen Rothwell wrote:
> > /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> > /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is=
 not a multiple of 4)
> > make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229: net/core/=
page_pool.o] Error 1 =20
>=20
> Ugh, bad times for networking, I just "fixed" the HSR one a few hours
> ago. Any idea what line of code this is? I'm dusting off my powerpc
> build but the error is somewhat enigmatic.

I have bisected it (just using the net-next tree) to commit

8ab79ed50cf10f338465c296012500de1081646f is the first bad commit
commit 8ab79ed50cf10f338465c296012500de1081646f
Author: Mina Almasry <almasrymina@google.com>
Date:   Tue Sep 10 17:14:49 2024 +0000

    page_pool: devmem support
   =20

And it may be pointing at arch/powerpc/include/asm/atomic.h line 200
which is this:

static __inline__ s64 arch_atomic64_read(const atomic64_t *v)
{
        s64 t;

        /* -mprefixed can generate offsets beyond range, fall back hack */
        if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
                __asm__ __volatile__("ld %0,0(%1)" : "=3Dr"(t) : "b"(&v->co=
unter))
;
        else
                __asm__ __volatile__("ld%U1%X1 %0,%1" : "=3Dr"(t) : "m<>"(v=
->counter));

        return t;
}

The second "asm" above (CONFIG_PPC_KERNEL_PREFIXED is not set).  I am
guessing by searching for "39" in net/core/page_pool.s

This is maybe called from page_pool_unref_netmem()

--=20
Cheers,
Stephen Rothwell

--Sig_/OqNqPcdJGXr8HswA1u3OcDh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbkFuIACgkQAVBC80lX
0GzYvwf+My4BrCjgWnAkd9yuW9q9y0XFB9nX8bAWXutRCiTw22e2MPif0yBJptC+
6mFCLLQUcov4q6REPXui/S6HfFoVSnc4Brl7FK002mDBjkZDRG+/JY9o+NBLECP9
gfZLmb4gvvcPtWM9i43hI1LG0xL/vFPri3jsRLwnbzMjwDd9QuzL4GVKGZXbSO5C
bzJGd3+jzVfMYpMSIcSxYmHR1gDr2fuSJObVoDk7hx9bW7RlgKM0tdg2s7qx+pDs
DSdELdrDXxgAyArQBLUdzkLok1HNpMaqXqinY+jhPlzc1B8FL3T1eyiUrz1FLp4K
gkIxUT3Wnq93H6SNB1uFO4CMXStdDQ==
=3Adj
-----END PGP SIGNATURE-----

--Sig_/OqNqPcdJGXr8HswA1u3OcDh--

