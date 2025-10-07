Return-Path: <linux-next+bounces-8572-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C774BC14CA
	for <lists+linux-next@lfdr.de>; Tue, 07 Oct 2025 14:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4BAF74E625B
	for <lists+linux-next@lfdr.de>; Tue,  7 Oct 2025 12:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D17C2D73B6;
	Tue,  7 Oct 2025 12:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t6PncqxY"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E841E0DE8;
	Tue,  7 Oct 2025 12:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759838647; cv=none; b=GFNMs9/e6FsUWJF+ltNCA2IHKTUPa+ockx1xVYr25RJV6ICJTYOI7wDCWVi7UI0g6XIDgNCJ2OjnclwmvoUwFFWLo3gcxYLmcBX6Pne5FKjKeqiElkaeOM0Kpz6alKMy56MrODvZ7cKko9KfrxIxQVWSVDzFiTEZ3HFLOchFmDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759838647; c=relaxed/simple;
	bh=jTvdgiH3xvYCF18FbvU7N9h659rjZ7cuGOlxPiRbHRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aFL+ocM73z7Fz526QQY/onoaK9GYpUbXV6jX2z0oCrE9FbuvVgEzyPe84VM8eWjHdd71+eUOY7F9P0nbO/6U8c2aS60zrrtt9ZZtGH9WYsTdPTzqj0vB7/JLqWQD8AewlabTN580iwQOBdzndNLYd1CojSp+qzZ/g//IKMb4qyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t6PncqxY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D262BC4CEF9;
	Tue,  7 Oct 2025 12:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759838646;
	bh=jTvdgiH3xvYCF18FbvU7N9h659rjZ7cuGOlxPiRbHRE=;
	h=Date:From:To:Cc:Subject:From;
	b=t6PncqxYdRRgNpz+aePj5keat+eeY3g3DDOYQBdRyhqUvV8wkscnClVoAM5JLVb1/
	 CuitQQXCPzbkO8EC/MkDYab74RykW55fGYF23WuwGJHpA3EeYoChHdr4PVqQhdSkJZ
	 Oe+DHgjlQk8+lMotOrdNG5Rry97K+GQRFlm5GzSzb58jHMmkISb0AI2ycrcRdKKbin
	 0lmExu/sAFWXN8c9SHyae91MfFpWqJUg8W4ug+kKInEPtXtjVUMOM2q5cmAn2nIVRQ
	 xK9h6Tlbt5qZ3I+sTjzk0qPYeEES6684Y97fEGPjfC1lq+V5ZZVFOR15IbANbOR/7x
	 U1pqdOdjpSLXg==
Date: Tue, 7 Oct 2025 13:04:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mailbox tree
Message-ID: <aOUBsxlznqQG5ooC@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="74eNrnwD/SN0UCSJ"
Content-Disposition: inline


--74eNrnwD/SN0UCSJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the mailbox tree, today's linux-next build (arm64
defconfig) failed like this:

/tmp/next/build/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c: In function 'mdp_probe':
/tmp/next/build/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c:297:41: error: implicit declaration of function 'cmdq_get_shift_pa' [-Wimplicit-function-declaration]
  297 |                 mdp->cmdq_shift_pa[i] = cmdq_get_shift_pa(mdp->cmdq_clt[i]->chan);
      |                                         ^~~~~~~~~~~~~~~~~
make[8]: *** [/tmp/next/build/scripts/Makefile.build:287: drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.o] Error 1
make[7]: *** [/tmp/next/build/scripts/Makefile.build:556: drivers/media/platform/mediatek/mdp3] Error 2
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [/tmp/next/build/scripts/Makefile.build:556: drivers/media/platform/mediatek] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [/tmp/next/build/scripts/Makefile.build:556: drivers/media/platform] Error 2
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [/tmp/next/build/scripts/Makefile.build:556: drivers/media] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [/tmp/next/build/scripts/Makefile.build:556: drivers] Error 2
make[2]: *** [/tmp/next/build/Makefile:2011: .] Error 2
make[1]: *** [/tmp/next/build/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Command exited with non-zero status 2
18.77user 674.76system 0:08.77elapsed 7908%CPU (0avgtext+0avgdata 173604maxresident)k
0inputs+0outputs (6major+965196minor)pagefaults 0swaps

Caused by commit

  58e172b23fe2f ("mailbox: mtk-cmdq: Remove unused cmdq_get_shift_pa()")

I have used the version from 20251006 instead.

--74eNrnwD/SN0UCSJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjlAbIACgkQJNaLcl1U
h9CC2wf+K7Q92tPqxwj7ZclMxcN4tx9ZQsUcSduZ5eVnfoSXiwieC2/UdOMaa0SW
anTKPiWmg/XsIo/BvkgXtKaTFpA8ok5U/4f//EvzLMhqN1cN3brgM11DUmbI/Kzv
p3PJzEM02C6pWjfCPrV5GyAdQ4MDAEVhcwxvuGeJMDW6rvyrLaysfomOxXKW3JF3
sftB814Q1X2OdDUol5w5QMmhmMyKy5s2JiwbBDvMWJ4lgfWkv1wXNfAz5t7U5Jbx
Ne7p2oJ+8TmgctFtxq8mxDqAl2pCelDwXawmvr7YlTwKUzmbZpc3GyDcQe7ZTaIV
RC/9FtGygxYcci/t3sBNhbyEu8oZfg==
=FGNC
-----END PGP SIGNATURE-----

--74eNrnwD/SN0UCSJ--

