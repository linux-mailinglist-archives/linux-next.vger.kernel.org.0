Return-Path: <linux-next+bounces-7176-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B86ADFE28
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 08:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14BEB7A7FBD
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 06:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BAF24889B;
	Thu, 19 Jun 2025 06:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sQ2lEZGG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D1A246772;
	Thu, 19 Jun 2025 06:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750316174; cv=none; b=lRXWRlZ7jqCMsWQa+q2zteVj9bdGnwo//5uX2nfREit2YMcN3EMz/qXShe1p/xUkQl9VXZAtxZpJg87ZvnFlshI68etnXtPP9yI/kGJE8AIE5RGgjKCv889u4AptvWiPil/5Ox+KXMbuu4rpYxVQ/OUtPFGl04qtQH3o2vOdIhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750316174; c=relaxed/simple;
	bh=vVSn7XKabejjo3pbl5c6nCyc1k4D4oaDiXJU5ZtAyT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Rs886OZ/4bhMqYudOl8vNbuwREyXYc5eSp5PXcQQ35oPQPfSUO7wZ4orZ77bxLlJwlVcV6clvYHogPGw+Eq+sIFaT4skrNfJptkAr7ZodxYBVLkNEkuez5T6jVBvebxmnEeGPul9Q6wZ7M8ZRkElDSoeq9VpxaN3xaUcDdZd2Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sQ2lEZGG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750316168;
	bh=Sxl7KycVrcsiHgLurxxG5MbEA/FN7L99ksyML0+5SDI=;
	h=Date:From:To:Cc:Subject:From;
	b=sQ2lEZGGrId+4G/4r9cjn+IamIL43YhEKHSHLbkKx0p443VLNBIKo/NPNzUPLVb8C
	 Zi+yXgbMCAmdu4Ue5sXODy4GQ/BIzz5G2T5u9PUnS+1LUQdFvvhnLNu4lu6ibvI9qm
	 rq2tYRGCJKA3exA1A7odKvNc/6eez5XnhVocR4DG7+DD8xIiZdQybleD2UaFQxwe4y
	 LPfJuH0OU0qvDgwMGlWqC8GaUCL57MpB6tzCQzfZc8deyAyhTbMqOAlWSd99/c3lhz
	 ivdhb9yn2UxYp838urFOJCPpOvQkdaYGtDHPIqOaAMO1rAy1G0m6uvyTHA5CRdtYp/
	 1NnRFXGdHTYFw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bNBGJ15ntz4wcy;
	Thu, 19 Jun 2025 16:56:08 +1000 (AEST)
Date: Thu, 19 Jun 2025 16:56:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Jiri Slaby (SUSE)"
 <jirislaby@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tty tree
Message-ID: <20250619165607.33403e19@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CfKrPqJxKFCbv7EWJ=H48aB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CfKrPqJxKFCbv7EWJ=H48aB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: modpost: "rsa_autoconfig" [drivers/tty/serial/8250/8250_base.ko] und=
efined!
ERROR: modpost: "rsa_reset" [drivers/tty/serial/8250/8250_base.ko] undefine=
d!
ERROR: modpost: "rsa_disable" [drivers/tty/serial/8250/8250_base.ko] undefi=
ned!
ERROR: modpost: "rsa_enable" [drivers/tty/serial/8250/8250_base.ko] undefin=
ed!

Caused by commit

  5a128fb475fb ("serial: 8250: move RSA functions to 8250_rsa.c")

(or its neighbours)

I have used the tty tree from next-20250618 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/CfKrPqJxKFCbv7EWJ=H48aB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhTtIcACgkQAVBC80lX
0Gx+qAf/Uk9aCs28YRDnbo/z87i5ngHOO8Y2LwZLJs19IXj1wAKanxGD6yQUHrTS
1VwCFB4bWVQEf0VQJqhFQe452hpIyKTZ0kv2udKjCGoVq8MHK8ym4JWJpwL8O47H
RgULxXL66NCo2DDB7m70NK/0BNBwu+6l/BMoweYNmaOcEphO73tKLfogsx/v2lGw
5+TcETgP8sytcAG/iuccmP37zTNrQX4GZNuxpXujNHBC3L1CPd/WCFmKJS0A8avu
7gc6iObbf6FZQkuCxhgSeEfCNn95T+y0NYbQVFH0nxsTXXvth3oACQd4ELydKwFG
u4ZZtl5oUAF2aegaEcINaSYFg8X4QQ==
=umYj
-----END PGP SIGNATURE-----

--Sig_/CfKrPqJxKFCbv7EWJ=H48aB--

