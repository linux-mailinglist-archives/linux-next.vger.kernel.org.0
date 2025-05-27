Return-Path: <linux-next+bounces-6935-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8248AC47CD
	for <lists+linux-next@lfdr.de>; Tue, 27 May 2025 07:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 709773B8A29
	for <lists+linux-next@lfdr.de>; Tue, 27 May 2025 05:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFD01D5160;
	Tue, 27 May 2025 05:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TJ6sorbd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49FA13AD3F;
	Tue, 27 May 2025 05:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748325025; cv=none; b=CjBULvUULxjiCUmwPtJ4MXY4DsGvwwQf00/VYI/59TQfbok1UGuNw3SByJrkklknRX8I1wGM6DfVmcBKKw02KX9yQ5ZunWT9bxINfpllwwmIiR7EDkoIff75VLiou9gS6VbjFPMtAYuHGcs+MXU5EllTCO0Dbz6J8gHMLystEYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748325025; c=relaxed/simple;
	bh=I+i5dyrdzbz4+joyyXYVctVKCdAlKG/p4OXWOnqDfjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=reHTEEc3+mQq7maUEJjiDzRosgq4IM3yyDvmRfg7/ogBVXyYf3OOXVoZ+7eaJVFUEYotI+PtfiP+XNSSt65d6uEDcSvYGrSEprulRs+1MVre1ygUrIa4owWikVJXZnamfhIulTqHfGBoewaawXDKDNzug9x4CRCjdslIWbQKftQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TJ6sorbd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748325011;
	bh=bs+mBRY5TuiGuazsOpx9h5+EYinEfFFe7npBsRn0iwc=;
	h=Date:From:To:Cc:Subject:From;
	b=TJ6sorbdVvKUqYtMK+NGsK3889msamJd1homLkMjqIRN5dhabjFHOD7yqSqHq1oa9
	 bzME7sNHBM3Y1/VzCzVUdk81rk70U4klnYQ73QAXN8Xu/w+YnZteSko49tTU0Gi3/h
	 MA7z7p/4yKsQvWECZhxW/0/idcpFOguY1bMVJ5N230wiPOveBSAdaIP3xRGuBwffBG
	 Q3yR8dOLpeBFGa6/j2o9P+78iu2Q/sBVRTOBAryjB5gxQ1UMxxyuYxJPBWYDj6p8Uo
	 4ZmqPIHERrAgfS1EZ43KJnVfr7sa0z0b6OOqovqwlp4zUlqhgmSaUhIwnn6YRT7eA/
	 04GJI95qJeWhw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b61tp6FRKz4x07;
	Tue, 27 May 2025 15:50:10 +1000 (AEST)
Date: Tue, 27 May 2025 15:50:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mailbox tree
Message-ID: <20250527155010.0ef7015f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KPL0tX/SjcogHn.xl7JkODX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KPL0tX/SjcogHn.xl7JkODX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mailbox tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c: In function 'mdp_prob=
e':
drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c:297:41: error: implici=
t declaration of function 'cmdq_get_shift_pa' [-Wimplicit-function-declarat=
ion]
  297 |                 mdp->cmdq_shift_pa[i] =3D cmdq_get_shift_pa(mdp->cm=
dq_clt[i]->chan);
      |                                         ^~~~~~~~~~~~~~~~~

Caused by commit

  1f808916c0a6 ("mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()")

I have used the mailbox tree from next-20250526 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/KPL0tX/SjcogHn.xl7JkODX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg1UpIACgkQAVBC80lX
0GxYAQgAoT5a2KncZZ4xJUmByEkgW3bf/IorTGugCjQui0MHQrXmXbveFuVI7Cgd
RTnPNatYYOWtLztzON+zXZM5zpdJmkBIVGyn0vKGmWXVMLLwBfV2aX9DrSXa5nui
nr+m7Ry10BhiIJAkltb27hlS0AR9AXPBmfYW5oG69w+XdReQk1vC1qjLG2F/lZI3
aQktqAmAS/vS3pSSY/zx7kI4qCZQPWXu/H6XOyPdzBNlTEJmhrT9ix/EPNFTFJ/b
4W9PC2nsfhKyfBez7xK4kjeWFxTixjMADuYcdrseRz4YH8NE2Ih1ZGkJI9hcArLe
C1D2jD0fkeQ1SbQRDmxX4MfnKDj53Q==
=goE+
-----END PGP SIGNATURE-----

--Sig_/KPL0tX/SjcogHn.xl7JkODX--

