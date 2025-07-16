Return-Path: <linux-next+bounces-7592-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E56B0806A
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 00:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 322621C41240
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 22:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F1026A0DF;
	Wed, 16 Jul 2025 22:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Id+GNqXq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5265A29292F;
	Wed, 16 Jul 2025 22:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752704395; cv=none; b=j5cCuQwj87J049hst8boTTKOMv/x9aPPE543yhlkyW0PZ+G02yuqQy0IhK0Htjxys6zky8REWdiS2WidAwnexYhu+dqYdFmqSv2aAvn/gOQyRG/90OmDNUYvk22ZrlbXY+w+62ZVeEFZIyYlcGEx9iDpC1cDUkzCHsa00AMbBn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752704395; c=relaxed/simple;
	bh=hOp/iiJp9UfB/4317DMh/h/kDTqG2iEiYlG7zT+garg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OzHNX9TUahUL0WWLlT+3bCldpvZ5cyZDBlRN6TwmzJDixNmAYuTdHlKCgeTsBqK4z1qFclUmheZCRehw8ohMDUifFeaQVvnJdUnmDBDWTmEfHgzhzwHSZ5vu3NABr7swrEWDQugkHMJWYUxJniBIGXpSINNUeTYpDs7DIyACGuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Id+GNqXq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752704270;
	bh=mPJb7c1OVUtc99R85TXvGQftjGOtBqyy3gRNeHuZ7b4=;
	h=Date:From:To:Cc:Subject:From;
	b=Id+GNqXqDCkHQtLP08t8cALu3ff22uYXRZENPhPw+I7SeKk5qtInb2oY45TzVU1yz
	 TfoQNV7dGMRB3AYTOcwTNE4oIoFjeGSu9ay18gFtnvrxbaCMuYMHm8vxqYNccUBRKL
	 IVvlgfsXcouHB9kIH2DT5VmdToVmWNbJ1+tyoztDCdr9wzwOrRFt7zpLwwaePFijCa
	 /VNUR3hVNfmoryPG8If3xwhKSMd7Us7xdOAvUm5lGwAO5dOTvPcr3PwtMiW53CKCSI
	 AXFHmMxlCPxu7VYbDcwreUYIcRGjiIl9OtpOmLbGJ3vFjTKqh6RWUqXTM/hXvk4GL0
	 yc8hjhZehR+RQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bj9RL180nz4x7G;
	Thu, 17 Jul 2025 08:17:50 +1000 (AEST)
Date: Thu, 17 Jul 2025 08:19:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the vhost tree
Message-ID: <20250717081949.6d801c51@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/91_PIYnWtG2dn8qvU7D8o79";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/91_PIYnWtG2dn8qvU7D8o79
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  b1cb0ae9565a ("ack! vhost: Fix typos in comments and clarity on alignof u=
sage")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/91_PIYnWtG2dn8qvU7D8o79
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh4JYUACgkQAVBC80lX
0Gy1Kgf/Rx5uumQVc3gKCin0134fff5ZTRXOANbfcIJqWjuQa6GKIDXE0otZ0fDw
Q2LQ7aM6offDgBFhksKKdIA4QLgl4kb/oseoR8OyZYbnvtS0WdvDpnsJMv4JD1pk
CdEdUOuwyaJ/2lAdp4yTK7vxde330TyB+6gxI9M0ZDipLpZGEd/Hj5HyEpwKbUvH
Yl0SlUidyKRroJIcgiLCXBkBUr0PE8+gux4PSlI3/zqn57QgrvwYqkzCjvLIupCQ
ndUbW1O+g4XDWBM/YIqI2DuC540XaJM0njz5vcSrkGqBvjODeZ8G54MPDRTxbLcD
ddCOlY/ePQQAwLWNxQ+Dgj4SIFyXDw==
=Xtak
-----END PGP SIGNATURE-----

--Sig_/91_PIYnWtG2dn8qvU7D8o79--

