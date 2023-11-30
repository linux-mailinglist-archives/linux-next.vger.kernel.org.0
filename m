Return-Path: <linux-next+bounces-163-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE8B7FFE1F
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 22:59:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E8AC1C20BA2
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 21:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBF05DF20;
	Thu, 30 Nov 2023 21:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jvPI/OO7"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3226BA8;
	Thu, 30 Nov 2023 13:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701381557;
	bh=aMOPwXjO1fbwAnhY4f8dQedNMViGu4NjfUvDGkCWvrA=;
	h=Date:From:To:Cc:Subject:From;
	b=jvPI/OO7Mr+gWu/yIUjoBiVudL+A9Gz1hNo+GQ+eU9ks+ine5EdGo2ttJmKJS0mYx
	 L00ydMo/bCBcTF2IIOG6Ty2JVQpAHBOU0VYaKzVm0aN+lS30myz8aspXnW3LTkv5Eb
	 kCWMx9M9AQ8xZw2X37qfQmgz4naSGUZQwrFbfRkpEiWWpaTMSi+ZRyNUiZ9nsDau6J
	 ti8rt1guQ9jG4ztWJJDAUJpZ5ckfn5lfdCHSr+lGUarzTY9si4VD7+HjNEuvPZZ6UY
	 nGpBaWJcvlbk/vdH5lGyIdN1IrtQ9ndDdhXggj/oXVfUXLb3PE/lvIl7HRfr+34x1N
	 gdjacYT5UBZRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sh9846Pxnz4xkQ;
	Fri,  1 Dec 2023 08:59:16 +1100 (AEDT)
Date: Fri, 1 Dec 2023 08:59:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the scmi tree
Message-ID: <20231201085914.4ad45eb2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QII/HTPJwoEeUR_Vy5Rd_Kf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QII/HTPJwoEeUR_Vy5Rd_Kf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scmi tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arm-linux-gnueabi-ld: drivers/firmware/arm_scmi/perf.o: in function `scmi_d=
vfs_freq_set':
perf.c:(.text+0xc8c): undefined reference to `__aeabi_uldivmod'

Caused by commit

  eb55fbef8913 ("firmware: arm_scmi: Fix possible frequency truncation when=
 using level indexing mode")

I have used the scmi tree from next-20231130 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/QII/HTPJwoEeUR_Vy5Rd_Kf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVpBbIACgkQAVBC80lX
0GxBMwf9E1hUNySGRFGANb/FMNTHBfzI0yU5tOWCUSl3l1zwIUQyZg9aW358o4KL
qRKE4CYpB4CcXuEfmNnWJ/i6W8H16+DUaKjFmpFZuTsTBeXtqNYI4c3dpvn9ECBs
csJwY2kurqrVsSTAKGzbGQfDnId+8NJvh2nz9tqZsDloXRiapSptkGdDQlqipf7+
yFMFGRg6sUAQEjqU2qzBpm8rQjI79LUeIPPhWfmZPNxjV6z81z/FZHd2bFN5p1A0
0pb3q72iYutgezxrqe0yO1XUDaYjyXtGhAQDjpeQGtiCGP4//xMcTMQ9cOBbMPUl
NipSfhx5+bknh2GQsvLz/A80NkJ7/A==
=hO2N
-----END PGP SIGNATURE-----

--Sig_/QII/HTPJwoEeUR_Vy5Rd_Kf--

