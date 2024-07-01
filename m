Return-Path: <linux-next+bounces-2738-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7FD91D662
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 05:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFA9428142B
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 03:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792BC8C1E;
	Mon,  1 Jul 2024 03:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="h00/IXiu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34231847B;
	Mon,  1 Jul 2024 03:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719802876; cv=none; b=GwxPF33ECF4Lml2B3dsmbB0cc7qnk/M8wIR+WZ6nuaMOg0BHYQm6UygLiETCMi76eYIQTEdF1Krot3m0g/W+KHhM2BfSJErZtPalGFibCzBiBZ8HruGjDCD7KfLZMuZUYnps+6L/zm2J5bVMcr7MBsJRj0INo6241gQ/sASAQ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719802876; c=relaxed/simple;
	bh=PhTqi10W0ho9mBkP3peVW7Sik/RTdxh/IxBS7saeJ60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fAv9fuM7Duj2jJl6bmKcQ7FK8Nja90qYNi4pYDiCTwodquyCGDxOu8u24rsrDpxfg9iyMzfLDIFrfPzYUgARXbT/MoQrvm48o5w87lq+OiatnTnA6ZgogA6e2pcqXBsX2/MWDELPRrII828+ZORL1dg+ySGjnB2XQ/zRREa33xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=h00/IXiu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719802869;
	bh=S1/nKtF9uDJYusiT2oSDQ/Ru2OEubQlOUtyy3yNwzkE=;
	h=Date:From:To:Cc:Subject:From;
	b=h00/IXiubmTtt/J5puSubgoI0LgIZXr44glaK9Ys8OMcS6g54SyFRX3oB0dUFys+R
	 dvtBr/dWLWybTWr+FeuziJPXfbxNyLzkSyuPLDu3SqkQfvODVdHlFgaBtl6eIDEbQd
	 HYomxRD8ksPgCLZfN7JMzcPmKAliJk/Q2/F9AIVs8apbphM6NNlDbTnn09PgqQyRTA
	 kojq9xodK4iOV7gG5JjCZBLxSCDK28aiCt3PiXZnPhZ8lYO+epibsKXeWkUeMVkY/D
	 IEY5eOGRQlBX+JDaL5hRmgZItHLF+Xuml1qzh9Xd1XEAry4gAtRjiOHv6aRBx3KY29
	 6xRE2vGjgDFUA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WC9m54MPBz4wnr;
	Mon,  1 Jul 2024 13:01:09 +1000 (AEST)
Date: Mon, 1 Jul 2024 13:01:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kw@linux.com>
Cc: Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pci tree
Message-ID: <20240701130108.63628d9f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p/szGzg/bz3ezpJ9aqNt/1=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/p/szGzg/bz3ezpJ9aqNt/1=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pci tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/pci/controller/dwc/pcie-designware-ep.c:818:6: error: redefinition =
of 'dw_pcie_ep_linkup'
  818 | void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
      |      ^~~~~~~~~~~~~~~~~
drivers/pci/controller/dwc/pcie-designware-ep.c:22:6: note: previous defini=
tion of 'dw_pcie_ep_linkup' with type 'void(struct dw_pcie_ep *)'
   22 | void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
      |      ^~~~~~~~~~~~~~~~~

Caused by commit

  9eba2f70362f ("PCI: dwc: ep: Remove dw_pcie_ep_init_notify() wrapper")

possibly because of an interaction with commit

  3d2e425263e2 ("PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown() API to h=
andle Link Down event")

I have used the pci tree from next-20240628 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/p/szGzg/bz3ezpJ9aqNt/1=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCG/QACgkQAVBC80lX
0GxoQQgAm5VL+WtvBVyXuG0voos1INdQEvIGp1HSbYI5mb4GCSa0AAedTeScB5BM
xx4UNXnm7Xkff6wnrbtd/ahxomdeB3y4q5461MEI0JZxs/ik6jgycqfWt8QeyCRZ
ug56hWU72gxSdilSLyvV8FWa9MVjlMNg3lbAcM7pNFxZClnbzeQGlOIqi0XSD4LX
riNhOXEr4T1Cnz8SOEFeBDTXJB45cpQfLG9iE4gVMx70mmRuvnbnAmrXbUpI3Cuj
vWuOIg+2KPKAq5tyrIs7TOdz9NRkmsQuz47V7KJFrpDu/DdB15UqRx2DaKu6zcy/
bOTDzVRklZL9FcLHHZ0EzQB/nMcr9Q==
=MjOh
-----END PGP SIGNATURE-----

--Sig_/p/szGzg/bz3ezpJ9aqNt/1=--

