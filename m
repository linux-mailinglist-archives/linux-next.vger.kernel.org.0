Return-Path: <linux-next+bounces-3897-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D121097B59B
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 00:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82E9E1F21F2C
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 22:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E02818B46A;
	Tue, 17 Sep 2024 22:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GY6/WgQQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8E015B0F2;
	Tue, 17 Sep 2024 22:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726611211; cv=none; b=VdCbRVgkNMhoZvEPX1+C0R6aOg6fO+92MSdUss3JlMZZllx4IbQQS2Gr5OpMqDUpooyWH2RHfeFkgLButJG6yXJnkja9ujNzLNxO22LNPK/Y+6pPWdI/O948LcxzsdMD32u7ViNQM2tS97oa9LES11q6U009UlC7Tm7Dozx1B/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726611211; c=relaxed/simple;
	bh=ygH9Je0RWqE+9Zl2PMFWYOW6l3+zWxd+lzPKFxn61fw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k1mRZJ/GEv5B7V9OLLwh4Gb7FG0L+oqSVslwo5ZVrE+cWo2SZ2rfED4Mbk9lhj9cAci3fvJBQy52ISRC3x8oYTwUe2sHzU5y6B5SbsusYpMQ7e/Pj1CiBKdqvX4GeRasnBlqgMrsjqoOJkBI96LzRwHioSotcLjNtz0Qn7gX6DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GY6/WgQQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726611204;
	bh=TDZjQFU1EEtnXlsLV7wF7rYgn/RFoMLvnlwlfiu2C+0=;
	h=Date:From:To:Cc:Subject:From;
	b=GY6/WgQQk4pK5GKS9qlJU535tIO0GANy0NyVnQLimNF6GyY+JbhYi5acWdP4dh3FY
	 IO8EAzXsb/T/IYxhCibNdTXT9+PKtXn5GX0d5NRf+bWoBmf935Gcs6g8DyI8yqMQMd
	 5bK7ob+HHRGEj4qIR3OV1YBaKOJs8YHidovW49dlGPQtAsZleczIau2jZ9cCyGxZf4
	 uEsEphITYdKAVhhhUuemQ7QwT+F6BtZYpEANPVF3JuqhNrWEiJaS5BZbXKLoglKsj+
	 dAiTu5eZGxApZD0cChH3Q7MCt3YDrC8MGOCDZ4j2ClBzPLIfDDsDC8n+az9VYEtIgY
	 +wX7/8PA1uFdg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X7bdc0f0Vz4x8C;
	Wed, 18 Sep 2024 08:13:24 +1000 (AEST)
Date: Wed, 18 Sep 2024 08:13:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Dongliang Cui <dongliang.cui@unisoc.com>, Zhiguo Niu
 <zhiguo.niu@unisoc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the exfat tree
Message-ID: <20240918081323.760ac7b4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NsSsJYJ/jIOwns0la7wFHF.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NsSsJYJ/jIOwns0la7wFHF.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the exfat tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from fs/exfat/inode.c:18:
fs/exfat/exfat_fs.h:13:10: fatal error: uapi/linux/exfat.h: No such file or=
 directory
   13 | #include <uapi/linux/exfat.h>
      |          ^~~~~~~~~~~~~~~~~~~~

Caused by commit

  0636fd914f77 ("exfat: Implement sops->shutdown and ioctl")

I have used the exfat tree from next-20240917 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/NsSsJYJ/jIOwns0la7wFHF.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbp/wMACgkQAVBC80lX
0GxGbAf/fv5sEQ+EuHiBypyPnkTyPE1inWD3LTFBDxTfTGuAu2RGBqmcBDiiXkP4
PtBptsLqgoZEgyqHZ9Vy/jUFOLJZrJII6ufRYXuD4tyfAip9+OPq3XIejnIdaiAU
jE/qsryedIHMGgsokzm65R+Ca61S9OR/YwjUaz0YhnBWCO/YR07Hr4NzOEHPM7Sx
i+UKEpyBV6mh9qy8/bI8DSorcF/0EPEBnoVUaVfcp8HbzV5S6bwr8ks4raJzFunB
u12qcwUtGMvGiFQOU4kbjXz9Kg/KuaO51Nc60Ix6WAvV1rbce/tXDYZ9QqzouH7q
JAOntLE7MKD7q+PI7zghW/getP2aMQ==
=TBxD
-----END PGP SIGNATURE-----

--Sig_/NsSsJYJ/jIOwns0la7wFHF.--

