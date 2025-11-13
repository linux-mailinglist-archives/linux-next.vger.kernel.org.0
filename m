Return-Path: <linux-next+bounces-8946-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F33C555C5
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 02:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 298D34E1A00
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 01:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F51D2877C3;
	Thu, 13 Nov 2025 01:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XvDoIki9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9540D13AF2;
	Thu, 13 Nov 2025 01:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762998947; cv=none; b=O0XkMtAjhELvvQhW5hwPOd3I4KAy8KDoZAO9bpgfa8hO4gTKFjZJh71TFm5H+VSOMn84cPXeUHyjP+8sy4BepCqr4uLZpY5uk4L9qw854G6FnEnsX6Sdyycx9sCDd01NXQBV5C9YEH5XFCvmApi8LVEf5dL+usUOYsyP/re3eoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762998947; c=relaxed/simple;
	bh=5BdQTbY5JzZxrTjVioBpnM8JNNbVOi9fHhBf7sOmzMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uioN1Es24U9eYa3kTUPu2sb0uv+HNI0PnLpcZnAH4VNE7r3PPVaMAVfBEvbiXBxSywE0dcHefiV6PRu2SYqBh9XmQZZEwLIE3q6+aq436sayZFVayoX5MQgE/XQWr+MekAUx67MDGboPpWRlIjhtkerMIsRoETNSNwWdWRMWZgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XvDoIki9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762998940;
	bh=nto+JLRe2n9yhFuipPFGHy0nAD9xnzvVyLqqGqnm2ok=;
	h=Date:From:To:Cc:Subject:From;
	b=XvDoIki98HMhNZ8vVvwBbUnR46+SZyklCT1nyRi9UwQP8qjAl9+Wmtt8p08M0iQFo
	 yqp/ib4m3gA/x2Q6n1253Is5JEeJpJ1LNcpPSYaTXtdUpi/QLu/czy6JRUZ8ayf/DG
	 TgmD3J2RhMrpx/8oZ8Kgj6NDsKa9lxTWwHnGqX96cHWb6KsaYF6XxJA0xVnr5NHn5y
	 Za0rWv8XsyIc0PySsU88295Vy+800U8xQtFn0KbladCLVKcxBGtsQv6cfLqb75Df2w
	 LEKeEczYHAKfJxaM4euhkIoEl5672C5d7dkt/v9cI56Sfy1p4+LZ6xQvCkqT/WKgwJ
	 nhEoyOp0J13Rg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d6Ndm00Yhz4w93;
	Thu, 13 Nov 2025 12:55:39 +1100 (AEDT)
Date: Thu, 13 Nov 2025 12:55:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jason Wang
 <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of Linus' tree
Message-ID: <20251113125537.0d08e5ce@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RUe=_+qnWjciz9=z8nsvSnk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RUe=_+qnWjciz9=z8nsvSnk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (htmldocs) produced these warnings:

WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:174 dupl=
icate section name 'Return'
WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:184 dupl=
icate section name 'Return'
WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:190 dupl=
icate section name 'Return'

Introduced by commit

  bee8c7c24b73 ("virtio: introduce map ops in virtio core")

but is probably a bug in our scripts as those lines above have "Returns:"
in them, not "Return:".

These have turned up now since a bug was fixed that was repressing a
lot of warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/RUe=_+qnWjciz9=z8nsvSnk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkVOpoACgkQAVBC80lX
0GynoAf/UXFKeB11m078Yr/Ttwk9vA8QpIyLyCvb1QaZFYxNc3QC4p0mFUec3KhQ
lWUTRdDQOafa1Vl6oxiX93A2jlpGaocRllkw+mDhwN/pXgDOfTjbFEJQU/aWfkuD
rajb9c0ZgmKabqXtxC4I/8EGmgFyYxrc5eg1oAAsjEvfFbRK1M9GNrlRlQsDN/jc
/PfK8+R2FXIf2FDT8b1MMYkKxaxZ7WGgttGj07DVa8L0/7yGrzd9LJwA86TnUIib
DCIdem9lR4aZ7p8Vhx33S2sOotcWwdgbRxFfnk7xDgIpO/OfN7F0YujMlY6KHzcQ
dm6ChS7H6H3m9tyDqDcMV3Vzr/FzWw==
=UklD
-----END PGP SIGNATURE-----

--Sig_/RUe=_+qnWjciz9=z8nsvSnk--

