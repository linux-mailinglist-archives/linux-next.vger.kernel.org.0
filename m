Return-Path: <linux-next+bounces-3660-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88036970A4D
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 00:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6F62281C5C
	for <lists+linux-next@lfdr.de>; Sun,  8 Sep 2024 22:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2D91741C6;
	Sun,  8 Sep 2024 22:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sxreuZke"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22BA139CF2;
	Sun,  8 Sep 2024 22:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725832917; cv=none; b=h5+J8QTlGt44jbupyjm4nhZGe4M6367n8dSsvUsqknKR2GW8IxpyAQ14YWJvFI44SSWML16w1XPp6VTIJQvrpzraVX3p+haD/hpHjXnj10s+i+Krlh7PBZJczjpDAQ+YgOcfCOQI0JU1CLhJHfXGr6Us/BTAutq0S6UtRW1PQ4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725832917; c=relaxed/simple;
	bh=7zuTUQ6KTMa5MGx6dCytMdQqqs3TndJci2qGVKimVSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nLTya7ssylgEh1PDj06fE8WtL+pI5UYH1GposAXcs9KasK5cSjo0mA/gNyceq6e8QMDblF7mV3CYz0JUg3rQ9Nl+DDVdK/xc1VpLRlnFO2NYq3NVVmhvcG/cNqD+msr/0X2BElJ+JcFD5Hzp7FCfv+meMGRvmOpWoTlI7sYknqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sxreuZke; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725832911;
	bh=MyhidYFk3diA8z4esvfYEYF1ijBBrr+SDbZ3JJ9ov4s=;
	h=Date:From:To:Cc:Subject:From;
	b=sxreuZkeCarJr7nsfTuZjqhnuvT0gLwCLcoiPOUlE4koOCNRV32oJ8+SJRHcWSPA9
	 W3GxqEcXbmktJhRIOJ8ASC9WBjOPRdI8HtyKEqOns/8wBspiHtn2Odk/FMEJtfls3f
	 BIz7NgmDAopsqshWKLIBA4wcI6P+Ddl2MCzgXi3j5Uw0lZjmIFEKcFPLUO+oyiZqeL
	 Gxd4dr2iyKuoxzYuciii+cbSYmqr4rV/EAzd/r3IKVFaxmjZPJQ9yzud7ho0bHaDGW
	 E67b2TQ6Fkf73PIThGZvfT3+RwOZFaY2NBv81q0pJGHPu44hI+4/zPh1XpwLNapgz1
	 hITJMzDFiMpBw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X23pR1ZYNz4wb5;
	Mon,  9 Sep 2024 08:01:50 +1000 (AEST)
Date: Mon, 9 Sep 2024 08:01:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the nand tree
Message-ID: <20240909080150.631c7923@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4hy=0TQSTQE6ch/qVI95Nx+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4hy=0TQSTQE6ch/qVI95Nx+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  26935d5fa4a8 ("mtd: rawnand: mtk: Fix init error path")

Fixes tag

  Fixes: Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")

has these problem(s):

  - No SHA1 recognised

It is just the second "Fixes:".

--=20
Cheers,
Stephen Rothwell

--Sig_/4hy=0TQSTQE6ch/qVI95Nx+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbeHs4ACgkQAVBC80lX
0GypVQf8DT7zMLYDEcJFhEiLME2El038Iucfg8qy+KThYNa0RRByUFwvL+Hud6Sv
r5/l39ITbVgFZPWFDEIqJzYkNcp6HUrkFNPNTmRvEmZO4TF1W5MdoDms3GpfyVD7
4I1VpqjxC94qgZ54nfzv4h/s03oV7qkn7M8GtXUtqJAiRrVTbBoSlU1OlCiAgWJn
SZW6nwZa/MdMc7XdBu6UZtOg3/leqZ7brn12+nAyR6qhMzxXX0GPNxTFUxDnhTp8
sp9oP90gwXOC6uZ1yA7j/Z0793eASrqdDsAipWB9Xva8yJ9xoiYmCUF1VIbQ/qkx
4t4AFVFICOYaM4aKCzXiDWKF6t1meQ==
=4IWb
-----END PGP SIGNATURE-----

--Sig_/4hy=0TQSTQE6ch/qVI95Nx+--

