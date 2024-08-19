Return-Path: <linux-next+bounces-3355-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFCC957850
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 01:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11BB6B2099E
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2024 23:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3631DD384;
	Mon, 19 Aug 2024 23:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZvnifwNk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B3314D43D;
	Mon, 19 Aug 2024 23:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724108586; cv=none; b=RbvCJe824xTK7lAHeVz+2XhDetRwPLsT1ksGHlqnphmKOOIDNqdj1Ul+dCT/n+hM/bD6P/kbl/KQCRF88EZSkWAZdTLgUPTIa+eLcd/+M8bAkmA1Li/sH4Wwb/bqsWEKAgONKRb79w3EMxsWhvQ16D1YpR8vTKj8Y9/1MJYc/1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724108586; c=relaxed/simple;
	bh=IBxRX3FxX61SdpyV9Dny06ARjAIqWCAWUGzBRw7wFVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IN/cyqKmfH3v5iVPs5S5Tc3SWVVBG2aqA/lwm4dD4sb0gnICp8ie89puXugGUgq1gMlJljr/kI/3gKzu/YhyL/mVwSmHyVKmvFB/eoeOO13AbiaGFm5uZA+vc/8joG52q7ducPmvXPIih0KzL/OMXthTTjutv7XUmIHKenGHpK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZvnifwNk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724108581;
	bh=UqTEZ6PhnHjdy/8LL1nNNbcf5sqyvEDtm+dAnqXjdIc=;
	h=Date:From:To:Cc:Subject:From;
	b=ZvnifwNkX04zSxMedeEWq38BWyZ6FCTUmCVOKyX9tncFRcoFMsgFVMJp55/SKQMrx
	 wWjKmvW/oYC6GDKU+zLmVf7Xmsb6oqKv+53ymO2u0VwNVd/DeiIanBiBEAcGSt3J0x
	 PxHz3OB5jOijbYyScTmd7z8+V4zyor7kJ/LZzIgShcLOVhMV/0kpyqEWWyjdwT0og1
	 a53bXQBvUMjya7uD51Fb1dOwHj2GUKSKMU8cX2ZvOUqePCRUcoVLQhCJBJ9jbxluWd
	 sU5l/oqR6c2WbPwusTG224ODt2XMsT2KP/uIqL7Zxt5YAIxrYzREeheKtTH7S2nSCp
	 B5ucDKWVo2cOQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wnp6F20dpz4w2L;
	Tue, 20 Aug 2024 09:03:01 +1000 (AEST)
Date: Tue, 20 Aug 2024 09:03:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20240820090300.166d3383@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EzaF0X+ACdEBiOdFUqJ7njc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EzaF0X+ACdEBiOdFUqJ7njc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/fs.h:6,
                 from fs/inode.c:7:
fs/inode.c: In function 'inode_dio_wait':
fs/inode.c:2650:45: error: the address of 'inode_dio_finished' will always =
evaluate as 'true' [-Werror=3Daddress]
 2650 |         wait_var_event(&inode->i_dio_count, inode_dio_finished);
      |                                             ^~~~~~~~~~~~~~~~~~
include/linux/wait_bit.h:276:13: note: in definition of macro 'wait_var_eve=
nt'
  276 |         if (condition)                                             =
     \
      |             ^~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  6f87283ed286 ("inode: remove __I_DIO_WAKEUP")

I have used the vfs-brauner tree from next-20240819 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/EzaF0X+ACdEBiOdFUqJ7njc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbDzyQACgkQAVBC80lX
0Gz1aAf/TUHyK6XqiFt6YqkKtOgTorGVbPc7WgMV2dnhJ2X3e/Vp0CppPhD8EO9R
pJndY3a4I8blZxVwE68g6bl4Xuw2AuNJ0u8iTrNd0OypPghP4Jv8MmSPjnQnvome
yLNGKdA8G5naG8r1CK5spOt+zLNm4shnZlfgtqcgSSuF8fD7fDTLGvWtuidhYf2i
SBsCzhxFxG244dRKAn+gaIad++Mg9aAvHagZi4ZSqKEEV1KHpYCJqrYxTcoS5CF1
RVVslSV/NFSdi3Aq5Q0WaggmMechNlIZrjXKgMgwaHny2hxvsAE0vl4J45I5wpdr
xH8d9j09F66j6a713/8QRnXQ0MztfQ==
=Svet
-----END PGP SIGNATURE-----

--Sig_/EzaF0X+ACdEBiOdFUqJ7njc--

