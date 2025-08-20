Return-Path: <linux-next+bounces-8030-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B86B2D32D
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 06:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6ED9188914E
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 04:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C979257848;
	Wed, 20 Aug 2025 04:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Zpk1tVh7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE481220F38;
	Wed, 20 Aug 2025 04:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755665411; cv=none; b=Z5RsCItDOoY0EHno4dJHnqFawGEAXuZCic7Wi0Y/E1SrkIm6amDXzLS6yF83x/fJ6ltvhFELvRfzZNYz5X4jj8CnqMWCMULFoWiNuscB9AYKKHkU9u8I6XfCyFT9S6r5q/wb+W5HbQ2cWS+/6b2NRsGCZjXrx/4IIMrpf0i8+Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755665411; c=relaxed/simple;
	bh=DgjVa+2zk/oz9hFTFZiWDmSJ2URUVj5e/H5qYb+e0G8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pp+mQkqUDpjWa+6Wt3HG1++MmYN9byY7jPgznI7A3rAoDANZamMqbNaS3h8WDyqa7ONtrz4yUDYp/4Nucdw2Zl5oOX1F+k9TXFh8/M7QnV2dfhdo1/kO8WQSrTafj4scGCj7mHJ27GJruKqggVL+89+lKxNHw9DfSa5gmksXNGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Zpk1tVh7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755665405;
	bh=ls7FmdiCkPKpK9KA7FfDV95qC63O6lo0Xe3852SwmaI=;
	h=Date:From:To:Cc:Subject:From;
	b=Zpk1tVh7N/e+hJCs2XKhq85uS+YM+caZXp/pLXbyHnvH32d/JrdM6p+D2oSZofqqs
	 M1ecMNJ+qdOp9MSm1qgznUBIFF8A+Ldb61bDuCsPSXV24Ib8p+PY5CCJVs7ERI1XaN
	 +Tv/8oZBjpfmhe0siowheaOlc4U1gP2U/WB2uTaujV5LQut0rGQkYwhIMgtEjFDpYA
	 ROSngrID0SuEKYLoo2NdUMT/t56t4d9DOQKUX7XNqdBziPq/uCVys0M+fITmz9GnBb
	 P/wWCqgUXXtBIqCpwRukQ1VUiee0xZb3f9HlD/e3ohWoERFRTM+z8Ox+l5YR301syK
	 cbYIkKXAAfTuw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c6DXD4Rskz4wbc;
	Wed, 20 Aug 2025 14:50:04 +1000 (AEST)
Date: Wed, 20 Aug 2025 14:50:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: wangzijie <wangzijie1@honor.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mm-hotfixes tree
Message-ID: <20250820145003.7d82d475@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gP+pN0J=Nsr_RsgBbzkJCKL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gP+pN0J=Nsr_RsgBbzkJCKL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  c450c8ffc9fd ("proc: fix missing pde_set_flags() for net proc files")

Fixes tag

  Fixes: ff7ec8dc1b64 ("proc: use the same treatment to check proc_lseek as=
 ones for proc_read_iter et.al)

has these problem(s):

  - Subject has leading but no trailing quotes

--=20
Cheers,
Stephen Rothwell

--Sig_/gP+pN0J=Nsr_RsgBbzkJCKL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmilU/sACgkQAVBC80lX
0GxDyAf+O+t5BrxTZMssYcCi5S7p1skP1b/msRXpHCKlSa0hIRueMo+0A1Q/jV69
z7r9QzkIMr/aj29Cyey3mOrXsAsqlDmHaiYcyCwydgcK7149BLn1oztzghbiWEc3
7nwWt64bGFRCRj3gi4COdWRf5SN12ABqrHyAJUH17njubDAZc6Bdg5iQ2r6ueI2M
WZ1b9ej1pjo+Vkwg/d57M8jBXO+iQ3uy1PA993TiGIgDv0tM5RmiEAFjNgcoL9a9
0li/zpzcMGyFbOdMSlw3oLcj+yxkHG+7u1vB5+8Qps5f1nwMe8VzbPPmPzG+VF4+
KRXvqU3pgoBdslNFLmMYWfNQgAocNQ==
=CNQX
-----END PGP SIGNATURE-----

--Sig_/gP+pN0J=Nsr_RsgBbzkJCKL--

