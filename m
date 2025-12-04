Return-Path: <linux-next+bounces-9330-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 971D4CA2A38
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 08:33:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A86A300452D
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 07:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8613319309C;
	Thu,  4 Dec 2025 07:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oZMpuUAO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03372398FB6;
	Thu,  4 Dec 2025 07:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764833604; cv=none; b=AdIQFzcjp4S848j8eQ+bivF9qXNDCKKUJPCzVndZN/FPV4n9l1uww1nTnImpxV6DnxhrBm6R5luFOnm+GP+lNJycbpDZDbgSW5nPD5ARWX03rPIJLDgNvQoKmC668tRvlVkXYiwWw7BvN3C4mQ0eaN0EXgEuTd4SB0cEjIP0lEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764833604; c=relaxed/simple;
	bh=TeEn8pSS0gpB9S3NFMOLp34WhcKVu6SjE01cUNRN77I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sTSUOImJg0Jh6zT/fhyMxHEiYHLELWyOalMY+55q61HyXjBJ0BCJoyYw80zf2wH2+9EcZ2ss8Id6pWKOTyDdiqv4AEDc9Fr4C4DGh2OE/2bTI34RRDBbvO/qZJ8GDr4fyNzcPy84LfgyokWsI7lYqhg50rEhKIwpR3s31Mw8d/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oZMpuUAO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764833598;
	bh=25X8DLidOS+wZoMOhp4FHxuh/9Czb4N8mndtQMMzjEM=;
	h=Date:From:To:Cc:Subject:From;
	b=oZMpuUAO6xYf+Y2XLkqwBOfkRZv3kFSGWUJ7+WPT+J+zRNdlAqtR1VK7871iW9D5+
	 JQf13IFxnLfjzvH/AocVBYeRRBvMap12iHbDVzDMJ1XpPF8AHurRXtQ8im3JjfRsC9
	 gJCuHRSNfZcRbOkUAEV9dLw93s31GxTD5fNO7XcMBxxkFz35aLSySRNgCS1ZR7w43x
	 WupnGj4FWUEipnpJMFhktoGgFlPIltgTLW8Qh5EaHcUnRTPrq0uo3LcnX03k2iRm1J
	 JPhDvisjhb28vbWinT0kSuMGkrPG4D+XdXDDy1O3DkDA+xmHprSSRLCdMEB/8C/bJh
	 hqFRxdBIxOs2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMR7f1j9Lz4w0p;
	Thu, 04 Dec 2025 18:33:17 +1100 (AEDT)
Date: Thu, 4 Dec 2025 18:33:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs-fixes tree
Message-ID: <20251204183317.34ca998d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tba65HmlZUwjo3je4_UhBCt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tba65HmlZUwjo3je4_UhBCt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  0249ef24b4c2 ("btrfs: fix leaf leak in an error path in btrfs_del_items()=
")
  2e5cf8b31ac7 ("btrfs: don't rewrite ret from inode_permission")

These are commits

  e7dd1182fced ("btrfs: fix leaf leak in an error path in btrfs_del_items()=
")
  0185c2292c60 ("btrfs: don't rewrite ret from inode_permission")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/tba65HmlZUwjo3je4_UhBCt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkxOT0ACgkQAVBC80lX
0GxgvggAoHfs2U9txVhXU8PJXlKe0rMkdnXlX6vjIBzKBbZFd1t9YwZpSJrOShxk
Nxj4SmVS+NUaOmtsCQoZqhvH1iZvY9z64p9gJAZ7aFxF/XCBBiFWgjaqCxH3jOOF
zYGvdjmAuStCB3CDg53wZ8VuaS/KCtvTJ0HyOr6WXRvUObdNAZ1/WJsetEJe6pQb
xsc/919rJTe9DX3BuErvVggBBe0L+BGhajQ7fjjZbXYJQVdt87iwARn+bzZIMMuL
h6FjRV0vx8MDMHft8b3nenmE+L9ka5i3gVatPizzmLUmgl3FAsFj+guo89A220J3
0uvRlSVGzZ3F7jczSXVLvLLdLSlF8A==
=KtRQ
-----END PGP SIGNATURE-----

--Sig_/tba65HmlZUwjo3je4_UhBCt--

