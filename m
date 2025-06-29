Return-Path: <linux-next+bounces-7274-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3833AED1B1
	for <lists+linux-next@lfdr.de>; Mon, 30 Jun 2025 00:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12DDE16FFC8
	for <lists+linux-next@lfdr.de>; Sun, 29 Jun 2025 22:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997CB23F40A;
	Sun, 29 Jun 2025 22:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jEAo8jPi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FCA238C2F;
	Sun, 29 Jun 2025 22:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751237602; cv=none; b=PJt5rvCoqXi+T3wLVMyqUS/h95B+bDDiOLh2xYEn/NlVeODpPOsSynQ/otdvCF5os0tXGLyoJc2NPdOqaAsoBekAErbcuFD9rgJ5E7T4rtBtGVRzCm1ovpBn9XnGTVkgySqprxme8IpeGFA35tYV/imWevSI7ykR2rawijcry+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751237602; c=relaxed/simple;
	bh=PnaNr/+BLBXmhmvPdAT7unjJcWf4m4Kt3yRZnIHS9ng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gA705rwY7KbRbVaeKyxSM6RwjUohBWRiVq9cchAHvSCCeeKdTAcpKN0ECHJ+zqQnExji79srbstmp1kRbVPxCfAPkizPIZ1qRZICpW/V3aSf8BiSbN2pECfzxQadGM58cwmxycgqKRlRJbAOfaUm5A9Ad21YXe3iq6q69IgGKFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jEAo8jPi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751237588;
	bh=6KuD9ehIHsajuZsC4FpypZrNrdrJ0xTPZWGLE4Iq0Qw=;
	h=Date:From:To:Cc:Subject:From;
	b=jEAo8jPiB3bedsUG0lYe7ekkW/eGVy2e8pgpmesGp/KDZjAXU2POULppR5s2jjeTE
	 WcAHTRxiLozY9qZtSFBG0gJmaeHF89WihUSU7RTGUjU1nh/UFiy92U1aJsZkiKMYZI
	 q1So9cQB8ZhISAVznqcLHN4WZfLBqz0hU+aw2KsN1SVvBdvFLWqWL0CZHEiVrYes3e
	 FGekX2RXeRwnpJ9oejXXqdroESyrvqMsqoSYbkt8nkadgV9fZyuQ9rmPe3YF7AQs11
	 ZuW/+UISfm/iq56GP28Zf9shP16GnmJNGugrFQqrBOi2aEUtJM8KbrrcDnWd5xlycs
	 ewekj2zToDTfQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bVl1w26wrz4x3q;
	Mon, 30 Jun 2025 08:53:08 +1000 (AEST)
Date: Mon, 30 Jun 2025 08:52:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20250630085253.4e8389e6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.BQrXo/E6jf5No.c+ut30cw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.BQrXo/E6jf5No.c+ut30cw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the btrfs-fixes tree as different
commits (but the same patches):

  6607ce31017f ("btrfs: use btrfs_record_snapshot_destroy() during rmdir")
  255265e977c3 ("btrfs: propagate last_unlink_trans earlier when doing a rm=
dir")
  2b6f3e452411 ("btrfs: record new subvolume in parent dir earlier to avoid=
 dir logging races")
  9fbec8743318 ("btrfs: fix inode lookup error handling during log replay")
  6437c70ad4e5 ("btrfs: fix iteration of extrefs during log replay")
  ae82071b0de6 ("btrfs: fix missing error handling when searching for inode=
 refs during log replay")
  731321790c83 ("btrfs: fix failure to rebuild free space tree using multip=
le transactions")

These are commits

  157501b04699 ("btrfs: use btrfs_record_snapshot_destroy() during rmdir")
  c466e33e729a ("btrfs: propagate last_unlink_trans earlier when doing a rm=
dir")
  bf5bcf9a6fa0 ("btrfs: record new subvolume in parent dir earlier to avoid=
 dir logging races")
  5f61b961599a ("btrfs: fix inode lookup error handling during log replay")
  54a7081ed168 ("btrfs: fix iteration of extrefs during log replay")
  6561a40ceced ("btrfs: fix missing error handling when searching for inode=
 refs during log replay")
  1e6ed33cabba ("btrfs: fix failure to rebuild free space tree using multip=
le transactions")

in the btrfs-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/.BQrXo/E6jf5No.c+ut30cw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhhw8UACgkQAVBC80lX
0GyhYAf/eOAP2yZHCimgIomdOp88LUbHcocEC+uKPFnAosT9dZc1naioJuf3cTRh
7wB9QJuTqu8xivb9tdrVUWLIlo1AW4Jf7Q7uW65NAbT0oeuXJQig7aArhuDdkfO5
ztv5rrA88Bd44sKu/iVBeefImAWjI0MIhbWI/zt8yIFHqiIH2+qNuzAiXY9afcc6
OeRrziSYwBKSyGmwoQwb9UiLzkxGcMjH0T8HwbgTTUtnraKmgJRFb2+ioic0UkXx
BBf3WdBRwgWCTf6P4vtRQa66kr0kRj6nc0tZXOIQLPiwDzE18Y8S7fnIw09uXGq2
3kfqVj57KRjBliH/We2NNUjcRdc/YA==
=jKlQ
-----END PGP SIGNATURE-----

--Sig_/.BQrXo/E6jf5No.c+ut30cw--

