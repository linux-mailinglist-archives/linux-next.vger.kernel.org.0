Return-Path: <linux-next+bounces-7612-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC95EB098BF
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 02:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61B8BA424BA
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 00:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5AE14F70;
	Fri, 18 Jul 2025 00:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WwzB7/7w"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E762B3C38;
	Fri, 18 Jul 2025 00:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752797324; cv=none; b=ATV1GH2M5iG1Vgs4xHXVD4yLyjhXeD/7hyPpRoPMzqo9LaJ+d4bTbN3EwKYWzBfvmacOi5TvzVZoA/lBwlGMm7a/FH3jvg0uttKFulYdeDDvB7QckaQyMZYgYvBA3GrCFYlf+2MJYxutXSnHYzKBIZMNkHY0IK0W4o6MAIdmguo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752797324; c=relaxed/simple;
	bh=jQa0fsMfau5mt8ky/yztS6c1bLnYyDwpxMTZtLSz4dc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nQSAE6d936hYTE5y6pXPVbbxUBoYHrOSPECeRKsqng9cXy0nKz48dNq5ifE8IHv1LWHWcLPDUrJbL7D+qXQqi4tR+KHtOXWiDfTj9PGrkvNROjCs1VUkUaCB/2k1sN3LupdqrerZuxd85dhPaE3Dl54vbq6fQDXJcJSJaXW/mQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WwzB7/7w; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752797190;
	bh=esC4Uup2wEWTmg3ir3LaXHjT0gvhLN8OQc4RHeGGv7Q=;
	h=Date:From:To:Cc:Subject:From;
	b=WwzB7/7w9RqYUxvn4zpSUVFz/TgWywJ1PPq0XO+ANA8tolel32UEPRUWqhKHqpYg+
	 raXfqjXKrKcix71HAUVBzd8WeRQ+WwFcb54DHWHzyD5YviMjdWZz5FelvB/5twu5i0
	 7wMsRJNvxVf+2k6B7IUj0tbUh5lCi/cfHlcXQFC/U5KWKU7fpw0iSGbFXQvYKh+Xht
	 i+vHt89lA82rD40YifStPpCzkv+M8WZGSbiIqpMQq1gv46ERBfoFIc6hbNOleJdGJK
	 bxXKxF+ayG6er+2MhxOJi8bc5mtYDFqaGS/SZYG5JMqlKBSDo4vNgUHRvM+fLAi9RG
	 27I7T4GDY5aYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bjqpG4qDMz4xQ1;
	Fri, 18 Jul 2025 10:06:30 +1000 (AEST)
Date: Fri, 18 Jul 2025 10:08:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Chinner <david@fromorbit.com>, Carlos Maiolino <cem@kernel.org>,
 <linux-xfs@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the xfs tree
Message-ID: <20250718100836.06da20b3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9_/vyAbBdNaLJaIxMSP=2c=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9_/vyAbBdNaLJaIxMSP=2c=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xfs tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

fs/xfs/xfs_notify_failure.c: In function 'xfs_dax_notify_dev_failure':
fs/xfs/xfs_notify_failure.c:353:1: error: label 'out' defined but not used =
[-Werror=3Dunused-label]
  353 | out:
      | ^~~

Caused by commit

  e967dc40d501 ("xfs: return the allocated transaction from xfs_trans_alloc=
_empty")

I have used the xfs tree from next-20250717 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/9_/vyAbBdNaLJaIxMSP=2c=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh5kIQACgkQAVBC80lX
0GxuuQgAgpfHS/UXVp3Po8lBi3mwJJqKaRY4r3BXdeH/kh0tJWaRWpT4EvgpfbLJ
PSCEuzY6pMDn+Vb1f187A2Cub5gqBxyUG6X6aijGZkvOQskIw4JgiukpCZ21fROC
uWeKqhIvbDtP64vWvuoZ150xTyDMj3MXxHAkgMGvYEWGoktQ7YxeslaQF4/Uh77t
A5Rh7RKFglLWfwOZ73iN743QL+bP4FRHFZky1KfoqapNwDDAXT5LaFU+5TDsuEBl
EIk4PY7/0WwenZUJKNt3L+WnFuVMgs99VRwOiE2ePe7sd623Vo8P3zNovjfa9NlR
1jSdFx1vIGT/dsQWI9BSR3PwGTjY6A==
=0R+Y
-----END PGP SIGNATURE-----

--Sig_/9_/vyAbBdNaLJaIxMSP=2c=--

