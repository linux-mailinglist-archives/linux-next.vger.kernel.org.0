Return-Path: <linux-next+bounces-5246-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE04A149C4
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2025 07:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E406D16AEB1
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2025 06:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2FD31F75AB;
	Fri, 17 Jan 2025 06:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HtX9vNx0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747501F7080;
	Fri, 17 Jan 2025 06:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737096060; cv=none; b=Ix4/VzDfDDVED+vKvDJXhtb7zHgJtNuCLRccHcnXkSjmuLqftQWTcM6/m4n3kQQ92mqxJa1jy4Dgw3B4faya5sl89ESxj9x1X/bTLnr5Omqm13hJQ8pSL4xcVg3bvVhHZmCXTlKYDzKXmgQGd6n3U6hqzVMQvGFLoo39RsrQacE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737096060; c=relaxed/simple;
	bh=9zmqzOwh0etWH3y1WC7wNoOSp/Br0CmJsChscLUq5Is=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fqRfHp+r3bK5NJTX9hw6iIohbDcm+sGFTbLeYSl+wrENcYAhXySAvQSrQCNP1CCCBS2+vCW9DMqnlH3jwOOiPCuSGlqEFBH2O+iqp2xxShgMYpFmFF/n/JuO85sckGdPmVangNMux+xsg7dAVDFPcNzlC4inOyW4/VeD02qpfFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HtX9vNx0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737096045;
	bh=zdXuDVUI7CyF8Bo3jd9Jqbh/sm7uJdr2kFF1bV8j7ZM=;
	h=Date:From:To:Cc:Subject:From;
	b=HtX9vNx0+sg2k7Fq3UvUGn3+dRu8qJBfE8kBhoh3DlHZDef3F/X2vfowhxEGOHerg
	 S5ITPuVbZyw4LKFAKQSFofu1i/D0OnqWOGBR9xnA8dVqOpaxzeAzmY2a7zKv6XBfEy
	 xAInxkTrgqk3CBL4WJ3hi73y//L67eH47lTEeXz9Od+kMlQU/qE/8SVLgt+l0w4lmc
	 E21TZSaMJXck38Grxb5Z1guef8wUdixLeJ9rJLIIrRim/L3+JGdF91uEstT1+MwG0n
	 wHOqFmV5Ly0paommXSrceYU3p3WgEcG2pW57/rihwWxkAEygm65MTem71RP9609z+r
	 NLmx9K7xkmzvQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YZ9990z9Sz4xQZ;
	Fri, 17 Jan 2025 17:40:45 +1100 (AEDT)
Date: Fri, 17 Jan 2025 17:40:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the powerpc tree
Message-ID: <20250117174051.532c5772@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SRU59EaH/GQymPt.eeeIr/L";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SRU59EaH/GQymPt.eeeIr/L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  7fee0217538a ("MAINTAINERS: powerpc: Update my status")

This is commit

  77a903cd8e5a ("MAINTAINERS: powerpc: Update my status")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/SRU59EaH/GQymPt.eeeIr/L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeJ+3MACgkQAVBC80lX
0Gx0Jgf/dlzQ1JQyarmjHUmRSbjDzNF3bz/p+KDagVrlmLMGzmS2Dy2cWn6/wGC8
bB9MWj91OqnP7AQVh42qPRsN4ANWAKLxz4L/SQPIyAy3WIYuH3G4PseBrUEdi+hX
DUDu+ei1XZWJkWEd2vBA8FttmL9VKSQBsGTBbp+/ZCg9i83FDfFDGG8424gMIS3F
JD/P96OZdl4cO6IWPZaDHkqns8yZAOK+fB87C8VVs5xoTd6Od9dloFB1PqverkPU
IpP/lkEXGMyyEurk63oYIiv3gdnPHA9fSfJNrVJE8VxMMjGdWgjCY0KbJtcHdnvl
zYNU2S0XEpF5aWYc0lnl0vjcypRe6g==
=ebah
-----END PGP SIGNATURE-----

--Sig_/SRU59EaH/GQymPt.eeeIr/L--

