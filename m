Return-Path: <linux-next+bounces-6778-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5056AB7973
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 01:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E3651B615C0
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 23:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F201F1510;
	Wed, 14 May 2025 23:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dOa5SACz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B00B4C9F;
	Wed, 14 May 2025 23:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747265614; cv=none; b=mzmsi6hKf6Qx5pJFxCBoHkxI2LaokfDhxnOj51X6RWBjmoaQrQSx7ziT2rQkhpAH+ggfi55jjxVs8EWiLuJQsE0W1658Uy04zPB1rodMjJL42tquShsBDxrW+pjE8q5DJISLGjmuNTTzgLatX+3MdhtHiZo4V0FcUnP7RcNaGTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747265614; c=relaxed/simple;
	bh=1tvcw8O6qPhy4x/kVyY2+rbpVwaq1j0ptYpEM3zH2e8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=p1JuE6vlNWHn1OIJK55fax4LfD8es3mhpno8T/EhNNLQndo24cnoYTeFltNwiGP5ImwJgzlX36qf2cwlr97cTogYX0YpKIMlYX6x/ivop7joJSa8E1Ofv9cGjnOr+T8Cmo4rAGmdG0UA99/r9+ZQ18tKVsXJMoSFTathRt0sgn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dOa5SACz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747265606;
	bh=1z7j5acc80gp0B4nI85jZpyRvzCYqpqZu0WrzXaJCt8=;
	h=Date:From:To:Cc:Subject:From;
	b=dOa5SACz2Fh/fuE8Yb0p5QqkPJ2r+qpOocynBLoaVgW10nxfmjNYL7s3Z5zGQM0m9
	 Q0sq4s7QOQMT+uMM+773OU7tnY7OaIB1WfzyF4H2u8tHy6M+p7sF9dPuxdzNDy8N9i
	 OTq9sS+t0LERs6+vzoRGxslHXT2F0QCaF+fT8M2pUu9VMftxaLa1z3ULE7IeJmfV5J
	 SrB+f+jg+MueAqKOXgaOvobR8ToLAT6IDwTnTW17JiUmGO/yIMSBf+8aMcbJlN5mly
	 Sxc6BXV0b7MkjrJLPAhoscJtDS9VDAlinHueIiT92LpaZv1Ckcvdzwpa1+X9bDTD9/
	 qKaMuoVFk4DGg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZyV5f5dgKz4wxx;
	Thu, 15 May 2025 09:33:26 +1000 (AEST)
Date: Thu, 15 May 2025 09:33:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vinod Koul <vkoul@kernel.org>
Cc: Qiu-ji Chen <chenqiuji666@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the dmaengine-fixes tree
Message-ID: <20250515093325.4e29e8a6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/riIBSQ/vVjamgiuYCYU8mdN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/riIBSQ/vVjamgiuYCYU8mdN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the dmaengine-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/dma/mediatek/mtk-cqdma.c: In function 'mtk_cqdma_find_active_desc':
drivers/dma/mediatek/mtk-cqdma.c:423:23: error: unused variable 'flags' [-W=
error=3Dunused-variable]
  423 |         unsigned long flags;
      |                       ^~~~~

Caused by commit

  157ae5ffd76a ("dmaengine: mediatek: Fix a possible deadlock error in mtk_=
cqdma_tx_status()")

I have used the dmaengine-fixes tree from next-20250514 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/riIBSQ/vVjamgiuYCYU8mdN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmglKEUACgkQAVBC80lX
0GxjyQf+MomWvDEffN97vSCV4FiuCsfORjxLfHtlQOLVz7+sz148VdD7G9omjq/n
O457xuEtZ9UaqHClwiP7aPelEzV/TNEQT16URajQxWWb3FEMpMdFtWCoAOpi3zDU
6ZZFwB7dK92wF8ShQMYjMftYyMIMk05Tn193QBGqZqMLpr1LlromNS80f01Y6Imq
QeSDD96G4D5Ui0hLBjoOC3JZcevYqI9RRURZE+WGkYhAzmS/eI1Z/VuyboCRuCNr
7WUojTt8NZNcEoEGK55IAKpN+1lIx9bFYgZ/6d3wwAsmfVhRNwTm6qsIWeKilqzR
3AD+mmotGbB3cEdy7vgb/OAb5ygIjg==
=67rq
-----END PGP SIGNATURE-----

--Sig_/riIBSQ/vVjamgiuYCYU8mdN--

