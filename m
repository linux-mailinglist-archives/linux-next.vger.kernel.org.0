Return-Path: <linux-next+bounces-3187-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C577B944223
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 06:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 242FEB216D4
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 04:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B09313D282;
	Thu,  1 Aug 2024 04:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oTO0hQNO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6DA1EB491;
	Thu,  1 Aug 2024 04:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722485456; cv=none; b=JL5S+9XnD52Fuq3nTF+MSvvxKuGwTHd1kCcsE4S0A5NDLWuzIRKUOEtMk5SRMOxNZcfSZn2q9lM8Sb9HyPg0Yxp2PX4JEkECBmdkCiS5FmegjnOmsKsmmPBwdJY3PBU41Q9sJyzhk8an50AseumYoB8LtMHSvgndXitxBCJc7Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722485456; c=relaxed/simple;
	bh=F3qxceTA8BNt5iCB1b3Nh9G2BNolkb4+V/qtx55hCuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nZP9sGdAd5r0X158mI8L9j8RTmQyYFiWGdzstxuU1htdBD027GUX8HnONG7+H3AbfNtiErp7uff1IOd6drwnPLjULzmhNUHDQ21p4ysL6pd5mZ6LVmvxPZeGconMCQGsCKePxRUMBvvz/DkfNHKFPuXqHirrShMVBtEAGu0dQPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oTO0hQNO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722485449;
	bh=QMbl7tTrCcI1Rusy8f5wIoMw/fVQ0Pg72X0sAannVC0=;
	h=Date:From:To:Cc:Subject:From;
	b=oTO0hQNOx/uRXitJ1mz69FUv/b/tLZJFcrZWZdSQ6aTUp4VcUft3BAELCU2/7uQOF
	 PT4foYW8Q5VZD+w5zZpXrDri4/7XyTq6vFz9C1bxRSMM1pJcX04yrbP8Xw6uYpo9t/
	 UiyW3IE13UaruMJ/ynwFB4sriaZVwS4e3IMlJN/0E/3f0tnplAur1N0mRMIN09UBXc
	 kQTYnkvCN/VOX7/dOSLNEPoc3W//bBYZEwmphqu6N7QATAHEcJNg1sM4eem7o+k6Lo
	 wChlsStRHzpStndgt6BsaKIJlSbh2jxAYUM4pC9+ExteCnJuaGA/wjhOPRiaT3e8lG
	 lsG6fKvIVE3ug==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZFr868Mjz4wc1;
	Thu,  1 Aug 2024 14:10:48 +1000 (AEST)
Date: Thu, 1 Aug 2024 14:10:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Wei Yang <richard.weiyang@gmail.com>
Subject: linux-next: manual merge of the memblock tree with the mm tree
Message-ID: <20240801141047.07940cd3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VInwpX3vo.XFmxww6=Ym10A";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VInwpX3vo.XFmxww6=Ym10A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the memblock tree got a conflict in:

  tools/testing/shared/linux/init.h

between commit:

  265291d604a6 ("tools: separate out shared radix-tree components")

from the mm-unstable branch of the mm tree and commit:

  f56de2214554 ("tools/testing: abstract two init.h into common include dir=
ectory")

from the memblock tree.

I fixed it up (I removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/VInwpX3vo.XFmxww6=Ym10A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmarCscACgkQAVBC80lX
0GzUmAf/bdzekCaJ8LBF19yZoxw+znOck3JYEbPxKfYbI4uo+zBGw27sS860DV81
dBONz63YBkYGcDSSrsPV2jkpK8qMXT4LwMgrgofrOxyDMfDwjgIu5QShs+8M6B6j
arl9ii8t5A933q5nti9MpxSO6F9pDM/Nzlo9KwGzK+tUjyX1QyjEeqybKQYUa+ar
K74RW3UA1ILhHUit3r8QaEtinqAuyGeAIVktMLfr26KfQD38I8wdaIHnlUEo1CFD
/oZQtHbWsQS0d0ZTMP6uKzgi1xLdC3Bjth4TBOst7MkVNa6t/quKsgu8uoKNq2s4
XUGYtDCML8xtCksbqGMRE4caUqokPA==
=Ja4H
-----END PGP SIGNATURE-----

--Sig_/VInwpX3vo.XFmxww6=Ym10A--

