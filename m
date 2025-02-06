Return-Path: <linux-next+bounces-5377-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD14A29EFA
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 03:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F5A31654CA
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 02:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B161136988;
	Thu,  6 Feb 2025 02:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VGbixHn5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF37B1422D4;
	Thu,  6 Feb 2025 02:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738810418; cv=none; b=jSt6Xgw5hrshiDIMPKZgQ/1B4S+//1wQMBE/aZ0zc0OlUBhHGktofRc3vK1YlmiyJwqCdUBUpEA+k/7OfC11pWcqtF/uc0F7e1oidMWHnep7LjX583353+hedHQ8OBB1x2GfYH7YxP4hUcFg+MfdKenbfIyS/mpPhwfK3x/k/rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738810418; c=relaxed/simple;
	bh=KaIqYSpMI2Kcjo9Dk1clxhX5KjFMB/7s/tbYlEm2v2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VahET0BEOxfPJOMOKq81WmfG7vSn1OfuumgG+ONGIxgWWpp3FUeGdRW3noqKf/7LGvcy6vnx9/pBahSPAWWeX2QcRXrjUo/519boKyV8TdayqRK9E1Gzcuk/1tRpDMYjSN1iHuAn+kvNiS/toHLg4JOokOqxNq1d0yx3zvnJhKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VGbixHn5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738810401;
	bh=YuhrVy0QKQnIHMyTWgPFjnFm1OG18Fln7T1zxKKh/EQ=;
	h=Date:From:To:Cc:Subject:From;
	b=VGbixHn5OFIYvutRjF+MlTIDXu4TDiTzYNqX74CC5RK3gRIkh//7TJsxILMIcuWrk
	 tsEyeZaG+NmShToFxLAmErXeKNeQraljn5RfuWo/bATnN2LWuAdJICxE6VuWobNXdK
	 FmZ/JQX6pB5QULa7nia/DdKyzAjAKUCePHBDKkHOLXXq9l0lF5oZsi7WE26BkTX3aF
	 iriUahBbzMwBz//kG1YVAJlafM1AXtRd+zzlsjFtJQQmktdHfaMroCwAGCNjHg6orQ
	 wSp9s0KznHx4qqVnbVH5MZAKBeRHyrfSSTEDpcxKYswt7C9QLhAZF0wM1tVYklEV6a
	 00ZEDj0CFq6Bg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YpM9X04ZCz4wcD;
	Thu,  6 Feb 2025 13:53:19 +1100 (AEDT)
Date: Thu, 6 Feb 2025 13:53:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Benjamin Larsson <benjamin.larsson@genexis.eu>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tty tree
Message-ID: <20250206135328.4bad1401@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pYaJ/yzPbG7Rmf1iL9+kcs9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pYaJ/yzPbG7Rmf1iL9+kcs9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tty tree, today's linux-next build (x86_64_allmodconfig)
failed like this:

drivers/tty/serial/8250/8250_airoha.c:52:6: error: redefinition of 'airoha8=
250_set_baud_rate'
   52 | void airoha8250_set_baud_rate(struct uart_port *port,
      |      ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/tty/serial/8250/8250_airoha.c:10:
drivers/tty/serial/8250/8250.h:328:20: note: previous definition of 'airoha=
8250_set_baud_rate' with type 'void(struct uart_port *, unsigned int,  unsi=
gned int)'
  328 | static inline void airoha8250_set_baud_rate(struct uart_port *port,
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  e12ebf14fa36 ("serial: Airoha SoC UART and HSUART support")

I have used the tty tree from next-20250205 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/pYaJ/yzPbG7Rmf1iL9+kcs9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmekJCgACgkQAVBC80lX
0GwEOAf8DLXNL4Pv3SpAnHBs5jrPP7rnPF70U47jEzd2dIz8wG53HQHPyCRVOo7P
VB1yLTMzR2gUzhBsCTNdi08RdS77T17cl2dIZ13DxtlYXJnmKHcnn/Mm1Tjf5R1O
pj4YtNV4IRuhh0ieTuLcUW/OCXd7dXhHcfVHwmQuHJR0siMD7iMDWcUzx0hlPLmI
emB6pdyyOqvz1BLPL8Nzo/UcyDHovQNr6AeCjszb12M6VGEf19smsbiMAbwXGvsr
euyvCOCel314HKgwajpkakMGLfxaHd/+7nB7vo8PvJfmw6az6UT7qRIYR6LTaFlK
NHDNET1b3ajxD0WFMCa10iRabwF8wQ==
=ivRd
-----END PGP SIGNATURE-----

--Sig_/pYaJ/yzPbG7Rmf1iL9+kcs9--

