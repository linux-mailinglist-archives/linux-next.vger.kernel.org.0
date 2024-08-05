Return-Path: <linux-next+bounces-3226-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2210694735B
	for <lists+linux-next@lfdr.de>; Mon,  5 Aug 2024 04:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8BA4280FA0
	for <lists+linux-next@lfdr.de>; Mon,  5 Aug 2024 02:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5276A49650;
	Mon,  5 Aug 2024 02:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YSb7lF5y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4478812;
	Mon,  5 Aug 2024 02:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722824866; cv=none; b=pXYL7KX18y3G3D1gQ0E/rJFa5UMDY4h+GBErwfrPQ2zNHotTiYDwZMedpYjKTOuM+s/0FWjC8gW3k3gHVxyPNzLyKdx8FNP6RaVU0SlCiNMyzbHdxwhoEgxBUNDDarxKZS19SvyZ/dmiPYOhMSNQgjZxiJApd19pS5sLUuOMK84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722824866; c=relaxed/simple;
	bh=Nbcpp1mi3tkTAlg9aNv1i2peykMwdpVfHKmbKC4agbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=p9RYXJSq/n01g+hSafqVNpTsBu98OdJyFli8fz/lB7ElQxp94Kz1rc3sZMVuoQBeSxjEFrcbgPrHOIzqKp/zM+KXtuNWNdEyuIoDgeillEEzYzErw/GG1aBPEkI9DqImpPO4GvxrnrdtJLdRErmYjzQs1XlObhUMaBooHqkCYrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YSb7lF5y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722824859;
	bh=J3xQI0ahLIVagsKkWY0tlAm8MaGOr+zf4EVx9sAqUg0=;
	h=Date:From:To:Cc:Subject:From;
	b=YSb7lF5yCWHpVAjEeZeI5zTkXuJ+dVRW8nvw+oEqJ4v5v50K6ngijECwIxqCWVJ/h
	 7wtl3CkL3H4s1jwFrCppZ7jXBlgCzBmKsj3TRSCD6Vo/3W2U6g8MtKbYCw7jad9a/1
	 7aZZFhbTiA6sIVmCM5JOs++4tNePxfKy9c/eqzThFHE/TKMy8GrZ0KHon32LPo36YN
	 m4U8KXHs3HbVUfev8xkJPEkqZFm5102Cqh6no+7u9QKhVffDj74HDD+y86lG7pkOVY
	 qDeh9o7PB8H1KpUSHvu3O4TakxMeqxwZs5M96vr/wVJwjkjWbZHbOpDS0uddpgZchl
	 NxqVTPP0JOziw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WcgMH20TPz4wcl;
	Mon,  5 Aug 2024 12:27:38 +1000 (AEST)
Date: Mon, 5 Aug 2024 12:27:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the net-next tree
Message-ID: <20240805122737.328eaa96@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wyKcAysSlnEeVb39fniN.2x";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wyKcAysSlnEeVb39fniN.2x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the net tree as a different commit
(but the same patch):

  c4b28e5699d2 ("net: pse-pd: tps23881: Fix the device ID check")

This is commit

  89108cb5c285 ("net: pse-pd: tps23881: Fix the device ID check")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/wyKcAysSlnEeVb39fniN.2x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmawOJkACgkQAVBC80lX
0GznIQf+Ii0Z5YWznXk28sHF6ZZ8kcVt2U+v4yqNyq17xQPeq7eKlwAIidW1uKmN
eW6GCNnGOMRKARr++iPW7gmrc/xehXFtUNmvrRufOxV13Hd5C4r0nFoFntPdgcoK
Z9nPiOYrJR6zziS+tpeFvrmXIHF6dtxGZh0EN0Mv9DmiyiOhdBnJt5TbzYC6ojNO
4gVajGqh5Fh3M2eicOypGzkN1ZBnPNR8jOqRfl/p09x+Ajkyw9Ps8Uo0Rq19oT6s
iIvRZaloIugXwU/O4R/3D1TlSKdXUp3AXksa5P4ytEZyFlhfb5yIFq/YbPuZ0vVJ
brMtalEFJ7iZiBqS3vsoh/OiErt05Q==
=36Lx
-----END PGP SIGNATURE-----

--Sig_/wyKcAysSlnEeVb39fniN.2x--

