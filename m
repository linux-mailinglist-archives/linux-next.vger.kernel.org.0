Return-Path: <linux-next+bounces-9296-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 040FDC9A016
	for <lists+linux-next@lfdr.de>; Tue, 02 Dec 2025 05:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC05F3A383B
	for <lists+linux-next@lfdr.de>; Tue,  2 Dec 2025 04:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476C42F532F;
	Tue,  2 Dec 2025 04:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sg4rVbZb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370F0281369;
	Tue,  2 Dec 2025 04:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764649515; cv=none; b=MyvgmAydtWRGfduoTT7RSyfjNyjxyLpXQu233WkKp4Mni/ZxA616R/ZTQM69yp6jxY1vpIrMkz3my8jDMUFxeX3nzlKE4MqE1GyoFfx3+nxOk2+V1J7iOzRYamAtcEL0T8di99Z9s56cRxuPdeRfZTyH4w97w2u5TpxrwqeGZ8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764649515; c=relaxed/simple;
	bh=Qb5gvLr3PgHiD25byuE8vQn0sd28ePmIXect/gvAsRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jthmuiCAJjLwgEf3wD5tUmWCAqqoVkRsR1OMpJZP+dnq9nOMFXZsbUNTMrcUU1CcwBsinkGYWorRQezySSeTNytHLegzZ7G311G9AuWpCkUVopTYLMTWdnW+LjmgZXsmSWwek5Kqb1+vNij+EdTLQoOsv80g/3+x9C/A5gsa5A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sg4rVbZb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764649507;
	bh=TIbdhMr13Dv4dnTtWWCMFRAXgSyyovsP7kWycbRXtjo=;
	h=Date:From:To:Cc:Subject:From;
	b=sg4rVbZbBp7gyIVitzByurXHGR14WjCt9aU0hFfhNchRn+QE3rcm7cE7Ts4tgzGHF
	 lZcGVV+YkTkG/iSb9WaOyOluk2XFxngtefx1cH4V33CND4HBRTDuc+waLkU944g/Ye
	 fVMq29yJVsfFMc0kXne3GHqj3NFibYvXKwPy601Z9jxqX1MJrKMPlBhtyM2LANTZ/j
	 Ca3WqbblhwwZBr7iVzxL+AVsGXa0/6m59LIfKU9TG6GqLYjm2oOlO63hra/RzyFPkX
	 O87/EVlnc7JQbSMNKQtLn4SxxELOn94YU/Tt8N9eV7ZNtWs8MBUo57Q6qGMGM3OjsA
	 exqlH+h8RCwAA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dL73R4yCmz4w2R;
	Tue, 02 Dec 2025 15:25:07 +1100 (AEDT)
Date: Tue, 2 Dec 2025 15:25:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Mike Snitzer <snitzer@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the nfsd tree
Message-ID: <20251202152506.7a2d2d41@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Sj=+ENWGCp.LHaFF_YRJcP=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Sj=+ENWGCp.LHaFF_YRJcP=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nfsd tree, today's linux-next build (htmldocs) produced
these warnings:

Documentation/filesystems/nfs/nfsd-io-modes.rst:29: ERROR: Unexpected inden=
tation. [docutils]
Documentation/filesystems/nfs/nfsd-io-modes.rst:34: ERROR: Unexpected inden=
tation. [docutils]
Documentation/filesystems/nfs/nfsd-io-modes.rst:58: ERROR: Unexpected inden=
tation. [docutils]
Documentation/filesystems/nfs/nfsd-io-modes.rst:59: WARNING: Block quote en=
ds without a blank line; unexpected unindent. [docutils]
Documentation/filesystems/nfs/nfsd-io-modes.rst: WARNING: document isn't in=
cluded in any toctree [toc.not_included]

Introduced by commit

  fa8d4e6784d1 ("NFSD: add Documentation/filesystems/nfs/nfsd-io-modes.rst")

--=20
Cheers,
Stephen Rothwell

--Sig_/Sj=+ENWGCp.LHaFF_YRJcP=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkuaiIACgkQAVBC80lX
0GyHZAf/SMYH16ifPN5xI0chIF/sDScnTzX2tUJ4ebjqY7t1vAy1UK7Wmb8Rq3/p
uJrJjobpYqGbsv6io5ZIBLH3cnROY1dAv5L2ErDAYAtcQTorbVMNxmSW337GQGd3
Tn6343YysGee37WQ6+DbxCurESsQNOcMblkU2cjWkceFyub93QgayEGvLpOKqevP
X+BjXVB3E9gL+oisgoCgrxgiCyh629yzJW7ak7RruKyj5V0ZNCYW1TkF/NgcRXzG
/IFJOD2kJrBITb9Dt0aAv4RQcjlZamkdsFHWNpfaOD8+6+pAC2SfV7ehhv/wML62
D05AGytRSdsq+wNZa7EDeAhNmEeuIw==
=Dfs5
-----END PGP SIGNATURE-----

--Sig_/Sj=+ENWGCp.LHaFF_YRJcP=--

