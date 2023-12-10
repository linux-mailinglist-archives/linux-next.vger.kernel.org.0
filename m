Return-Path: <linux-next+bounces-301-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 820BC80BD8C
	for <lists+linux-next@lfdr.de>; Sun, 10 Dec 2023 23:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12871B207A6
	for <lists+linux-next@lfdr.de>; Sun, 10 Dec 2023 22:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED9E1CF8F;
	Sun, 10 Dec 2023 22:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dKqDVO7k"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62650D5;
	Sun, 10 Dec 2023 14:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702246339;
	bh=uD/eHC6kktSvte88W4rJwJFskAS4QDzL/gW1VwIDpwk=;
	h=Date:From:To:Cc:Subject:From;
	b=dKqDVO7k/auykEeBPPV1Z47Ijoul2HiUHiCRO7XCbR2Ot5wb5hDZd5J++Sk0+cHWw
	 8+k6oxafgiye6Xj6wAivP84f96NthaIXloK7vv+ltNZAFFSP0I4/rjet51s/v5TlUB
	 C+z92YV1PmR8z5BDHPeoh/5wPVXBy6Xatf76X72EA17yb+wL+cZP/6bOUC4RjaUJjg
	 9dOAEAQgva0jcnWGif+njqWonzhx6Po71Y+I660o8F+1fn+PIg5Wp1+yJS1oROwUTE
	 V/ohotUgKHtXIx58aQAnP/t/Xyf3Wzdt7BQsx3lCAjVjg116mB0ety3LouN5pUEtNR
	 HReK5e2D55MRw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SpJyT3q9lz4wd4;
	Mon, 11 Dec 2023 09:12:17 +1100 (AEDT)
Date: Mon, 11 Dec 2023 09:12:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the net tree
Message-ID: <20231211091216.046531d3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/con3bkfQzbZz7yjfEaQOv2p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/con3bkfQzbZz7yjfEaQOv2p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  69db702c8387 ("io_uring/af_unix: disable sending io_uring over sockets")

This is commit

  705318a99a13 ("io_uring/af_unix: disable sending io_uring over sockets")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/con3bkfQzbZz7yjfEaQOv2p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV2N8AACgkQAVBC80lX
0GyzIAf+JPj+8C1QwgJQhxZCDGrmW2CV/KaEgueqJS6xbYM/IzkQJmCnBms0565G
lfq2pcWBxCPiJgVvaP87Ke2Eyy39rSIpzafVoS+HvMmhLs03rd3HwIUT0GFOKxYM
xo0EU3LmVqMXdyvWAIJl3F5M+1VwvYd59Wbp6UAnAZPWjcexGBR/vBU2+2uUQM6s
RrziEaHpWp+/Y2nTCiOq44USVh7lu4YoGevDTB4fkFGV1+1e1fEwinCNtskmo+KN
6Ml+vcketl+ESB6eUnFBvyHL0Oz3qiywaeYhoYZ++FNVM9TadUvXVF/PwzVpeIbK
mXyJLNuYsNlY+F2CKPPOHo2FuOT7rQ==
=lfOc
-----END PGP SIGNATURE-----

--Sig_/con3bkfQzbZz7yjfEaQOv2p--

