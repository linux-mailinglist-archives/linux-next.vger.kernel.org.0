Return-Path: <linux-next+bounces-5420-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED8AA31D91
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 05:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A90C18888E7
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 04:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7142D1DF751;
	Wed, 12 Feb 2025 04:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EsDRIKo/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B63271834;
	Wed, 12 Feb 2025 04:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739335979; cv=none; b=dX9XchD1wBSpOrqBDY77vzJhiDTg7mOyDkJYediPa8s9d809mqPAeSWBlMX1d/a+4Ze82sN7BXyJj5BNbGl11IfkvAA0VgsSD52RjwJH4PAnTjz6W0YmYyJvuAhDbuF6WybMlDRnA+n/dL76CI/QrYgyEosbqi0C21ZLsFdjwyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739335979; c=relaxed/simple;
	bh=vEhaiUeWbm3CbrKyZ5HkwDIYljqNyu+i+o5TB+0shRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cZVFHpLmReKd3lxS7FZ3Wnf7l1IfXna3bxYrlyCGti01cNQIJAPpn4G8Cy2d1Jn5aUskQYNPfkDT8l6KcRIHuiqpQYpFkvhiytSZu+GPpoVxf7ii7xARkkTlefaM6VnrPVSc7Y7J6igiR+oL2QfoQI4XFWyeYeQqOuVkioHeT5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EsDRIKo/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739335975;
	bh=vEhaiUeWbm3CbrKyZ5HkwDIYljqNyu+i+o5TB+0shRk=;
	h=Date:From:To:Cc:Subject:From;
	b=EsDRIKo/qy45hi2EHpTGPaVcJX9nzqWcssrlfCk0Iu4Wvh75BxSy9inHvl6t2mLRd
	 rIpSiIfL7X+FRy21dvHbLVyOsBT8/1OIwQfDmZ3JEHSYMSaBgihFr6AyGJpb8YL5oL
	 O48GvFL/YNTMrCJm5vJH2MFQsWvHuwcppJcDNOKZ7dMx0uLpjSNT2sTZy0+saW9s8k
	 HJXlNrJUmadpd0OBfzkwAWUM3gqH5jBUOQPGaH27vM1oqkoVrbuwzV+qusae5MmUb0
	 fGBGseLkk6yAXMbdENXh6WQ15GuCQqPAb9aD8o6ru7ZHZxBi+k7J+sWp3NEAWX75wu
	 FH4C5As2VIS/w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yt5Xl0Z6mz4wcT;
	Wed, 12 Feb 2025 15:52:54 +1100 (AEDT)
Date: Wed, 12 Feb 2025 15:52:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the jc_docs tree
Message-ID: <20250212155253.5bf0513a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GTjfF2+xSkkQ_u_gHlL5g5D";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GTjfF2+xSkkQ_u_gHlL5g5D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the jc_docs tree, today's linux-next build (htmldocs)
produced these warnings:

WARNING: /sys/devices/system/cpu/cpuX/topology/physical_package_id is defin=
ed 2 times: Documentation/ABI/stable/sysfs-devices-system-cpu:27; Documenta=
tion/ABI/testing/sysfs-devices-system-cpu:70
WARNING: /sys/devices/system/cpu/cpuX/topology/ppin is defined 2 times: Doc=
umentation/ABI/stable/sysfs-devices-system-cpu:89; Documentation/ABI/testin=
g/sysfs-devices-system-cpu:70

I am not sure what introduced these warnings, but I am guessing Mauro's
changes have exposed them - the two Documentation files above have not
changed since my last build.

--=20
Cheers,
Stephen Rothwell

--Sig_/GTjfF2+xSkkQ_u_gHlL5g5D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmesKSUACgkQAVBC80lX
0GxvvAf/SDLRIPDPDVjUO8ZSQitp5fCi5X53OTobQv6I0TyRzGLOJEx0xplILlzi
0r1WZh2xRiyQ3DbXvoak3ZO6T0uWAeOp0juzbHZdF2R5TbLnYfPwtw1Z7rcMA8fg
ZwOIava2bbrwm5txoV0ADXduDN0aEBdQJmIj+uYX1acHKxn9GlI5lJSed0YwrXbO
GRO3g3rm6PbVc6G5/xCmizRCvrR4UEiAQNTmAeq6psfSRbjLNHYm5uRpiO/JIv9J
qhbwCHVqHOq2c40SNXVw9JmPCmdVHF1RQZWgaO6S7bDShc4fiSO2EQtLO9ruJFRP
jyUYaqzjwWG/K+06Bx3J2sDEkQUiBg==
=jJ50
-----END PGP SIGNATURE-----

--Sig_/GTjfF2+xSkkQ_u_gHlL5g5D--

