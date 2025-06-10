Return-Path: <linux-next+bounces-7113-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFC9AD2C00
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 04:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4DC1189132C
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 02:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19E4211497;
	Tue, 10 Jun 2025 02:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Catthj7j"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A05BA45;
	Tue, 10 Jun 2025 02:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749523697; cv=none; b=fqPkHZi5p5K15T10fTV7o5zTjuDWmXtpRX624JHFAow86rdrftUrupm2U9EYx3V4BboqyrN/X1BQB57JFT+s2ViOcAMvzITG0h3W8m4UepMK+xgmYVrHoUdAU+ng1k4q78SJDN8lr9qbxk7AicfbrNiJUB7Ku5aT+rCxUWZV6sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749523697; c=relaxed/simple;
	bh=tyL3sDxaUW7wfbGxZHW6COIcBEmWJUmUVpztWNtQcWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DYST1RrxAo3qnb5KQY/mqHqlluqJcvCb+69hSY/Y9U/62udoiliyxuR6WWzZFHCJzox6iw3TcUurKTI9QpSlBf/2ZUTItngIHJmrv2lWMCEoqjWuWKLg7KITN4+GhQHNoXWt4aUFEZPsIMK0qfEQpDSyFBqiTOPGtQ1r7/+82/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Catthj7j; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749523691;
	bh=v8qGSKqYmLAneTxuYDnB1D6/yHuF6lrd/pyw2iVA0Bc=;
	h=Date:From:To:Cc:Subject:From;
	b=Catthj7jgd8LmNVunr8NjWZZxt0pgo/GPOA23t0oJUAS50BaRBEySdxR0uCglqGXh
	 0gfozzpe1g4Fj5y5N2UErwC09iw7Q4LDwQSiXTKSrHHBEWmdR9kspTc3XrNslHVhwn
	 FLSOsCsxiu9IxEiIL9ETmMsdDUg5Osvktag1mFLA7nyLB+5CqLLhO8rdsEEe9zn8ZS
	 Sk+iKRo3TNduL1JytPdt5zKL14ie/Amr8y3MwhBg2r4vhhA1aY9GrdK8S/DfLlUfFP
	 tuxtxBbmrpszAETtMOBU+2V5aEwUUojzd0LMVORgSmXJV+ogpDCqahtT7XcjcUMPXI
	 3uD04eLzSxH5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bGYBK6td8z4wj2;
	Tue, 10 Jun 2025 12:48:09 +1000 (AEST)
Date: Tue, 10 Jun 2025 12:48:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: semantic conflict  between  the drm-misc tree and
 Linus' tree
Message-ID: <20250610124809.1e1ff0cd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T77Pp_HWM8GH0TUTsKa4OJM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/T77Pp_HWM8GH0TUTsKa4OJM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/accel/qaic/qaic_ras.c: In function 'decode_ras_msg':
drivers/accel/qaic/qaic_ras.c:325:17: error: implicit declaration of functi=
on 'pci_printk'; did you mean 'pci_intx'? [-Wimplicit-function-declaration]
  325 |                 pci_printk(level, qdev->pdev, "RAS event.\nClass:%s=
\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    =
0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%=
llx\n    0x%llx\n",
      |                 ^~~~~~~~~~
      |                 pci_intx

Caused by commit

  c11a50b170e7 ("accel/qaic: Add Reliability, Accessibility, Serviceability=
 (RAS)")

interacting with commit

  1c8a0ed2043c ("PCI: Remove unused pci_printk()")

from Linus' tree (in v6.16-rc1).

As a fix up patch would be a bit of a mess, I have used the drm-misc
tree from next-20250606 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/T77Pp_HWM8GH0TUTsKa4OJM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhHnOkACgkQAVBC80lX
0GxP2ggAo19Tr02P/N3wNq2xlLcQEBlaxxHwXNEzxpmLQASTE3YmVgiOYa0AcDiv
qT29I817Qz6uZ390Om3YNOPp5GArsTWlt/Wl78qgZaAdU8ibbaQzVAYC99vAKJ9g
vtF3WbwzRxiuMQTN/fa7V6gByttn3yKS18v4Liw7U9bwXI1CvkPLST5JUvHfemrn
d+EX12x+nXWB/EGhQeUrt+aUq0OwZklaCe/2vsBkBxn1DP/6OY3dg85OwZTtUhJm
8LGrlDsedIeEeMCusbpnYIXmVXD2fGs4+DSTaMINOStlWgOrrLnf+rPnQ5oy88WY
TKKFQdZjYhli4bO03r4WV4HPrs6U8A==
=lo4c
-----END PGP SIGNATURE-----

--Sig_/T77Pp_HWM8GH0TUTsKa4OJM--

