Return-Path: <linux-next+bounces-3132-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 627EF93CB97
	for <lists+linux-next@lfdr.de>; Fri, 26 Jul 2024 02:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F027282DC6
	for <lists+linux-next@lfdr.de>; Fri, 26 Jul 2024 00:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4E8370;
	Fri, 26 Jul 2024 00:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="m1YJ3fnR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED10D19B;
	Fri, 26 Jul 2024 00:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721952047; cv=none; b=iYjBCI+2ALvDh768lwWKRiYJM0NUFP51J2rnVbXjV7R1ebuQW+nb7mY+nJ1M01j0H5qf5vn4ztE+OS3enXRSQyyIXarzKiM7Kfvm2PrkNZ5BLBAaqC66jmx0X3yM1e/L6ZgQuGqqxBmvvMV4MWYeodzRzLAXEoLY5tUdgvLBmzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721952047; c=relaxed/simple;
	bh=9FA1ZpzzSx4lTKp7aL1jL+rA03pMwNQ7weLmoReJDEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rwC7xMFVNTg415Xubvcoz8NQGBu18RRQ+8pDAI9oN2utM6Q1d5AN+UTLN2tfE35PpY4/LJT+ayTVj0+t0E5m4xj16oiHYCfVZDpbMxAa+P++FFLI/m4TpokT5/fu3xyqGolITqjqwHW39TnihtLUGyqKp7P2GdQ33gLrLA+YEIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=m1YJ3fnR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721952042;
	bh=SE1I3hk19CBvYxlR21MywnDGMRGv7EoNLEZvXw/4rT4=;
	h=Date:From:To:Cc:Subject:From;
	b=m1YJ3fnRAKqPB/89LqPCDre3JRftT+0+PFyfQUchPNK3iQFPU4GBdFDw+2yImCQKE
	 YtICgU+dDzx0vl85lLAZ1uzT6VdeNA0OyDBFgE+3IyEMXUYGsWOxRL2vLkvrSdzGN7
	 zvm/ZMfIO5KIYRwB8ENviquZDoT2e321GyzVapBs0EboWQZIGMThGDnK+qzb3Do7KF
	 DTWuvCfw4P+54/lWdthrp1mBQNuCmXK1+5CBuj/Vho4qj/yJAopGLekgbjloiD4jxV
	 XdEO+7DJLiv6mikdsUljr3UnQGj16BF/WPPyP+z9e/O7HKKB8EnmFjN9bUdpiMIjnS
	 QEd7PJ7lT/jyg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WVSZL0Lk0z4wcK;
	Fri, 26 Jul 2024 10:00:42 +1000 (AEST)
Date: Fri, 26 Jul 2024 10:00:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20240726100041.142b6e35@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PPdJgSOv6_de9EiODgNjcdP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PPdJgSOv6_de9EiODgNjcdP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from fs/smb/server/unicode.c:14:
fs/smb/server/smb_common.h:46: error: "F_CREATED" redefined [-Werror]
   46 | #define F_CREATED       2
      |=20
In file included from include/linux/fcntl.h:6,
                 from include/linux/fs.h:26,
                 from fs/smb/server/unicode.c:9:
include/uapi/linux/fcntl.h:20: note: this is the location of the previous d=
efinition
   20 | #define F_CREATED       (F_LINUX_SPECIFIC_BASE + 4)
      |=20
cc1: all warnings being treated as errors

Caused by commit

  a621ce4eed14 ("fcntl: add F_CREATED")

Is that commit really intended for this merge window?

I have used the vfs-brauner tree from next-20240725 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/PPdJgSOv6_de9EiODgNjcdP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmai5ykACgkQAVBC80lX
0GzC7gf9EOnTTI0+G7iUEjqEeYOq9j5tUmmd6seaEvrD0SY5p9mfhE36nWoKbOuU
j/WJRYibrvnl1FMiREkWp2rcgvtDTmWJO4EOV6sKRIlfZ8zlRS8V7CBUE20fp6M+
Es1yPIUsoE2jMY0mtxdJvtQ321nF09ThWZ0ovVP1YbHVbNTjWhp5orLBIfX9Vc2R
F7pg3uz5XuA2kE7cmz1N/39e6eUcpNDd5ENZuGWnPHAKTe69YgbMAKKk7v2vNtsF
rkDlnfUCW7zW6aegT5n5RNhWyyBHwuHA3jMMVk6JNNDmDKuX/8DThdPQaXEa5cSU
BxQM9U4Zs6UU8uKTW1frsA7ReL3iRQ==
=mkYD
-----END PGP SIGNATURE-----

--Sig_/PPdJgSOv6_de9EiODgNjcdP--

