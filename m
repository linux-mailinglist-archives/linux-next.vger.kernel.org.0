Return-Path: <linux-next+bounces-4428-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FC69AF5F1
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 02:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5916B282ACD
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 00:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B31A15A8;
	Fri, 25 Oct 2024 00:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qX+rvYd/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2482800;
	Fri, 25 Oct 2024 00:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729814974; cv=none; b=VXkP9kC6/Wu5nUBudSOSylwvgLUGABfiKSmLIc54+7kiJrN3iNj0nIAivjQlx/s0N2KNCnNlk2QAjQk/+oVqYIbAgpZeuw/jezssIe8T0QcbYG85LDr3/2DSgs/PTt5ieHhqKGi+vEfk72/W9CBXM+2OhSaQcNlPDXTxbCBUH/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729814974; c=relaxed/simple;
	bh=owGRusrWsduZVLdJbDG/9WJqA40hW18c5kI6uGjGQkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cLsi2MEICKQqiQ1JTJMC2nJBtjVEwxUOFtnTzacxdpVJ39uYzfq1fC5UW8NUyMp70df8voMl5xj5pFIcnFZvFCuAFhph8oKY+ptKsK6wYk7MQZ0vScyfN8CHzrFrnJJtpDC3lqa4+ePDGsLQgc9Kuar3ZOc2Sk8hucQ4q9zZPbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qX+rvYd/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729814959;
	bh=LEsKpxUV7caqdhtwSHdu4CLYxLzzaOwt6akNurAYlNE=;
	h=Date:From:To:Cc:Subject:From;
	b=qX+rvYd/LB85eRacS1y2/5/Lxhlb5lCWfFfifE5EYA8mUHLKEIo//CabTAgqoguPP
	 sWB9hIz0pHs1uEl5H5lzfY/0fNR2UoAzrAWi7rPdtzSHrAOs/0OElIwZTDYdmRK5WW
	 3g149JBrqKjJXI8pPZdVw8g2XO99YHMAo6d1KGV9TkZGFI9DaARnoBPchiE71bHqsS
	 B3XZDilsG1PdvXDt0VgTiNn0Z0s/RjSisQZSSWi9FaxyCdRGDZnQW/GTD8eXxVrS0d
	 kv2DKfzv1oyO2N2jCAruHUR2P+vK6ELzHkSnzNjPe5nZOZUlieeMaE3rPkHkH5sqI+
	 eblA32Ofs35cg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XZNSH3BTKz4w2K;
	Fri, 25 Oct 2024 11:09:18 +1100 (AEDT)
Date: Fri, 25 Oct 2024 11:09:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Herve Codina <herve.codina@bootlin.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the reset tree
Message-ID: <20241025110919.64b1cffb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nyv9WJd=1Tvs76A.evXtIYK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nyv9WJd=1Tvs76A.evXtIYK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the reset tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/misc/lan966x_pci.dtso:34.23-40.7: Warning (interrupts_property): /f=
ragment@0/__overlay__/pci-ep-bus@0/oic@e00c0120: Missing interrupt-parent

Introduced by commit

  185686beb464 ("misc: Add support for LAN966x PCI device")

--=20
Cheers,
Stephen Rothwell

--Sig_/nyv9WJd=1Tvs76A.evXtIYK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmca4a8ACgkQAVBC80lX
0GzFwAf5AQUBETqeSdm4SZV1krEKU4ctzR7Uro6uYJUo4kY6n7of1rwa/d01JLhV
Ymlc/A+LyypSlWL2GogQX5DMJ71vVQ42cnibf8XhxdNAbSR65oNRn/lLdJWTQO4N
ebQynPKAaEPmSn5HfAYQR/DWUnN9Pm9ni6ZZRkaHuROy2zHn93bPw4hCJKirDEsP
P9B6NJgbhHXZRk/UHQSGrtwtMyKjVZfxrDbBbe+9ixEzH5M1xR6ujmAerklLoIhn
wVNs+dlbvD3CJyKoNlPRJGkvzQwdtTLxFQxVALnQf2F3a6xu40n3l7Gkr9FBIr/g
4kKQiyj0NQmOXp3v/JTyd6fIQKnCKw==
=qBtj
-----END PGP SIGNATURE-----

--Sig_/nyv9WJd=1Tvs76A.evXtIYK--

