Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 673702D27E4
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 10:40:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgLHJkD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 04:40:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727418AbgLHJkD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Dec 2020 04:40:03 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E43C061793;
        Tue,  8 Dec 2020 01:39:05 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cqw9c5CMWz9sWC;
        Tue,  8 Dec 2020 20:39:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607420342;
        bh=czNbbQ+yPaSeZZk6eDCqAlYfX19e+yxxa2fyKIQj9FE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kCSSE6P0sG4BNcLiRIDzdV8pm+zzrC3j1lLYsXS9vzSIUh9H22xhoQtyecYuh0Dpy
         OLmJ0UU2TRkYxmNW/cuj53vMmYZEIvqdcH5Vd2XkeZ2PS8A6hzd4RNBaBy8PWh1w50
         XzYqCGJQwdbMONzNz/jCPfv7P1AAEdIACfk/UMnuqk2DjCP9vJuaWSSPsYckim4FVb
         8NtjnDV+N6lZctNauWCYBRn+LEXlGwjFrykJkaIDauuBi0lsYjyZbdRn8Kty2FGnWn
         dbDeQCoeeYTCq1AmIulbt2pX3UJ0vS6Wgj0KR2ChlMcQy5TLmmUPUMZ39O75NuY1PR
         gz8RGKqKlLs7A==
Date:   Tue, 8 Dec 2020 20:38:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Bart Van Assche <bvanassche@acm.org>,
        Can Guo <cang@codeaurora.org>, Christoph Hellwig <hch@lst.de>,
        Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <20201208203859.686f83eb@canb.auug.org.au>
In-Reply-To: <20201208202853.186ae136@canb.auug.org.au>
References: <20201208202853.186ae136@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2y8xhnXUT/QOOohesLr816Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2y8xhnXUT/QOOohesLr816Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 8 Dec 2020 20:28:53 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> After merging the scsi-mkp tree, today's linux-next build (sparc64
> defconfig) failed like this:
>=20
> drivers/mtd/nand/raw/intel-nand-controller.c:17:10: fatal error: linux/mt=
d/nand_ecc.h: No such file or directory
>    17 | #include <linux/mtd/nand_ecc.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~~

Clearly, it did not fail like that :-)

block/blk-core.c: In function 'blk_queue_enter':
block/blk-core.c:443:18: error: 'struct request_queue' has no member named =
'rpm_status'; did you mean 'stats'?
    if ((pm && q->rpm_status !=3D RPM_SUSPENDED) ||
                  ^~~~~~~~~~
                  stats

> Caused by commit
>=20
>   81a395cdc176 ("scsi: block: Do not accept any requests while suspended")
>=20
> # CONFIG_PM is not set
>=20
> I have applied the following patch:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 8 Dec 2020 20:12:33 +1100
> Subject: [PATCH] scsi: block: fix for "scsi: block: Do not accept any req=
uests while suspended"
>=20
> Fixes: 81a395cdc176 ("scsi: block: Do not accept any requests while suspe=
nded")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  block/blk-core.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/block/blk-core.c b/block/blk-core.c
> index a71a5c9429d6..9c9aec1382be 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -421,6 +421,18 @@ void blk_cleanup_queue(struct request_queue *q)
>  }
>  EXPORT_SYMBOL(blk_cleanup_queue);
> =20
> +#ifdef CONFIG_PM
> +static bool rq_suspended(struct request_queue *q)
> +{
> +	return q->rpm_status =3D=3D RPM_SUSPENDED;
> +}
> +#else
> +static bool rq_suspended(struct request_queue *q)
> +{
> +	return false;
> +}
> +#endif
> +
>  /**
>   * blk_queue_enter() - try to increase q->q_usage_counter
>   * @q: request queue pointer
> @@ -440,12 +452,10 @@ int blk_queue_enter(struct request_queue *q, blk_mq=
_req_flags_t flags)
>  			 * responsible for ensuring that that counter is
>  			 * globally visible before the queue is unfrozen.
>  			 */
> -			if ((pm && q->rpm_status !=3D RPM_SUSPENDED) ||
> -			    !blk_queue_pm_only(q)) {
> +			if ((pm && !rq_suspended(q)) || !blk_queue_pm_only(q))
>  				success =3D true;
> -			} else {
> +			else
>  				percpu_ref_put(&q->q_usage_counter);
> -			}
>  		}
>  		rcu_read_unlock();
> =20
> --=20
> 2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/2y8xhnXUT/QOOohesLr816Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/PSbMACgkQAVBC80lX
0GyelAgAm9HI1fl/ZxtU9NuRsgcjpTtPv9KIVpQZHHHEnKZrMKhy5IN2IWkVG0q/
ENIruQ7HgpCQmACkMFnBl8gArtni72UJVex7o2tuNI8AX8qX+TQiudq9WeDAK5+Z
6HuxbhETQCp3vOc0S+BspyQOtjgk8/g/En9uCR64NjXibPkWUv7qGqNuvOmvsddO
xcv7vZge/z9qTtO0hFBcRysiIEO8Y1X7L9jRto4PNnsn9d7/upRXx1AqflbZdQSy
vOrcyM6tQZPnAnaK8UKel1V9cfEsPpD9Nmbv4N6eP5AYDi4OJh549DBkdw4uSZAy
UbNwyv5u1szpLG/1sRj2u9UJNEFx9A==
=vuOX
-----END PGP SIGNATURE-----

--Sig_/2y8xhnXUT/QOOohesLr816Y--
