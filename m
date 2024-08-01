Return-Path: <linux-next+bounces-3194-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC549442FF
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 08:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7059A283A63
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 06:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FEB61EB49D;
	Thu,  1 Aug 2024 06:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Fa5EysRO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5B01EB487;
	Thu,  1 Aug 2024 06:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722492243; cv=none; b=bi6uDQnuZ46dMH7G1xaAdMX+z0MqyqlLQbnmrpFE4a29FfiBKT4nvNj7rklbiZXMsTb77MSxrUNtj49gXvDdEiZKi4o09oLr1Bo4nVo8wYE13LpfsPJV65nctSId0ZnhI7phlh+YSjlixlL3bENUP78Psr5D08yc+XlTR44B9cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722492243; c=relaxed/simple;
	bh=FKlxur0CMqOyOsvecMdO2kRtUQaFDGZ45PtqsROFYbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dWaOmJ+xP0dl/MIHlu0SZyAzQaonIXxUEsGNurJMBjG4LsmYDM7Vp75d4lVJbWFl4P/qncNU4kujCaIcVuv8J6KoGgZJYq11Tfp0V16C9WupI7A/TK/A1ZPkpBLz9oV0voB/IVpT1pEpGq63yhhkmuJYtIj6RT55NHCKGeA+B+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Fa5EysRO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722492238;
	bh=uVarZMcOO5cTR+tIOWbqIQxx78Q5RYUZs/Sn8X/szxI=;
	h=Date:From:To:Cc:Subject:From;
	b=Fa5EysROkmNcCbdiutsZFnJJ8L2aV/qiLint8zW4hwAKtqenAHSXrXmCUAM6lf4HR
	 acAio9ATcAp1jPSLjqS+M7yNOzZk2CiNHcdg88vn0C6SYU8ppVdw5ile39N80jllqW
	 Aap8FrTxDN8XldoFrrhIJbpUg7JZ4QshA1hIqrb9IuksOeZR/SLxcMH1h9j/6CFdtf
	 Dvqtss2U++zjHKb3TfGRbTRlk54+Xnf8wBebdjOOhcVa89RPu7X+43Rw5JXA9gphJx
	 mXdWbrWuYfOhkkWxCts06mAyGlgWeCUB1qo2OG4SZb1PGWcbBuXuYkaPBNStBQl1QO
	 sLqz8rpx2ZZPA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZJLk0Lqjz4wc1;
	Thu,  1 Aug 2024 16:03:57 +1000 (AEST)
Date: Thu, 1 Aug 2024 16:03:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maxime Ripard <mripard@kernel.org>, Sebastian Wick
 <sebastian.wick@redhat.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20240801160357.7ac5f111@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JhW2nqM.dTPOZCGAkE51VId";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JhW2nqM.dTPOZCGAkE51VId
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/gpu/drm-kms:538: drivers/gpu/drm/drm_connector.c:1641: ERROR:=
 Unexpected indentation.
Documentation/gpu/drm-kms:538: drivers/gpu/drm/drm_connector.c:1643: WARNIN=
G: Block quote ends without a blank line; unexpected unindent.
Documentation/gpu/drm-kms:538: drivers/gpu/drm/drm_connector.c:2388: WARNIN=
G: Definition list ends without a blank line; unexpected unindent.
Documentation/gpu/drm-kms:538: drivers/gpu/drm/drm_connector.c:2390: ERROR:=
 Unexpected indentation.
Documentation/gpu/drm-kms:538: drivers/gpu/drm/drm_connector.c:2412: WARNIN=
G: Block quote ends without a blank line; unexpected unindent.
Documentation/gpu/drm-kms:538: drivers/gpu/drm/drm_connector.c:2425: ERROR:=
 Unexpected indentation.

Introduced by commits

  f592e01664b4 ("drm/drm_connector: Document Colorspace property variants")
  76299a557f36 ("drm: Introduce 'power saving policy' drm property")

--=20
Cheers,
Stephen Rothwell

--Sig_/JhW2nqM.dTPOZCGAkE51VId
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmarJU0ACgkQAVBC80lX
0GxPrAf+LZrPefWc8mKaoShDOh3Tvk+rQMIg4gnwDKmg+7sczKv7NGgsA2h9Jc0K
FhUFGLQJ/AGRJwPnVwLDu+j2zj0CPCXQtxebncJnpb/0gBVeFXBpJtzYiT2urv08
YQQ7MgDQLZZk47JNAYJTUdihVy+gZlORW2AnM8E/vHHqK1wPIPQJ0t2oveXH5jMl
2xtDgdJB30oTg2kXq0W86ZxsWxNWqOKNTmITP34tkZ1EoPa1TWxdvTsQRBOBBx2g
JEo1hJJil2hf/Jav18Y875mtoxC915se64ewU5rASnEcCfID94j+Sbz0trxVxtur
2L432PU6JN+mPG1pGG/mGvaHakxPpQ==
=W8co
-----END PGP SIGNATURE-----

--Sig_/JhW2nqM.dTPOZCGAkE51VId--

