Return-Path: <linux-next+bounces-3748-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C86974BBC
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 09:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D697C285A63
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 07:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8A313A265;
	Wed, 11 Sep 2024 07:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YCP2qb1P"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22487E107;
	Wed, 11 Sep 2024 07:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726040834; cv=none; b=IBBPCdFHahnP8+dODnViGa4rRvzkyn1H4oVjA+WbIUkPO2COQIvnfbnFjhZSc1S3FVvPmvVMWQRloo9u5KkNbwdlIePMkK9IrDGxwzO+iAZ+f4XjJ+KGYnHaoe2v6Zcc9zHxZuNwcCT0fIhIYDekdf6P/rsPEpQKS5UxXx9zmGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726040834; c=relaxed/simple;
	bh=yxtwvMMr9SWwBpt9wWzm4OLa9DLuNdRcD/P8VKUpHiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NJcERPxQJvBKf+XxcEy77qayvqbjLwzPGBKtpVAjqK5DW7uZS5EWvceUdgCPYj6o5bCpJvXOK1ymgEs5dDv41DG61ECP2zXdNYMFTwm8HrPcHd1lb+5cAgvh4VeYpxXQHmuoBv3vNiOHvnhxzQ+DL5y21WzsTHfVcMxgz1YEO0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YCP2qb1P; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726040829;
	bh=BBLiZ0Tzs2SAihySNrkfyO0VCU1stq6i+ktx423xcBs=;
	h=Date:From:To:Cc:Subject:From;
	b=YCP2qb1PsKqX8dy842ucaHIEZrSzgvyJXC2ZUiMU8hvXlEMGV3VJzDU++L4BEJ+HS
	 T8kFqKaNGsOqoGv2oE7MVllfEKKtf+SlPfx7k6ML47fjVBu2+3fwli4GtiFLJiujgZ
	 xe1y3WEppOXi9oVjGod8BRXBXtZ6pxEpcMYlUmmqZGGX4lzLzsUoxGmPym0Xs0t528
	 gO4j2VaCmgovDA/9BgeNMwprLxzSQh298/0xcaQTju5x0iZHYWUrJIrEjYWklqt8jN
	 eSGrTdbmOGQnRR0ottaDE48LdX70JVf6iFPib7AoyNhhisXSXlf61L82oHuu+AnoPO
	 IxmOSSEwj5lLA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3Xhs45l5z4wbr;
	Wed, 11 Sep 2024 17:47:09 +1000 (AEST)
Date: Wed, 11 Sep 2024 17:47:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vhost tree
Message-ID: <20240911174708.5c52b33a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K+T6Tx1cxw3kNOlb//lQU6o";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/K+T6Tx1cxw3kNOlb//lQU6o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-stable tree as a different commit
(but the same patch):

  040b4f437e17 ("vduse: avoid using __GFP_NOFAIL")

This is commit

  955abe0a1b41 ("vduse: avoid using __GFP_NOFAIL")

in the mm-stable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/K+T6Tx1cxw3kNOlb//lQU6o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhSvwACgkQAVBC80lX
0GxWAQgAhNFUxEaAWuoOCPujvUpX9MYocxo+NIaA9h9zlDIzMU/lnJGMGBxt+dhj
e7N8g087JjV2sTgfgw1y9l4lqdZd4/ZaMVzKUB5vTP08X3p8nkJnNJb1zpP/5npy
ShRoojfhN0uli1qzYb3BUHZSDkxfYmM8Fzxk+LboaM2KtgVpSgDxLIdTZCAbjVgr
IbWgIkcqpPsXApYtN0KKGuH+FhZfqqg6lzQotnSnzTlu8BxZw4K3Sy7EItTLrbnq
zB3slotSuyEhccNFVwpNHqIEg/N0hTUyWXCZE8LfdTExjUdMTaNbEzD0lgRLtAY3
tXv94spfZ+9uQ4G3mQLcOqAc5P73zg==
=vidA
-----END PGP SIGNATURE-----

--Sig_/K+T6Tx1cxw3kNOlb//lQU6o--

