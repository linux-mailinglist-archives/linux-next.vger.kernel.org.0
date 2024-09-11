Return-Path: <linux-next+bounces-3767-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A43975D4C
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 00:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D89B2856E3
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 22:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B07B157A5C;
	Wed, 11 Sep 2024 22:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bYoVOgLt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9384A155CAC;
	Wed, 11 Sep 2024 22:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726094063; cv=none; b=sS7lS44Nhw4OChWZihDqw1tM7O41wZ2spvVv6xS5BRqwn98Zt8S9sywKeX/rKhMtzEpHz7SuUnLQFFL4CnHTNlIzAgjbQSXxFru60+JExg8NEh7yXR0yQveAZPqha/gGA/NFv7Rd1MA7VdqqIDNki0c4FdVNnYCYIOLjXozvQXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726094063; c=relaxed/simple;
	bh=nKqwEkb4LntIPvVMgkjmfg4BUgBrVlL5xiSpmKOGmAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ck4ZV057ggv+lrP2LETW9XG8w0lv1XGwycqJcfPMMEQMyDx7IixV49yOM7mbAxnWggc4HzyJktHD0vl3fOZgwgbkzuZyqlfs6TrpUQ70YXCECm8CQ3+nARhcu4g2hnCQ7r65wmDVwHfGi3rbGhDbHf697u4xQUOhMswRJQncz8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bYoVOgLt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726094058;
	bh=gFHZZRjhHDhxgX+kM6Ds21kafPywieussi7TWZr98G0=;
	h=Date:From:To:Cc:Subject:From;
	b=bYoVOgLtPJucl5or0LwBHx/OW9yT/53VkUa3oAaHnZfRSOdTPfyOV5osG34mflKGK
	 CingbHxDDVLMsQzsf4zJiKeiyyUTq5s9GKIrMfurMz3NJ/pYa8FEpTI5dvMa2NQSB3
	 BzvdUxHHap63hdRWAnKDUda3IPJL7s2zYOt+KFSHQTY4BM84UBDgd5OYW97UYte0Om
	 B2nDl8Bko1fnzUlogrI5/t8welnodhJkwYg9yk6CuimhK/8/nPzOd4xJGZlGgtGV94
	 jWxuLgb4GC53+0ziy9v6txxLPGkj4crVVt0GYv0lfpNBbKAJpVYDmVmO3yVL99HPpv
	 1tBOnCKJl++Tg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3wNV5B9Nz4w2F;
	Thu, 12 Sep 2024 08:34:18 +1000 (AEST)
Date: Thu, 12 Sep 2024 08:34:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the loongarch tree
Message-ID: <20240912083417.581ebc91@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R+.bGsbQZcDZ._SSLiXs.FI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/R+.bGsbQZcDZ._SSLiXs.FI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  a1654ae45ea6 ("LoongArch: KVM: Add irqfd support")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/R+.bGsbQZcDZ._SSLiXs.FI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbiGukACgkQAVBC80lX
0Gy3WAf44y02xCiLJ5n94R54ZGHpk6T73S7ZA68MMO+4BP5Y9bgscvu36E/9mJNo
jg48oNNrcnJ5ofKsEqDb3kXeULjiZI8Lr6XIL9Kz/ZkupLOL0jGWsbksnzF3Gfs+
AhAbojfVArMMBm7aQKt1iN4SRiU2aLPLaKbJ7Sltc/WTmfm2ZFkOlmuaUcbA/u01
WHmVz6J6Yp6nhnMmDyrf8M1rNbPjWG2ZbEwbUz387R/fXQvHdrea6Y2EW/D4kz6e
YWKV6izYnZ/dOiNzl4xPFxwukZ4k+bPScHRFSNt9OHWFBh5Y9fGP6kgZjJ8RV50l
cZ4jmFiiQ8mG0rXfprXow+XHggH0
=4FKe
-----END PGP SIGNATURE-----

--Sig_/R+.bGsbQZcDZ._SSLiXs.FI--

