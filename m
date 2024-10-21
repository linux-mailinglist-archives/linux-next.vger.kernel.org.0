Return-Path: <linux-next+bounces-4356-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE199A91B6
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 23:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CC2E283BED
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 21:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602EA1D0F76;
	Mon, 21 Oct 2024 21:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="j6ueBLLr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56DD433D8;
	Mon, 21 Oct 2024 21:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729544469; cv=none; b=JopoKD/KuA5DpQAA/+W2llMzDyW2/pc2JC7BadkCbdDkbMT+AwD6a4GxYBCFogondmG1WMWc80ggR8WXAn88YzKioyVtT99g7KG86wCUP0N4yecez6edtepBmQrahAHMTRGTPwQXKI3FqN2Qw+7wO/s9NzmJVOlWEhGOiNLPZKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729544469; c=relaxed/simple;
	bh=eCTQOMlKr1XeJfb7E5Eyg2/tKFw4bMZz66LC7peR5R4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=q4o54Z/4B0I82/qcvS3xiwXyOd0tVmdNG/iV/apbj7P19SrfU1JJDsROR29Z33dZMiAtiOGLKNTLMOdbo7gp5nBDsjTxhC/AVtOWMXTkWKB/zMjrKTV+R/0egPMzZ9TRbHf5m+HhJyZDElOyz8fmfdxh0jqp/yDebMIVlvvbbU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=j6ueBLLr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729544463;
	bh=HV/wOUyVx06+wZqXxg1qGFVkRmfKo7IJiUKoNPJcp88=;
	h=Date:From:To:Cc:Subject:From;
	b=j6ueBLLrF4rBTzu/eIagKbRZ4EuO+wjd5UXndZujuYeSKfJi/OrwoSeRYdYp4+8wk
	 fclshLo+Ixaz+EpnhOInHzVECsSqKbeDr/pvB49R+L1aZ81B6QGoUocRpZEgU53HK1
	 T/hBsD5wUQcAhvIvLdEStPu1EoF7iJ4wfnZPhEw67avg4LMdUaZIdwG/KmhDJxt1/F
	 jeJowMXIswjNlg19BXzjsH38RQF8qO4PRhruaM+LcXc0FMP6DDO0MuoW7cy9F4q77o
	 cfm7ITpjx4Su0Nv3+NQuseyxkQbJk7ZBFYaJwFuid4XvXqtkwuHX+Pq7E4UrLbPj9f
	 hOofC3WnGSs1Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XXSQR32fPz4w2F;
	Tue, 22 Oct 2024 08:01:02 +1100 (AEDT)
Date: Tue, 22 Oct 2024 08:01:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <didi.debian@cknow.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the rockchip tree
Message-ID: <20241022080103.332d3024@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c5a3fagidrDSg+kMlAyF0JZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/c5a3fagidrDSg+kMlAyF0JZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  273070dad96f ("arm64: dts: rockchip: Correct GPIO polarity on brcm BT nod=
es")

Fixes tag

  Fixes: a3a625086192 ("arm64: dts: rockchip: Fix reset-gpios property on b=
rcm BT nodes")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 2b6a3f857550 ("arm64: dts: rockchip: Fix reset-gpios property on brc=
m BT nodes")

--=20
Cheers,
Stephen Rothwell

--Sig_/c5a3fagidrDSg+kMlAyF0JZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcWwQ8ACgkQAVBC80lX
0Gz3+QgAoI/tDHtoVMbzkzewHVclUaDnji86/MDK2n4WXNRqC3r5C2lCUFPKARdo
imTD0GcQRptkdOxGjSFDR7lry2cM1bvpKX7H+dnz5wBGi8WHlzYF5It8Ff/JJTD0
GvwB5aEUimVK0uEAnXqqkPVebnwDgKw4qQkghhjkI4CCaC+rpYS+6kv+l5+cB4eC
ktupqBlYs3jMXfqJs0np1PHPB8MLh/bKM4XlXfYcqih4cmqwr0Z64o99Iqoc+Wsp
iTeXZrR1YaOmqvg1mN57Le2TjTe4cVpRj3TIl5oQtpqh8clBBsg7gowgjG4/SIKL
p5RgGn31T8MU3O5035bftw9KQ8dpbg==
=N8/X
-----END PGP SIGNATURE-----

--Sig_/c5a3fagidrDSg+kMlAyF0JZ--

