Return-Path: <linux-next+bounces-4399-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9319AD8EB
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 02:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8749A1F22EB4
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 00:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93DCF250F8;
	Thu, 24 Oct 2024 00:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mwwDnS+B"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902CF22EED;
	Thu, 24 Oct 2024 00:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729729522; cv=none; b=qtWGlUTpXYVixBZ3DI9TwA4RspkZhu14/uVpdaVnK1GcxWvyRozhyZarMc81OzYCl8wu8KF+wQMhbYiVKUbDO23pFzx/t8WaEk7fqf1kYcD4j5igYGu3wR1hWtM13+f47v2FKlwD7atFDNCI+1kTL73n44L9kfWj0SNR6QtgxsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729729522; c=relaxed/simple;
	bh=Qp7+sI7822Uboxsc2K2yFkQKm5T7JBfpwmgTxdoDqG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=szE/YDvaE4WkuZaBMXN70KVEOFTFqWlYW7qPwUIQ05pZw+yHOtqDDdLMyqvnq+KlvNhmIGQXccMjEALi9d5UwpNqPfbpe5YW44K8l6gI8KPoMQZBaG2wrfoY4mixXGtqP2r+s+WawumgBkcBcD6CuiQP9TgJx6OBUEvaqJAUm+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mwwDnS+B; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729729516;
	bh=G2mmw/Pg+MgHd1rwEcUlsatfW1c8hXEYgh8Gu1ssBU0=;
	h=Date:From:To:Cc:Subject:From;
	b=mwwDnS+Bp05VcjNWpFA490rf1m6DL6zU7nuOpFI1ivrSHySLPwXCJ+2XvAKCCECTd
	 +4wE1oJTD0+0hmOOmThgoXnsuwLDLhdna5CJcq/q8KI9wNhxYqH+F9atWsejpj1JRJ
	 oSq07KxAW4VSPk/KfNhf+NGwD65FNbXR3ky/M1xfguZhn92EJhiWGop1Qiu0Ug+CJo
	 6LTH5tf5SLrldU4t6DcD0PDI9MTHiNOlQVJNVu4n+K5uZcZcOuIebSSa3NcBmqSGNe
	 3680ltuSiTPaO57qci/32VraC3KfByy1SUT1Gt5GabRh8oMichD2LiuG5c5sQa22qn
	 1KUgLjKug/PwA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYms75t04z4wb1;
	Thu, 24 Oct 2024 11:25:15 +1100 (AEDT)
Date: Thu, 24 Oct 2024 11:25:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kw@linux.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pci tree with the pci-current tree
Message-ID: <20241024112516.18b226af@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=ycD5/.VyGWRYWev=zfTbvE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=ycD5/.VyGWRYWev=zfTbvE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/pci/pwrctl/pci-pwrctl-pwrseq.c

between commit:

  ad783b9f8e78 ("PCI/pwrctl: Abandon QCom WCN probe on pre-pwrseq device-tr=
ees")

from the pci-current tree and commit:

  98cb476c98e9 ("PCI/pwrctl: Use generic device_get_match_data() instead of=
 OF version")

from the pci tree.

I fixed it up (the former commit includes the changes from the latter)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/=ycD5/.VyGWRYWev=zfTbvE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcZk+wACgkQAVBC80lX
0Gx1gwf+K8keTk9vAFBXblDTXjtvs7w0gswIuaFlzyDsrD5RN4+imQa4HXj0Zgo9
EQmMOenby8QGVq1mcpcCT/h9w5Hs/kYSogAjakfvZ+mE5Qpip5BWfPIkDZQthyZl
7jId9ncIXR7G6TJqXA1fS/fJ570oST6ffgE2N7Z7fM7iNcoQoyCvpROCj7q8m20Q
08tn7tu6eu0pY8PQJFlYModB5kvaw6tisq5H2/p8m9QAQBzR13fTqu8hdNrUA1kj
7vCd1ubPeAwydYWOWhZAE70h3guwZ+z+q4Cg3xNrjahGVNh+VRkcN+vNRIY5Ug72
Z7NW1daVYhQ84P3lG2cBPhjdmbG97g==
=gy7H
-----END PGP SIGNATURE-----

--Sig_/=ycD5/.VyGWRYWev=zfTbvE--

