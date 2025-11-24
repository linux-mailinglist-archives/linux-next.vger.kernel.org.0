Return-Path: <linux-next+bounces-9194-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B2147C82B2F
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 23:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C80974E6427
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 22:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955292517AC;
	Mon, 24 Nov 2025 22:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qS3/y6m5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF62815ECD7;
	Mon, 24 Nov 2025 22:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764023983; cv=none; b=hl+CKdH43fZZAGnWVROzTPCs4OPa91GXw6Tbki+1MuNkU3EL+XmNVq2dvIWvrg2Od2ghIiYXjIO7coIK508sraPl5sS3iZYAJVnOqBucSBpxdnZgcR5X1KCVq+Cak6lV6dUz7+DTq4YBUoVSdsH0Q0unOz4SGxfu/2XWQhOIegw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764023983; c=relaxed/simple;
	bh=XZimppQ8k3uH84HbuY0KbfogPZ5O0l9Rh/aKMB6cv5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P/G6yRK1z9Dvb57CA6d5V0ot74tM/eXnYMqyflxY/a4uZgimfU1mjpR+I9JOWcpwxdrxXvdKZtwDTB8PpLyMvYGH77wr5yHlgpUgoTiIJd2+Y12tZctlihV8gSkebZnF4FcnY/gm2soNYY+eD/CS+lFvhcz81X5cm/kMW/rCdjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qS3/y6m5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764023967;
	bh=DVmTMyPy6RzWtiw3yTq0FvarV+MGBSUax+B/ivnYEws=;
	h=Date:From:To:Cc:Subject:From;
	b=qS3/y6m5xfegWCF9tYrjYXa3pU1IGT+43f8n8xIYQ670343yW6npQDKU+CYSSptdn
	 ME9TVFmS8kTvwbGdg1So4VYya5/JnhfmDcU9F6B52Ld281mz+pcctqlbaQ49QneplX
	 3XqOV8vlhDErL8tleIhC8EFMDfhKwB6jlU7qwHWnJ7YsOcr0K08YlanknnvMpMFgcn
	 Je481yhZnB1yumHqayyHn94jDQkuH+oAZ+bNiUXLKcqv+SYhUjpESyN50g6otsgWq3
	 /5FftN2h2NSBbPqvp1QjT/KfqYm9dggUhyTiF4ylvShRWsq96TJpLqLsYJtijfGOjL
	 EHiSlSr5XBeTQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dFgjq5q6Dz4wD0;
	Tue, 25 Nov 2025 09:39:27 +1100 (AEDT)
Date: Tue, 25 Nov 2025 09:39:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20251125093926.296e0d3e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FTKSiSX1vQjkG=HkX6ICDOM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FTKSiSX1vQjkG=HkX6ICDOM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the btrfs-fixes tree as different
commits (but the same patches):

  5f63928dfbbe ("btrfs: don't rewrite ret from inode_permission")
  14071ea0b0fc ("btrfs: fix leaf leak in an error path in btrfs_del_items()=
")

These are commits

  2e5cf8b31ac7 ("btrfs: don't rewrite ret from inode_permission")
  0249ef24b4c2 ("btrfs: fix leaf leak in an error path in btrfs_del_items()=
")

in the btrfs-fixes tree

--=20
Cheers,
Stephen Rothwell

--Sig_/FTKSiSX1vQjkG=HkX6ICDOM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkk3p4ACgkQAVBC80lX
0Gxw1Qf+KLkDMpaj//AdEQqM7MD/pKZ6+MRRERgTj3f/NSQoRsCqmyxRHJ8tCmlK
IJWw5PMIEQ2MPM/uVyh2Dt6440u6XT9DKRDmfV0gjvWgEN+ZFmuyoFaq31PZyZD6
JqpnT0ZWrVDiPw9kxXE7c+p8PdxDD0Rbu6RSC4swYm+xUdS5+ZZ6/S46T+RN9frt
e7mf12NXFerZXSvs+41DlGvK/XdrTAEfTO6b8gS4l53j+Oow1xb5WkhVLD6D3eNw
ibzFn9Xm2sSdxwiRve0RN+CNXyZO0lB4SC6Hl2Ok2t66IZCBTq4jQYfTMK/TKc0L
EMElsAV9iQsnCYSyMEY+5fyHIRH7HQ==
=CO2z
-----END PGP SIGNATURE-----

--Sig_/FTKSiSX1vQjkG=HkX6ICDOM--

