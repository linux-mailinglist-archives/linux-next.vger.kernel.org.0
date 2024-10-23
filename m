Return-Path: <linux-next+bounces-4391-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 296D09AD6FB
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 23:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF4F4B217DA
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 21:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1C01E2300;
	Wed, 23 Oct 2024 21:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ez23kiUU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400D617DE16;
	Wed, 23 Oct 2024 21:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729720628; cv=none; b=Sl8sHfy6RnrlDr6ILFYFfsl+7Tdk7fdPQl51ZTSzrifprW5LkJ+4RGl3GB6GJTUjhO5ss0tBZqFYaHskZSBxLeLRGXOessbSpg9Y4ut5w9ubuBwYwdA8bSEZNGjfCzuVx7iw1ClsxiBJKUijAgA5za5PamYq419R3AiuXkYYdzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729720628; c=relaxed/simple;
	bh=HuaSP/d2c1coy8FVaLu0lL9lRYfdt/B6FTGRXTg/QlU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=utghj7xPM7OYbhtwQzN6HdHh5vdiY6aiOhtqhxziMVVdtkIc0qq2mGN+awFUm1QkK9Zpk2DTFiObWU96ChakBBcLXY+JbFsg7Sp2z5nSlUznnwIpTWvYDmGfyf4gAG6fxElopz72tV1pcYjLUydUwt+6qktW/T8cirMJ0ytxrxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ez23kiUU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729720621;
	bh=FWu3Ot0ztok0O5FgT0OyakwAINfPQjZ4bFLpRRLaXs4=;
	h=Date:From:To:Cc:Subject:From;
	b=ez23kiUU3rcuUMy99fdcifNWqbA3MaAsVMfQ39Iz382WNqhJ1mw4jFIe6KYbyEWEt
	 BeHvJbTCAaOobQ+N3iO0Yf2C7mZIW7yaNtnK3xEF9qAa+VEM8skVWDNLZsrIFNzwvx
	 6rtyp0GvZOjd2roRYH8xeZL39mKb/8C19eyaNnlvMo06gnYscdnewTdxW5CUqWkXhL
	 VWXX6zalpOD1lVzT0byglCGakQoLkbW3F5Rt8Da4uZHYTMHN3Q5+rUQj7p72xTx9xW
	 eiU3hFl327kQf2uYOcPr87Zbpg1xgGlsr8+q/O23LPi2GCwSB9O7T0zTOvbZBN3O/3
	 bizLBlYtGfd1Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYjZ54zRFz4wc3;
	Thu, 24 Oct 2024 08:57:01 +1100 (AEDT)
Date: Thu, 24 Oct 2024 08:57:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the btrfs tree
Message-ID: <20241024085701.64263a3b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/es8fPm8je.Mn58s9UM+A.yr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/es8fPm8je.Mn58s9UM+A.yr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the btrfs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/btrfs/super.c: In function 'btrfs_reconfigure_for_mount':
fs/btrfs/super.c:2011:56: error: suggest parentheses around '&&' within '||=
' [-Werror=3Dparentheses]
 2011 |         if (!fc->oldapi || !(fc->sb_flags & SB_RDONLY) && (mnt->mnt=
_sb->s_flags & SB_RDONLY))
      |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  4642e430c55b ("btrfs: fix mount failure due to remount races")

I have used the btrfs tree from next-20241023 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/es8fPm8je.Mn58s9UM+A.yr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcZcS4ACgkQAVBC80lX
0GwwtAf+OCRV/aDSwqgq0w4ZzDEe8ULzvhXFhk1Ax06FG0XX3eQxpXETaJCifAuc
bz8PU+8jbNs/Hoy5o+y5E0DX87exlRKIewg2Lh80wj5RxWHjl8iVMics3G0CP2+s
KB74iO9SYZJgmzHKx8PATizj8qhlFvWTOD8eHMLopgxOEWqsrHaCPJaBWFn+7nDv
Phwl8VbVDmi3enwvzCB2rcv43QjbHmynGBJzbfT7idrxaGV0GfDFrosnU3YBGiaH
B80/B7SLfnD7Th0Rd/Z1SMX6qHFpixv8b+3YlOaX0yHQJKIvKfYI0clJqvMnWKcF
UnerztAeEsDKPLOeqOysOKwJgNqGPQ==
=mLI9
-----END PGP SIGNATURE-----

--Sig_/es8fPm8je.Mn58s9UM+A.yr--

