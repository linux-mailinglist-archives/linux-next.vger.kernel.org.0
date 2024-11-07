Return-Path: <linux-next+bounces-4695-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7EF9C1172
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 23:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C69082831F6
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 22:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BF5216A32;
	Thu,  7 Nov 2024 22:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="anTApJyq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409CB215C6D;
	Thu,  7 Nov 2024 22:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731017003; cv=none; b=G3u42krH5ZyeMgQDKIwMzJvdHZP2FrHe/WwVNHTm/nzo09NddbSrdlBs9mekh8Z70UCm0yqbxA9ejf5ezLZ5pZJBqaEuxaLBFITskh999/n74REXHJDXPSJCRuqzEQoJS5pOruxKEaxJu/rpJCaf3/2KL41peE5KbVKHyhffBQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731017003; c=relaxed/simple;
	bh=qkK0amL98AbIIS/b4OPpm+hQwWpbUUOjYa7QJ2H5DuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sZAG9n4rkdcaZiC82DE8Iv2slw/vPsUgpWA7czhh7AnNcfo1wkc/Z+UVT6aS2x+7KsOzAW9ZfQMD4+9T7H/r4Yu+cDQwVXFteVQe8bQ/iP2PlWWe2XdLRQ60Mr+tNqIdEHbK+0LMI7GBfzUdKmJEC2EqnppWQnd6uf1Gi72xtSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=anTApJyq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731016995;
	bh=wUixlLA5DgEihjvV1A9082nTUUK+zEhB9qYoo60sBWs=;
	h=Date:From:To:Cc:Subject:From;
	b=anTApJyqJPBY3BVeaYG9jUx8gH8mpy+Y3jpuM9K3NmgQfD/9iEintklgz/Uge0nxK
	 ZFAVyi6FOBlXLX9ODee6pyA4AZ4UryL7bdFFZunJ+pYEdszrjJHlBOvFAMFbeVglVF
	 0H8ap32HepW3gFDi8WyBBFsPHsag2jdG6hgY1/kzJ0W13wCOiQOrDirrg3KvbsUejU
	 2B7MeBM0zHkdKz8e0YsxNagaeCUcwrNNYwzuZ8C9ajZO96dhfDzleS3z4ASqSdYUET
	 BcZkAoSsg8M54MJr8VB3b9cT5npi8KS8csv7IOlJjt5SNz/Elfqj+bQF4UGm6XtU62
	 7HQHRKKel0c8Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xkx0M6F7nz4w2K;
	Fri,  8 Nov 2024 09:03:15 +1100 (AEDT)
Date: Fri, 8 Nov 2024 09:03:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the btrfs tree
Message-ID: <20241108090317.3eaad84e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JgKSypWmO_Is+W0YgB_Oq5A";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JgKSypWmO_Is+W0YgB_Oq5A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the btrfs-fixes tree as a different commit
(but the same patch):

  f4c30cb4a62e ("btrfs: fix the length of reserved qgroup to free")

This is commit

  2b084d820594 ("btrfs: fix the length of reserved qgroup to free")

in the btrfs-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/JgKSypWmO_Is+W0YgB_Oq5A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmctOSUACgkQAVBC80lX
0GwuaQgAi4n5MrwpmwN3TxBglM6Fpv0G1PgpW45U9pZq8XGpUY9RTvrOFJJalJwC
OdzqQSBH+YuQSDzyP8DOjMRP6SR8ENHH2pm6nRNWJaPnYDNByPh3XzJr6ftvQ8Xy
JkDg8JYJl5CgCiDw12obTMTJYkeJpRwDtbZS61TcpP0fdecWG3+j4lEnunVFtQxa
iq84NMKrmuCZg9eaKTmim/ac+PeiaeNuF28ZsNisBzd8Gjn3qVyiQtj7I10T3EE1
ttWz9VqyAkTviCUHu9kQDRITTtbauRDaI8uX3QCj0sKggGpPnAXzA6IEec0haaaa
7TjytF8mbosb5wq77BO7U1g2aRwtng==
=Awqt
-----END PGP SIGNATURE-----

--Sig_/JgKSypWmO_Is+W0YgB_Oq5A--

