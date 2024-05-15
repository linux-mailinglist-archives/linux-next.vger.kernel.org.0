Return-Path: <linux-next+bounces-2327-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9418C6ED6
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 00:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CEE91F21CAE
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 22:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB06D4086A;
	Wed, 15 May 2024 22:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MpXxLqcs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6463C68C;
	Wed, 15 May 2024 22:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715813711; cv=none; b=gVramRTwqSf2FStKpPFUmUBFlwO6JvJOpADMau0LlyrJmLx+YQTxwDn9+RG2JoBWFukUw/K5049EZo75L1sKnxT/BxMFVQ4h00Evi+GaOmELIzP753QtNNpKwtD4iqvF5rkZFsp0QkvoJc6IpSHC9Gu/g/IcsOpyGckqpgyITJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715813711; c=relaxed/simple;
	bh=o4DgAy62qyJ0nADFKG9xG856wIaWqxAtZHJ9t5cc5SU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W8ZDc/WKh2bbbAsTzzWAetfEtXroYb4V7zbiQXxB0JjW/yNi3yc89NPxZTr4jwZpnHf/Ru1hv21uFeitOgJWD1MSwWI2KGxMtJiBDQU2Krx2b48Q4kBLIlHgKAlNntXS3IF3GUkJouBrWk9Qs6IYqm0A82nyMiB0p23sQWxndi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MpXxLqcs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715813707;
	bh=oo8tP2JjIO5kS3+u8DU/4QjZmOqGxW1CPFiQYmO+7XQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MpXxLqcsr/gXdzRBKYTTnyyE2Dn4g/Z73Ry0b6qoADkG2uIuCp153biTBK2DI9/CF
	 IFASQLOEcPUkQfzD0LMbwR9WdqSZPl0Kguw9baslpgbW1juaep6ReS6+Xs6KwYLOLw
	 35yW0BdyFemcgSCGWWglmNHWHP5fNwbyt+BsSw+CBR76+RuNLxtCd0aYfC6i7ETinS
	 MGdV9AU00WnTOPGD+83NJVbbWHb5xHymeCEvUoHxNdt5QJ489jfQRJeGpI01ZSOYYc
	 Qzn6W7S26r9dSIM3x6qPx7c1I2rj18/FF466kggwjBvw7DK+u2rsWVzKFHJg5h/Q0k
	 vZzQJhJ2HwyYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VfpTR0JDtz4wxf;
	Thu, 16 May 2024 08:55:07 +1000 (AEST)
Date: Thu, 16 May 2024 08:55:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>,
 Alexander Lobakin <aleksander.lobakin@intel.com>, Kent Overstreet
 <kent.overstreet@linux.dev>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Suren
 Baghdasaryan <surenb@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: Re: linux-next: manual merge of the net-next tree with the mm tree
Message-ID: <20240516085506.6169f45f@canb.auug.org.au>
In-Reply-To: <20240516085140.5c654de5@canb.auug.org.au>
References: <20240429114302.7af809e8@canb.auug.org.au>
	<20240516085140.5c654de5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TsITq.qB1112D2X9O+uw5/w";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TsITq.qB1112D2X9O+uw5/w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 16 May 2024 08:51:40 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 29 Apr 2024 11:43:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the net-next tree got a conflict in:
> >=20
> >   include/linux/slab.h
> >=20
> > between commit:
> >=20
> >   7bd230a26648 ("mm/slab: enable slab allocation tagging for kmalloc an=
d friends")
> >=20
> > from the mm_unstable branch of the mm tree and commit:
> >=20
> >   a1d6063d9f2f ("slab: introduce kvmalloc_array_node() and kvcalloc_nod=
e()")
> >=20
> > from the net-next tree.
> >=20
>
> This is now a conflict between the mm-stable tree and Linus' tree.

But with the revised fixup below, of course.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/slab.h
index 4cc37ef22aae,d1d1fa5e7983..88426b015faa
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@@ -773,40 -744,66 +773,54 @@@ static inline __alloc_size(1, 2) void *
   * @size: how many bytes of memory are required.
   * @flags: the type of memory to allocate (see kmalloc).
   */
 -static inline __alloc_size(1) void *kzalloc(size_t size, gfp_t flags)
 +static inline __alloc_size(1) void *kzalloc_noprof(size_t size, gfp_t fla=
gs)
  {
 -	return kmalloc(size, flags | __GFP_ZERO);
 +	return kmalloc_noprof(size, flags | __GFP_ZERO);
  }
 +#define kzalloc(...)				alloc_hooks(kzalloc_noprof(__VA_ARGS__))
 +#define kzalloc_node(_size, _flags, _node)	kmalloc_node(_size, (_flags)|_=
_GFP_ZERO, _node)
 =20
 -/**
 - * kzalloc_node - allocate zeroed memory from a particular memory node.
 - * @size: how many bytes of memory are required.
 - * @flags: the type of memory to allocate (see kmalloc).
 - * @node: memory node from which to allocate
 - */
 -static inline __alloc_size(1) void *kzalloc_node(size_t size, gfp_t flags=
, int node)
 -{
 -	return kmalloc_node(size, flags | __GFP_ZERO, node);
 -}
 +extern void *kvmalloc_node_noprof(size_t size, gfp_t flags, int node) __a=
lloc_size(1);
 +#define kvmalloc_node(...)			alloc_hooks(kvmalloc_node_noprof(__VA_ARGS__=
))
 =20
 -extern void *kvmalloc_node(size_t size, gfp_t flags, int node) __alloc_si=
