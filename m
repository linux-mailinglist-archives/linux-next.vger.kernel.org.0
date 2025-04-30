Return-Path: <linux-next+bounces-6460-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 210A6AA4908
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 12:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57DE916B5F0
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 10:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F6925A2CE;
	Wed, 30 Apr 2025 10:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MUTYhPTP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E38925A2B9;
	Wed, 30 Apr 2025 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009756; cv=none; b=YCZoW3l2ba1/hI0aaPYktJQ2v6NL/5MnTZ7SwDg8OHDp/ONCkNqR7pAk8OaTtC3BC5/QzD+6ASJ1kZzv48O1uuLLks+pRQWz20qjTOdSbgs1AfIo8/9vUdJFi90/CpQfizOvSPPDU7k33Ppd7RKQzY6kF+KP1tdqwPonGuIc/ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009756; c=relaxed/simple;
	bh=zxQ6fGKI5m58QThT5LuBA5TVYnM3IRxIYodE/yq6ZDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jvwkeXkI7BaopCLNsFtWHbHYHf/LeH2hpiO3ylJWrqFA9din6b9oNCiM36wmfHxZMCG7uE5h0tgb6J6/fu1RZehSVROf+9wNoCdF2HNjQ47sbnve5chxZdn11IwllPydbjSC7+0+tPoXXmr1wZefgm2gamkEgT8JQ7/9E1Xe7Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MUTYhPTP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746009750;
	bh=a4db0jGbjZG5YpSE6E/3f/+hk0TLsCY4qxjKwbGG7Kk=;
	h=Date:From:To:Cc:Subject:From;
	b=MUTYhPTPHBapHjwKgZYjGE+cQkXp1mY7eQ0P9unzC2MyN6ofQD5HKhSaG9CPTmPqq
	 49CtR0P3B+dd3rDJ79Ay0nCffsE9bLCZq0/FzjpBfT7eOF7melJu73gpZGobdo1/xZ
	 G9tuPY0N5fo/hYtsMMUG+K55rr1ZxQtfhYRZ+UIjJ5cUDWpylL7c0M596GOemV7fFR
	 WX4loIAREJsNdz4z7Bv36J3GACZpGfDf9zdTto/FQkRdDFpN056qi6AF4SQJ49V9PS
	 d0z0/mv9a1tfsSQFLkZZOvppxZlEJeaitS0kAdSYH50AMNBiKUzqF4lPAKs+G059sN
	 bW/svvXluEqpA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZnYfZ0ghQz4x8S;
	Wed, 30 Apr 2025 20:42:30 +1000 (AEST)
Date: Wed, 30 Apr 2025 20:42:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the f2fs tree
Message-ID: <20250430204229.3971ac8a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KgYFyJ4+Pb_h9+xtV.VZZLK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KgYFyJ4+Pb_h9+xtV.VZZLK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the f2fs tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/ABI/testing/sysfs-fs-f2fs:850: ERROR: Malformed table.
Text in column margin in table line 5.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Flag_Name                        Flag_Value
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
SB_ENC_STRICT_MODE_FL            0x00000001
SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [docutils]

Introduced by commit

  0d56663919d2 ("f2fs: sysfs: add encoding_flags entry")

--=20
Cheers,
Stephen Rothwell

--Sig_/KgYFyJ4+Pb_h9+xtV.VZZLK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgR/pUACgkQAVBC80lX
0Gy+HAgAnGWQ4LgGxbyO3Pdkr0++udaLGPcW3daSLNYVZThik9G6J9kJU76xKZy7
1l8OyVwe2064HIIxKzJ6zFURukmMVxj1bSxB9yRrU6wu7PkQ2gJXwPlDbmcGr2ZB
Ja4zuDi2pR2sivtjTImjMa5HzArruoI4ZNaVpfcHzrf7TiazFxsXZ/gwT1N7pyay
TCAcpYV+AUP1xngpoyBGub8WWSjO95tJqpagZxo0t4tjUGNVID/5+Wt83zygxB8i
Q7Hax/Wrfp52eNDYbd3i/YRMrZi3UTMTt3sbCg6Hyu+ib+G7R5Fw+cFVUiQcXv++
Q5QSPcp4tA4u9ocCjKa83MiwH8YPwA==
=wDMN
-----END PGP SIGNATURE-----

--Sig_/KgYFyJ4+Pb_h9+xtV.VZZLK--

