Return-Path: <linux-next+bounces-5540-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E36A41493
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 06:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD9111694A8
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 05:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54AFF15886C;
	Mon, 24 Feb 2025 05:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D4kPcOYf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A56941C85;
	Mon, 24 Feb 2025 05:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740373226; cv=none; b=VWcfEmlqsKGIjbWA6x+WqEyNTtL+mdQqEAQL3yyaYBGisu4d277wD/0Qi9XaJQHhhbgi6yBFt6ME7/CWiKrzxUO9zBu9097R8NNUtI4jUzDJ2eJPCK3/3sk3tWqOZwp1ykJBGaInV/EaVf2klW0ZRaXn0Hq9ljNgeb5Q+jPetus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740373226; c=relaxed/simple;
	bh=K9i6Jn+Zx+VHq4F4pEcWJAeOv1sieh7R7qTCwo+JiD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Z62VW/jRnBw8vN/Wi8ScyssP3+3X6r5HoxnD4n4cZQ/uncZpekracm+94uPAP3qmFfnsuWHo1WUt+p0R30Mz76vTfBs0N6FHOwJQCZBMYP0gD04mrZwugVgEDc3PYeIuZBVjbxF2Ls0/WJ0zGzuiSUenN0Gdxk9MRn7oPBcGs6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=D4kPcOYf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740373222;
	bh=dma7rBTTkx2nvjxB+nfPmpRvUxgwC22P+h+MR1cXpMM=;
	h=Date:From:To:Cc:Subject:From;
	b=D4kPcOYfNe0mM28w6022i/CplmnfPnPGfcurK8ifwFr+/FuYE1GRX2GYUJiIrLvJZ
	 cIqG62OJeefwzs/uplbKT+5EpFffFhNQn/oXD93LK4ecVF6lUqcwK2xx6IkIz0JPyP
	 NI6SjmHQJHEve6/x5Y98mBY+jU5hIp7WG4ZYhRK47GgDxkA1RDduvjUx+crmDzfxCg
	 LfFelDHfKqxr+0tPGNBIVsN0ViD/U/C2XxAbiZzFdcytDshP29hxn5rqPpNNkdp900
	 2Ph+/gMcK13yN9BxNuD1h86FnW54NE+r4qT+uWIkvOHq0lB0Z/LdDTJMe2cPBUHiMh
	 vR+2kXRl76z+w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z1T7n50KPz4wcj;
	Mon, 24 Feb 2025 16:00:21 +1100 (AEDT)
Date: Mon, 24 Feb 2025 16:00:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede
 <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the char-misc tree
Message-ID: <20250224160021.63b13a2b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YU2IFvuctig6A5Qs9=gyinR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YU2IFvuctig6A5Qs9=gyinR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the drivers-x86 tree as a different commit
(but the same patch):

  74826b3fd7d2 ("sonypi: Use str_on_off() helper in sonypi_display_info()")

This is commit



  74826b3fd7d2 ("sonypi: Use str_on_off() helper in sonypi_display_info()")

This is commit

  9cf1c75bfda5 ("sonypi: Use str_on_off() helper in sonypi_display_info()")

in the drivers-x86 tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/YU2IFvuctig6A5Qs9=gyinR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme7/OUACgkQAVBC80lX
0GzZLwgAjPOKTPHHeMgxeiaV/Z8mE9+K/FavLe7qC4hcV2ljVnSUN9zQ6k3U/lMr
mxCGs2Edg/zWflbe0q/wWhlPw3Kf6DW+uuTkE/F2GDY7ZCsVhDPtqJqgr7Vqb+BI
kiznCVfBrkhKOaPdVFe1f3gq9SVAHYe0tQjqsw3M5sFJQQeNUqaObCmeK0cYbkRK
8vxvRLlYrqoNOhV0o8B8LWNdoJbc41vUOEHF7z9pdipbkk2P9381E5Zl2SGLJ6eL
MknBa59wl5eFVogCEstz5Mkw7Xcqg/kNA4uL/jOmIuXbZ8U4jcMUA5INpEWhALf7
uvATAfP20LbBj5AX+4lXmXE572U9PA==
=IHsg
-----END PGP SIGNATURE-----

--Sig_/YU2IFvuctig6A5Qs9=gyinR--

