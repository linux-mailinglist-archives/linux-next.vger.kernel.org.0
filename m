Return-Path: <linux-next+bounces-4201-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD57997C1F
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 07:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BA83B23E27
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 05:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8EF19F475;
	Thu, 10 Oct 2024 05:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PuSUaA+q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B371B155316;
	Thu, 10 Oct 2024 05:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728536702; cv=none; b=Y/xa/I63Lt6opqIEuTD7Sy/hWKrMIDX/9E1jtJ4X/0r1GKxDP0rDpsYSDdEaZRPGxtapiATzHrQV+U4858bXiv8yeyCYlUxLRxk34l+NkLxfCkUQ5m2tvQaUTnwASVQ6UV9zIbG7LJwVEvxrNefQZzZUQg2V5VSSoiV9aXHzTpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728536702; c=relaxed/simple;
	bh=p8zxHP7vOaQh+twvOsINvpT/1wJ8EjMfOYRe07eu8Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=q/V8B6w/WLQOSF5EvpIS2mKkCc6hxWk5mH68jYlXL4xMDS5kF+3tfCeLsjEyzKvui8CJ0rRq5Jr+vllczJSYuJWGpmCZJsVoFhOWy2RB3TzkKfoXXlt4ZSdhdJMwf/ELVdyB3sSzYbD1omxyq9ZTxHsndXz2yen8eW/OQVgIy/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PuSUaA+q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728536695;
	bh=fijtcdxdrZ665Q/BtLmU4Byqk9VH161emL4XWOqA/Aw=;
	h=Date:From:To:Cc:Subject:From;
	b=PuSUaA+qJbLS9j58FxGirA076c7K3l1IpcFP8IQocxEOaxI1jf07qhomDDLhgBJ/g
	 cHt6W+4VJCQUI54O3N2WRlYKVrVzWOmAnAv1J2bckjyaVLxtNwEX1EqP6rwUlJgAQU
	 UuPYg7a8q78XMWJbLt1t2vQ0QVwQUx/0H8wzZMgQRQpX3hJg8FH2AGfSUTF2kEWZ8s
	 GNytSTxzwWIehGsSLUrquo6Z9b0/zBDM3KJDPNhYV7ijJj73Ggme/ADm/jlj8ZD9sd
	 qcjmrjQdMLffTk5Zc29/j8IYUbT2FSWuCg1YEMgzLnmOmbz2To2BaKsOxahS0Ll8Xt
	 ow9+d4NuvFgVQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPHkG6nPMz4wnw;
	Thu, 10 Oct 2024 16:04:54 +1100 (AEDT)
Date: Thu, 10 Oct 2024 16:04:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20241010160454.60466ebe@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W_eVme5ixBJu0oC.Htdu_TM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/W_eVme5ixBJu0oC.Htdu_TM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

drivers/gpu/drm/drm_mipi_dsi.c:1533: warning: Excess function parameter 'ds=
i' description in 'mipi_dsi_compression_mode_multi'
drivers/gpu/drm/drm_mipi_dsi.c:1533: warning: Function parameter or struct =
member 'ctx' not described in 'mipi_dsi_compression_mode_multi'
drivers/gpu/drm/drm_mipi_dsi.c:1533: warning: Excess function parameter 'ds=
i' description in 'mipi_dsi_compression_mode_multi'

Introduced by commit

  975bdea8c470 ("drm/mipi-dsi: add mipi_dsi_compression_mode_multi")

--=20
Cheers,
Stephen Rothwell

--Sig_/W_eVme5ixBJu0oC.Htdu_TM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcHYHYACgkQAVBC80lX
0GzXggf8DCdxh8u8+Reh4BVD40uzGiZD6jjsOHHJRDvtdyUn4UHrS+4hEaTRTXF5
ecBEjkOl4gwsprWVQwl6GTN2MCpnC1I/scg/+Nn3qQ0juEXoQ/O7084AyRORrAy/
iUBGWyqDDkJWs47RGbc5OrorRkC5P6+pDIQJwf9B7UDAaMyLbdgl6JtehE0pIajz
TdzPfNjSgYj1V5a1KdbRP7CwPt1DTEYBFqc6tJ2W9rgoLzsiuj6nEi+2mkL3TLrx
ROwuht0IB0CZIpTOh8W4myJ49ivDm8UlOGcyk8lcmMh+/zN6OrigY9pTQ6hTZFoS
oXU9YrSfEqz9UmD4UJ8W/uTLw213Kg==
=JrHx
-----END PGP SIGNATURE-----

--Sig_/W_eVme5ixBJu0oC.Htdu_TM--

