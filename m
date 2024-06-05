Return-Path: <linux-next+bounces-2473-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6848FDA33
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 01:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88765B23797
	for <lists+linux-next@lfdr.de>; Wed,  5 Jun 2024 23:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E00A161B7C;
	Wed,  5 Jun 2024 23:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QQiOb1SD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13C016192C;
	Wed,  5 Jun 2024 23:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717629144; cv=none; b=UN0Lc6aNYMw4gIFe/BL7znRc1Mb0xaovxLP0fpcBUBigryJd9XGEqc86CPYGPANy8yuGmJeJsxN0jeRStzhDA8QE+EML6YKkz2am5YqaMdRwGZ9/yCGmpKpXH7NMa21sjC6uVxJpZYHIPWKuqk+IZ+21SeJVsDmE+NzawWZj2eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717629144; c=relaxed/simple;
	bh=ZKMPQ4ftvDi44OWXSZ2rFzOllC0ZbTh3KgX+LRltxLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=H7b+spbRaW3qzuW2NUFubOjmnrtw5HGTZoIV26xX+dsdWifVyVTMwljm+lZoxKe+9woaNNShwJNYthxLVpKO6dqppL/Jwx39aKF71PLDMVpqWoDHSHaYfOnJTrzusH5iNeM5WiLxcfsWp4l32toC8J+mIsW2+CmRaCB0rYjOCdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QQiOb1SD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717629138;
	bh=dl5OjQZMpEKGRKkxAsMtaCPVS5mZeM4wapndBze53FM=;
	h=Date:From:To:Cc:Subject:From;
	b=QQiOb1SDQ5WT5E67IhdxAtrXpA06mlpZPZVhILFK38ZtkGAuujf+Pfn9FWdSXK2IH
	 l9JA5fSI9NWjDQ41QCgYeFqjZQBlNHlWP338Za3U8fYPX5V85S6mkKFF/4MF8xAwxW
	 IjgbcheYoY+nl2PC7CRcN++ffnR8iZOPcrDp1hJqCghWpggljh/pmMYVbtm1SUTyRS
	 AYlZn0Ay2zdgZE4bg/DV45o0sF/8N2PrOWpdnL/CcrPTbSx1Lh2GVACs/wo/DEDClg
	 H6gqGOJu0Q//kxFxYEvIly0Ov/O5MgnKqrqrSozv5Zf0/EbFr83crroQf+d6o5Nbc2
	 jsDfP6zZqV4ig==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VvjsZ21bGz4wcq;
	Thu,  6 Jun 2024 09:12:18 +1000 (AEST)
Date: Thu, 6 Jun 2024 09:12:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Marek Vasut
 <marex@denx.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the stm32 tree
Message-ID: <20240606091217.19a08b65@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+7eoUFzv0ibuc6reI7_WGuP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+7eoUFzv0ibuc6reI7_WGuP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the stm32 tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

make[4]: *** No rule to make target 'arch/arm/boot/dts/st/stm32mp135f-dhsom=
-dhsbc.dtb', needed by 'arch/arm/boot/dts/st/dtbs-list'.  Stop.

Caused by commit

  12ff8e167641 ("ARM: dts: stm32: Add support for STM32MP13xx DHCOR SoM and=
 DHSBC board")

I have used the stm32 tree from next-20240605 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/+7eoUFzv0ibuc6reI7_WGuP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZg8NEACgkQAVBC80lX
0GyNjgf+PHHYlVqdIgwU9xWKEh5M+3IlTOzA5PAXDxaO3iHw/+R9GPD4MRoguXq/
mSnZfRSnmXjbq0icuF8xkahMPicgAXP4qyJ1qIJGJqk1z42alvELM5NgRM681xDw
vh4WrgDc8xKkjng3bEhaPt0nGbYRhUIKgRiXH91OuSZm6CgXHXqkwPuRz9gIPjXP
5Y92P09/DNZeITVPXC/41Io7LR3iQUw+CtoontlZL9CsU2dWgLSi7N/PCIqcX5Rh
znzIym1dFaDQyWThapBXfDnDaFFrLIrMn8ioWzktv6t4FE7B2F9nmYNV6oGtCGxc
EkReq5Xwn9yBwPkUPWX63tLeAQQlJg==
=xXxA
-----END PGP SIGNATURE-----

--Sig_/+7eoUFzv0ibuc6reI7_WGuP--

