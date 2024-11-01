Return-Path: <linux-next+bounces-4571-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE5F9B8ABA
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 06:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09C33281DA5
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 05:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A102E142623;
	Fri,  1 Nov 2024 05:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tGGJAiNu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D4F42A81;
	Fri,  1 Nov 2024 05:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730439912; cv=none; b=W8gWVaL1fcP+wL8mCO1LBxmsPRlVszxPnzhA/SiW7O/CdV2jLS41Bey/+hDOeiF7M9+jDL6ur0AXvkWAnL2ot67mlM3XR56/nSoZlu9K8T6ELVPaUriV6LUif0ah17krQq0FGZdEJ2hWZ/t3lvjZKRM8MtwfTw8qzQhoxm2xZtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730439912; c=relaxed/simple;
	bh=j/Zbp1ATz3swiKNzKbRS9S275iqWeDXlyyWHpEJtjFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LIMTEKwWur8JMh4+xceYGcnWXPyVsVhzxrUgGBN6NDibfsxmmr0K4JPRytngyPxVSVsEo33ed7TS1ViRNwmZi6H91k6fi2XRFkyUWZguzgeR2J4Q3SxDV9YhR97xf23/O5iAGMRW1pdvX6yihsK8TTrwDWIGYTUip/ej5V3zg3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tGGJAiNu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730439902;
	bh=DXJdx6tewXLVfBs6bFdA4Ket6LcYenR39a+b44k97ZU=;
	h=Date:From:To:Cc:Subject:From;
	b=tGGJAiNuSt0qUQJwp2ot1JFVCvAqjS35Roz6j3HQ8xsDsoV6N27EnaszRk2kfCMXs
	 W9mZiNlyi9HkL26SmpiLfqCa4ppGMc7UFQ+DUoAP8rbOuqjJ6dDTE+K0nMh4f43uqw
	 S1Hq9iECPxATtj54hCKFBxrYMDq/ZzGggq+Xe0xACMhiJLLMoXYRINJcHxeto0CHaG
	 2dEaYrWdDWr1qiAGzLzI89mr0HY2HPdse8wYXSfhsfkKvu7Y2fJJpuhTWsoWXJzgCN
	 o/UOmkYudLVfyl7qCAw/Gusx9H10mutQNwqFIGM2+nGrefBy1DwzvizyDGtcSKeqdk
	 WBqJTA6nXVwSQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XfqZQ1Wt8z4x3J;
	Fri,  1 Nov 2024 16:45:02 +1100 (AEDT)
Date: Fri, 1 Nov 2024 16:45:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the i3c tree
Message-ID: <20241101164502.7c08e77a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AfoCcM=dzHgw=gLj2yu4vOL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AfoCcM=dzHgw=gLj2yu4vOL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the i3c tree, today's linux-next build (htmldocs) produced
this warning:

include/linux/i3c/master.h:317: warning: Enum value 'I3C_ADDR_SLOT_EXT_STAT=
US_MASK' not described in enum 'i3c_addr_slot_status'

Introduced by commit

  2f552fa28059 ("i3c: master: Extend address status bit to 4 and add I3C_AD=
DR_SLOT_EXT_DESIRED")

--=20
Cheers,
Stephen Rothwell

--Sig_/AfoCcM=dzHgw=gLj2yu4vOL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmckat4ACgkQAVBC80lX
0GxXAgf/WGH1KgxYls2ttqjfyRHplCxeSdmTaoQ3Kz23CsmG1F/+etl5t15AdvNM
z7LmzdktGi7ZPbwNtXTt9b4K+EVMXzXXk6TvKuf9osZfY/gWF/snQdWv7C4eLeEv
gagKrS+ofBc5AwdcuwwCIbFK9LvTOQnm6KYvH0fKzw9ceoipYzTFMuW9Vzy43oV/
XhGeLlKw3btXuV2fYNw9PUDLcwOoSO0+iRj+H7NPql6vTNaEAXv47tRnPEJkStmK
otcXot0xyOcszwAwcXI6mLBbHNEUNjYCxMZEEDeHBjPF5bh/VK5cnwD5YeP03L9f
KI0cxZVw4VaKSAMRviT+R4m+akgx6g==
=aNX4
-----END PGP SIGNATURE-----

--Sig_/AfoCcM=dzHgw=gLj2yu4vOL--

