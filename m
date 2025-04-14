Return-Path: <linux-next+bounces-6212-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8259A876EF
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 06:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAC7B3A69C7
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 04:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBAB9175D39;
	Mon, 14 Apr 2025 04:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="I8m851z9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C885155C83;
	Mon, 14 Apr 2025 04:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744604866; cv=none; b=l/xpVbX6p830aTEJz6wb1hS5vkalOQlvFWlbZbL5l4Rz4Z+Ot63IB/Trpfh8pDKEg0bzb27CSrvP7z/H4i4RLei7rMJ6T//DsGzXCu7JNq8/vhB7oOpo1ILijBzP5ucsnk2QRN1157XHmnha5EDNye2s/3ro+zT71ST+brDbphE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744604866; c=relaxed/simple;
	bh=ANkMDoeKwRx61nJjsgTo5/adP+NJVOloiogx6HuztBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LTCR1QJHaQpsI3fUDzvgL4lOXkva2bm0SJwepvzS0djFpUFpzNfQjXlBUTzajs12hhh07bjvvq2m+rlAA9oaC3N+TBLHJrDUG/oYdNlLpHhegKMj5jD0pr10nDDq+Ixijjex32H93uzkM42sN6pVDdcg1bZFbrD1/miuUv5GYaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=I8m851z9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744604861;
	bh=izat2NnbRoo5hRIjmcUQdtzedlt6iMtpmClmX2HNuBk=;
	h=Date:From:To:Cc:Subject:From;
	b=I8m851z9qePvxNCs1WLp+WVvEkcyWM/0iTyONe6aTruJwW7SU7Y6sfLvkqTricFzS
	 lXHOo3c0YG/erYAlRY2EeeJXyVP2daz4SXz464sNevhmnusbxwXwyNb7EVh5khX/7F
	 cGJc5ZeLj3DUfL1x0r2VtKs8Dl+7Huluy4nQh+f7FbU6WFCQhlBxCM2tiSeWraeyY5
	 hJnIFpVw9nukXxw9HwPN3PWMRyMfN58N/MbXdDwTJzmDiinFgbK9SgAYQ/wdvBZEY7
	 duSTmAdQcK4PSUqnlxUF4stEzj521WgA7AGcHWuxVEgeJ/vFBFY26vmaNjMj2Dj+mM
	 nkDAPbBf6r5XA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZbZ5T33zyz4wnp;
	Mon, 14 Apr 2025 14:27:41 +1000 (AEST)
Date: Mon, 14 Apr 2025 14:27:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: linux-next: manual merge of the usb tree with the usb.current tree
Message-ID: <20250414142740.550af271@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zkdLiaEg5pubC/WNE6xYyWz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zkdLiaEg5pubC/WNE6xYyWz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/usb/host/xhci.h

between commit:

  bea5892d0ed2 ("xhci: Limit time spent with xHC interrupts disabled during=
 bus resume")

from the usb.current tree and commit:

  5beb4a53a1dd ("usb: host: xhci-mem: Cleanup pending secondary event ring =
events")

from the usb tree.

I fixed it up (they both added the same function, and the former added
another function, so I used that) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/zkdLiaEg5pubC/WNE6xYyWz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf8jrwACgkQAVBC80lX
0GzpUwf9HntDjxp4WdMbmdEYMtCUIrKH5Kkwd46PjklrwnR7oVGSXJWaGXy0cbwy
eCSsQYS0C9Z0XmkKJyqKI2lHeBj1VNhpb+OZQxq3+lPMrZC38Ngp/EqRmKNAZ7WF
2AP/woxhWdB3CJZ/kgrjnc89gfAczGZ4imQFWlxTGugWhh/BCIegyqyg52vCqSS0
UxQOZKvJ7FXUjJIx77TiSOyDLl3K49GS8S0g0DvYbstw0dMaMJNpqHyyh0V57jIK
sUEeqNXxCdToXSbdqDMGyEMWHK67IIq1pVnE933iEkW5pXLv0RH+IgDvQ6ej2VNX
0RUvjMlmY82viI/5DYhh+JkPT/t+kA==
=Qff7
-----END PGP SIGNATURE-----

--Sig_/zkdLiaEg5pubC/WNE6xYyWz--

