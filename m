Return-Path: <linux-next+bounces-5328-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04690A1CFA1
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2025 04:01:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69E043A33F1
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2025 03:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72A41F95A;
	Mon, 27 Jan 2025 03:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QL7+nzRz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED47B664;
	Mon, 27 Jan 2025 03:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737946883; cv=none; b=qBqg5Nyj9YBHbb/+57228KsklKYV1GGX2YFgHwxfEMKcANBLJK2ZlRg584TnTSl/CEFmjzB7LBAbHMbhxgYPujkLM+R79GdfxGymT2r0Xx/uQD8K6vxaFVWKpeUCHA5U7ahsA/Ywefd4xlTn2x7b71KcUMwuUAZjPdZ7MsVuGIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737946883; c=relaxed/simple;
	bh=ZV1O5rPkbf3qQo8ryBrD2L/6uNnldnzqOaBr79F3jlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sazuYtX0ESb8TNA0y3qYiOmjxJ/Zfrg4Fqo/W5dchzESJjZ1qwVRcZ32L8t3FVmOxk8A4q7TAkjwmkqxT6GY3EhfBec1ZHPmsNkF1pxnXFQrflXKqOc0lBFnjbpLcLEss8BTCtHgCUOGR33BVDv6M1MOrdKuo61Q/Zqtmelos5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QL7+nzRz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737946871;
	bh=0EeyIIyyE/CMPpsa7GrYRwuI6LwE6u2zv/lpdDQ3CBQ=;
	h=Date:From:To:Cc:Subject:From;
	b=QL7+nzRzWrqAOvgV9ssYvy+EmKTuchR4pM8joImyZ6RpDxproW6iWFxn91c2P+hYe
	 HAu2hatJpFr0QWQlHatUeZD6n2dEJvcUBZWQcNCNDFNhDOnXgnz7Ql8hLkrmH0RAHs
	 Dhq8444rnqr/9X0G8HBIfscItQyjVNlMxgqPKiHNal+d/S+dPFCIt9Y/AGgskFwiMk
	 lTlczGDeVD3v5M1BHLDWk0OA6OPbwdFgA9zdqbhWLbqnvAPdGSyvvMzjF0EzvcXa+i
	 G+Z5ki2fwj7QGoi6S1eblDwdjeS1D+JrDvXive/GHXuyow0VksoQ8y1wDPjdBcoClx
	 /pOXrfV5+IM+w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YhCqB6J1kz4wc4;
	Mon, 27 Jan 2025 14:01:10 +1100 (AEDT)
Date: Mon, 27 Jan 2025 14:01:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the landlock tree
Message-ID: <20250127140118.205f53c6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZuFz4B1bv58RN//2n5JvHE2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZuFz4B1bv58RN//2n5JvHE2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  0e8f845926b6 ("landlock: Fix grammar error")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZuFz4B1bv58RN//2n5JvHE2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeW9v4ACgkQAVBC80lX
0GxUtQf/VUDYIXXrFWRyUn+fqi2lo+1aIZE+ZucYOGyqHHfQVAQYo47aqdnTsSGB
deFqNkBWpWQSAztGpRi0RtP29QJXad1vbYZwpyoe2p2CDQx4ssxPPhizLTiLEbV2
Wh+0XB1I9Dh1iY7B49bAh7IyboJP0G0s2DFOWhnkJYC9Frs4u9jxq/fq08OLaLYP
Na9UogCjX/UoMcZ0VpiMdTgXJJb9gDhxhXEpFnURaZBpdmVOZX/yCi935XJrRcJj
iluqfsgT4/JzX/m1Tm73WRcX3EjxO+NbXAar6kwOqhga4E7K52ZASxDTycswARw5
G4X92Ib2sHdmNuvdWmDJOoGe7c7zcw==
=av6M
-----END PGP SIGNATURE-----

--Sig_/ZuFz4B1bv58RN//2n5JvHE2--

