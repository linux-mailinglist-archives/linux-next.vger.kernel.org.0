Return-Path: <linux-next+bounces-3240-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEC4948887
	for <lists+linux-next@lfdr.de>; Tue,  6 Aug 2024 06:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3353B22474
	for <lists+linux-next@lfdr.de>; Tue,  6 Aug 2024 04:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61E51BB687;
	Tue,  6 Aug 2024 04:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mWX9BA+4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452B91547DC;
	Tue,  6 Aug 2024 04:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722920102; cv=none; b=LSKdjRmRom7Kw4e/KuVloOlRvJydcs983ugtHE2n4d1FcZ0qNdmjaLhaQKXKbLa3u3M/jC/NYADT1ur/2wqa+8heqYA4jggg8Oz3jyKgi85WclBAR4YgZU3CzwH+1zP9/95ZztgHNSvcVDjiXat6E+R1bwXTAx2QNfb983dRALo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722920102; c=relaxed/simple;
	bh=yVWWv/w5+YM1K0nYc7SQqUqiq5ck0KnZ2go4D/koSdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LXnKsbe4RPoL+geEp4saoNzONPRZCi0S567mL2wg2ULFS4tvYpxnMtbD2scCY/2k2HSXmgsFMjmtA0HJOD4kUdu2wkrmRsIhcD0rIz8A4bFY77TUisxw+lym9zao0sScjfyE1lphGg6BDXqdtrs748x9s1b12SLgAZJPOz4FVsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mWX9BA+4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722920098;
	bh=IZJxQOUfY9wJZY7tly4/Ob2nyBoTcJt5NpVOgvBjDlU=;
	h=Date:From:To:Cc:Subject:From;
	b=mWX9BA+4q62qhyqGzerRFNUhmRGzLT1TvD2BBpGzk8ivDOW+IfeQ2oSqAqdhAR+X6
	 Nj8DrsGhXm+xSdMj8rq9BBJ+kNBZCd8JL1OuTNZUAZ+NP2QX2TIPJY2Hu/WzsRXX0t
	 k7wUiDAdw/tFp70IFVno6Ro3vP7b1SgBiZThdzNfQ6knjuNatEgtROyTHlKH3XTugJ
	 4Zjb491Au37UyfkpiinxMN4W44Din8DrPb0bZWuup4nT2n4NMgQFUtmT9zawY2d5lM
	 bCdT2xCQ7UXGAnAWhLkrhQI8rGpTZBU3POUI1ZqhPe6ELCWu7T54E6K639nBGg+Q5A
	 tLel+F6q4+g4Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WdLZp2jz5z4wc3;
	Tue,  6 Aug 2024 14:54:58 +1000 (AEST)
Date: Tue, 6 Aug 2024 14:54:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kspp tree
Message-ID: <20240806145457.0d412006@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cMXLfPcYYvmjMRkdR1quO/k";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cMXLfPcYYvmjMRkdR1quO/k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp tree, today's linux-next build (arm64 defconfig)
failed like this:

aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
aarch64-linux-gnu-ld: drivers/char/mem.o: in function `page_is_allowed':
/home/sfr/next/next/drivers/char/mem.c:62:(.text+0x670): undefined referenc=
e to `devmem_is_allowed'
aarch64-linux-gnu-ld: /home/sfr/next/next/drivers/char/mem.c:62:(.text+0x81=
8): undefined reference to `devmem_is_allowed'
aarch64-linux-gnu-ld: drivers/char/mem.o: in function `range_is_allowed':
/home/sfr/next/next/drivers/char/mem.c:71:(.text+0xb34): undefined referenc=
e to `devmem_is_allowed'

Caused by commit

  b2d1f5c72c63 ("lib: Move KUnit tests into tests/ subdirectory")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/cMXLfPcYYvmjMRkdR1quO/k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaxrKEACgkQAVBC80lX
0Gy/UwgAiBq1i59mPKpzlivZWIxUIiSHbN5sG5kdRk3/paBSSoHuE3KhqA0J57Xq
SXGpRZznxIuvrsldyfz74tLJ3hJZJ0uIr7fzNCRbNi9YXI9fAdphwtBrbWBcydQA
+urE0Jr0MiJJS8Nj/un9j4sZ4SqkdjrwSI+8X6DGfRS+06XFLNyjyKExEX9zsT2L
CnYLxqX/ljjGY15IZi2BMP74U8tWF8yA+fcfa/iVz/nEsK7sKlA0EI380euh6u3K
Z+WWoWto5sae3wkX/rboCCsXjg+iwwvDQq2Mt6niS8M8n2WVh2EokLgVoPUwkTNE
OQO/Uh0uYcwGTuSAWOADBIU+sLCCuQ==
=tcs8
-----END PGP SIGNATURE-----

--Sig_/cMXLfPcYYvmjMRkdR1quO/k--

