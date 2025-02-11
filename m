Return-Path: <linux-next+bounces-5415-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9848A3191B
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2025 23:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EA763A23FB
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2025 22:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F051F3FC1;
	Tue, 11 Feb 2025 22:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rt6058jz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D03272905;
	Tue, 11 Feb 2025 22:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739314600; cv=none; b=RyPHA4BXDY6wfWQu/olZJlWIOg5WquNcZF5kbm3hYs3O+hSiQJ62628DXANEbpm+k85TjqWIO7zBuGq57ZrQ60bWgcc5joqIv+NfoYWlO05fWPLjIyREpCP/kZcG3HwQ/m+KYJnpUyXNF/kwCwZtAOdRhe3podMEy03dYZE4JQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739314600; c=relaxed/simple;
	bh=dYrJuMxdV6jozccHmg9SnWnNVYjGS6AulY33mzIFdgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QjhjLSsSQ6O84JNVChQFLRXxL1WkTZjoSJhGyAEeD0vYqYqd5/be2Z/elbZ5hDasrYDZwgbeE7GgKFRoj/IejMCux3XrWbciDUUqt7bZbuOplEMq8XSCPyP1mpCmFQljrvwfMADHKQO+lTAyeZhPyaCizRoqyRm8TcupzNc0aLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rt6058jz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739314594;
	bh=6L3fCjZVIAkhJkWYXypOk23dzFYJb9vXKqVETgLsesw=;
	h=Date:From:To:Cc:Subject:From;
	b=rt6058jzOl2h12evXfojzYEJGWbjs1mz6SyQFCOD5UFO0sEQub+PeNdoACiliBGzz
	 ZKJjgcwEtCAiBuv3dqP8GG/4wzsck7AYI0wLAyhXASnJEywYlioMX3GtuhqtBlec8j
	 VKIdzfkEWscNJOtlk5+LnuoaqQMhKhlQ6CFP36QwwHI1He+0PjNzo22huWidOCussJ
	 yhYAYXIUUl6dqQ0MGOmU/g4SqSRLwk4W+aQgqGlA1L6LcAYygtzmUPMcMfcA8B22Tu
	 zXpb3OUBo4w1AEPGv3XeiHugqomJ3zmNmsiG8Z40je4AwcHYHST4zuefbKGinSVgWe
	 nl+jygUBw11Xg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YsxdY1vhKz4wxh;
	Wed, 12 Feb 2025 09:56:33 +1100 (AEDT)
Date: Wed, 12 Feb 2025 09:56:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dan Williams
 <dan.j.williams@intel.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Jeff Layton <jlayton@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, Joel Stanley
 <joel@jms.id.au>, Kent Overstreet <kent.overstreet@linux.dev>, Linus
 Walleij <linus.walleij@linaro.org>, Nick Terrell <terrelln@fb.com>, Vineet
 Gupta <vgupta@kernel.org>
Subject: linux-next: trees being removed
Message-ID: <20250212095632.6bdd50d7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Idhm0bL.jX/ZPT8E5ompBls";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Idhm0bL.jX/ZPT8E5ompBls
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

The following trees are going to be removed from linux-next because they
have not been updated in more than a year.  If you want a tree restored,
just let me know (and update its branch).

Tree			Last commit date
  URL
  comits (if any)
----			----------------
arc			2023-09-10 16:28:41 -0700
  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git#for-next
file-locks		2023-09-01 08:09:48 -0700
  git://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git#locks-next
fsi			2023-12-14 19:44:11 +1030
  git://git.kernel.org/pub/scm/linux/kernel/git/joel/fsi.git#next
  ec084e4ec314 ("fsi: sbefifo: Bump up user write cmd length")
  f7236a0c919e ("fsi: sbefifo: Handle pending write command")
  c5eeb63edac9 ("fsi: Fix panic on scom file read")
gpio			2023-09-10 16:28:41 -0700
  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git#for-n=
ext
header_cleanup		2024-01-15 15:52:12 -0500
  git://evilpiepirate.org/bcachefs.git#header_cleanup
kspp-gustavo		2024-01-21 14:11:32 -0800
  git://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git#for-ne=
xt/kspp
tsm			2023-10-19 18:12:00 -0700
  git://git.kernel.org/pub/scm/linux/kernel/git/djbw/linux#tsm-next
zstd			2023-11-20 14:49:34 -0800
  https://github.com/terrelln/linux.git#zstd-next
  98988fc8e9ed ("zstd: import upstream v1.5.5")
  40eb0e915deb ("zstd: Backport Huffman speed improvement from upstream")
  3f832dfb8a8e ("zstd: fix g_debuglevel export warning")
zstd-fixes		2023-11-14 17:12:52 -0800
  https://github.com/terrelln/linux.git#zstd-linus

--=20
Cheers,
Stephen Rothwell

--Sig_/Idhm0bL.jX/ZPT8E5ompBls
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmer1aAACgkQAVBC80lX
0GzX4Af+J6yS/VVn4Oqx1BqWRU7pW6/efAwut9epDpIG6sYDmu3b7Vl/SMw53aBi
koFpzUOFX61b+OWZH+1/ugVasfE+mGO2sMUC/apiOwyAfqB0NzcgPcQBOcY8RxYB
lpLD+feAd8bCH8Ypo4//6GywVJx38Hxy63BTohs9d14m9P+XTXi+OStj1x5gCj/y
PuTne2xEujOjtVcOeCcmySLGFpk9T9G2S05CkCn/dVp+UIcPHuHawQXdgnDQptmC
EXvnMW+R3XtuwsR5UEAWj4tFXBFlhzP3OjzTNqX9SppSR2zAAai4D+WgTg/Wf/zz
545y0rq3dDitswEsI0OGfpbFvDlMXw==
=DIGw
-----END PGP SIGNATURE-----

--Sig_/Idhm0bL.jX/ZPT8E5ompBls--

