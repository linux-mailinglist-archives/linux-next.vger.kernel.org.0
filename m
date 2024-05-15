Return-Path: <linux-next+bounces-2326-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFA08C6ECD
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 00:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C1A1282D98
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 22:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751833FB1B;
	Wed, 15 May 2024 22:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="h3wadNns"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAB339FEC;
	Wed, 15 May 2024 22:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715813512; cv=none; b=BA2X74UqqGYLHtb6xO6418fd7hX1cjkiVClAkgtFeUpIita2wlroPxU0iTaGigAjdNsmg/n7IuYtWkCe+eYqG30bAHpxd/1kUlTHEAfSxKQ1X/uKh+8d4ammCaiNWRQulv0fJ2dC/NjRJHLfQCNZbMz5OkEbkY0eldtyZBk+mkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715813512; c=relaxed/simple;
	bh=Mb72hI9N1q8f905w29oQTMBpXZa5SO8MKRbxn0FqpKY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eFYCTiYnDNqB501IUoMrj1GEi2bM7YA6oIfLzjH46iTGzanyFZB865EmBaSWP9nrR0b5Jgkwf9zjbXeEFwZLdKdvBZzV4rMSd01DPJ8hNst8tIV6aHjbYbGAthpwpQp2iAqYdI3U8xzQO8c6T5sZyR8Qc+emkbg4A6ZTnuRGK1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=h3wadNns; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715813505;
	bh=jEboa18Osj+JPyOBHPHbfv1Gl7l9oo0jlh+QKu/Hg7I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h3wadNnsrKeFTTlI+huVPSgxFEA7LMoJe4Gb3LEBslhfLigmCqmCHUdQwfhQkmN+U
	 xkx+tRHY+vY0nuUbQ/SPSqhn9jf/ezOXAU1zYiLjrrupchLHhGxpHmQcF8YahJVLW+
	 BDYugLN3F3XWEo0oh7AAtUOUaV8qNdZJB2i0JtF1roMoD23f10gdIk4JoJVtJ+jHHR
	 uwH11rM04NIOVxDaDbtpCC14Nm3RQeAi/1IgsY0KvHKvKaPKImmf1sV3xI4QaU4m3l
	 q7yLOkcghbSTEQaKTOvTDJ+W/ULZ6+NDgsqPlwlj+tnunRPudC/+r0dMjbWn83w8CF
	 jcdyrDuF3aT8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VfpPW6tkpz4wc8;
	Thu, 16 May 2024 08:51:43 +1000 (AEST)
