Return-Path: <linux-next+bounces-4375-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D93D79AB9C4
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 00:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35583B233F3
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 22:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0C71CDFC2;
	Tue, 22 Oct 2024 22:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YsaVXTkG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2127D14A08E;
	Tue, 22 Oct 2024 22:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729637966; cv=none; b=ZtU6KDqIS8Z90ypNkfIIx12ub3AI9/Sa7p0wB2IBPzu4JeUTPKvtbsdhlN8/8CIH01M+1bjRTasbzLcClgvpvrEkyDUzX7rBOO02+/ToGGgh5AcpM1+5HYBihAWEIBt7iOn+BvN5BELqD+OiZynHxGGexpC1d0WcZt6/lmZ39Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729637966; c=relaxed/simple;
	bh=lJYsOq2AkoxPPkO8K6d77gZJysa8w2fWsasRtEt4eyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jAQVirPwkExL/3MzcLyvHsgHH4xENTF3/aPbbJBKsTTcXl7VlzvvhNAmfrniaYjhQwTiKmpneXCpj1Kay/0OQIBKVP3Ly41bKiRqmBPLmgdmZK8/kGYRzECK9j/c56Qg45gAH55WO2br6VkLxB1gR0+cjYry0FaFcC7Q+EbT5wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YsaVXTkG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729637953;
	bh=cxBBxFS+aLjWtIsw8dOqObxFFW/WvV/mp/WOqiM/Lxo=;
	h=Date:From:To:Cc:Subject:From;
	b=YsaVXTkGhWiLlPXRZk3JcplqhalcabJSEkB8S0wJ8EH9Y7Vs324EPh5gu45wV0dbq
	 zm05WOvS+WqkMSu3gn+rt0Kq/I69EsWm/TdOfjRKyRhL4DtUB0hgG4JWyA9OdQ/1TA
	 0hB6nYEotH8OkkWr9czfePD3tvXClLi/LsoSUOzvWIpGV+nzJD9GMpRm7iQWZvESzH
	 7i59ymxU3cjhyzYdb6uwOBceDvw3fvwhx+f/nO4+SfW2xPYVxV6LzKExA8tGSSOcFn
	 HHOVe/3U4ykxuePio35WaJM9E1feG/kncAJJ8Sx+EFqxOzQFKp2fGZjLUNspNoFUbF
	 zi7kzD6Qio8Qg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XY70K5C4Pz4wb1;
	Wed, 23 Oct 2024 09:59:13 +1100 (AEDT)
Date: Wed, 23 Oct 2024 09:59:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Bart Van Assche <bvanassche@acm.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20241023095914.61b9eafa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5X90uYoOB/0jP82UnZqFMB_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5X90uYoOB/0jP82UnZqFMB_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  6fbd7e0472b7 ("blk-mq: Make blk_mq_quiesce_tagset() hold the tag list mut=
ex less long")

Fixes tag

  Fixes: commit 414dd48e882c ("blk-mq: add tagset quiesce interface")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/5X90uYoOB/0jP82UnZqFMB_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcYLkIACgkQAVBC80lX
0GxIRAf/ZiPm3Hbk232qKBAJH67k/faNW41qjKur0QvbgPhPAT81KU05razQb2cw
6Whh6e1gBf7H+oq3Fth9+szr9GbZQdgNJw550lcpScG/OLTu4XS9EiiuT5OthKMl
vgZ8flB+xoSRY0Tnc2jtHuOnh878cuYcDWRdKPDWSWp7NEsGuN/lWmIOxwcMkVgi
LEBlDhoAKyNBIQIMJKj7GUOg96x2Bilq0E78qa+QU4sigY8r1V83t5wSVhgQyaZ7
fX9bq66exaRxE6Aj7IZOzgck75VWixek78tFmS6FVcqJoJWF7jync/sOwz09Rs2N
1ln1nGzuzhABy87d2Tmkork6tDf8Fw==
=r6EF
-----END PGP SIGNATURE-----

--Sig_/5X90uYoOB/0jP82UnZqFMB_--

