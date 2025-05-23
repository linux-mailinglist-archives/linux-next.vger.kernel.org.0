Return-Path: <linux-next+bounces-6911-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B65AC1D1A
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 08:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F262A24BE5
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 06:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEAB019F12D;
	Fri, 23 May 2025 06:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YSU+IfA0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B398634F;
	Fri, 23 May 2025 06:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747982116; cv=none; b=PQh5Rumvmc5UrkiGN2P/vE80e1D2CS1go7qD+wXLrsUkQiRa0YnpoyzkOdGmGqI8r8PPGH1Ak9/S6C5twwqgi2FWBB2uJTJ5nPH1aHsJhN+9d5RC6t7e7ajKL0osC1ZzhX/Kcebn6R9Cs5VHm3R2g2lMPGeiJmQ14FLEDIj+/A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747982116; c=relaxed/simple;
	bh=ZJ7JmYi7v/9GW6YlI13qU6U2LDd6O+i6xiPd4qimaJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nLIrsdB0J/PGH66Kc83G0AYerl94zemaCiZjEuamWLHcwE9TehgcLeZPQYWNM0Fk+tFOv2pMDCSCsPkbkwm2Ygc2wbL5OEnWFcFh0ixDFGEikgLBl4o2r6Pr1h9iapWUTvbOH5cPoK4yAik6z7rk5Ry2tpDJz9GUPosBYEumKkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YSU+IfA0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747982110;
	bh=jL9lz3ytBDcvyIRB8gXr8jQsMb0pdoHCK033w9X7VUA=;
	h=Date:From:To:Cc:Subject:From;
	b=YSU+IfA0KjMkSLtxu3DQFeMIcFJKnPl9/jjQ//Kz+yA0BXtq1JOH7XL6S7Qa0/eEB
	 2VmkI+4RZSLF84srrdv2y1PeLjUekx97xLtlI8TLXKpTFsnEsW7KHSa9Ph5xsklYFc
	 9k7SudQ5n8GTtZzONQ9CSdgTEF2uCyAsTPZfWGO8wEBxGUog3NCzyhRlOOY0IYK6LW
	 FjHiTfGX/9tn805oH8kJuWG1r7y9e2aB5S7ydxU4MTvw33INWD1XS8XDWRkRZCPG1y
	 6Lfn7QkGn8E4xRnuCS7EJPglb+s25Kltyd9yp5bmOlpWgexs5MvLVTsBB8PjmIUcpc
	 K6hNWCrG110PQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b3b4Z0cDcz4wxh;
	Fri, 23 May 2025 16:35:10 +1000 (AEST)
Date: Fri, 23 May 2025 16:35:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Greg KH
 <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the nvmem tree
Message-ID: <20250523163509.683d19a2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.XzQSY++hhf2Zn1W0x2M5GR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.XzQSY++hhf2Zn1W0x2M5GR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the char-misc tree as different commits
(but the same patches):

  8d2900cc1411 ("nvmem: Add apple-spmi-nvmem driver")
  342ad99689be ("dt-bindings: spmi: Add Apple SPMI NVMEM")
  1656ca6bf14d ("nvmem: Remove unused nvmem cell table support")
  c708bbd57d15 ("nvmem: zynqmp_nvmem: unbreak driver after cleanup")
  f1a714e1cd0d ("nvmem: rmem: select CONFIG_CRC32")

These are commits

  fe91c24a551c ("nvmem: Add apple-spmi-nvmem driver")
  483324549267 ("dt-bindings: spmi: Add Apple SPMI NVMEM")
  01465f296a68 ("nvmem: Remove unused nvmem cell table support")
  fe8abdd175d7 ("nvmem: zynqmp_nvmem: unbreak driver after cleanup")
  7a93add1d31f ("nvmem: rmem: select CONFIG_CRC32")

in the char-misc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/.XzQSY++hhf2Zn1W0x2M5GR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgwFx0ACgkQAVBC80lX
0Gzj9ggAkMvWu59aNZdINxbwJc7gjPfPnw3jcu9jwfaOkXaZGdHgj2VYkfyoLY3v
WZIcRRue0uvwB2Z6QH6aN+h0Pv2/Kh6J1sBs7YO8zbNd30vA1l6/mG46rT7eYqLf
9hHm6TOoQuIMy3rSiwJTlXtQfS4Rh3oG3LodAzMQ6Z1EwJghnLJs+ZtZTskBooaB
LVH4MHRxrZhFSGZ/BcKJELH4RwC3Ub11ViW+/v5Z+b8V4Y28imUvVO+o6p4Fs1YG
SOqsmH9lmtbfRUVcw682NwwZ8nkJa8TS+bsFoJeKHijXW1MIRfOflQ8yKw8bUCis
RxfE/2mnxkXPoF2HtQMx5ZOwCzqbCQ==
=KqoU
-----END PGP SIGNATURE-----

--Sig_/.XzQSY++hhf2Zn1W0x2M5GR--

