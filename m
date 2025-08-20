Return-Path: <linux-next+bounces-8042-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FEBB2E7BA
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 23:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F27D21893A0E
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 21:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C74C2BEC27;
	Wed, 20 Aug 2025 21:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="b4AyeJjX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813E2334368;
	Wed, 20 Aug 2025 21:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755726650; cv=none; b=L3uZll/fLU5drc+6m7vBNORm2AvL/I7uxcsPAyWhuUU/Rc2OhNieNVt3JgzdDjS/aJ197+pQo0Yu+BKFS0h+p8Y6HOvGlcWVJowP/Xi7wLIVAYIiN4xdg860Fo6N1h+uwBFUoxWCr8M+IGNxXinnfrbiG3DgaRxP36QYajIPrL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755726650; c=relaxed/simple;
	bh=6Px1qLZaP5KkAkXcAjlGmPZyKVVrTH3RDECaYDCm2NM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JKU+wNuDsnlErTXuf6Mspw3j7K5s9b/e0n62AC1UfuHmQflxLEXMpIEG7PvlzezEFDRLHkYj2Cbd0T1lyt2naRplmuol34PV7lyybSeKLI3K/sInTfHBGjD7g4I4kO2xSt0g3qyFQWjfcOJfxZKlBuMTGNOWtIDK/I7MSoQiroA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=b4AyeJjX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755726642;
	bh=SECfTSRCICH50662hUdET1xmry6PhtZFKPVYRiGJPA0=;
	h=Date:From:To:Cc:Subject:From;
	b=b4AyeJjXA72D3c7SJF28Z64/VeZvf2IbNMt3Mix6EevL3VwPiY7smGIq1+70fb7Jn
	 L3csSOYXr5bZ/qAzMxqLAG7IXJU4+dXNLLB1ouTdt6vTw3L3LQx5dzombnCD0O8Pgq
	 lgPUqT7VHvHVbh7MOFyK/cx6SppPwH1bwIw9SWcH0wrBeV0NOQlF4AHWXXxR5/WVZ4
	 hzc2CbzQE1fCLJOLPKzWzRaWzu0ztKDMgjyjNEOpH0bQU8FMIBLtHTcFEtYAdWIQXc
	 DyxpCz2/qQtL7QAwixLffvET+Eb5g6IRh7niFrMSdLIdB3kcvwbK8C4al+MN0EnK4X
	 cZwznT/sEX/Ew==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c6g9t3qcnz4w2J;
	Thu, 21 Aug 2025 07:50:41 +1000 (AEST)
Date: Thu, 21 Aug 2025 07:50:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Joanne Koong <joannelkoong@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the fuse tree
Message-ID: <20250821075041.576dfc6a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DXD06fxoE7xO=ya6/ruezp_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DXD06fxoE7xO=ya6/ruezp_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  1c9f99647c40 ("fuse: reflect cached blocksize if blocksize was changed")

Fixes tag

  Fixes: 542ede096e48 ("fuse: keep inode->i_blkbits constant)

has these problem(s):

  - Subject has leading but no trailing quotes

--=20
Cheers,
Stephen Rothwell

--Sig_/DXD06fxoE7xO=ya6/ruezp_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmimQzEACgkQAVBC80lX
0GzyFggAnpwvN2RUXF17N/lPXCJF03q/coByroYb8ZqL1NKKqcxSMFXGrVmiQ10P
oxhhcAv7BA9Mq1RH+7qcli1HLntyPdwc0kfmTQaUu1CK5lTyFa28hDp9NzNRxX4Q
8EEBneUNNwDtv8J3UIeW2h5jDUd82LrJK37J3abu/CXO7AJObD9zvomXluOyk3N4
jeEMp40IBjkA6Oe5GbWwo9JnoqnTEJSZSxGU6k+3UhQZlbF3rMy+VJwMhdR+ktRC
0CzvPERwolmzGv+7vDUnRx2S3nznS3STlovqX1hr3PuI8Zt8/xKA4wQWfpZwT0A5
be9sLb1xctdswiVjxGRmYatuOOYHzQ==
=2rbZ
-----END PGP SIGNATURE-----

--Sig_/DXD06fxoE7xO=ya6/ruezp_--

