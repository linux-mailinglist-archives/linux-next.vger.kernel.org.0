Return-Path: <linux-next+bounces-3433-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E20E495FC79
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 00:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C4D72853AC
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 22:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3EE19CD07;
	Mon, 26 Aug 2024 22:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ucT+P5OJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522B8B677;
	Mon, 26 Aug 2024 22:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724710307; cv=none; b=OryzJCGmVK4VgUFJpttx7xW3lMs+Hm06XH4E3h5FfChTRlyU+l1K+AD6FlkJwgJeJS1zQ4s3Y6rmzlZ1L1CrVa8jpNvKEePIjYSlOe/dBLPWeiX6kwkxMiDiTOz6sD+PW2VrpXcaVhpKanl9L7lY/rPO/04j6BTIH12LlfO5oHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724710307; c=relaxed/simple;
	bh=l0ZM5JINIC2w8W4/PMA3DqGVsALHH3OzU5NAbMEwCGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U6p1wNCEtcIHip0Zty7O2DA/7wnfZU/4smCPTtvAIIvp0jWJuGairenGHDZubBZ2yVucNmVchsovfE3FkHsEE3TcmFyOHRGYr5hF6NDomcIhE9+3Oc5QYFoaEpTJADOUFiXtBqqxm1SWf43J9IKmrwh7FkfGhC+sM2ZbkYG/L0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ucT+P5OJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724710302;
	bh=y75W7w7IEwHB7RmuRahFxMt/aMjIijgoEroY2/sa5G8=;
	h=Date:From:To:Cc:Subject:From;
	b=ucT+P5OJ5OeFoqh2UeCfFmoqO7NDaMvx9lCHmqWXQyouP5bi2FnG1PfmknLIxR7SI
	 wnGbjA2iHEBifH1fcpGuw5/16x/8CFmZUgVfNpoYzlwZ5yqJjDhUkGb0Vh9w02jBNM
	 AGXtkv7UocfUMouMssnEhlApf/D2sVNXG9stJ33WqxnlnaPJAYS7isRxspCqyHfJ3a
	 kWK1emS4yOsAjGQhoilzyJu79I0nsMaf5LE1HDvE3sgREvYG7tNOoa5GvjQpEObZLg
	 ihD4CFKjK2cgStGfCUuLyljRdoTI/ko/0WJu+X85eof3SEMszQfChepD71kOysIqH+
	 UowuoRqrafBFg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wt4dp5xyFz4wcl;
	Tue, 27 Aug 2024 08:11:42 +1000 (AEST)
Date: Tue, 27 Aug 2024 08:11:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the nfsd-fixes tree
Message-ID: <20240827081141.051462a4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jbE2BS2fxAHZv1hCx+vuXtR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jbE2BS2fxAHZv1hCx+vuXtR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  2378b0fe77ac ("fs/nfsd: fix update of inode attrs in CB_GETATTR")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/jbE2BS2fxAHZv1hCx+vuXtR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbM/Z4ACgkQAVBC80lX
0GzEfwf+LtSrETGbBu3Nv+fmHduIFGrt8VVHMpwricoM0pdf+oFCbygsqAOKE8MU
bm4m0snluwxWBK4w0gVn98Ro3Uwq/4FjRaBTl65ohwWvKmgjRASqiUxTLM1p6RFj
fF6b8WAgHGhY0pP8Nz7usrEhjUxQZuTdACXf90js9+iCljEBxCEoAjeyqG512N/Y
1rcu1lqAFMoRFEf2nk/2J+z/Eyodgov9pZbTXMm86Y/vz2gTlq8oP0PkkaX80xoT
Vj4doCJrZD9hr8DuvWfvK2aSHjLlgBnoWZ+bmMEvtDOKVAqtqKcsr5XyJ7PI0oH2
E5ofVMkuIqEKVmuD3pnxYaygo3u4hw==
=1ZXv
-----END PGP SIGNATURE-----

--Sig_/jbE2BS2fxAHZv1hCx+vuXtR--

