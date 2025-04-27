Return-Path: <linux-next+bounces-6393-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C342DA9E4B7
	for <lists+linux-next@lfdr.de>; Sun, 27 Apr 2025 23:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 472BB7A9021
	for <lists+linux-next@lfdr.de>; Sun, 27 Apr 2025 21:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3AE1F4176;
	Sun, 27 Apr 2025 21:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DtzT4i8Z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D42433D9;
	Sun, 27 Apr 2025 21:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745789973; cv=none; b=epxfVkQZM96M2IZMw0x8hgVH+TCqTG0jH9Dapv48JzAtXzvHRLIoGysemjfk4mgaRXszBl9jGkENYKpZ956WmmvNuC0akTbXst0WmGKjaoB+jRZELlpktynvgRROrdXWc8RPgaEHoxsmGmEIOHRLWOjsNqCdVhQFQN8sUz7Gy0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745789973; c=relaxed/simple;
	bh=6QGJ0a9Ht2gElXiaPuOCn6CfzvHDVIJKiI1NHI+hYTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ff61Z5f5/7pgmch3JlyfCFPBa31X+Jh8UkOH2F9nZk2yqveB7ZUxbLgjVaxsddCBms8wizxNOKgEOjjjvV57oX3EH8MKZbLNvwhb64dBCHJrB6D8qYDWfLI3VKbl0m/HqzZCFmORiy8bX4DERl6sDmnq5o9Zljts6E3dxISu8Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DtzT4i8Z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745789969;
	bh=g6bcMdHT8g3bxJqpi93cPewdqgSG/KDxynKqC+KzDCM=;
	h=Date:From:To:Cc:Subject:From;
	b=DtzT4i8ZkZ2MsDl1f66BVokfsFE0NF1U71vGZ16oBj782fI1BSLA/Uy4tpp91KO95
	 aA+i+amr6NbPD6C/PMIrGqeIgF/LTJVeGi+MKJf9DCrQYBrsoE/AILuNeAtwjds5O+
	 xBrTa2MMQ5uESimtfk29ToVxfqpj+ojTI4LErdevCVy4acX501327ajXny7pA55WsN
	 gVk3nGfyIXi9eFiur4w/0WLYRAtmi+urNLzKz7k6ykda7EuWC0TLeY4QYpjWn+mops
	 kYZgWYOIas5G7y5UKS8mI5srfEl0Uhso4tSethffsl4RjIU4SVIQLjt42mD3iLRx/D
	 Vz8DM/jaFs0AQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zm0N06Hygz4wyh;
	Mon, 28 Apr 2025 07:39:28 +1000 (AEST)
Date: Mon, 28 Apr 2025 07:39:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Wu Hao
 <hao.wu@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the fpga tree
Message-ID: <20250428073928.373426d8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/08CBCxnPvxyT6paf00rb9Cb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/08CBCxnPvxyT6paf00rb9Cb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  e8af44909c1d ("fpga: tests: add module descriptions")

This is commit

  6810431bc473 ("fpga: tests: add module descriptions")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/08CBCxnPvxyT6paf00rb9Cb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgOpBAACgkQAVBC80lX
0Gypawf/Ry1yySJOZmRCDQryw8geoYmEHThQKFZ3iE6kXy9ggyr1zx4AvClqOY5Y
1pyRct0NPaZBCKSZCJPAtP3EKLJox5QFHVU7VL8IDhJNmsk55WmCwy+XxENk20pg
skyNEaFQwods274rdcs/tJi5afK9CFYNNxX6WNF23wiNlUISjDmhkucxG8MjiaNI
GzIjbQMfRPK8cnwNRgpE5mIV/dKjELznpCoY7ulQKvhlB8rUkeyBAmzCWpjYkTJm
rLLQfsLlBsK+EcqpOeTh/3/vhUzuzzVYXOYV4d+BZsqWIrmi0biHhlNCKW8WHTZN
YRz/HH/c4G4KXgV0v5zS7es3gNSnBQ==
=2sjD
-----END PGP SIGNATURE-----

--Sig_/08CBCxnPvxyT6paf00rb9Cb--

