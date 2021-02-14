Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB0331B319
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 23:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhBNWpn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 17:45:43 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:36307 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229793AbhBNWpm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Feb 2021 17:45:42 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df2P80Jcmz9rx8;
        Mon, 15 Feb 2021 09:45:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613342700;
        bh=k7VHkKMggz/EgJ58k+StvT7CQUBhnZV9l6k+lQ817Jc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TDU02awpZWDIo2fBIk0a78qGzaIbhy+7H+xwmvFVJVq7fpBT5AgXSLEH1Xe5EXl9g
         79cx2tfkynSiwvv16WrlCRMp39gNbQ1gEFPIztyBEQ0U5LumavRvbcPTTodrePZFO0
         28wc+6g1hVzIS2bJM+WU66rztxFTzj/GAB0ffJ3jwihnB2UPYklkb2a3+VINIuk5dh
         c7v3YRQ3FD4v0ok89WK1chq/FvaOSMWy8EYeulA3mU/VKvm+rxQbdOqTIt/YhTX45q
         Oeja/w8fnjX8u7BFBiQ0vGVVt4yFN5+MMCSyNT7ESTdkjjXLyJl9d+uPTTYRc3HvmN
         x+1pADtSvd2VA==
Date:   Mon, 15 Feb 2021 09:44:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20210215094459.1e072fa6@canb.auug.org.au>
In-Reply-To: <20210208233716.16d962ad@canb.auug.org.au>
References: <20210208233716.16d962ad@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t06uMKG/GtJzj6_n7+tqoB/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/t06uMKG/GtJzj6_n7+tqoB/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 8 Feb 2021 23:37:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the v4l-dvb tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> include/media/v4l2-async.h:178: warning: expecting prototype for v4l2_asy=
nc_notifier_add_fwnode_subdev(). Prototype was for __v4l2_async_notifier_ad=
d_fwnode_subdev() instead
> include/media/v4l2-async.h:207: warning: expecting prototype for v4l2_asy=
nc_notifier_add_fwnode_remote_subdev(). Prototype was for __v4l2_async_noti=
fier_add_fwnode_remote_subdev() instead
> include/media/v4l2-async.h:230: warning: expecting prototype for v4l2_asy=
nc_notifier_add_i2c_subdev(). Prototype was for __v4l2_async_notifier_add_i=
2c_subdev() instead
>=20
> Maybe introduced by commit
>=20
>   c1cc23625062 ("media: v4l2-async: Discourage use of v4l2_async_notifier=
_add_subdev")

With the merge window about to open, this is a reminder that these
warnings still exist.

--=20
Cheers,
Stephen Rothwell

--Sig_/t06uMKG/GtJzj6_n7+tqoB/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApp+sACgkQAVBC80lX
0Gw3mAf/UUw7vweHMX1Rv7slJE3CZGGrIfXah1yUMYLARlDZYYcUpeksOmr8x7eb
a5Jy1ZdjyDTMd7LoDOLzfS05kYjZ/YwSNw86805byjjGmv2CnIwWI+9I35/cYx1H
WCAlm0cojMIWq7CZG/7ebOTqzkrVzEczVf0nVTEhIsguLzcV0FAz8JbVFpLRUAk4
1LzHLIiQLfgPaWW/jhYEdDtuBKWCP+8FPMW0QnZBwYJlvoRIi0TLsjYEQI4sucCJ
LO8DWf5G4PUtLRegIfT0PhwzGNHMBnNbsH8acrzORyftuu3FlmDU8h+lwFJjF2tQ
XEmQKjhswip8odcPltQIzYGZmLWlTQ==
=cCTG
-----END PGP SIGNATURE-----

--Sig_/t06uMKG/GtJzj6_n7+tqoB/--
