Return-Path: <linux-next+bounces-7560-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC5AB069DA
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 01:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A71743AA7A0
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 23:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE3A2D5C74;
	Tue, 15 Jul 2025 23:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fIy2kXQf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94922D028A;
	Tue, 15 Jul 2025 23:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752621892; cv=none; b=tfJ4V25k5uwtWpDX6hpLfOD3XpoJiFVwI07OqRFSXxbOxpDz/yAvqZg7vjz1w5G1vZznEnEadI1FI2sEiIPu/K26SmGy2LFmAlS/0YkjZBBy30dz4ZQ7W2NLMtD7bh0cB3vdcIA3cDL1OiqdvnqLPhQatF6nomyUtyJSFDygmoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752621892; c=relaxed/simple;
	bh=ojutHGyoFSRRAB3a5mqG5JRLqJy4pyKqBz8EeOc8Yec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cygmJRnqB1+5N0uduVDcj21xZtofeknaWI3lhYUE96mCltHRp7t0DGOiCFrQl6IxOy7AWowXLbSbxQx00Gx36MldxUh1zpDQ/3/MQfmOhqPKjYp/8nt6EpddDKComGB1ydaKLqZBFVBCLwZy3y4Ou/1X81kt1DH4QK3wteY2cbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fIy2kXQf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752621769;
	bh=CTIHpG4Rv1Fg/ahKv5UThomQ+/44WaEtw+fJuo4EV4E=;
	h=Date:From:To:Cc:Subject:From;
	b=fIy2kXQfEky/dKrN7ZYa8FimWpA3R71QXFHydiUw/p8gSQH+xQCKfatjfMEG2Z8CM
	 tAQGkMwJck83IrbclHme39NlOI6MWpOA8m5/R/Nl5Nb7ddFK+mahx+0/NBRkrY9Dgb
	 hUsjYshhR7OZigQMKkK7OJDLcCvwH4JxqDHS3t77koOHf+fWDsXMDQ96c6NBsYSiKd
	 faP+7u9f7/3ECcwxKw5PRLyaSpUPfnJPQaKEJtC6nAz3dS1aowtMNKtULfvOYFgLIE
	 Clo/dn74KWuJRYRelTb0a6apSqZbDv2dyGVXLLuGuASjlr89xWJcE8VqZSCJCrUi+5
	 86Kh1rR1Nb3NA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhZwn4TWPz4wbx;
	Wed, 16 Jul 2025 09:22:49 +1000 (AEST)
Date: Wed, 16 Jul 2025 09:24:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20250716092440.5b7361c2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sERDvpXcRSq_8Nv8TtFqK2k";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sERDvpXcRSq_8Nv8TtFqK2k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the btrfs-fixes tree as different
commits (but the same patches):

  563671745fcf ("btrfs: qgroup: fix qgroup create ioctl returning success a=
fter quotas disabled")
  9ec166a40f80 ("btrfs: qgroup: set quota enabled bit if quota disable fail=
s flushing reservations")
  15accde5ab22 ("btrfs: qgroup: fix race between quota disable and quota re=
scan ioctl")

These are commits

  92e6fa77b2e0 ("btrfs: qgroup: fix qgroup create ioctl returning success a=
fter quotas disabled")
  da08927994d8 ("btrfs: qgroup: set quota enabled bit if quota disable fail=
s flushing reservations")
  9eb1cf99dc45 ("btrfs: qgroup: fix race between quota disable and quota re=
scan ioctl")

in the btrfs-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/sERDvpXcRSq_8Nv8TtFqK2k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh24zgACgkQAVBC80lX
0GyQ9AgAndXTq/jzVeffg3Y1jbwbvbeTu4lpEPNcOnvulBqiRnYlHIp5JealfTGr
I8InSK+LMy4w9NIaJF7Oa1jDVuwj5xt6rId3k7pGkrNYf6Luh87DwWNZnlHYi/G6
tOQqFAZx07kjAijLLGmedhXEt6Rf31wHRRGicWc3dtK+Jtr8sI3allgfxRiivo8d
0IWRHTu0hmByMojluN1McJLYZtz6hXhGOoT6RdNQZZVy1k/hDHoRkQN0IEDmqG5i
qRhL2soZxGvvkTHQLDrUhJC2YRhmKg1Nsb3nUCElccmOtWhDsfol42ViGCA5I1mQ
/GHhCnDLZBoPKcO6xiyi5vnhfqe5VA==
=6N1q
-----END PGP SIGNATURE-----

--Sig_/sERDvpXcRSq_8Nv8TtFqK2k--

