Return-Path: <linux-next+bounces-4265-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C69F199DDA3
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 07:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 046B01C2179C
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 05:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B34175D5A;
	Tue, 15 Oct 2024 05:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cP+P+Duf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D270176231;
	Tue, 15 Oct 2024 05:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728971100; cv=none; b=WuMizTBGQjCdAk0hooMT7XXReD1gegx0VpD5mVSmCE7x8YHOtBnW2a6rw9bt2IUVpCOobN+3fU+mXlVipwXSMVuhqQnpTOUOD/3f4Ni/e3kRoVYNn+40P3uyOKkAHZs6YWQ/hPSRyyW1TD/qCflQerTZiopbNQVTgUghM7yw3o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728971100; c=relaxed/simple;
	bh=OJDjE/0wOZFnBB1X+CRQJZha6zmYet5yi3t4PlRmXcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Bk4G6jQ5HMtHLw19R1Vnu5WKktJpaHBo2ztCU2s2wEmV5AQuXSSkGT+FF5IU1IpixU+V+ElX+HtRuhFV7TPv9gWbiGwhcV+zvJRl/3JM70Han3pT9HS/Zf5AtjJTUqM5ObAtGatPGoq6zc0ov32YjSHdR/TMmmLt8lzftsto4wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cP+P+Duf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728971093;
	bh=0/Ru7NKkCxmEJS1qE1b20E/DUyHvkj6Do1MlzU8Xj2c=;
	h=Date:From:To:Cc:Subject:From;
	b=cP+P+DufazSlxZxHfQoaHpd6yhp1UTjhVZMsdBsCfwi6GTBj2BN/9p3uEgE30R/Dm
	 YVlbaMYXD5MJ8ZIK7fvn4ijQsEN7xpar7JXIdc5R7tiXfvxjVx6F4a53ybKY9bBHq2
	 0mM5Hz6kPZUMlkQ/TU6GkgLTl4wUbmLa8+Pzl1QxYFS8ambW8iE2Zn66v2iBE+cnYB
	 J6RNiZl+EF2JjqW8ghz/5W5JPaG9thSx4FKgtD8NSHf1JUZ+BUI81OCin2SeEu6KhM
	 6UFu1gsbkyOvTsOvmGnCOaVVwLBNf+jRK7uWO+EjL3ZzlBMm7M6S8VJT5c+1/6TVl5
	 ZHW24zmPLqhEw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XSNN52l0wz4x8W;
	Tue, 15 Oct 2024 16:44:53 +1100 (AEDT)
Date: Tue, 15 Oct 2024 16:44:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the devicetree tree
Message-ID: <20241015164453.09845d09@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j5nb74UNV./s+SWfVgpxL8Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/j5nb74UNV./s+SWfVgpxL8Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the devicetree tree, today's linux-next build (powerpc
allnoconfig) produced this warning:

drivers/of/address.c: In function 'of_pci_range_to_resource':
drivers/of/address.c:244:45: warning: passing argument 1 of 'pci_register_i=
o_range' discards 'const' qualifier from pointer target type [-Wdiscarded-q=
ualifiers]
  244 |                 err =3D pci_register_io_range(&np->fwnode, range->c=
pu_addr,
      |                                             ^~~~~~~~~~~
In file included from drivers/of/address.c:12:
include/linux/pci.h:2022:63: note: expected 'struct fwnode_handle *' but ar=
gument is of type 'const struct fwnode_handle *'
 2022 | static inline int pci_register_io_range(struct fwnode_handle *fwnod=
e,
      |                                         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~

Introduced by commit

  1957da25d023 ("of: Constify struct device_node function arguments")

--=20
Cheers,
Stephen Rothwell

--Sig_/j5nb74UNV./s+SWfVgpxL8Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcOAVUACgkQAVBC80lX
0GwXpAf7BxlAs7Y9H8xDhMtlyCC4Mwxfki5eu+k/fSxzENvMr6M/lu637dVi71zs
H77HQuP4yO895P3vSSW1n092gDf+fzRKxW5mLYFZRKVGMEMjFw5jP+ItInokt7XQ
KHuavgfwrvHBJmIZ1k8z7M302wxdDqcMGQfEMTQ0UzxmPAKz6MBG/fa9FW3gleEw
n+zM3/7QoY8VDCHRPMbedlvlj2sCUOy/GWjqccVcP7ncDpiupy8jfaBa7ODAWzYF
xNT2VPmEVequmMyELKBLJCRwrSTxUCNfSqLHuSOLDx+xmNNAxs8//Km0R3iudcMv
Yb68s1oTEGWLBgycn0q6yOQcmiJM6A==
=58Ma
-----END PGP SIGNATURE-----

--Sig_/j5nb74UNV./s+SWfVgpxL8Z--

