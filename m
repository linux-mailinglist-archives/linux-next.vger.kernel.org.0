Return-Path: <linux-next+bounces-8703-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBDAC04577
	for <lists+linux-next@lfdr.de>; Fri, 24 Oct 2025 06:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAC013B6C6F
	for <lists+linux-next@lfdr.de>; Fri, 24 Oct 2025 04:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700BC191F98;
	Fri, 24 Oct 2025 04:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="r/y7rmdI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06EE125A9;
	Fri, 24 Oct 2025 04:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761280294; cv=none; b=FN+dmbkt++BZt/NjTUeKzSWH5EtLnEhgBB1mQ0XW8nSl1NhyDBZFwsXSrBbvMhUtwMDCZ97pjkAa/fqUfYMJpBHGkN2iBKVfuitnDwKlDVtGTD1NSz+3DeSNbUoJh18UcrI+Ip7euAgcXZ8Ea2w4ulOMl/XShsKt7nuvCOc0Enc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761280294; c=relaxed/simple;
	bh=yx4K1K85toZ/E5o6jya7RkVBvy1UnqNR5rY2AuzuhCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JQGU+0EMdPrBQy39sGE47ZUAPs6+wfdXk7bXIKaCRvHpATK6Kjv3umJMXGXwr9GT9p2GTmlZzzsAbQF0Gi9h5tUr0HgQnV8b8rjDYW+2eZIFmhXGyGd9lFSVRve3hWGA845a2XKSlcQtY0ASmTbzLXZ+hnoYarIpQE/sbfcd40U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=r/y7rmdI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761280287;
	bh=LSeXo3qHPEQXI4tmXQ+7HeGWbGKJODt/U5vq8NEzn2o=;
	h=Date:From:To:Cc:Subject:From;
	b=r/y7rmdIC3ECGkj4e8FHVLyh8pPQr9Ong4qb2TMVlpbKmyiipESQfGlsdV2eXlnLU
	 CaiOcWdspQ4CDosUj4dqd6bNANsEC1udKMx4QCtg8qbIfP4yyb03mO2LMwUUzPtqYz
	 BREyeGsqXPUj682/Woq5wHA1J8uQ3/Ir6toNQ7upMC2CrC/86O3I17FOX4io4tDbC5
	 roWmKKVPN2G7OAoIq7d7/A91ql6Y9z2603JoAVB+Z44QY8QJNeQSFO1IwsDm3C/z4Z
	 CHzXnCE2uctjMzaqDCSlD0ipHw0ewasgEGxxsyD/iBhIqPZB/YC92ksgLbI/HwDxj8
	 zol2BR387cbaA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ct92l5ZTQz4wCR;
	Fri, 24 Oct 2025 15:31:27 +1100 (AEDT)
Date: Fri, 24 Oct 2025 15:31:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mm-hotfixes tree
Message-ID: <20251024153127.25f42dbd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//8=NumWf4XcSTcOl0zH4O/y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//8=NumWf4XcSTcOl0zH4O/y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  d8858aa4bc8f ("MAINTAINERS: add Mark Brown as a linux-next maintainer")

This is commit

  6fab32bb6508 ("MAINTAINERS: add Mark Brown as a linux-next maintainer")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_//8=NumWf4XcSTcOl0zH4O/y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj7AR8ACgkQAVBC80lX
0GzXAgf43a0ANoIAuzqU0n5fykQfEUYPHhgcW17wNcFYZkNDDT1vHymCuzJDVO0q
hhVmd6nIN06QZ8/tIRRhFVH1rXG6meyzS6DFe0LOLSIQvVWjOumpkqOrR9s+F20j
BYusm9F1c7ZDa2o9cd58oZDvN45nAXaOe+ZRXK01ggmse94nOXo+Df3MyYdt8VuG
LWBaeXDtjUNadYA5OHcx3AkXRJeGSKQMQXWjX6FFQ3xjsQmzKa5ev93CWSNFlQHv
Mz0zLGdoDq73zVS9TTNI8Qq6Y3OLXX7d5sPRhXM0F5tst/+CSnnPhvwlpt+CTNEl
aAls2PRw7Hrv1U8RjdAsey72s6Xw
=w6yn
-----END PGP SIGNATURE-----

--Sig_//8=NumWf4XcSTcOl0zH4O/y--

