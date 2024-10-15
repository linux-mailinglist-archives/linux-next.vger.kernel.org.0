Return-Path: <linux-next+bounces-4285-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CAD99FC8B
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 01:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FAA41C23B3D
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 23:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A26C1D63DF;
	Tue, 15 Oct 2024 23:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PI8JXHPA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B0B21E3D8;
	Tue, 15 Oct 2024 23:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729035723; cv=none; b=ujOeROv0aXG9JBmaTZDX3H6eb9O/L2hUqCbdf21U/IXq2NVJZuHLdqfgYMS3WctZ6LPzplf8i58ghjssppWxqJu73CThIN4GlIytIlJ/izDhWiMN+WwkGBYwLcqi/sEyg98MuOndoAWprE0DdH6mvua0/6ZcYwq/4hO2CNQcjEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729035723; c=relaxed/simple;
	bh=4E+A9XrjrRD/qUlVpK4IwBrJMl0hMEGH8U7yKeKjv2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=p5Q5AidHTFFKM0zzgBBuCMhVv1X75L9EwWW5dNxdfW7cq86XsiIHqztY85rnFg8q58xN7oIi1ddZD42fILQWVpsdZWWKyxGA2QDQemuIzPzNV4M4Rw1/0wCTUycdm1/3L+8PRvE89vyyxjZOPG6hJep4jM3EPwvv606oibb1VMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PI8JXHPA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729035715;
	bh=h1qwV7OAFhdU46DcMXYrjliwHFwUQnYDyhKc2HtXNlk=;
	h=Date:From:To:Cc:Subject:From;
	b=PI8JXHPA/T0vr3IIFSOiAt8jwOYqpUVVJyh9RUY6hLqMH2u+hGXUhauT6IMtAEoYZ
	 4IsMiLiq5L7MOwAiDootlJR8S9JTr1t5gn1aRNuGZ/sAuULDwT+dQSluvzrkY3nL1F
	 /1fK7vwM7d5jZkRmtvjI65VPFrsNRFPiuQcGe9YUYgkuGmRRA1CKsyp/S9jOMYX4KH
	 Q7BAqrCQ1NFx3ks6M0NzzoeIgYCa6mEITTMW54AR6s5pEPvWkJEVTEZI/V2vVyHc5D
	 wnqPiJEbMk/Bx4m4AB1N9g+ZV4KCDIXAXOhkTNT+OdTb6jh2rxDjsxSo9ICKEKCsJl
	 RKqH/CWf+GusA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XSrGn4kZHz4wx5;
	Wed, 16 Oct 2024 10:41:52 +1100 (AEDT)
Date: Wed, 16 Oct 2024 10:41:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sudeep Holla <sudeep.holla@arm.com>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Gavin@web.codeaurora.org, "Shan <gshan"@redhat.com,
	ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the scmi tree
Message-ID: <20241016104152.62d032e5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gWcsb2ysYoqAE0q40q1nuYp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gWcsb2ysYoqAE0q40q1nuYp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  1d49af538dea ("firmware: arm_ffa: Fix warning caused by memcpy()")

This is commit

  b0798838418a ("firmware: arm_ffa: Avoid string-fortify warning caused by =
memcpy()")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/gWcsb2ysYoqAE0q40q1nuYp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcO/cAACgkQAVBC80lX
0GyQkQf/baZrT3wkRTvg1RJKLSfp0X3wWBzAzCxZtQbO8cKEYf5niSZHW7V4X6sK
vbDX8QlxlDEmHw56G4q+M8g2nsDALaLmF8VxwUFzpmSy5weWgk/Q/c4cnjeb8oSh
Z+UDeZQ5RskCVjpzVIqWva7qsIXrj0WsNxG8Dtja7qBWHugFfII9g8lvTNY0j0aN
0bBoqC0fO7SzP802JPRDFBqMu17Ta6u8vp5SrSse2FSf21SsKwEFzCpWLV0ZLa2/
oA1544+Mg4h4slP/w4QCXrEN5nXoW4kw6KubDUJ09wtWpU53kakLxbi3XhRQFshd
3mexcn7vdE3Uu0utzz24hG1z25uP3w==
=B6rn
-----END PGP SIGNATURE-----

--Sig_/gWcsb2ysYoqAE0q40q1nuYp--

