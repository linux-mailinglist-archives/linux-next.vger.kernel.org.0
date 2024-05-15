Return-Path: <linux-next+bounces-2330-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5638C6F23
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 01:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0037D1F218C4
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 23:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20B44D9F2;
	Wed, 15 May 2024 23:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PmnaoTIW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBAE3FBA7;
	Wed, 15 May 2024 23:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715815446; cv=none; b=Yikz4q+0TA52663C4OzSKeB7z3GA74WPga5D2B0H4RqK23Dai2Y3aurGF9D5JVZQqBX1VlhrGqAZ46U2grLeszfEbUKM3aJhM1cc3j8JfcbAnBz6TBBGQLL4rIgiVVzyrUtMae6YB8uWBObCW32NCUiOaSbE7ucU8qgRTKGgj6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715815446; c=relaxed/simple;
	bh=Q8VPkE29IY3yc1Ga9qKaqmduPct/QBAS7mlBMvMJWI0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uFTBx089CYE6Le6UPIP5IqM49H/O396dwQgKW5kcaOUBgN5P4oc6ofs8CQuDhhGZZiKa3Yji80rZM5fQM4M3OkKDOb+Gvr1nKzztsd4GBGwJnOJJwu/kvSCAmkm/JK6brr9o9kPrNc0f9E3KutYe3zhgHjp460+IMPFV6pUI9fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PmnaoTIW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715815443;
	bh=d98LuK1KfsLFwZxjpmtakns62dhgVIQuZbCW8Ow/p4g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PmnaoTIWJQ55BQJBEg/AEUhVUuzta/XESSmq1HP+LG7DLaLHKFCLLFWe9Y3JVAL7T
	 qelhM8EmbwVFGOHp6NnuRWY+iX7Ea2dPP4NPxTwzKj04yiutK6XGO9/ea4FUHNTnWM
	 3OXt0QoN5bJyJ4jZvZl5hQigbjfWWslnVoHq4E4/I4vHPMonKdf/A9AN9nzjeWpY0j
	 eTSF9wVyjTgiWLXyEF0rwyLuoi61XhjGtwcKWPFf9Ucimku1rGAqeoMqUijRuydt5W
	 vEP/sF9PUw6cyTAKkoqlARTlWhuIM60DNLbDlgzmH7lfzDqGMSE5HShxcNL+SbHJAO
	 I7lUoA7AyqfuQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vfq6p192nz4x1T;
	Thu, 16 May 2024 09:24:02 +1000 (AEST)
Date: Thu, 16 May 2024 09:24:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoph Hellwig <hch@lst.de>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Alexander Lobakin
 <aleksander.lobakin@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the net-next tree with the
 dma-mapping tree
Message-ID: <20240516092401.5257bf0e@canb.auug.org.au>
In-Reply-To: <20240509115307.71ae8787@canb.auug.org.au>
References: <20240509115307.71ae8787@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XcPvDPn//a2UViAc0ysycQ_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XcPvDPn//a2UViAc0ysycQ_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 9 May 2024 11:53:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the net-next tree got a conflict in:
>=20
>   net/core/page_pool.c
>=20
> between commit:
>=20
>   4321de4497b2 ("page_pool: check for DMA sync shortcut earlier")
>=20
> from the dma-mapping tree and commit:
>=20
>   ef9226cd56b7 ("page_pool: constify some read-only function arguments")
>=20
> from the net-next tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc net/core/page_pool.c
> index 4f9d1bd7f4d1,8bcc7014a61a..000000000000
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@@ -398,26 -384,16 +399,26 @@@ static struct page *__page_pool_get_cac
>   	return page;
>   }
>  =20
>  -static void page_pool_dma_sync_for_device(const struct page_pool *pool,
>  -					  const struct page *page,
>  -					  unsigned int dma_sync_size)
>  +static void __page_pool_dma_sync_for_device(const struct page_pool *poo=
l,
> - 					    struct page *page,
> ++					    const struct page *page,
>  +					    u32 dma_sync_size)
>   {
>  +#if defined(CONFIG_HAS_DMA) && defined(CONFIG_DMA_NEED_SYNC)
>   	dma_addr_t dma_addr =3D page_pool_get_dma_addr(page);
>  =20
>   	dma_sync_size =3D min(dma_sync_size, pool->p.max_len);
>  -	dma_sync_single_range_for_device(pool->p.dev, dma_addr,
>  -					 pool->p.offset, dma_sync_size,
>  -					 pool->p.dma_dir);
>  +	__dma_sync_single_for_device(pool->p.dev, dma_addr + pool->p.offset,
>  +				     dma_sync_size, pool->p.dma_dir);
>  +#endif
>  +}
>  +
>  +static __always_inline void
>  +page_pool_dma_sync_for_device(const struct page_pool *pool,
> - 			      struct page *page,
> ++			      const struct page *page,
>  +			      u32 dma_sync_size)
>  +{
>  +	if (pool->dma_sync && dma_dev_need_sync(pool->p.dev))
>  +		__page_pool_dma_sync_for_device(pool, page, dma_sync_size);
>   }
>  =20
>   static bool page_pool_dma_map(struct page_pool *pool, struct page *page)
> @@@ -708,10 -688,11 +710,9 @@@ __page_pool_put_page(struct page_pool *
>   	if (likely(__page_pool_page_can_be_recycled(page))) {
>   		/* Read barrier done in page_ref_count / READ_ONCE */
>  =20
>  -		if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
>  -			page_pool_dma_sync_for_device(pool, page,
>  -						      dma_sync_size);
>  +		page_pool_dma_sync_for_device(pool, page, dma_sync_size);
>  =20
> - 		if (allow_direct && in_softirq() &&
> - 		    page_pool_recycle_in_cache(page, pool))
> + 		if (allow_direct && page_pool_recycle_in_cache(page, pool))
>   			return NULL;
>  =20
>   		/* Page found as candidate for recycling */

This is now a conflict between the dma-mapping tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/XcPvDPn//a2UViAc0ysycQ_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZFRBEACgkQAVBC80lX
0GyBLAgAjOyX7LRNLBPiTsX9UYXq3Dj5vzSJE9dv5mqGbXU+39GRYPRVpADcZaXo
8cNjiP7nkub+BQYXPFndeyB/J3hngcEPdMt1fY1qMBikrRBpIkt1XPuiRP1K8YR7
p9Kb4C4GZ/UR2m6xSGXhXDROgMXYknqOcHX3SNQUXn/lc+MyAxl5PKHGxcoLqGnw
BG7UTF8Fs0J4MUIZ31hzgw23q37ULLLULk6uzFtjZgI+UcSMHRVLkBzVYSDZvzlF
xO08zGVXSqtih/VwzDRNtLR6GLiroTa/FR1K+9v6glrfoUNuSpA+ncqWcoqTQQjh
vt0nklB3T5+hFrlsveDZsjhNWvaWrw==
=hnQX
-----END PGP SIGNATURE-----

--Sig_/XcPvDPn//a2UViAc0ysycQ_--