Date: Thu, 16 May 2024 08:51:40 +1000
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
Message-ID: <20240516085140.5c654de5@canb.auug.org.au>
In-Reply-To: <20240429114302.7af809e8@canb.auug.org.au>
References: <20240429114302.7af809e8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kC3KBzbwlzX2dVVi_nF4cEt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kC3KBzbwlzX2dVVi_nF4cEt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 29 Apr 2024 11:43:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the net-next tree got a conflict in:
>=20
>   include/linux/slab.h
>=20
> between commit:
>=20
>   7bd230a26648 ("mm/slab: enable slab allocation tagging for kmalloc and =
friends")
>=20
> from the mm_unstable branch of the mm tree and commit:
>=20
>   a1d6063d9f2f ("slab: introduce kvmalloc_array_node() and kvcalloc_node(=
)")
>=20
> from the net-next tree.
>=20
> I fixed it up (maybe? see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc include/linux/slab.h
> index 4cc37ef22aae,d1d1fa5e7983..000000000000
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@@ -773,40 -744,66 +773,47 @@@ static inline __alloc_size(1, 2) void *
>    * @size: how many bytes of memory are required.
>    * @flags: the type of memory to allocate (see kmalloc).
>    */
>  -static inline __alloc_size(1) void *kzalloc(size_t size, gfp_t flags)
>  +static inline __alloc_size(1) void *kzalloc_noprof(size_t size, gfp_t f=
lags)
>   {
>  -	return kmalloc(size, flags | __GFP_ZERO);
>  +	return kmalloc_noprof(size, flags | __GFP_ZERO);
>   }
>  +#define kzalloc(...)				alloc_hooks(kzalloc_noprof(__VA_ARGS__))
>  +#define kzalloc_node(_size, _flags, _node)	kmalloc_node(_size, (_flags)=
|__GFP_ZERO, _node)
>  =20
>  -/**
>  - * kzalloc_node - allocate zeroed memory from a particular memory node.
>  - * @size: how many bytes of memory are required.
>  - * @flags: the type of memory to allocate (see kmalloc).
>  - * @node: memory node from which to allocate
>  - */
>  -static inline __alloc_size(1) void *kzalloc_node(size_t size, gfp_t fla=
gs, int node)
>  -{
>  -	return kmalloc_node(size, flags | __GFP_ZERO, node);
>  -}
>  +extern void *kvmalloc_node_noprof(size_t size, gfp_t flags, int node) _=
_alloc_size(1);
>  +#define kvmalloc_node(...)			alloc_hooks(kvmalloc_node_noprof(__VA_ARGS=
__))
>  =20
>  -extern void *kvmalloc_node(size_t size, gfp_t flags, int node) __alloc_=
size(1);
>  -static inline __alloc_size(1) void *kvmalloc(size_t size, gfp_t flags)
>  -{
>  -	return kvmalloc_node(size, flags, NUMA_NO_NODE);
>  -}
>  -static inline __alloc_size(1) void *kvzalloc_node(size_t size, gfp_t fl=
ags, int node)
>  -{
>  -	return kvmalloc_node(size, flags | __GFP_ZERO, node);
>  -}
>  -static inline __alloc_size(1) void *kvzalloc(size_t size, gfp_t flags)
>  -{
>  -	return kvmalloc(size, flags | __GFP_ZERO);
>  -}
>  +#define kvmalloc(_size, _flags)			kvmalloc_node(_size, _flags, NUMA_NO_=
NODE)
>  +#define kvmalloc_noprof(_size, _flags)		kvmalloc_node_noprof(_size, _fl=
ags, NUMA_NO_NODE)
>  +#define kvzalloc(_size, _flags)			kvmalloc(_size, _flags|__GFP_ZERO)
>  =20
>  -static inline __alloc_size(1, 2) void *
>  -kvmalloc_array_node(size_t n, size_t size, gfp_t flags, int node)
>  +#define kvzalloc_node(_size, _flags, _node)	kvmalloc_node(_size, _flags=
|__GFP_ZERO, _node)
>  +
> - static inline __alloc_size(1, 2) void *kvmalloc_array_noprof(size_t n, =
size_t size, gfp_t flags)
> ++static inline __alloc_size(1, 2) void *kvmalloc_array_node_noprof(size_=
t n, size_t size, gfp_t flags)
>   {
>   	size_t bytes;
>  =20
>   	if (unlikely(check_mul_overflow(n, size, &bytes)))
>   		return NULL;
>  =20
>  -	return kvmalloc_node(bytes, flags, node);
>  -}
>  -
>  -static inline __alloc_size(1, 2) void *
>  -kvmalloc_array(size_t n, size_t size, gfp_t flags)
>  -{
>  -	return kvmalloc_array_node(n, size, flags, NUMA_NO_NODE);
>  +	return kvmalloc_node_noprof(bytes, flags, NUMA_NO_NODE);
>   }
>  =20
> - #define kvmalloc_array(...)			alloc_hooks(kvmalloc_array_noprof(__VA_AR=
GS__))
> + static inline __alloc_size(1, 2) void *
> + kvcalloc_node(size_t n, size_t size, gfp_t flags, int node)
> + {
>  -	return kvmalloc_array_node(n, size, flags | __GFP_ZERO, node);
> ++	return kvmalloc_array_node_noprof(n, size, flags | __GFP_ZERO, node);
> + }
> +=20
>  -static inline __alloc_size(1, 2) void *kvcalloc(size_t n, size_t size, =
gfp_t flags)
>  -{
>  -	return kvmalloc_array(n, size, flags | __GFP_ZERO);
>  -}
> ++#define kvmalloc_array(...)			alloc_hooks(kvmalloc_array_node_noprof(__=
VA_ARGS__))
> ++#define kvmalloc_array_noprof(_n, _size, _flags))	kvmalloc_array(_n, _s=
ize, _flags)
>  +#define kvcalloc(_n, _size, _flags)		kvmalloc_array(_n, _size, _flags|_=
_GFP_ZERO)
> - #define kvcalloc_noprof(_n, _size, _flags)	kvmalloc_array_noprof(_n, _s=
ize, _flags|__GFP_ZERO)
> ++#define kvcalloc_noprof(_n, _size, _flags)	kvmalloc_array_node_noprof(_=
n, _size, _flags|__GFP_ZERO)
>  =20
>  -extern void *kvrealloc(const void *p, size_t oldsize, size_t newsize, g=
fp_t flags)
>  +extern void *kvrealloc_noprof(const void *p, size_t oldsize, size_t new=
size, gfp_t flags)
>   		      __realloc_size(3);
>  +#define kvrealloc(...)				alloc_hooks(kvrealloc_noprof(__VA_ARGS__))
>  +
>   extern void kvfree(const void *addr);
>   DEFINE_FREE(kvfree, void *, if (_T) kvfree(_T))
>  =20

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/kC3KBzbwlzX2dVVi_nF4cEt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZFPHwACgkQAVBC80lX
0GzJgQf/XD+z7kZfxjn9vvDwKAP7ZsDJ++faVg/Qkpy7RZiJ84tXimu7hanHLkpe
9Wmkz5iWRKnKfb2UnEE13faHjb90lK5oDc36V0DaGXi3sJ04ETsRjWpeWpZDXjob
grzA+d8yIsVsnzaklt6y9njWsEpXmsTdVBQF5DFvrNFFYV9lSf8CbUNNlhDFezIK
zvszIpQHLHJWMwwOLVZy/tutRUo2fDb33Tsp54tUlLEneOSfleeZqCFqXk0ZBL1L
Xk9HuJcsXtdL4LZPQfKQotHsjqf/3Y3//chHONApxi7PpU2m++cyK7efQrkiu2hn
RBAak/GYqDolJo2u3qN1w05YQ904Mw==
=WSvc
-----END PGP SIGNATURE-----

--Sig_/kC3KBzbwlzX2dVVi_nF4cEt--

