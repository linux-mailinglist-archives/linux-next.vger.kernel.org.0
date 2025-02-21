Return-Path: <linux-next+bounces-5521-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8251FA3EB77
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 04:42:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5A1B189B221
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 03:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E7E1F427D;
	Fri, 21 Feb 2025 03:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QhDV9/uI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EF21519A2;
	Fri, 21 Feb 2025 03:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740109358; cv=none; b=QXPMhPDB6JWNnYPENjcrIuMSMwpTM6LyrLR+LZqF9w4QCU8L4YmelV5zX1aqH6+M0ugP0qHF+4Wt5KbRnl/imgLYeOfy1QoCoCVIWkLbtwnuvlL7xRKMOOpAeonqzBKFo19bIlMTgEMd+LHGtOU24s/AQc4HrjfaYQxmA+lExgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740109358; c=relaxed/simple;
	bh=iY7X1blUneRUWAI5qU43CN9wZmsEj5r8bam8zZe1Qc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WicS6KZXrNLwBB/akSAWQ9POosF/dLrkenwAT9p155E/3yt8l6GGbMcHmTlKvAMzA+75HGQAkuBjpsX3LRqotQbHESbW+8kgZwBNakjquCDytXzm14/zP7Syod34GvdsSPS4dBD6ajqUEqavz9JeWlW2FHUbaxbQOO1g1cgcDEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QhDV9/uI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740109352;
	bh=DV8XXZwA6qtR5d/0lbdDNGOn+Web7DC/5fBJNNmHLeQ=;
	h=Date:From:To:Cc:Subject:From;
	b=QhDV9/uI5vl+3MnWXXoE3bFMBQSB9WfxedU/Tqu/OfXvGz4AduuGTbphyEE57LFi1
	 dMFDkiAJNDE9+6Tt5hecYlFrBLYWNqhD4HEbBHqF6xrRY508Pd69GoxL3/p6COtAAw
	 7lQSfjelpslxx6LvEWxxJqNQiOBd+OIuxGa3S3T4uVPa9WgCjwoLq927CP6QNd4AcT
	 SRUFal7OxDNmCuqa/QG8lQUhz+JIkEg1hSTUgLnNFvKJTJ35SSB71ylMzr5ro0ouDv
	 rv0lSrXi4YBR2BVyTCsOkanrVhZ/tInGALwg7nFmASf9G6S0C3TjMTquL3u/aNFjN5
	 fatdobz62Yidg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YzbYN4htzz4wy6;
	Fri, 21 Feb 2025 14:42:32 +1100 (AEDT)
Date: Fri, 21 Feb 2025 14:42:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>
Cc: Eddie James <eajames@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the leds-lj tree
Message-ID: <20250221144231.6cf64c98@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JILpILCZA0qtZg0R7BMnyhQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JILpILCZA0qtZg0R7BMnyhQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the leds-lj tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/leds/leds-pca955x.c: In function 'pca955x_probe':
drivers/leds/leds-pca955x.c:640:15: error: implicit declaration of function=
 'pca955x_num_led_regs'; did you mean 'pca955x_num_input_regs'? [-Wimplicit=
-function-declaration]
  640 |         nls =3D pca955x_num_led_regs(chip->bits);
      |               ^~~~~~~~~~~~~~~~~~~~
      |               pca955x_num_input_regs

Caused by commit

  14ef0738a31d ("leds: pca955x: Optimize probe LED selection")

I have used the led-lj tree from next-20250220 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/JILpILCZA0qtZg0R7BMnyhQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme39icACgkQAVBC80lX
0Gw97gf/QgE1H3qQKkIQhgu/ooUrEBN2LR8NslbRbeCWckEeaaITcyjTwvnX9yWk
h2yGbLBnqOrS3nVBN6Ly/sl9WI2GOYRyj8xo0IsB62QxzsXUnigWt7WtHLU2Gw+6
qsPeNj2JlJCGdjSSLw41wSFzxddw6kVDXe2+4N5KS8Ex0x39OefmBupteW7dxj6r
LfrHxWKS0FKTIimtvePKjNfUUvNiBZy2jYYfPcDR0sQFFMr07+ksXgEM1LHp7Xqf
bDFqL71fN6wiE5XSrLTmVFWWMkSPnYI6zF+mdyuI628DcN2P2bON7Hqj6EMSmjdB
1NHQsvf8whihwyF8rp5f2C3jTr3j4A==
=erJL
-----END PGP SIGNATURE-----

--Sig_/JILpILCZA0qtZg0R7BMnyhQ--

