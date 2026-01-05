Return-Path: <linux-next+bounces-9536-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1068CCF1D56
	for <lists+linux-next@lfdr.de>; Mon, 05 Jan 2026 06:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32515300B932
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 05:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B28C32571B;
	Mon,  5 Jan 2026 05:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ALXRFcca"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1742BE7CD;
	Mon,  5 Jan 2026 05:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767589209; cv=none; b=aS+sW3ljjhFGZKs5U9HDthSPxd+m6wTMN5USE+BPzoXitrFCQpx0ASwhXKiBMEN/41yESN665UeNaHbGLnTfwhht0JgUvMoICrlvkf8bx5XQ10JW2rG+6S3CwzDP/f6VKq0pok5ouwsA5LzKXmf0VO7QGS6pMMYqx0YdoUODXfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767589209; c=relaxed/simple;
	bh=l2cHoZb1yS13iDqmHPuChS/JCcXf+ogsBxkXp4vLLcE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AwkbaYI6YmR+GG9eDZxUqLumUj6jMD4zOMVKYiW9FQFpQKSWyMDFYQ+eMY+vxDyC/SJxBM9OmXz105rEbMioQLRpXGxycaB9XXHiPYn/KA1zCzvgS9D5sToOMJLAHoW1+aerCqHB8Bucgx62m0hBq75UiMsAgBPjJb2ESW6zvbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ALXRFcca; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767589201;
	bh=7f1tiCjL+FQl9C1W7U2Ix6vDLoZsz8lBMQPDNYptZEo=;
	h=Date:From:To:Cc:Subject:From;
	b=ALXRFccaGJ6JaPZ6kmaF9v30tQ5S47ZtXpeSATjKQnOZaQiHVcj96cBddBt4py4OZ
	 6xQU7HVo67tm458uhc0vsxClFD8l2r5uId+088zOYF87R+/PQBB1uFck0IYngHZGgU
	 I5dBQB726HBvs/vwP0da5ehW3AVeiMHCt99vY4PlVzljdCzaGryoj0+nLBmqkzW9R/
	 bIalmfjpDznPe56HMx7q1trzYzRSXB2tF5R7fsD1ZXjfAmx0JweD7Ozk5xMQxWfk65
	 P2yeeUlzX3zYV0V85nkEoUuC324ZurXCcau2gyjvFEN2rHwNG5KTJjiHkgsK6KuDcM
	 URkyWav5kY11A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dl2D055tHz4w26;
	Mon, 05 Jan 2026 16:00:00 +1100 (AEDT)
Date: Mon, 5 Jan 2026 16:00:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the pci tree
Message-ID: <20260105160000.0368ec8d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j43jAn/KyPmGIznJjkqNPve";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/j43jAn/KyPmGIznJjkqNPve
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pci tree, today's linux-next build (htmldocs) produced
these warnings:

Documentation/trace/events-pci.rst:43: ERROR: Unexpected indentation. [docu=
tils]
Documentation/trace/events-pci.rst:74: ERROR: Unexpected indentation. [docu=
tils]
Documentation/trace/events-pci.rst: WARNING: document isn't included in any=
 toctree [toc.not_included]

Introduced by commit

  d0eb853678a2 ("Documentation: tracing: Add PCI tracepoint documentation")

--=20
Cheers,
Stephen Rothwell

--Sig_/j43jAn/KyPmGIznJjkqNPve
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlbRVAACgkQAVBC80lX
0Gy71Qf/asx+LEj1kicE5nog3+BcMB9bHj+b7ehPfcXbBvFgk455o2odhbaTF+GY
XNcTcHmXRinOucZxM9TpaWKbVfEbMkXkAW9N1bKUyH4Oiu1kuxUNVyEx3uE6i3Au
wDdXzw9wjmCaGTvivReFcqB3Eooo2JuUl5tKG6KYRIsJ3HQ4X4R4g1xhEBXP6dDb
P61dpxqEnbLm840zW1YE3ERlCjFIoaILjzEYz/1mBlN2nnUeMmymdzOq+2kavfyJ
IdnSmf2IPURtDI8iBHIKTC1+VgpVpVEh7/LvEmWauq5Xr90PhuJjLLAiXHF4YwfK
l8Byk7na1PjoTgEIGfURfMirPpmGwg==
=mbT2
-----END PGP SIGNATURE-----

--Sig_/j43jAn/KyPmGIznJjkqNPve--

