Return-Path: <linux-next+bounces-3076-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7473A937108
	for <lists+linux-next@lfdr.de>; Fri, 19 Jul 2024 01:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28D631F22067
	for <lists+linux-next@lfdr.de>; Thu, 18 Jul 2024 23:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902F9137775;
	Thu, 18 Jul 2024 23:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="l2aesBbc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C54C2C1AC;
	Thu, 18 Jul 2024 23:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721344519; cv=none; b=BZS1VdQnlkJ02yeP6u1hij0Pn1STRJUwVf9z/amDR+KujDek42s6BnLpfs8GIvGdiOoOB/MScxStmgUfyrZZloNpFzaWKXjCgcIjiZ7IscyT5wi7HiZb6i9L27d33HkQY0nm2Lh/6grX1AwY8E+w5RI/sWzrhfl7502D5KaNFs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721344519; c=relaxed/simple;
	bh=SyjwdQDKywlwuSm5QQjWaBpmyPoHA0LA4JS9a1UX1FM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Q+GxaNbROXs1ZnHzxp5nzjJe6pJ5NVHPVuTc16SD/bCFSEI+KaQwJHQPxoUbNue3/roAn8VCIri9CAF9Ft4u2CqUts/8pBqL+DIRzsTpHhPAsixY/qVIzqKbxUUSpJJRfybo5yf9szYqV6ZsP5l8XVgpzD8z0oGZjgFebF20QL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=l2aesBbc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721344514;
	bh=gqE7aOZBb2b+Ol/wI0GPSlL+rWQ1R+ozWBgDYKdk+08=;
	h=Date:From:To:Cc:Subject:From;
	b=l2aesBbcg197E0qrmoVrMRDKvVbAkKvawKI+CbtNyA8Ro1DioPi0m3QCmRAX8cZ6I
	 8C75zi4mHIBlxqqSY1kGRk2BCtTXGkTKMYqksuaIMw+aRt8/XJEb2uHg0FTBcvgWv2
	 NfjXwWevIuy+rdQ1VBOLIJp8mzHU85YEY3PJ3Nya/RNNFQbufEyCh7InXNZ99n9iKi
	 xRChTqO3aJSkAKkGwz3pkvYjCjhIJywtaJ/GrAjgt7eyNhGzydbA7lmAVSZKGRn0sM
	 ZH3zHFXdJL0GQMRYwpblsqKG2yBpdfJF3BlOBt81924I7LVGroOsZni2yoURHQ27hC
	 sLF3NBBDPeWYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WQ7v61fSkz4w2M;
	Fri, 19 Jul 2024 09:15:14 +1000 (AEST)
Date: Fri, 19 Jul 2024 09:15:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mm tree
Message-ID: <20240719091512.76588ea9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1rPdisC7cVZRToBS1T_l/mj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1rPdisC7cVZRToBS1T_l/mj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  d25a4557c1f5 ("bootconfig: Remove duplicate included header file linux/bo=
otconfig.h")

in the mm-nonmm-unstable branch of the mm tree.

This is commit

  0d9c0a67b144 ("bootconfig: Remove duplicate included header file linux/bo=
otconfig.h")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/1rPdisC7cVZRToBS1T_l/mj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaZogAACgkQAVBC80lX
0GzTOQf/V+s6AIrt4altxeNBwjAUnVawrsg9b3cZoZFDhwsVdJymUdugu995cCDH
q5udS32SecNHVoJJSdu5pN3yfi6ZlyICw7ff0RhDOiN39oFqXyODlaT6TbmouH+v
jgAisgZymlAXtfa0S1M7gv7rM8dgtXC2bvGYjLWYKsrNUWnzGXuB9knex+gACOML
0ZoHMGV4m73R0O78+xNffLvJDC5dlpNY62z5aJLsDQY0z+IYhgq3QFppjzyMfZoy
NiF/zzbeKiyVOnXShJW1btcroPjIBnA0F+lmo4tdXYm0Lx6XXd0DC9k27kpL+UFl
vvKpbdHQFC2YrDpMWZRWmvOQmsromQ==
=ylTK
-----END PGP SIGNATURE-----

--Sig_/1rPdisC7cVZRToBS1T_l/mj--

