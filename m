Return-Path: <linux-next+bounces-2-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4FF7F23C6
	for <lists+linux-next@lfdr.de>; Tue, 21 Nov 2023 03:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 397B1281A2E
	for <lists+linux-next@lfdr.de>; Tue, 21 Nov 2023 02:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D826A14A92;
	Tue, 21 Nov 2023 02:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DLKtddlL"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048A7FA;
	Mon, 20 Nov 2023 18:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1700533146;
	bh=aw2kfXcqIv7euEitZuI2dbZdBFBSAHNhYjWtnQdSqvk=;
	h=Date:From:To:Cc:Subject:From;
	b=DLKtddlLZHWp6IXsTReYqMjwpbbmwNRS6VrSfT+tuswqRNbcMOA05H3tWNOb9fF4T
	 Y7/AhBEJpEl8eYY4LLufhY7sMgH2P/eafqrqYO33w1+9AzzERHvGzipqM+hUvISNyv
	 WDUklYFZh06yTMaule36OiP+I28ILvukli+mRN8JDbMMiGfOuzrG2i+dah2jpyIMTF
	 ixKzsHL+jw1Vcv6Bl7/kFkN4GR0g6DQWSDSv/cVPGs3Jb9mKApZr0MFk/1BTZCixqU
	 n6oJuUconSfmyZjY+f5mamYsfwyCwRyiv2nriUzRQK3Oetk+UGnIbdOVZ0paRIShw/
	 S08noEkdJf4sw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZ7NV04dtz4wch;
	Tue, 21 Nov 2023 13:19:05 +1100 (AEDT)
Date: Tue, 21 Nov 2023 13:19:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kspp-gustavo tree
Message-ID: <20231121131903.68a37932@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EQ.c.foqdeoFlDG/+ymMIJR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EQ.c.foqdeoFlDG/+ymMIJR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp-gustavo tree, today's linux-next build (powerpc
pseries_le_defconfig) failed like this:

arch/powerpc/crypto/aes-gcm-p10-glue.c: In function 'gcmp10_init':
arch/powerpc/crypto/aes-gcm-p10-glue.c:120:9: error: 'gcm_init_htable' acce=
ssing 256 bytes in a region of size 224 [-Werror=3Dstringop-overflow=3D]
  120 |         gcm_init_htable(hash->Htable+32, hash->H);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/powerpc/crypto/aes-gcm-p10-glue.c:120:9: note: referencing argument 1 =
of type 'unsigned char[256]'
arch/powerpc/crypto/aes-gcm-p10-glue.c:120:9: note: referencing argument 2 =
of type 'unsigned char[16]'
arch/powerpc/crypto/aes-gcm-p10-glue.c:40:17: note: in a call to function '=
gcm_init_htable'
   40 | asmlinkage void gcm_init_htable(unsigned char htable[256], unsigned=
 char Xi[16]);
      |                 ^~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  167820dd258d ("Makefile: Enable -Wstringop-overflow globally")

I have used the kspp-gustavo tree from next-20231120 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/EQ.c.foqdeoFlDG/+ymMIJR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVcE5gACgkQAVBC80lX
0GwsTQf+JCEq02XCvI1UOAffW57bHXui6j0CgWgmwygFl9h6xOEdCyxD/YH0x/U0
xHNQgduIzfr8kHfjxV4LlwMlsmm3lr+0IqmwQRE/AoDBWzVnSSHYXPF4HkMGaau2
ukDfBuoiaS8wblc3qXeRkVqf9dF2Z/+ve70QeAjq0M52c1V5+j/SEM+tpq2xyc+0
xjG2KzjJsm1FJOeryDo5SZG3IDbehMC9IjbhCn7zlDKrbs7O35HOrEZIXYh63WFn
xhoa8oZCiEWiDe4DT3SJKR/fINquZfigJoar2snEnxGilEVZRz1TPLF7WoN2CxJS
p89JkbV8hs1z3pXAZkCp0vxnA7Ajog==
=aBbs
-----END PGP SIGNATURE-----

--Sig_/EQ.c.foqdeoFlDG/+ymMIJR--

