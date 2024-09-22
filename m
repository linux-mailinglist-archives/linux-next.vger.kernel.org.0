Return-Path: <linux-next+bounces-3938-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C124D97E42D
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2024 01:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F17071C20F97
	for <lists+linux-next@lfdr.de>; Sun, 22 Sep 2024 23:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECD47711B;
	Sun, 22 Sep 2024 23:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OTtojBLw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7569578B4E;
	Sun, 22 Sep 2024 23:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727047287; cv=none; b=jcdT27vIrD61f5CBzt3J25TDpF1i3g2ArHukwmuJzBnqSylsZBrkY3gxEU+z6cSShu3gpgzTvl2KZmk5k3GHGwreALKr4KJAv37df41WW8Rc5C6Xk+69axzlz1/dZEn6EA3khZdt8GWNkXbcnqF0T7l3XuFzxeJIYyw7gzLuOmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727047287; c=relaxed/simple;
	bh=wGZlavn6lGXdDjSzf368JhXXnw7YXEi2aNAaa6DsLlM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Er9TZwB9fWqGTqNKRL3g8GtDk4NiQne22HgCkAWZ83v2w9kRbXuKSy8T+UJn25XYsyTiPOkVmQeZsktucXlRgInB+kN4ouLUDTRa0sdH96hoRCvz/QvTYEUEizsq/UJMBnuG6j2m67w1WFvfX+EfGaOzl8PiCbYVsJXpOSJ7JUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OTtojBLw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727047281;
	bh=MzZn+RVr1XubVYjSaXhZ3zRhUYfmumejBBLZtUr2yTc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OTtojBLw/nVkLhnaF+Hln7S6ewBtumbCwj3KFHu8LOReM9SHDCP3nelkh6ZoTyh47
	 CQhnGAZu6iaS+Qio52ArNbMVmCn3LtyjGf7LT0T+IRHAwQnETg+bw2m1zcDjIDw/hG
	 qaFa/3xLFwyy1zhEvfg06rsc7LucprIC+CJVLKB8fDj3KP2X3108xRXKBXbAWwOabu
	 oYoTCjMxQORAFWIyal+JTBF0nGZF4Q7ffI8xywDR23I4Dqf0NlMq3hKIvzzfErI+/A
	 sHp3u+fk1E3lqDmTDU9nTYD4kJbs4dQ6Eh/M2taxZuRDAbda+6oXZItNr/w5YFQmo/
	 xo6UreuRpL8Jw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XBhvh5SQFz4w2F;
	Mon, 23 Sep 2024 09:21:20 +1000 (AEST)
Date: Mon, 23 Sep 2024 09:21:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Wei Yang <richard.weiyang@gmail.com>
Subject: Re: linux-next: manual merge of the memblock tree with the mm tree
Message-ID: <20240923092120.797681e1@canb.auug.org.au>
In-Reply-To: <20240801141047.07940cd3@canb.auug.org.au>
References: <20240801141047.07940cd3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CBshog2uhXxYE5esAgzZCzK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CBshog2uhXxYE5esAgzZCzK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 1 Aug 2024 14:10:47 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the memblock tree got a conflict in:
>=20
>   tools/testing/shared/linux/init.h
>=20
> between commit:
>=20
>   265291d604a6 ("tools: separate out shared radix-tree components")
>=20
> from the mm-unstable branch of the mm tree and commit:
>=20
>   f56de2214554 ("tools/testing: abstract two init.h into common include d=
irectory")
>=20
> from the memblock tree.
>=20
> I fixed it up (I removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the memblock tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/CBshog2uhXxYE5esAgzZCzK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbwpnAACgkQAVBC80lX
0GzEIgf7BveyBzXdgmL1CxBX1BTBE/yTN+AED0WPMs6r3aDz7ZlrQg8TttdmlRrt
vvGFqRkkgc+sBGaFBdzVkSDnr2YZCsui2QA+q4LiPPEYmePguel00Cp+M3DwVFqC
LWpGQjlVAFrEXiXg55pQ4ZMs9CPxtetpjMI6veHAeYjJwBbiLqhyo56miP/akOV+
7mdlD80FFgEFOQ7nfXYy5gzzzjC/sT2nKNCfJ2PTMKbbuiOKDb+T1jL3EYUonlw+
IyAoIBxoDtjKKyZWEBP3MlmqObZMGZdBR5ci/MFGG95fL0t90evYg+JfOQ8RmcLA
eij1+6BvzQq+l7A6iykqU70x4YYUAw==
=o0go
-----END PGP SIGNATURE-----

--Sig_/CBshog2uhXxYE5esAgzZCzK--

