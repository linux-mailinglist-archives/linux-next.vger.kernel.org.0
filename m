Return-Path: <linux-next+bounces-4459-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE3E9B2166
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 00:36:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD9FA1C20A2F
	for <lists+linux-next@lfdr.de>; Sun, 27 Oct 2024 23:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A52189528;
	Sun, 27 Oct 2024 23:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AVHBpwse"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D29188A0E;
	Sun, 27 Oct 2024 23:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730072208; cv=none; b=TMfRU8KJsn+3hjDNaF/OBhpb4xuRSqZqy/pqG4j6dadDddKo+w3fFKfCrGAF8lxq7Y+19zuOrVAK6pO0SQjo8cSm6QvnvgMXows/VfQkgwGtWbwmtsW7iVDtgDe6EopqqzhN9vLTjMX0D6ulWK+iMbgMYaUDhXiCvdWVidU0Efc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730072208; c=relaxed/simple;
	bh=NI/0NjJRoSMFb/rVMn3gS2S+ywVIq3W+7xx2YIHD+Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ac2vLTarVUJgl1aJgjBDJd7BXGdI77ILeON6L/knfWV3b/PHAnAITQFMEi/OA8zJF88YiJCFXh6b7h8ynqwQWnJyWVWcxBnsK8JYypcHncYmNZN/rlzDoZ5tvz05pvCoBRceBPhSrJE6wObrAZOlJq4txVJyxjW4cEEvX2i7RHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AVHBpwse; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730072198;
	bh=Oe4Qquk5IkTM08N/SEpAtTh93r0yCVzE4swwv+GL6zo=;
	h=Date:From:To:Cc:Subject:From;
	b=AVHBpwseRufHsyI3esE8IVklXSA40kksZpixnCdyNuS5t5OpVzeOKI+dx9L5la1rb
	 ABwYm/X3sqA05fcRYdOJEF3A/LHP3gy/HYuZDMeA/spDF1XUBGhi+Gj9JujUPtq8U/
	 gD9tTBW8jkQtDlgWDnZksP45D6O5GdU/kL6Ua8sBdbfXospCOQa+OrvUZ55m+UxuaN
	 pJxd0DNhRBfRicGUYusQ8zHnexJTdbUTXT1NQ//nukQUvPDyMq+/7u/GImc7RFoGBC
	 8uQFmFiHI4H8mYHDtpuxZQ5dp3NiowTkXrkooXuQk6BXsbpsVf4VIq8/zHb2rCToX6
	 NxP4fKhbc9A0Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcCbB3r4sz4x33;
	Mon, 28 Oct 2024 10:36:38 +1100 (AEDT)
Date: Mon, 28 Oct 2024 10:36:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20241028103638.70996727@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bX.JHr=sY9ePnok.=fz6L5g";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bX.JHr=sY9ePnok.=fz6L5g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

mm/workingset.c: In function 'workingset_activation':
mm/workingset.c:598:38: error: implicit declaration of function 'folio_memc=
g_charged'; did you mean 'folio_memcg_check'? [-Wimplicit-function-declarat=
ion]
  598 |         if (mem_cgroup_disabled() || folio_memcg_charged(folio))
      |                                      ^~~~~~~~~~~~~~~~~~~
      |                                      folio_memcg_check

Caused by commit

  b4fa93fbd1dc ("memcg: workingset: remove folio_memcg_rcu usage")

from the mm-unstable branch of the mm tree.

this build has

# CONFIG_MEMCG is not set

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/bX.JHr=sY9ePnok.=fz6L5g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcezoYACgkQAVBC80lX
0Gw6bwf5AbaTm4+x/7IZMnxRrNXx5XxnfmJShvMuFy578u1heN7qMrIf++yWk+z6
zO0zo3+bjmKf7rnDnkzijo/xlbqVTbWsjQMoDYXUSoXpnkWXwgvcaK/mHtQ/bJqt
sv2QFLr8kVIG/Stvupkq80P5apsH2AVhOWfkvKWWL/PXXA4rFIe3MExWeZLj+z96
djOGb1Dqptd9X/mIO6PdN3wnSv1w6/D3yViUZ1WQwMp88RPM/UhOp3fq3IDzSF0F
RzfXMZTxSghegMuMshTFuIYY5FAxKJyxNrjzfL7zb1TY6sc+v7PEQuDiVGY7rUUI
QcrLz+slznm6I+Slb6PyODshfI+cxQ==
=+D56
-----END PGP SIGNATURE-----

--Sig_/bX.JHr=sY9ePnok.=fz6L5g--

