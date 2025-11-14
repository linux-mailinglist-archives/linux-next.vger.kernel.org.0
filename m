Return-Path: <linux-next+bounces-8983-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A00EC5B55F
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 05:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0AA984E3382
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 04:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C6927F005;
	Fri, 14 Nov 2025 04:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DxnZ44xo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734E9202F65;
	Fri, 14 Nov 2025 04:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763095166; cv=none; b=FZssjwXazzPYqAVds7yE67CqCVmm5CS0DCAmY7JUf6/eFZdUrsK6jHXzOxXYz7FX0zH81PkdGe0qBc1Tb7fK4I5zMJ0VlxauYA5FaiH63A0XGQhYxJqmujCv2wAySQwX9eXHZr+my1k0D//In9+TVULvAIVwxIlW9ifK6c0m1pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763095166; c=relaxed/simple;
	bh=Z7HhVhxXUwSGx06KciMx6ffX2vKR/HnwwO8RCaYrvO4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eN34s8VAiCMpDujB9qMNs46bYj9y5C5Lo3f709wDYCYKZwr+x4nu48PgsA/RealqPxG3lWea2rqD+kfRU8+cq8SOYsVctzQ5I9kEzabCrHTKyqijSGepVYOjgjY0aeP4LV2LW2UIduRiKGZqwglU4hiMf68M69/qmXzVC5w05Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DxnZ44xo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763095161;
	bh=Bd6xK/dT94mWv06soekeP4+OiU/ylRQoNxPuNNhej6w=;
	h=Date:From:To:Cc:Subject:From;
	b=DxnZ44xo8PQFW588DXtgK5/w2Ioo8MMkHnYl3zLKGX6JD5YvWlFXy/nB8+YRJUh0C
	 vJG467VlDRoWJ4nmKUV8g+vnaYsI/lC4Z1i///epUQgc7bHYNF1ukHjtLmEiKTY34Q
	 a0w7T8VCcFYppKhpAxVMIiwRFLc/P0tvUrxijt7Ugd5UuQOTdR/8daFWw/7jpEac08
	 4GfDZLLovtn4fLJX15ET5k1IsFGJUGNTE7ab3kJhFaaAu+Xfr0WIGH6JmvemBPEKAL
	 D2wlgwCx9daxDe3wz1Qckz6xIY6PdXA1w5+pp1zQrRsZoyjDQ8IE7rJFvXGWllP/Qu
	 BQ8v9fU6ErW9A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d74D93Bqtz4wCB;
	Fri, 14 Nov 2025 15:39:21 +1100 (AEDT)
Date: Fri, 14 Nov 2025 15:39:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Khairul Anuar Romli
 <khairul.anuar.romli@altera.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the char-misc tree
Message-ID: <20251114153920.1c5df700@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_8cw61cWJrvqELDhxv92TQ7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_8cw61cWJrvqELDhxv92TQ7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, today's linux-next build (htmldocs)
produced these warnings:

WARNING: include/linux/firmware/intel/stratix10-svc-client.h:22 This commen=
t starts with '/**', but isn't a kernel-doc comment. Refer Documentation/do=
c-guide/kernel-doc.rst
 * Status of the sent command, in bit number
WARNING: include/linux/firmware/intel/stratix10-svc-client.h:184 Enum value=
 'COMMAND_HWMON_READTEMP' not described in enum 'stratix10_svc_command_code'
WARNING: include/linux/firmware/intel/stratix10-svc-client.h:184 Enum value=
 'COMMAND_HWMON_READVOLT' not described in enum 'stratix10_svc_command_code'
WARNING: include/linux/firmware/intel/stratix10-svc-client.h:307 function p=
arameter 'cb_arg' not described in 'async_callback_t'

Introduced by commits

  bcb9f4f07061 ("firmware: stratix10-svc: Add support for async communicati=
on")
  4f49088c1625 ("firmware: stratix10-svc: Add definition for voltage and te=
mperature sensor")

--=20
Cheers,
Stephen Rothwell

--Sig_/_8cw61cWJrvqELDhxv92TQ7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkWsngACgkQAVBC80lX
0GzM0gf/ffTPZ5rLWv/9UBhlIKScEej6mj6OIquu1MyWlOJ+MATVXHNkgTvbKpIP
aOFyqh70zycufBw9yZOUPPvMmOdo8uimYHGy23uNHZvRO5TC1pJL/pnAXCRjp8h+
m/a/2Z3Egm//NW1u2SlL8TgUN1F9Q4DYlo+wMrDMXJfIOxA7SyBOFkiFM+D5/w86
SLQ1F1V3QqEHrFM/yLHTMRj0hilBDU/fnufdzavIbkag+riUeyITHfqi78L4Rkwd
Tr2dFDVOjjlzsMV29CaneNYl3z9zi/LMVNtYF6Ru2pNrZYAvj2sDs9LByL0cTqP2
8sURV/HduJQ2XBboHYBYSpuz6l28aw==
=bdZ4
-----END PGP SIGNATURE-----

--Sig_/_8cw61cWJrvqELDhxv92TQ7--

