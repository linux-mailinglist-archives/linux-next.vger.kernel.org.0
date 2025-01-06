Return-Path: <linux-next+bounces-5050-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB81A01F4F
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 07:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE3CC1884B75
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 06:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1861D5AD9;
	Mon,  6 Jan 2025 06:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AHmtcjYy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4276F1D5174;
	Mon,  6 Jan 2025 06:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736145761; cv=none; b=Vp7TjIgzs4PR2cwcX32BfXzpQpini9wdSl5OQQAtY/aSM2HkMkAzsRFGpi151hDmSGJKpvuwzLJpqq2m85xgVb+9PmgUCOiyjfRUhNJZbN3IDmoZX0RiIwmU4lgIsSeBxWTp6k3eYionykrpWWLIGwObEnq0C7/f2sMsv7IsKx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736145761; c=relaxed/simple;
	bh=ntdbSdd0/WWbUj6y1zot1djy51e4UbXdYIQYacaSnNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=akR2Bw0xHneMCCrBojqY+HzcxC0d/bXLOO9zfpWIEdkFDfoH5K1w9rywjvuAjK5QoIjNNDR23x73Q8QNByjkZjoJ3tx4TDXnuokm66poekwFDQ9cMxVE1zNz/tUpInMopeFzqz60zEqnNqkjLtx8Dfc72yda9Jc7inZO/sBV3lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AHmtcjYy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736145751;
	bh=t54s+V/BcJbbT3ZB00g7IJRlMOu7Kk91eGhQESplDdU=;
	h=Date:From:To:Cc:Subject:From;
	b=AHmtcjYyDr87AokSqZM8NUfnmrqgiZD/8HI/ygfeDtg5vGioTGMogCzv+TCANhgqw
	 F7miqT/YvfOVTsPAY45964wMZFtbrJlgLiWEQX2vPmT2NGW1ADgpFAWYZzF6T0eJCQ
	 IRsWcDNx/fIpgd6N5FuoLaJAtIGwvnY9Z8KZ23XNcuLkuQek/cwBPnXycpGEj4SoZ2
	 6zAcVGqrbKua+CEcEfoLD+j4fR/yQxV56B4k6MGUsNXS2dgBu/Vp4kP5x8uYgTGyzM
	 /3+sLQXesXf5MkSUejSi4U6pFss1LEUE5+FPXEPKMz6zjpNji7uNoFI1BaCpwR0SSq
	 9qgcKomeV1mWA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRPkG6Ynvz4wvd;
	Mon,  6 Jan 2025 17:42:30 +1100 (AEDT)
Date: Mon, 6 Jan 2025 17:42:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the mm tree
Message-ID: <20250106174236.5a74e94e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e_bBakcCP2y/iyASqPfPvh_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/e_bBakcCP2y/iyASqPfPvh_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/core-api/kernel-api:108: lib/sort.c:206: ERROR: Unexpected in=
dentation.
Documentation/core-api/kernel-api:108: lib/sort.c:207: WARNING: Block quote=
 ends without a blank line; unexpected unindent.
Documentation/core-api/kernel-api:111: lib/list_sort.c:114: ERROR: Unexpect=
ed indentation.
Documentation/core-api/kernel-api:111: lib/list_sort.c:115: WARNING: Block =
quote ends without a blank line; unexpected unindent.

Introduced by commits

  504556ace988 ("lib/sort: clarify comparison function requirements in sort=
_r()")
  d61e15e52019 ("lib/list_sort: clarify comparison function requirements in=
 list_sort()")

from the mm-nonmm-unstable branch.
--=20
Cheers,
Stephen Rothwell

--Sig_/e_bBakcCP2y/iyASqPfPvh_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7e1wACgkQAVBC80lX
0Gz0ZQf/WmW26x88YbH5oki1wqMsmEH5LhUBh+9Ynfv3IooAwXv8B2xsDxQWzoEk
qdkvW94TGsFxal4ARFhfYLCS97zNtzAdtZVaGTNvKGfbCNe0FmrX4y21g2xVufI0
EfDaOucLYR1v66WHgE2hq8juJ7ZlxSdtKwqs0kGrWcVadPIayZ2WA+krjozeXu6d
SOGiAKFy4FkmZsq4ST49aAIL1P8gjTfw5H5ZEy/o1FixJWi1exDmeXYMWNyNDnLY
ctqQLtIDZBZxb9FgR/yoQzVWIoBfu+mPrd6092MuYh6DodIiXfDEC6TlBNEf64I+
0Atcc2fSV9/yTTOPTSclqtDejZYWGg==
=gU5F
-----END PGP SIGNATURE-----

--Sig_/e_bBakcCP2y/iyASqPfPvh_--

