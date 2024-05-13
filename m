Return-Path: <linux-next+bounces-2284-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEF68C4A49
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 01:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5426B286EBE
	for <lists+linux-next@lfdr.de>; Mon, 13 May 2024 23:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2AB285C4E;
	Mon, 13 May 2024 23:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="luRtVw/9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5BD85C42;
	Mon, 13 May 2024 23:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715644421; cv=none; b=IrJsyPu/cQURE+wbywi3PLOThEZOgUpBrVH7fLyUZgZ+yKhlJzbvF2it2USWMDHEkb10DRA+ed/uI4zEpWPqirqdwtndeltHG8IiMOXfkqmZDYKbqOVWygXBmLULkIUHvqffw+C/4hbSw4QgVlbWkzezPwrpg9yGS7JNwMas/zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715644421; c=relaxed/simple;
	bh=R/KylpXSXNvGKAiTGKjpx8UwgnUX+GBGMiz5pPzku6s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fOphjwz3PevUhH3djBFlNNnjfOnoF/DW8VCOdm3AcX4NaaP/D/PS20NmzWmozagWhklLjofng8wrviBFBiHNNyKRznb2ZUY50wW8LaNrlAuA5HIe5XjXTphq6YCpxr7uukA8rY5XAzZmTWKDY7Lu7WKr9XAzmDIVn4CxorTvBos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=luRtVw/9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715644417;
	bh=nrX0QnSujQBcrtoDk0rMMTUg0PNEV0q40s3RZ7bbSG4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=luRtVw/9c5vJtIXfTK3jZAetTYnmiLMQfjZDWIWVXnCvgH77gnB56xkHocfQJNL+r
	 chWcXETXg8CdgBdS38EWVf5W/PHUF06x59Y6qUXwIrOQFLiTbXZNXG83s3XpDTqsxA
	 w2NP68VvF/+XNmqxPZ5T1qtAOJJAmVt/sollEYAvatSGsCKbekdbCXGD5wk/yzoDOC
	 +rhDOmL31lgkUYpRnwAc+5hRdpCJcbLvuKDwIPWvs4RaSNK6bUgVFTC1QbmcbJAusH
	 Ef+geWdhxThLJD7bifBI7PuYRPUiycXdMVXLO5SDk4cYGBjMsjxSCcEgNVnxZ9kZFG
	 toRpkjZGyV7Mw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vdbsr6PlMz4wbr;
	Tue, 14 May 2024 09:53:36 +1000 (AEST)
Date: Tue, 14 May 2024 09:53:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <dlemoal@kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20240514095336.5b805453@canb.auug.org.au>
In-Reply-To: <20240510131003.70f46881@canb.auug.org.au>
References: <20240510131003.70f46881@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fo57KRCbyFjjZQkD81OmLOp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fo57KRCbyFjjZQkD81OmLOp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 10 May 2024 13:10:03 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> block/blk-zoned.c: In function 'blk_zone_write_plug_bio_endio':
> block/blk-zoned.c:1260:25: error: 'struct block_device' has no member nam=
ed 'bd_has_submit_bio'
>  1260 |         if (bio->bi_bdev->bd_has_submit_bio)
>       |                         ^~
> block/blk-zoned.c: In function 'blk_zone_wplug_bio_work':
> block/blk-zoned.c:1329:17: error: 'struct block_device' has no member nam=
ed 'bd_has_submit_bio'
>  1329 |         if (bdev->bd_has_submit_bio)
>       |                 ^~
>=20
> Caused by commit
>=20
>   dd291d77cc90 ("block: Introduce zone write plugging")
>=20
> interacting with commit
>=20
>   ac2b6f9dee8f ("bdev: move ->bd_has_subit_bio to ->__bd_flags")
>=20
> from the vfs tree.
>=20
> I have applied the following merge resolution patch.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 10 May 2024 12:59:09 +1000
> Subject: [PATCH] fix up for "bdev: move ->bd_has_subit_bio to ->__bd_flag=
s"
>=20
> interacting with "block: Introduce zone write plugging".
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  block/blk-zoned.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/block/blk-zoned.c b/block/blk-zoned.c
> index 57d367ada1f2..03aa4eead39e 100644
> --- a/block/blk-zoned.c
> +++ b/block/blk-zoned.c
> @@ -1257,7 +1257,7 @@ void blk_zone_write_plug_bio_endio(struct bio *bio)
>  	 * is not called. So we need to schedule execution of the next
>  	 * plugged BIO here.
>  	 */
> -	if (bio->bi_bdev->bd_has_submit_bio)
> +	if (bdev_test_flag(bio->bi_bdev, BD_HAS_SUBMIT_BIO))
>  		disk_zone_wplug_unplug_bio(disk, zwplug);
> =20
>  	/* Drop the reference we took when entering this function. */
> @@ -1326,7 +1326,7 @@ static void blk_zone_wplug_bio_work(struct work_str=
uct *work)
>  	 * path for BIO-based devices will not do that. So drop this extra
>  	 * reference here.
>  	 */
> -	if (bdev->bd_has_submit_bio)
> +	if (bdev_test_flag(bdev, BD_HAS_SUBMIT_BIO))
>  		blk_queue_exit(bdev->bd_disk->queue);
> =20
>  put_zwplug:
> --=20
> 2.43.0

This is now a semantic conflict between the vfs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/fo57KRCbyFjjZQkD81OmLOp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZCqAAACgkQAVBC80lX
0Gxclwf/V6HIcsyWW98hZSKTFWyKVQIoS2XYHiiXXKaE6iKD6jiKvJnk/Km/CCIN
uTJPZOvarDDIylH5r+Eg2Y6u6wNIq85qhlOWbBWwoVmvK9SX5GN4jo77mJEoT6SB
tca64lvZA/XCKBjloC7p8GK+4e7YVGVNA7tS85oQVUELJq74/5kQGouYSopGheJY
Z/cP8hEu+9ehVBlHp6ndEpAPcU2WFVcPsWhaXm+fAzI/Qt3vJgAgGx4btWXVdKN0
/Dy5jYyeCnQE9Slt3TgIhkXkw2ZvRMtt+maHKXn0bPYf25WHam4aCY1WN0sPk0S1
tR4v4sAXHpDJng7IaZcRbqqLkXAr2A==
=p9oD
-----END PGP SIGNATURE-----

--Sig_/fo57KRCbyFjjZQkD81OmLOp--

