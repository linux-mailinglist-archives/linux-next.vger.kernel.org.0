Return-Path: <linux-next+bounces-3943-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 356C297E524
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2024 05:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66A321C20F12
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2024 03:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2668F5B;
	Mon, 23 Sep 2024 03:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WH9V49Tg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEC53FE4;
	Mon, 23 Sep 2024 03:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727063599; cv=none; b=I5DKZZOpkkreR7yXn0qHFXZno07tLhJK2a4iiHWIENEPULCpFq5yIXkwuGe2W470DM4OMUe4YGZHC60EoPhofZkg7ymsGpBhtJECm1OQPyuWhweEg1w+3EjCUDkJqwFwnvu8hggRhGk+x5mSOgYbrH8g13VVaZa6NsiDoTxQQJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727063599; c=relaxed/simple;
	bh=58+lmNMLR5JMYQSr8VqXP2ycHad7qgQNtKckzdsDzOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cxmgc7/3vZdkIkb5ENiIRMpulvC7cGTaNhPE64bDDHo+65EufNe4VdnQ+DbVm3KD+FPWuFVTPlUGT1SgisR5/Cumn6UILpupOcGg43YXqu/8Ejzw2F72Ioc+Q7A/futaADs2i6IndYJ+on7dS0g09S0cnXtTSDZV7EKOOTPW4Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WH9V49Tg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727063595;
	bh=0LA1GWBk1yiC7/FysF9w5hc4/wI7WSx5FB9Im1d79fU=;
	h=Date:From:To:Cc:Subject:From;
	b=WH9V49Tg6NNnUA+LMA80Ztbrob7kVgZqsn0C9f/oEfim7jFdLYqA3BQsnTfjIu5j7
	 CdXAjLIOTLBSeCCjSqLsEF/ljcogGF8RObORdeiH6vLY8RMMJOawuixVeEvH85YQn9
	 IAd9L42E+F3YSFU0tSXv7ZlghB6LWgVvzC4AQgvlkPQBcnBCPMcXd9WMeFq+MtFEWD
	 3Lu7mrvRUj3Gsp951+hhPASmxPx/0miZXp/C+lyA5btV2p8RETYJOTRWMRQUQxolBi
	 H1diEa+trIZrSLgajI4VYP00FbzB/XnHHIrFFqR8mGpcTyU1bsTBZxc+62XjGM5sDJ
	 P96VYf7Evw7qw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XBpxR3Fcjz4wcL;
	Mon, 23 Sep 2024 13:53:15 +1000 (AEST)
Date: Mon, 23 Sep 2024 13:53:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the cxl tree
Message-ID: <20240923135315.3f72c326@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0jDlmXnMdiA.v4Gp._pNRvX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0jDlmXnMdiA.v4Gp._pNRvX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cxl tree, today's linux-next build (htmldocs) produced
these warnings:

drivers/cxl/cxlmem.h:409: warning: Function parameter or struct member 'cda=
t_coord' not described in 'cxl_dpa_perf'
drivers/cxl/core/cdat.c:974: warning: Function parameter or struct member '=
cxlr' not described in 'cxl_region_shared_upstream_bandwidth_update'
drivers/cxl/core/cdat.c:974: warning: expecting prototype for cxl_region_sh=
ared_upstream_perf_update(). Prototype was for cxl_region_shared_upstream_b=
andwidth_update() instead

Introduced by commits

  6df85c6f5a5b ("cxl: Preserve the CDAT access_coordinate for an endpoint")
  3338229f4a59 ("cxl: Calculate region bandwidth of targets with shared ups=
tream link")

--=20
Cheers,
Stephen Rothwell

--Sig_/0jDlmXnMdiA.v4Gp._pNRvX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbw5isACgkQAVBC80lX
0GynOwf/Tphmu0Kr39cRlqXIDa/oGCffg3Cfns+v7sXj/TrMxeY7GLLXJXgQRZbU
7sf+MeIoiQqZs15Mkp/m3np0/VYNMsXBMbGtBo4bjMh5AOBY2NCTRLFbTH4CJ+Rn
K0G8azXoiJTGKs5vvEVnB8d4EoX+KRhvqnm8m2dgOwyEmkct6WXlKvww4zExQamZ
80JBnlmIbnCknKp9qCuPZY31ga0yoacoYNUBrWAFTJobCiceByFri5tyMQzqLJPT
iMPJVjGcSPq+9tYsRXJKhO3y0j3qItRaHVC4KxBK/or+DjnntWgmm7mN2FUNnmh6
EddJHmZrEEA1bJeG79/25T5kSX4TIA==
=9nxq
-----END PGP SIGNATURE-----

--Sig_/0jDlmXnMdiA.v4Gp._pNRvX--

