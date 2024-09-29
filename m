Return-Path: <linux-next+bounces-4002-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D119B98983B
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 00:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FA251C20F29
	for <lists+linux-next@lfdr.de>; Sun, 29 Sep 2024 22:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F254D757EA;
	Sun, 29 Sep 2024 22:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JSbUfX/2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEF638396;
	Sun, 29 Sep 2024 22:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727647671; cv=none; b=KKQ0YCpBYI8rh9op1BHF/obeaJTC3xv/6oTg1f8qOe2tCqkqlUx/IaYMTLDmsQGSfAkwFqaNwZWxYh10CSBAKyKVv02S3zDPh/Ws9MaMwJEj4WgLkmtuQmhKR3LE8oVPqwz1j+9sC5A3jmMskNiO9+hFG5cCI5G6jGogNwfazxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727647671; c=relaxed/simple;
	bh=QCy0BybPk3+5ArjUThPJOsG+7WUB6VoPVv8Qo5KDeOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ipJctV5X457WnI0AaVDRl6vCW6MUquW21vANkG10mI959aUfgNFCzS0MvWasMOiM2bm1W7Xopm40X3//AqGIIRNxBczWvhfUBg+OtqcOlOWGhl7NSAjYpUchX1We9fGs4L2kuR5k+CIim7Q9LmQk8CI9XTsDIqYxsyd819P/DBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JSbUfX/2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727647659;
	bh=QCy0BybPk3+5ArjUThPJOsG+7WUB6VoPVv8Qo5KDeOo=;
	h=Date:From:To:Cc:Subject:From;
	b=JSbUfX/2XpwiK2XoFJp01jANEX0Ss0ZZ6tbTWDJptGuGAfOpWglUz94xyGbW/zEKs
	 ltGTD8FPqif//ASwl00BcQ1YP1sbrWcUWpv7DPeJXmR7MWd8krpKvGivO3On0P5GdN
	 0EseTuCLtcDa+BZj7iZSZ2RNb9DsXCsKjqU7vo1ItjiKKyUkDc4rPgrD1amYGmiOTY
	 E1pVNF3v8b5MF7K1yyNwu8HK4YsCNtVHivXMLv6xTQOVjAVMgmMrh66gVc0g3RrDHD
	 crlG2xxNKybMeeYJdE5SzTdAWWFoBqtMfb/f8GEfPEoEQvnYkmpcU9Jx2HJu2gQopR
	 qBrXnjTA1AiLg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XGyxR64mBz4wc3;
	Mon, 30 Sep 2024 08:07:39 +1000 (AEST)
Date: Mon, 30 Sep 2024 08:07:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: error while fetching the exportfs tree
Message-ID: <20240930080739.53c91136@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/agAo.TYluy9bs3fl8_VJ.Yn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/agAo.TYluy9bs3fl8_VJ.Yn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the exportfs tree
(git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux exportfs-next)
produces this error:

fatal: couldn't find remote ref refs/heads/exportfs-next

--=20
Cheers,
Stephen Rothwell

--Sig_/agAo.TYluy9bs3fl8_VJ.Yn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb5z6sACgkQAVBC80lX
0GwK+Qf+ITxnmAiR2NeveUcAgPtX6PyhiR++u5OLlLft5DSs1I2SxtVmzUta8pBM
q6lav9+xIh2oXX7IdktNfJeka5Vw3eaHuYjTR29aA3mH0nYbk2Mp+wGLOPUX9ZaL
724Goc6UveXoRFqJaJ6eMbGb9vud+dmIVtOj6cUpKqEQpT5vhPoZxBmONYeO4LnD
qJVmMD6FWu/3d56EiDAYahJGLAqLT/lTS6zCuTES6XunoIta8tBAXze32wm1c762
JG7KlpZkizQW+FN7JmvtQW8Hec/0/y4APPU5k5ADIvmfXtGbscfziMQi9XZBvA5C
PdHy8C4j3ZGgf0NQiTBAQJUSbcGpKA==
=1v7m
-----END PGP SIGNATURE-----

--Sig_/agAo.TYluy9bs3fl8_VJ.Yn--