ze(1);
 -static inline __alloc_size(1) void *kvmalloc(size_t size, gfp_t flags)
 -{
 -	return kvmalloc_node(size, flags, NUMA_NO_NODE);
 -}
 -static inline __alloc_size(1) void *kvzalloc_node(size_t size, gfp_t flag=
s, int node)
 -{
 -	return kvmalloc_node(size, flags | __GFP_ZERO, node);
 -}
 -static inline __alloc_size(1) void *kvzalloc(size_t size, gfp_t flags)
 -{
 -	return kvmalloc(size, flags | __GFP_ZERO);
 -}
 +#define kvmalloc(_size, _flags)			kvmalloc_node(_size, _flags, NUMA_NO_NO=
DE)
 +#define kvmalloc_noprof(_size, _flags)		kvmalloc_node_noprof(_size, _flag=
s, NUMA_NO_NODE)
 +#define kvzalloc(_size, _flags)			kvmalloc(_size, _flags|__GFP_ZERO)
 =20
 -static inline __alloc_size(1, 2) void *
 -kvmalloc_array_node(size_t n, size_t size, gfp_t flags, int node)
 +#define kvzalloc_node(_size, _flags, _node)	kvmalloc_node(_size, _flags|_=
_GFP_ZERO, _node)
 +
- static inline __alloc_size(1, 2) void *kvmalloc_array_noprof(size_t n, si=
ze_t size, gfp_t flags)
++static inline __alloc_size(1, 2) void *kvmalloc_array_node_noprof(size_t =
n, size_t size, gfp_t flags, int node)
  {
  	size_t bytes;
 =20
  	if (unlikely(check_mul_overflow(n, size, &bytes)))
  		return NULL;
 =20
- 	return kvmalloc_node_noprof(bytes, flags, NUMA_NO_NODE);
 -	return kvmalloc_node(bytes, flags, node);
++	return kvmalloc_node_noprof(bytes, flags, node);
+ }
+=20
++#define kvmalloc_array_node(...)	alloc_hooks(kvmalloc_array_node_noprof(_=
_VA_ARGS__))
++
+ static inline __alloc_size(1, 2) void *
+ kvmalloc_array(size_t n, size_t size, gfp_t flags)
+ {
+ 	return kvmalloc_array_node(n, size, flags, NUMA_NO_NODE);
+ }
++#define kvmalloc_array_noprof(_n, _size, _flags)	kvmalloc_array(_n, _size=
, _flags)
+=20
+ static inline __alloc_size(1, 2) void *
+ kvcalloc_node(size_t n, size_t size, gfp_t flags, int node)
+ {
 -	return kvmalloc_array_node(n, size, flags | __GFP_ZERO, node);
++	return kvmalloc_array_node_noprof(n, size, flags | __GFP_ZERO, node);
  }
 =20
- #define kvmalloc_array(...)			alloc_hooks(kvmalloc_array_noprof(__VA_ARGS=
__))
 -static inline __alloc_size(1, 2) void *kvcalloc(size_t n, size_t size, gf=
p_t flags)
 -{
 -	return kvmalloc_array(n, size, flags | __GFP_ZERO);
 -}
 +#define kvcalloc(_n, _size, _flags)		kvmalloc_array(_n, _size, _flags|__G=
FP_ZERO)
- #define kvcalloc_noprof(_n, _size, _flags)	kvmalloc_array_noprof(_n, _siz=
e, _flags|__GFP_ZERO)
++#define kvcalloc_noprof(_n, _size, _flags)	kvmalloc_array_node_noprof(_n,=
 _size, _flags|__GFP_ZERO)
 =20
 -extern void *kvrealloc(const void *p, size_t oldsize, size_t newsize, gfp=
_t flags)
 +extern void *kvrealloc_noprof(const void *p, size_t oldsize, size_t newsi=
ze, gfp_t flags)
  		      __realloc_size(3);
 +#define kvrealloc(...)				alloc_hooks(kvrealloc_noprof(__VA_ARGS__))
 +
  extern void kvfree(const void *addr);
  DEFINE_FREE(kvfree, void *, if (_T) kvfree(_T))
 =20

--Sig_/TsITq.qB1112D2X9O+uw5/w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZFPUoACgkQAVBC80lX
0GwAfwf3bdnCyFNkWI2rog8o8I9W7GGzCO+n+Y3t8qoq8pN2+lkNyOUKGsTvQYmw
C0S2o81B1rczgjPM9zJA+wp7KXQdw9ZIq/Ack7h2PThGxwiOpf7tS76E69zV+Td+
V2GmEE/3/KlgcfDMsu0V+DQfTSR9HF96A1O9wnPVsmhGxEEeFWIRuznsepKit7B9
6KDbCzg24gZOaJcA3csImuQ+sTf6SUzpZHyrDmEA0nR7EnlFAKXUppATqA8yAFzR
yUhp9Qv5Za2uDvIoBQn+3QIom55zfSvUBcBao3VcyD9H6VwBxzadK6AxUJf1gGsx
FqZ/0eBcN6x3RJsn3Gxa+mvE1OzR
=/sGT
-----END PGP SIGNATURE-----

--Sig_/TsITq.qB1112D2X9O+uw5/w--

