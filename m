Return-Path: <linux-next+bounces-4254-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CAE99BF56
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 07:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E0C92835D5
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 05:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC62B4F21D;
	Mon, 14 Oct 2024 05:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="J5aP7Ye6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6024C7E;
	Mon, 14 Oct 2024 05:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728883262; cv=none; b=A+PGFXito8OLxdDTM2uLqjHwA56AE9+P/xkZE8URuAPhiKF9RxpIzwtU/cnOcnYWLR3M+zxDQdmPEMTqWRxLTabIhzOjJzoU2P54B+L894pQ/05/lwiG5TctiOXECG+RmDrHordBrZ8Y8UNJE/7QGx7QCOUti3fEOCqT6MHoYIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728883262; c=relaxed/simple;
	bh=fO4hKIigFskhfF8QQQcPAfPJlO1JwObBoidmzr2Vpok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MKV3dEockxQwk/I2Pn8fQxhnvuGO11Bhp6SlVY/u71Bq1/zsjDPHRsj0ndWUfBremPkCJ5fiM97bxuiIZI4KBFJ7osE13nLUY4xMNZlPMh5GypjTJiWuxhKUyex2p/oGtnylwWi/MxLWuviZ37P8fOdpcxQJzYoVcOh6dtAin7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=J5aP7Ye6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728883254;
	bh=XqCxUSsCGYQruf+99J4vhJwg9Ry3Bhm1g+ItTYsi++4=;
	h=Date:From:To:Cc:Subject:From;
	b=J5aP7Ye6di1PNSCJhmE4HGJbQiIPPGx0iAkQaqPdwG4ks9exkk+Qr21Q52aIEt7GK
	 Hqi6BmpUX7vuZNpx/WVeybq5Jevbzcr3M1jsq+SCWDRskfQUpe+PR5eMupCCQo107y
	 62Ekf5YmgCrPTqUxxndYzsELDbvzisQSVLKBxOmDWz5QgMDbH96IQ8/obCVSGdRAR2
	 szt/u6mdH8ztzrYzxJ00NQXPsq5pPSLH2QPV/1oWT9SHw7CUS7fIV6FXHP0bIJUGtg
	 1J6SabMWE3awnbFcZPD/dJgKexcrvGWwSrsERQn2t+MwIyapJtdepqvHD2row5jucR
	 VZkZv1YkaWP+A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XRltt20Pnz4wcy;
	Mon, 14 Oct 2024 16:20:53 +1100 (AEDT)
Date: Mon, 14 Oct 2024 16:20:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Dave Penkler <dpenkler@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the staging tree
Message-ID: <20241014162054.2b91b5af@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GHmAruhLwpB_+E5lRxqEjL_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GHmAruhLwpB_+E5lRxqEjL_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "isapnp_read_byte" [drivers/staging/gpib/hp_82341/hp_82341.=
ko] undefined!

Caused by commit

  6d4f8749cd5d ("staging: gpib: Add hp82341x GPIB driver")

isapnp_read_byte() is not exported to modules.

I have used the staging tree from next-20241011 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/GHmAruhLwpB_+E5lRxqEjL_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcMqjYACgkQAVBC80lX
0GxMCQf/Wy2g5vVTpq4+NrH+LziMuts+0sN7DQgRlnwxkz6AP1t32m9yznkA5d8U
kXWotmpWJn4sfyk5viAqDvgl5la3JMWQsSdPjdcXq3fXo5r4x0Dq6uo8Vxicq937
KGvXXN2OblzljfzdSC7fMFJLZk6JXQe6Tq1xpaIhHjDzlYMsT1RX/X8MNiwIvpWx
V75L0PuydQkfmTOPDrQIXPFzhh78Yng1Jp4rAzycklnq8UQQx++dqqJAVk8FXV/N
f9KQqtYiUOBXjC3NjQ0qNUtazg8G/M2yRFCFdUTA9aUE6W4bc9Po5CBrsFIn9Suy
TkPlU0uvwljzc4wl6TiS7hGxU0xSww==
=FqlP
-----END PGP SIGNATURE-----

--Sig_/GHmAruhLwpB_+E5lRxqEjL_--

