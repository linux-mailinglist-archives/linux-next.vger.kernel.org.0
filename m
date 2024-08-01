Return-Path: <linux-next+bounces-3191-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A76EB9442CC
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 07:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E56FB2202C
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 05:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8315413DDDB;
	Thu,  1 Aug 2024 05:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BO2HFfgF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CFA13E03E;
	Thu,  1 Aug 2024 05:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722491310; cv=none; b=EAnM+xfZgFrVK8tT4F2Qv0GP+gqgizkQD7KXJ4sC7bMoacIx2xSDcLH+7Ah5cXr/raAydlfImoMnBkBcRE+NEhHAxD6ZGaQtX6/b6cGO2vyJ2voRzupE0bJeTqR4FEB50QrRB3oC0Y3uG7ilgzrs9lSLLQIkoKIV5505kWxXm1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722491310; c=relaxed/simple;
	bh=z2A5pzM7jjAUuMokD+IgJ/IvXcqtxEB0CwpBTSvwGr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jfZyPGebpDY/X0e2ybkzMNhmQ5seeW3zHJcz6FR25MLvvDJelEZOiQ9omxj6EqEenIVfgQOSoPBB/wKQ0BDq8O4O6SNLIHFwjz2SuFB46OOg/WwejEXpP0u0UaWvbW0hquCqmCMZQvw7Gyyc6AwyrT6lRM42Cbg7SvDBGh4Zj5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BO2HFfgF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722491304;
	bh=d4I6pz6iZ9iooNa+8AqRg0tOxyUtpfZHVrW4gjMiYSM=;
	h=Date:From:To:Cc:Subject:From;
	b=BO2HFfgFBs1J67CQMiASS3N3xVhFYcilQgt/WcwqYyYufb2UkYbTpCwLuTtp0eM4V
	 fdwZdcHTzxGGipgHETubsO1Kw6ct7QXcMi8JwdrX74grmvClae21wkI42I22FcGY6f
	 3/cSBii357Rkz9H2GdzZR4x0M+RsuHKg7Fm5SAvHA77g5iykAbNqWMdvPekcyvuDd0
	 UPBzEUBsTEh0oSO51Mj7saJhHbZLjXuhyL3n0imW5c21n3zWnmS+ULbZ8VT3PyxN3v
	 m8ZfOIs6FN9dCdyNrZ1vETpkl1ydpzp1Y71Y/AVqhh0GtTJTnmtWcUsvMwW8tYLXsl
	 EIB8zK+TrA1sg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZJ0m2ZtPz4wbv;
	Thu,  1 Aug 2024 15:48:24 +1000 (AEST)
Date: Thu, 1 Aug 2024 15:48:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>
Cc: Xavier <xavier_qy@163.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the cgroup tree
Message-ID: <20240801154823.358ff7b4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U4uhjvznJAJV3DQDTv27QKZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/U4uhjvznJAJV3DQDTv27QKZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cgroup tree, today's linux-next build (htmdocs)
produced these warnings:

Documentation/core-api/union_find.rst:22: WARNING: Definition list ends wit=
hout a blank line; unexpected unindent.
Documentation/core-api/union_find.rst:66: WARNING: Title underline too shor=
t.

Initializing union-find
--------------------
Documentation/core-api/union_find.rst:74: WARNING: Literal block ends witho=
ut a blank line; unexpected unindent.
Documentation/core-api/union_find.rst: WARNING: document isn't included in =
any toctree
Documentation/translations/zh_CN/core-api/union_find.rst:6: WARNING: Title =
overline too short.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
Linux=E4=B8=AD=E7=9A=84=E5=B9=B6=E6=9F=A5=E9=9B=86=EF=BC=88Union-Find=EF=BC=
=89
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
Documentation/translations/zh_CN/core-api/union_find.rst:15: WARNING: Title=
 underline too short.

=E4=BD=95=E4=B8=BA=E5=B9=B6=E6=9F=A5=E9=9B=86=EF=BC=8C=E5=AE=83=E6=9C=89=E4=
=BB=80=E4=B9=88=E7=94=A8=EF=BC=9F
---------------------
Documentation/translations/zh_CN/core-api/union_find.rst:20: ERROR: Unexpec=
ted indentation.
Documentation/translations/zh_CN/core-api/union_find.rst:21: WARNING: Block=
 quote ends without a blank line; unexpected unindent.
Documentation/translations/zh_CN/core-api/union_find.rst:40: WARNING: Title=
 underline too short.

=E5=B9=B6=E6=9F=A5=E9=9B=86=E7=9A=84Linux=E5=AE=9E=E7=8E=B0
----------------
Documentation/translations/zh_CN/core-api/union_find.rst:51: WARNING: Liter=
al block ends without a blank line; unexpected unindent.
Documentation/translations/zh_CN/core-api/union_find.rst:55: WARNING: Title=
 underline too short.

=E5=88=9D=E5=A7=8B=E5=8C=96=E5=B9=B6=E6=9F=A5=E9=9B=86
---------
Documentation/translations/zh_CN/core-api/union_find.rst:62: WARNING: Liter=
al block ends without a blank line; unexpected unindent.
Documentation/translations/zh_CN/core-api/union_find.rst:66: WARNING: Title=
 underline too short.

=E6=9F=A5=E6=89=BE=E5=B9=B6=E6=9F=A5=E9=9B=86=E7=9A=84=E6=A0=B9=E8=8A=82=E7=
=82=B9
----------------
Documentation/translations/zh_CN/core-api/union_find.rst:81: WARNING: Title=
 underline too short.

=E5=90=88=E5=B9=B6=E4=B8=A4=E4=B8=AA=E5=B9=B6=E6=9F=A5=E9=9B=86
-------------

Introduced by commit

  93c8332c8373 ("Union-Find: add a new module in kernel library")

--=20
Cheers,
Stephen Rothwell

--Sig_/U4uhjvznJAJV3DQDTv27QKZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmarIacACgkQAVBC80lX
0GwinAf9G6hfJNPT2rVYWfiZgYuQKx4xFg28s0/uVuJJQYfuwgq2R5NXXbCMx3dC
ueFMcpz6GDiOP+j2XF3r7jnWsJt5i+RfBwAbbgXJKlYVHpqAOpODeJBbX7TRX9HW
q0+m16FLerRyV+vx/kRaTla5TktH7ZjzGg8fP6GGtIg0c6sMhBJp6PQ2jol30CHK
wJ5T00NtSPefQkoK21X2k8iopwpjEV00FLy5c0ssPu5fP+FSSOCjopIC7qZXToS4
FStKPxYpp/1/sSxg7smxlyOQ2TYNgGgBk9GgzgsioBsF6bIp/4K4HtKmzs7lqWhZ
ei6ZfzCS5S7WQbgbvtV+6ve6VX/sNQ==
=56uj
-----END PGP SIGNATURE-----

--Sig_/U4uhjvznJAJV3DQDTv27QKZ--

