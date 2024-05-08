Return-Path: <linux-next+bounces-2216-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 970488BF47F
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 04:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8F421C23446
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 02:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707F72563;
	Wed,  8 May 2024 02:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tbcf0igr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49B81A2C28;
	Wed,  8 May 2024 02:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715135089; cv=none; b=BNs8y3hjAfTvCNcxpf4nR4Idi0kTq2SOzdFoTgcnWxjcI3JTv/d+3l2DYLXM2c2KrX9lC2kCASCTfvGoBrXuvK0gct7xcfDpAJPL17aB2JjyajYYWjv0xsqDydM+ySCkF3odeTis3EnK9dfX72DsUSJcphKUh87g0PDOXujqHLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715135089; c=relaxed/simple;
	bh=DrTJJj4/DI+nRdnktDehjO3j+446swCwUdWrtVQkKfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jm179daXjouainHuaFJjNxtJB5dArjxD3hsauvlexXzZ9rMtpAuoNuTnCnpBe6UQAGuGA+cfjX5nwVQ1e9fLh2DOeJ1EeJDd6fJ+HJC2fQjidK5HFAmInX0o95aftFcgK4kme2w+WXnRREimmF/wNbgqoYkrMi48gc+KzV9xFSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tbcf0igr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715135077;
	bh=WjcJFtkWsaHrQfyoMXdu9HdwD6Aa7FRZZJXjbvKGcrQ=;
	h=Date:From:To:Cc:Subject:From;
	b=tbcf0igrfTt923enQhcc8JK8OR5RMOd2cQLHnRsknxGYvCplmpT7Z1eN6asgbqitU
	 ZJQFng/SebPx0TnvFxmPiwUxB/yekKx9J0qfZmVkCpfXYMPBgWKJj0C7GyCMmcdpzR
	 pgLZdiX6lB086Er5YbKZLi/jGDR7slk6NUQGk5EqzOcIyDbZ+3LLy9afFmMO6Ahcmy
	 0F76Jhq/DfUSsohF+udHagW7KRNnR0TpPcG9+NJVENkC2uDBFoe/kGS+cyPXMyp2C/
	 G7J9XeCceeurP3fIHWUz8qFTPTow3bYFLL1poNgOLh3XUEfUEVqjDqXw1ghLrGEkrR
	 8mZiLcDFg/qPQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VYzVr4jsJz4x0x;
	Wed,  8 May 2024 12:24:36 +1000 (AEST)
Date: Wed, 8 May 2024 12:24:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Kiran K <kiran.k@intel.com>, Luiz Augusto von Dentz
 <luiz.von.dentz@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the bluetooth tree
Message-ID: <20240508122432.6579321b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jL1Pl9mUhy7A.3BwoG087mr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jL1Pl9mUhy7A.3BwoG087mr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bluetooth tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from drivers/bluetooth/hci_ldisc.c:34:
drivers/bluetooth/btintel.h:373:13: warning: 'btintel_hw_error' defined but=
 not used [-Wunused-function]
  373 | static void btintel_hw_error(struct hci_dev *hdev, u8 code)
      |             ^~~~~~~~~~~~~~~~

Introduced by commit

  1d8e17157eb5 ("Bluetooth: btintel: Export few static functions")

--=20
Cheers,
Stephen Rothwell

--Sig_/jL1Pl9mUhy7A.3BwoG087mr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY64mAACgkQAVBC80lX
0GyaNQgAlF8rO+0kTQYce4Ca0bhgVQfMQGFTYr3PK7i1WQ67XGXR4zHmdyMF+r5Q
DuLCIvUn7slCYdyyebp4lU/NzHVPz7RJexOXmL+T7XYvF/SvLYvC6C/tvt+JABnP
wP5yoCC3oglRhYgqrm37Y3Q1mKcEyIunYTd/viPCHDOD6J2P+5KRCdj8PtsA4d3O
g30msBGOjDPShM7cu/I0j/7wQSeJ4z/PHzPQPWeNz0shcn9KRn4N3WeKvwhVrnJz
kcTMkQr8eBoxRzOLom9oGpegtZkzGCA56NdbPDLcskn0nZXpjWFLlqKceCi/Z7Pw
ZmPNhMBRqfeWIieguTLrCQh2hL27fQ==
=o8Ya
-----END PGP SIGNATURE-----

--Sig_/jL1Pl9mUhy7A.3BwoG087mr--

