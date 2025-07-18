Return-Path: <linux-next+bounces-7625-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9C0B09E3A
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 10:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FBB6189DD57
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 08:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F30B292B4F;
	Fri, 18 Jul 2025 08:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cljrBCdm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823BA1DC997;
	Fri, 18 Jul 2025 08:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752828212; cv=none; b=KTFr09lNv6IYSc8N77ruuR2bvkALdfjQVz1kX4oA1oZj0Ywp2Q+qreHijjJQ3fAWZwehIwKnzpi/YGxj25EyXUvgFElISprIni2kvY++XJQXMJsdfHWXe7NMKo1Vt/XuXdquuvvnr2lwD6Bz0R0IDEQqBLKrdKQkY1SGyqAmCI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752828212; c=relaxed/simple;
	bh=cXmv7rZFFjbUKRilKGfoMRbzyOD2VnoSNzU7sGVCsxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eGUJvige6wfpn1M3M6wltJU9X56BGNZYJmforSt/EClpDrXJuHn5aeWT/oHbVSoJUt9ZYH3QfwfkZ1oqy+iDFQUIg6UQIaGD7UW0gus7toYXI3oRhLmn0UQiE8ib1mcu5HfCZtmYtaatkUbwC2SgdeJc9zbOaZcBuyopOzM9oQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cljrBCdm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752828073;
	bh=SKJLwW63F7O+yYICcK8Ia582y6foMuGX7RjBoTDoJA8=;
	h=Date:From:To:Cc:Subject:From;
	b=cljrBCdmWvGLH4pwhGLxfW/tasmqrRpXW6WAMxbQORcjKk1UKpQDz05uMgKE00WSX
	 c4KkN0or3CzNjx9IssgKVb43qG1wQdMxgd1kocbkPP0nhX44XrWSowpMgCoIR3XBG0
	 GQeJf6EA5r19XmF7s6J766Q6XuDxqCxmeHpjQ/0Sl3ZornPxjl3FUO+m5B9t+T9G6J
	 TQrVrrHxddxLzYuro1ruhJ9yzLIJsqXwPIp8le+ZllZqgZk8KNpvY6FAxSwMW/bbOv
	 UGdtD9Wp96X2LPSuAJCCtSyVrmJ3npE+BNE6kHJmqSuF+zU0F/OQH9jssZ8Hg2zJxr
	 yizFZEPxdCH9g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bk3D94Xstz4w2H;
	Fri, 18 Jul 2025 18:41:13 +1000 (AEST)
Date: Fri, 18 Jul 2025 18:43:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vhost tree
Message-ID: <20250718184322.6afe4756@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F7+rG9gj1+fjl46QitYnT0S";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/F7+rG9gj1+fjl46QitYnT0S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vhost tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/vdpa/pds/vdpa_dev.c: In function 'pds_vdpa_dev_add':
drivers/vdpa/pds/vdpa_dev.c:647:24: error: 'struct vdpa_device' has no memb=
er named 'dma_dev'; did you mean 'mdev'?
  647 |         pdsv->vdpa_dev.dma_dev =3D dma_dev;
      |                        ^~~~~~~
      |                        mdev

Caused by commit

  ca3cc7f8da0a ("vdpa: rename dma_dev to map_token")

I have used the vhost tree from next-20250717 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/F7+rG9gj1+fjl46QitYnT0S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh6CSoACgkQAVBC80lX
0GxZHAf/a/ZlZ7J17UlqKgZBaZFcpgtjUXMmuqTQXT4244Ak9ersX6+E0KLcRx2Z
XeEZHybsX32CQq4k9fHl/mudhaH/po0BixzsurRET7J2paN+1j+/uABP7h6VItXc
NDiRXIQdNNZF+DlXm4ha5LggnktPJYcBX2YU/7RE+ROncsljYXz+9NOMdWpZNkfM
sZ4yn/qoAHafLEWjWo6dI89skYgTi8IXBCN2wA7/lg/CQLHnHv6qFPYioqeEhjRy
QqCABVKdXGvSZkRCnd3eRh230z2auvlv/XBQ0oWYtYly89XTCjYN/Y2ISNWSS9X7
Qif1GKW0aVUGaE5a8WlluZtzEDqGFA==
=IXCc
-----END PGP SIGNATURE-----

--Sig_/F7+rG9gj1+fjl46QitYnT0S--

