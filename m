Return-Path: <linux-next+bounces-6884-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9F6ABF211
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 12:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7ADE1BC0E82
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 10:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2EC241682;
	Wed, 21 May 2025 10:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VLX0rgfr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60E225EFB7;
	Wed, 21 May 2025 10:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824563; cv=none; b=aT0QT9rAwtH7NdHzdGLcVYd4h3o8FHdvBSGZf8QGGdFdd3w3XKqm4UpgZVtJ8SolOdj5sgrZgF0SR2+gfww6h++Ar7feyr7/f9/Q++7Xbq2mZmePIWV0eqEHSXtfVXJNCYSe5F14JZf8/4/9QbYYzYFta98LgazKHvIT7KXRzk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824563; c=relaxed/simple;
	bh=H3iRYjCYuYjvJRdci98fMRhbGO8vgk6s/FC2Ns+5OuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZR81lr6eNMsM/nzE6KRqklqDQ55wQ120mLBcFCoIbZmPZs9YMscZLhZU/jL/2gMd1hSOehETbh9P3xoS/p0tNhm96eevibFjvIAtiIFgCA5KkN3C19/nQLLThhjn747129itKbVLxm8v3GjhKj7+ZJQlrxXBx/6xI2/1hf1H180=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VLX0rgfr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747824552;
	bh=U8Kum45Soj1YdBMA948I7gV1KcZcpl8+JJ7xVSf4/EM=;
	h=Date:From:To:Cc:Subject:From;
	b=VLX0rgfrZNZswyEh6zlSqTxPcO3RFrbJhcv8iLdFLOrK2zhH7liADeiAHNm/jSreU
	 epJc1BEttiBsH6sJUd5Z9AG9Wc3jhiD56eJ3RNCRBn8V4q3vBK/FnDD2C84tEs/qO2
	 93UTRGtFgHQ+iFtQ+88DKooe0g95S1weQ3rbMMULHRi2vl1kIQ9tpMI7RZwFuUl8dK
	 fezrqIlwaKypj/NLvZjAMZ+gZSG9de64IJpKLTq+OmJjbW9gSd8d1/G36X161hMBhh
	 F7fsYzuUCIEE+Dx8xHHgEWb/8CJ5x7bfSYglNsqnQ5LJuNDwB7H/cGxjI292lJUNTn
	 rwEKiCI6emwxg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2Spc30nCz4xM2;
	Wed, 21 May 2025 20:49:12 +1000 (AEST)
Date: Wed, 21 May 2025 20:49:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Ben Skeggs <bskeggs@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20250521204911.0266f4d3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+E.CrsXL.3kfQOTMBk0EHeK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+E.CrsXL.3kfQOTMBk0EHeK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

Error: Cannot open file drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

Introduced by commit

  c472d828348c ("drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm=
/r535/")

--=20
Cheers,
Stephen Rothwell

--Sig_/+E.CrsXL.3kfQOTMBk0EHeK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtr6cACgkQAVBC80lX
0GygLwf/YK4BWSNTJs7KHU6PcKmiYb5AU6rzo8UX264WliJEvk2J+RALl+n2+OHp
EO3Na/00d7NeYp1ftqa+UwullZ6/msQ6akwjv5TNsJlwh7dnHX7VtWmyhBJV6aB1
xPBmg5Lbvyppa8nRpujPKMBHzWX0+dmS7Ue1eXPPf7oa5ISJhjHDW9MW+Q3fbv7j
P2yqE9D5nc5hW4mFiKIEbVAlB+EUG18lyvqg4o9ie8eXDi5WLhUGLyOt+Nc8Mmrz
v4Xwzv+vjCQMtrOB1CZa4heSCOwdDlgEISYbLmE2Dr24yAKAJ6pJ+0fWKRBzI9Ep
IntBHKkodjzveNIelAW7T9JZQtMlbQ==
=XpP1
-----END PGP SIGNATURE-----

--Sig_/+E.CrsXL.3kfQOTMBk0EHeK--

