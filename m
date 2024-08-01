Return-Path: <linux-next+bounces-3206-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 962DC9454B4
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 01:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21434B22728
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 23:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF4C14A627;
	Thu,  1 Aug 2024 23:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Hg5vRdWK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4E7D2F5;
	Thu,  1 Aug 2024 23:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722553369; cv=none; b=Kpxl9s17FeEDNgKuWT/ol6tuLIZPEIJLvb1HCwwhfikrC5cCq4/guIEvxWcMcYEumRw7KwNCla+DINm4cUJqgRIvy5wxyORvcMlt/5dgAAVKv7kG5HcbtJ2vmzuhnTR4dMFn5JmjWhBAWFpIyvkLkE7lTFboD1semKBkg/qjzHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722553369; c=relaxed/simple;
	bh=gpObIo5+5dKoSU6+IRW2aVouzgBQARAn+4TLPa76lwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qYi0yXlaeVMjyeAv1/1TIfstG1+MIldwc1apW2KbiwAtuAtrI2WDRolU2EsQ8T09eLlLqV8o1zOKJiTCK7w8Je1fjZKftTb4GtKYT/nRs7vvH3Mp/VKEr5ijGbxuPy3011jTAGS65iMWP3Su+e/LYnINKe2NBMoZWLCJzh8shJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Hg5vRdWK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722553355;
	bh=sPR1DXqp+H0E9EZyb3uxi0QTiqNFJyFuyh7Y45XKkVw=;
	h=Date:From:To:Cc:Subject:From;
	b=Hg5vRdWKlPSUjjuLycfXllLGCLRItiMJBmUOmzBYY+87/mycQ4qn8n+SNNq59CMP5
	 dYMqNFshIgnG7dRLfhoCGEReqM61yRU8CYFJfh6tjfOUgWzcc9uxGPLwTUncGSHfjl
	 jQppIU9lLZbpSaCrv+2SrdNTWjp5PW3m2wuYI7QTrgHQSMO447Y6vEEkg6Hgd/8tJL
	 Hi10SDgfKKQV6XT0jxf/skv+QXTChmeaNuM/Oik3Et5nU3WSVsVcPF3JQJlgDprtSA
	 2raQ8orvTdBrvgHFbPuh3dw07kjJdZi4yNl6iw3Xqjuv/TuajO8jcqWa/imsIkXkUd
	 vcjEvQYHFfSuA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZky35QBxz4wZx;
	Fri,  2 Aug 2024 09:02:35 +1000 (AEST)
Date: Fri, 2 Aug 2024 09:02:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tpmdd tree
Message-ID: <20240802090234.2acf4c25@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P9RDH9dunukgujqcdlO6AGx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/P9RDH9dunukgujqcdlO6AGx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  f6554cbf56be ("KEYS: Remove unused declarations")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/P9RDH9dunukgujqcdlO6AGx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmasFAoACgkQAVBC80lX
0GzewAf+M/rotJTAN8zyIHoAOh3KFX3ZWfIC1KmnZmsR/54rHKzuqKeCTtEeawSA
/huyzJvNVCOraXxl2NdqkNHDz5xPU7IAe3/tjFernmujSzMECejEucrMK1fd87n0
PC6Qv3xMB4uPq9PEb7WSMzfrGJiLodvuqPDWEb+e9RemNB6JLK8JTjg5JzUgQRft
PvfUnlWA/0w3D7puwBVJwdUoJRGGAEVGu1YJRoj7qBuVncAd0V381R+0Cowa5q2W
H2QPX2o03u5nkLgGRnZbPk4U15VFA0edmpxSNaX+CKd3hEkmpkgoX2/G7JE86uMu
cTs3sJ0OsUWWTYwOQ7Hgir98AuPQ1g==
=x07o
-----END PGP SIGNATURE-----

--Sig_/P9RDH9dunukgujqcdlO6AGx--

