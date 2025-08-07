Return-Path: <linux-next+bounces-7869-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FA6B1DF52
	for <lists+linux-next@lfdr.de>; Fri,  8 Aug 2025 00:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9DC73B4F82
	for <lists+linux-next@lfdr.de>; Thu,  7 Aug 2025 22:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C015D2517B9;
	Thu,  7 Aug 2025 22:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Q8W6czGP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99EE246BA4;
	Thu,  7 Aug 2025 22:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754605348; cv=none; b=kQRFvu3EiMCoFg7E4mjNNPxs8mTOsp+lAXNyTylpRGQmxr/YHqxuYOO6uElBotgIaInAzQZ9fLhvrMAPO8i3hEny031yPpi3jJeFO7+hhavmhXzjYLgSWXoIkUQ0cpCyVQsyaKQdKByNO7AL7fWkcaamYRBryU+l+68/4IrzAdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754605348; c=relaxed/simple;
	bh=JSpf2ptRywNd2j8GJ35NjosfBhP+dq3rNvcJKUUd4qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=om9NaS0a5GzEYoInztKqaE9PCVBdlBIRUSeev5zRn+yLq9IxUpHIAGkR4VeQ7lrsHGjLVMOomRT3vV8UzvauqwPcrIVj6FfKwROXhIDBGq2MmF5hsfciYzzd4GHJhR5UJvvvzlWq9NSohJuux704pLyw1762KE6yUebO+h4U1L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Q8W6czGP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754605339;
	bh=pgecB+cd0d7chm+o1LDyp4M6rsvKMQCOem0wHxfohYE=;
	h=Date:From:To:Cc:Subject:From;
	b=Q8W6czGP6QAI/Ct8344x9HH+2JK3W1Asfh3ShEwZqeyyoYIFSj4EIgiU8XFDSZCPO
	 eGQhkBlXcjZKT/2ahfADDoQYCbshWwYERNkcQny3RM9IKgxfwbkgAaaho7h2BUCYoY
	 YlfwwV5HKiZ173etDrsWj3Xtauyi2t41XnMmtn3aSLC8BCDjszTrm3rkoj17l/uklp
	 WIxMUPJZzxr5cXP3+a4vV+tGxrTJSzpQQp6MfgZE5wLdRDmXkvzK47KgjUxS5wNsN3
	 EVWFgnjRP3urTiRyQXl57AtBKkk6E2tMw4CILtXZCnHU5cXLhqH8T0Nc9+kc8/uGxS
	 QJnHeXXxFekVQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4byhVM4XTBz4w2H;
	Fri,  8 Aug 2025 08:22:19 +1000 (AEST)
Date: Fri, 8 Aug 2025 08:22:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Torrente <igor.torrente@collabora.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the vhost tree
Message-ID: <20250808082217.6503856d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u6_nzrL_jY8tlG=t5Fw.EMO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/u6_nzrL_jY8tlG=t5Fw.EMO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  878676525147 ("Revert "virtio: reject shm region if length is zero"")

Fixes tag

  Fixes: 206cc44588f7 ("virtio: reject shm region if length is zero` breaks=
 the Virtio-gpu `host_visible")

has these problem(s):

  - Subject does not match target commit subject
    Just use
        git log -1 --format=3D'Fixes: %h ("%s")'

Thus:

Fixes: 206cc44588f7 ("virtio: reject shm region if length is zero")

--=20
Cheers,
Stephen Rothwell

--Sig_/u6_nzrL_jY8tlG=t5Fw.EMO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiVJxoACgkQAVBC80lX
0GyPQgf/eAZ0m3Ggy0j0bZ1gYLgDuRdhtYpmh5vqkhc3ls4CryxwJRKd682dvdgt
QozUPDsibntOYsi/H70MgYRZcY77ENQ2SdspuZUiYW65zCt6qksE+L5QaFSkCLVL
yIkEez5pCbBzZ6c0ouaZXjrl+N1Jmz+lmUo1WLb/oLqXNvz9IRo6aJ+0rJrranQt
/uBB2zHsHmC+RKOkgrkfD4D3t2vYs4AjGvvBpWrq3KWEE7gdy2K6DEOz5e4p18w7
wqSfvJQaICzRXJJzYhIXuvaa9/cUAvNcILjE++9KmnKZzjrvZKXonOXMW81WDQ3/
hZ/9TnN9uttw0QqlyPGft/w0TEs2CA==
=d0aC
-----END PGP SIGNATURE-----

--Sig_/u6_nzrL_jY8tlG=t5Fw.EMO--

