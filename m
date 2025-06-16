Return-Path: <linux-next+bounces-7155-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B03BBADA70D
	for <lists+linux-next@lfdr.de>; Mon, 16 Jun 2025 06:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D6BC16D215
	for <lists+linux-next@lfdr.de>; Mon, 16 Jun 2025 04:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C32219066B;
	Mon, 16 Jun 2025 04:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LNEIIpBD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0256748D;
	Mon, 16 Jun 2025 04:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750047120; cv=none; b=KtxucJqmtgHLmaWbjYo1T6eQ/9j5u9AruShCgbrCQk6jusvpPApAoO834ShtjoSX8OMdnQQTOEXbaFIi4lLyEUTtgj5GzdLGmsBPyGanuSUvueyon2MH6/2LKXywDHB6A2mZoAsV0GJOatq3PskDAOrcneoyawZzn/kbsKsm00s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750047120; c=relaxed/simple;
	bh=BdyC90Qn1wdecaLVG79GIGZDrfU2hK8l5KTPBf/l2t0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=L2ZDNxLIjKRfPlruxFbkbYko7RmtfNvWIXL5ndL/kAgn3XK9czPiVMmJTY3UTN5EBfiu5arVyPUxi995+zKjXJ4XBSJstp01/o759xFD1EJwdFNM4wRg/t/C5LX8lbL+g1U3Sg3SHigbbTOTRwcEcdcYoARBSWYgq/s97OnMpN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LNEIIpBD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750047112;
	bh=jfUtfepG9hGzFcULcP6CDM0WszwuNUz6BqXP9BIm0NI=;
	h=Date:From:To:Cc:Subject:From;
	b=LNEIIpBDkAqJh3XAFaetWHFxjZtEle1YpteMFnVWQEVDL0XQyA54Y9zi4BlOZV1Hr
	 c1FBI+j/UzxxCzJgs8qBKiL4Mi0cS86viVkwuFlIByK0PDYX7yKdEKYu+b95p6S/x5
	 t30OAiVcfqFGVHHrLj/rkgwRPiujqo3KKcPcEM0OgwQnY1M9KOoXK8ESnzobJhNbct
	 Zd4p8OisM5raCFEOvQ20vX26fIi7lDJYREXU+C7LqaIbn/+EGqxh0aUSHm1JRxkX87
	 PGtaFpQbdnZh2mPWvQG9/9iU/kNA5HgcHn3vty5TchhN71qu7VEZaBWrmL3HJl7M+/
	 oo1xN1Na/g1Mg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bLGm80p3nz4wb0;
	Mon, 16 Jun 2025 14:11:52 +1000 (AEST)
Date: Mon, 16 Jun 2025 14:11:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Wu Hao
 <hao.wu@intel.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Xu Yilun
 <yilun.xu@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the fpga tree
Message-ID: <20250616141151.64eb59e0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R+e/CqPHcGl6RkRsKZ+h6xs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/R+e/CqPHcGl6RkRsKZ+h6xs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the fpga tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/fpga/zynq-fpga.c: In function 'zynq_fpga_ops_write':
drivers/fpga/zynq-fpga.c:409:13: error: too few arguments to function 'dma_=
map_sgtable'
  409 |             dma_map_sgtable(mgr->dev.parent, sgt, DMA_TO_DEVICE);
      |             ^~~~~~~~~~~~~~~
In file included from drivers/fpga/zynq-fpga.c:13:
include/linux/dma-mapping.h:126:5: note: declared here
  126 | int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
      |     ^~~~~~~~~~~~~~~
drivers/fpga/zynq-fpga.c:481:9: error: too few arguments to function 'dma_u=
nmap_sgtable'
  481 |         dma_unmap_sgtable(mgr->dev.parent, sgt, DMA_TO_DEVICE);
      |         ^~~~~~~~~~~~~~~~~
include/linux/dma-mapping.h:504:20: note: declared here
  504 | static inline void dma_unmap_sgtable(struct device *dev, struct sg_=
table *sgt,
      |                    ^~~~~~~~~~~~~~~~~

Caused by commit

  f9b5ee4364ed ("fpga: zynq-fpga: use sgtable-based scatterlist wrappers")

I have used the fpga tree from next-20250613 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/R+e/CqPHcGl6RkRsKZ+h6xs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhPmYcACgkQAVBC80lX
0GyZtwf415FIfPYDn85dQujwHy+88OhCy/fOJn1HF1hqjEsMPVf2o8Wb1UD/Fu2G
UFdRuDxXfufIzUjiko2HU+I4CKMBxfeUwH8Fnv/2MRkLOs4BNcGZJsfK+ENNaqGN
gavyh3Q8sJujyoIOi8AInFN26VOP+AfHvLxSpcCb2upbM4g+1gyvnJPm7ihbDY8b
8O5EOcwc9ziATf3jLzpoEylVtI31+VNDctXFkGGrjtMm7oHCUhmE3hv3VAuAcyGW
tmsCVH+cWP2Yic8SwmjIVgoBx43TP/XoNxsBULj4RAeOu/h4ZHLtYoRfuD+OxMgE
i8qx82NQ6PlAdHJFOmW4IqbsnGru
=xnqg
-----END PGP SIGNATURE-----

--Sig_/R+e/CqPHcGl6RkRsKZ+h6xs--

