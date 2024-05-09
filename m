Return-Path: <linux-next+bounces-2240-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 464C78C0961
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 03:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0299D282A16
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 01:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1AD13D511;
	Thu,  9 May 2024 01:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GpYwT3ly"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C347413D280;
	Thu,  9 May 2024 01:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715219603; cv=none; b=a2K3b9DcAHaM5+lAo6VhbwNV6JpQajzG4Lex2WGhYr0UDBYxY3GWO5Fs4sEEwyFUqLYCiW5Rgnk9lSQJvNMMkIg3BUmXt/29QzBzxPV6ZZ6iFmHZA33bxQpx5/YwJiCi/PcX3aGnHwmnxVKjtDP34Bik96EzD1G5r+Or80iDG+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715219603; c=relaxed/simple;
	bh=nhF5Rqpf1Sh/E7F/InVEqc1GzOa/hK+3b/qJDEK0PdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Cloz6ZkoIM4JUlK658Q7vWDyU4iwHXIOcs1MNFg1RdcB0wCgSO0zSuyuq96egOw2J1bHuqelmdWhWAHeMh1o6w5HpW6SbYC76jn1WaXfW383/LaHb5zJNLhIeaIaHTdtxAduR2lLyt1wyr8yN2a+ujm2J0cPkeZdUrT+RR03YUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GpYwT3ly; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715219592;
	bh=WpdW4zqAGBKvnQv0jKzuhtnmm8jG3qKhG4SNIVAsBt4=;
	h=Date:From:To:Cc:Subject:From;
	b=GpYwT3lyREGArozTLTrWqQSSnAQQMhHVI6/9zkqD5S4MCB/UDXvcKRxBFKdNiSXtR
	 YWOYU3nPg+rtTWsOsXILkTBQQeIXLm9h7IfpwEdu8PI0Gq7B/xdmu7D9GpkCyJdrCa
	 tQjFoJ6KJTKcpupzgeSvRj44xrjTLbsCer/CzLXi4DqZpmpdTfqZYeBEJD758ZXazc
	 WnXoXJ5OV34fXQ8w1iyxodyyZA8VV2n8UJui4E9GB9cPh+KKBZ5GSZVfvmrQMTWlEj
	 ZKtTrYPYLY311CcTvOD/v8LZMgDGNt7VW7EohpCmIXjqBMq9W1OokHmBKkJtK5gp60
	 WFaQbHKq6Bzuw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZZm72g4Nz4x30;
	Thu,  9 May 2024 11:53:10 +1000 (AEST)
Date: Thu, 9 May 2024 11:53:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Christoph Hellwig <hch@lst.de>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>, Tony Nguyen
 <anthony.l.nguyen@intel.com>, Networking <netdev@vger.kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the dma-mapping
 tree
Message-ID: <20240509115307.71ae8787@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NuBy9ZQeB44PQ22KF2SbEhf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NuBy9ZQeB44PQ22KF2SbEhf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/core/page_pool.c

between commit:

  4321de4497b2 ("page_pool: check for DMA sync shortcut earlier")

from the dma-mapping tree and commit:

  ef9226cd56b7 ("page_pool: constify some read-only function arguments")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc net/core/page_pool.c
index 4f9d1bd7f4d1,8bcc7014a61a..000000000000
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@@ -398,26 -384,16 +399,26 @@@ static struct page *__page_pool_get_cac
  	return page;
  }
 =20
 -static void page_pool_dma_sync_for_device(const struct page_pool *pool,
 -					  const struct page *page,
 -					  unsigned int dma_sync_size)
 +static void __page_pool_dma_sync_for_device(const struct page_pool *pool,
- 					    struct page *page,
++					    const struct page *page,
 +					    u32 dma_sync_size)
  {
 +#if defined(CONFIG_HAS_DMA) && defined(CONFIG_DMA_NEED_SYNC)
  	dma_addr_t dma_addr =3D page_pool_get_dma_addr(page);
 =20
  	dma_sync_size =3D min(dma_sync_size, pool->p.max_len);
 -	dma_sync_single_range_for_device(pool->p.dev, dma_addr,
 -					 pool->p.offset, dma_sync_size,
 -					 pool->p.dma_dir);
 +	__dma_sync_single_for_device(pool->p.dev, dma_addr + pool->p.offset,
 +				     dma_sync_size, pool->p.dma_dir);
 +#endif
 +}
 +
 +static __always_inline void
 +page_pool_dma_sync_for_device(const struct page_pool *pool,
- 			      struct page *page,
++			      const struct page *page,
 +			      u32 dma_sync_size)
 +{
 +	if (pool->dma_sync && dma_dev_need_sync(pool->p.dev))
 +		__page_pool_dma_sync_for_device(pool, page, dma_sync_size);
  }
 =20
  static bool page_pool_dma_map(struct page_pool *pool, struct page *page)
@@@ -708,10 -688,11 +710,9 @@@ __page_pool_put_page(struct page_pool *
  	if (likely(__page_pool_page_can_be_recycled(page))) {
  		/* Read barrier done in page_ref_count / READ_ONCE */
 =20
 -		if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
 -			page_pool_dma_sync_for_device(pool, page,
 -						      dma_sync_size);
 +		page_pool_dma_sync_for_device(pool, page, dma_sync_size);
 =20
- 		if (allow_direct && in_softirq() &&
- 		    page_pool_recycle_in_cache(page, pool))
+ 		if (allow_direct && page_pool_recycle_in_cache(page, pool))
  			return NULL;
 =20
  		/* Page found as candidate for recycling */

--Sig_/NuBy9ZQeB44PQ22KF2SbEhf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY8LIMACgkQAVBC80lX
0GyoaQf/ezrpddH1WzyhXEMQYeGAg/CF1ZTKsowhF5XlCdn+JLEPJdmubXK/zClx
+CwSlhUDqXIENzGzmQtGFmZQ2lTCKcfrREz+0LPCbrLVm3w2mvuFpzXv2ywncPz+
isqeCsKePHKAYo7n25wM28Swzgm/nzyXMGLpkdlUCCGOpfa4iG7EtDkuffqnkG1P
o1DsjAWiWSnDnm/1Ug5WEV8zO+V6YWDr683LKbuPH49o+52FisC89Zs+ezMFN3wT
hp8EHfIIVTk2enZK2ZWko3mDbr5Zwlpf85VWoeGA4rIblxIWaC8zHlS56VReI8Re
l6oXl3MZkt6OUWjwwGP6Hy/7Orw/AQ==
=oTxH
-----END PGP SIGNATURE-----

--Sig_/NuBy9ZQeB44PQ22KF2SbEhf--

