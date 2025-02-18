Return-Path: <linux-next+bounces-5487-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78396A3ACC4
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 00:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 525E116B6B6
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 23:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B5F1DE3BB;
	Tue, 18 Feb 2025 23:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pA7rjGlG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D571AF0C0;
	Tue, 18 Feb 2025 23:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739922415; cv=none; b=SIOlECuLQeqFRgWz45SfLE3pdFJ5+NAEVGGrUGE+N6gM64NlPP4KoGSqR3jerVoSB5IPqLI9YIk5UX+szYyui3+mETJ6OTKhyQ26uHXSe7o2igecurS2D6KmWBFnVqkPzb6V3ooH7Ad6XWueGMu51dt8UVCUaivWdFVS8P28xzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739922415; c=relaxed/simple;
	bh=poD1v6TfHKoTBFbZYELrY7zeKVutjkIYj/ZJ3ArFR/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jcZGosAz+1DFWHS4ytLhq09i8h4S8EwaW+UmVMnqicpMpHB/0j8vOID74gUvWzsJ5XuXPsdB56a4QBHHcFqk2oE3E9XFgVSs18DnQmSEv5J1vrYLQQaf2YjoNyK/U5lhawbc7F3E4is5bVgtA5Vp30wDZH2SfZ8S4UjL+nm27hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pA7rjGlG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739922406;
	bh=grNNz9rqU4x/urCUS1702ksIj4thywYQESEq033IsY0=;
	h=Date:From:To:Cc:Subject:From;
	b=pA7rjGlGw6uyeHaXSPtpV1OcCaFL56t7hHX4V7fwEC2eutOUQtvnaZCcbrPbKiGMv
	 Wiql1RdRX38vwzbcCtlnZVFjGfMVe0lKesyyhcyIA7LD7JBUWs2sQMj1Vr7AeI471B
	 bxjBktVQX+bBIEUhPri8q6DoWtjSKwaALz3PWKFmIQniozQ/THzdMWbQCqBnpRulcs
	 ap/RYUkarUCBvM9ImU1oVe00U7GnAwwhSb1akdEZrXjeDhhbIMHsps95okXUsIS7Bs
	 +6cZSkPaXv5kHYawKrv3LThPbYZ2iBPAvHpU44FWig8QXr0lmSFCbITUs+45D1a05S
	 qB54XK0AcZR0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YyGQG24Ywz4wcy;
	Wed, 19 Feb 2025 10:46:46 +1100 (AEDT)
Date: Wed, 19 Feb 2025 10:46:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm tree
Message-ID: <20250219104645.12422813@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Od7nkuH_FOd.uaC/4IeEVMw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Od7nkuH_FOd.uaC/4IeEVMw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

vmlinux.o: warning: objtool: error_context+0x39: call to search_exception_t=
ables() leaves .noinstr.text section

Introduced by commit

  599382062e7b ("x86/mce: add EX_TYPE_EFAULT_REG as in-kernel recovery cont=
ext to fix copy-from-user operations regression")

from the mm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Od7nkuH_FOd.uaC/4IeEVMw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme1G+UACgkQAVBC80lX
0GwKcQf+LtjwxD16zs/bdb0Zmwlw5Qh3Z785U/W3amBONmX7gCmQp4HrTcwdZjk0
CisP/Vk/d0oYV0wnZUWgbxd7p3+glu0iHpRCXWEwnC4G+dRl8MN4uWrPJjSRTXZn
14w/PIwoX3OEP+HPQFEYCqui812LmEceBwTp1+tTqol2ytUGYdJsG6M1pDHappqa
K2/VYH25+1Vs1/jyYM5rmKWDF2uBeOd8DLFwyBTC5P1jpcuQyZb0Xal1yTQ8pcx8
zonZX41y8EJqT0N/4kR11BQjV6uA7ax0Z0vLaofQB58F0SYmRzK1eI1eCRPbqyh/
l4fqoStkBIJ5+yMGG4UWPd1gwi8RYg==
=Qhz+
-----END PGP SIGNATURE-----

--Sig_/Od7nkuH_FOd.uaC/4IeEVMw--

