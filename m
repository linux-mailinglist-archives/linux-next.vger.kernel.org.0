Return-Path: <linux-next+bounces-9167-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 577FFC7EDCE
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 04:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F1DCE3410FD
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 03:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579321EF36C;
	Mon, 24 Nov 2025 03:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZLm5epYN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192FC36D50C;
	Mon, 24 Nov 2025 03:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763953315; cv=none; b=JD5wpoFUhN65Up2lpKN/iv3qmujeGup+jneSe2izog1JYqxiabAlZzYi/JNRuBd7k6dW5mwNAY1G+tH49wFDcwszTGNoxuUgbK+wKj7H5DLi23qbc25a6IA4spbeX4iJB2AIlgZbGW9b74mEqUhIE7MsN0sXQ6PTYKotV5TJVbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763953315; c=relaxed/simple;
	bh=AayBavAfpNAk3+f73wpmUoluOAZ3L/IvpiIJBOg8CNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KWVEIIzzrVUdvoXAJE1uTid4DP4R0vfK0aypvcrAtb1F7M7uvlNgI2rXPK76crLtg6BJT6+GeFTl+993QDci/iDHz5UcQVXiI4FLQtJG8j0MWI7m6PSjCdyD3m5MCgdwAaUghGozumceyYnLpQG+EShdc+lB/FCazdQVkHq2O0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZLm5epYN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763953307;
	bh=f0S7WIq2WK7wTwC9nNQ8vKBiiE8MChe/XwfNzRBngpA=;
	h=Date:From:To:Cc:Subject:From;
	b=ZLm5epYNESV0LLqGEDmdS4rcpYqeuETsST0RDw3O6bmoswdiQzqZAGLfadvsoIQ86
	 UO3O/fZWX1w43W8QQlLiGBx1FjOpb67cXw/IEGZ1FN0hpAbtvFNOXEgzJQ+j48goHL
	 H7X6At0vevuLeUCK7BMW2SGd1KHFNZzQys9QblrobiwNwTFmDX3ZCy73xXhQFhrXKh
	 4irm7ttvrAnWYF2UxYuSZDlCuCwrQLt64yfEEhav7k6TXiYDc/6M22LYAmSBzSOUXB
	 FaGmY54ooDlPmbia3o/0polB4lQ12UNFC/H/bbuxpD8j56PIahTje9RRKULlaEH0Fb
	 jRGqzM03WZ27A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dF9Zz3Cmgz4wCk;
	Mon, 24 Nov 2025 14:01:47 +1100 (AEDT)
Date: Mon, 24 Nov 2025 14:01:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Siva Reddy Kallam
 <siva.kallam@broadcom.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rdma tree
Message-ID: <20251124140146.784d6305@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EjNgm2HZFI5/iGI1ip0Xh0n";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EjNgm2HZFI5/iGI1ip0Xh0n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rdma tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/infiniband/hw/bng_re/bng_dev.c:19:13: error: 'version' defined but =
not used [-Werror=3Dunused-variable]
   19 | static char version[] =3D
      |             ^~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  e873663e5f05 ("RDMA/bng_re: Add Auxiliary interface")

I have used the rdma tree from next-20251121 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/EjNgm2HZFI5/iGI1ip0Xh0n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkjypoACgkQAVBC80lX
0GxcQAf+PlAPkYhR71l3cxIaWJmUeSIM4Rt+/ibMPbV8MfbHjLkYcM1OXtC6um1B
k/FYLb+nw+OJMwJ1k34c7lefwOOz3HmXbwsXSOcmmItpmgFYhYaoB5EJQW+O0gF4
4g3JlUzGr8egAaDuXeV7AkQLsQwVuRVQddWZHjn27GHqIejpI61ulMvuzvdz9m0X
Mb0qYB9nD/4mr8i+Nti+YFxmNZ0lWr4M+E7os2fMr125/fWyIM3aFoQ3te2nbcjQ
uuQ69xD9GSMiDjYzGM7XQlFJCLdLlEew2Ds6M+EW0Hda4ap1gj0GT/XcMs8tQKaJ
/lfguiqHLe3VVj7MoKCpJr6cT0VcPQ==
=d8Qo
-----END PGP SIGNATURE-----

--Sig_/EjNgm2HZFI5/iGI1ip0Xh0n--

