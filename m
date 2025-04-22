Return-Path: <linux-next+bounces-6340-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CC6A97A96
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 00:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ACD23B6537
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 22:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02ECC2BCF52;
	Tue, 22 Apr 2025 22:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZDU6ayl2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38D1199252;
	Tue, 22 Apr 2025 22:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745361600; cv=none; b=ns9IHUmY/wV/AZzd5h69V05UvAewRCb/NvjF5XtvjmLWMkM756PxuqIL2W3YO1Len+Xhbv3ebR309aAbv4Qc3Ogc+QW5t+hKhsIrfgMJl4iDkc9Tx+Vfbttr8qxkcmc8ArbMeVPutEx6fs3LxU4KcZWoqqoTVMMQWaAmmrBVF0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745361600; c=relaxed/simple;
	bh=BZjzvxdqTI935HKjR3EG+gZTiMA0fXjyN91hyu3waBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Pev9qVbDabSg8E6St7MgPtyfTiQRmSI+h7yCAIhg0yMQEezRMGcDm8V9KEZlxOdtMr90y6Ypz3UH8rbm6cbyxqAA/MLMd1kg/0c4g45zQWhhaS8WDpQjaknsWWWQo0gaQNW7Xgbk7k+U5aVNm8jrlH+W85FC0/KLnjMHHQIFZ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZDU6ayl2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745361593;
	bh=uhJGXvbYZA3woF2MOJRHZx+ki1AM/kNwlZ0wFug8ERc=;
	h=Date:From:To:Cc:Subject:From;
	b=ZDU6ayl2XUgjlqNhINbiafYjg+HhBKDWVxac5AuYNh2+7fdyOHT7voT7j5HNFH2rh
	 rh0Fg3/8ZSOYVYlbj0QAOcX7FfuGBluHzfVG40vhnMrKV0Vssj8iHd8CCLRbRc79aA
	 A8Lpiq6M+8mIh3Vm4WcnTZA7jJroLzBc6sKaNTwU9jQXewVHvP4wcB5aorOp+muMGn
	 B10dDMrzvSv1bzaK3+7GyqfdvWknoe6mhSb+dIDkMPd6eOXXGJf5p0IaVp4OpASDSO
	 s/Yvn6ijXt4ChqZGBXIjbz4qihTppFkKOLGCTxBtdoIrDmLdYEkmOnGEthhfARf7Mq
	 M0X82Zy9pLKsA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zhxy1127sz4xM3;
	Wed, 23 Apr 2025 08:39:53 +1000 (AEST)
Date: Wed, 23 Apr 2025 08:39:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mimi Zohar <zohar@linux.vnet.ibm.com>, Dmitry Kasatkin
 <dmitry.kasatkin@gmail.com>
Cc: Roberto Sassu <roberto.sassu@huawei.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the integrity tree
Message-ID: <20250423083952.7fae69b0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e1lu0ajI4/VZoB3a5SPMVAI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/e1lu0ajI4/VZoB3a5SPMVAI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  976e5b974fef ("ima: process_measurement() needlessly takes inode_lock() o=
n MAY_READ")

This is commit

  30d68cb0c37e ("ima: process_measurement() needlessly takes inode_lock() o=
n MAY_READ")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/e1lu0ajI4/VZoB3a5SPMVAI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgIGrgACgkQAVBC80lX
0GwQjAf/bImN/WL8+qc1czM4zWr0Keip2mRTM5WR5mA8/4A8yDItpq9tQuCoswc1
V38APQuZ8UYanTyigjPB05oXaLDRGyrYYDrBDaEW7n2uQ8enGGoYf+i/aJkixVn6
IPJEjsiitX8QwPBnJI4WH7i8HMQKylHrsdjH6gjdrqFTvWC9sIVUPXS8aFjLykTy
hlQyLKG2KsA/5WWAWY6sZbwE0jig6XGRN0jj3WIY1owpedfn+t0WJuPQzCK+LcT/
5dS15xtQZn9Do827+pwtEVWSqAgeiYjVPV4xtcnWE26va0JEIiu8QhS0n7+yh5l4
+SEdTz3iMH10gT4uY1NbUa8q/k21Jw==
=R4Ic
-----END PGP SIGNATURE-----

--Sig_/e1lu0ajI4/VZoB3a5SPMVAI--

