Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C98601893DF
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 03:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbgCRCFl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 22:05:41 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42701 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726871AbgCRCFl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Mar 2020 22:05:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48htfp56vwz9sNg;
        Wed, 18 Mar 2020 13:05:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584497139;
        bh=ODSzlO0kO5hWcTZeHNNs9tVOUUI5xO0GzBFK5kFt5/E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HUjlpHPwdybPdv0+gf/57bWMC30tGK5rYLCvx1CbKgusB/GCWuCVoS8TJqxZu4Q8d
         LZVTnZAgdfr1wlw525WTsFZZC4YP5I8tw1s+/Kv9iqq+GCX90VI0w59Osk15Y4zSI8
         0xq4woXAcA9d3y1zWdwIuxZJ8T8xLx+JTeuxMVFs1hDOkCldG0oPxAc3CmPCvhZONm
         thnXdT6qeHI+Mp1BFmz326IXFTWFi3bw4flvnaUdgB5DNxvBmS/8HpzD/rYqtyqLvO
         5Uq1BPi5OCtobyFeXGQWDhVlPvZ/ntpETqgBowdTFX6M2ftvFtuc/J5v9U06/Nn7JG
         zBhjXUt3G3wow==
Date:   Wed, 18 Mar 2020 13:05:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Leon Romanovsky <leon@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Saeed Mahameed <saeedm@mellanox.com>
Subject: Re: linux-next: build warning after merge of the mlx5-next tree
Message-ID: <20200318130531.1df149c7@canb.auug.org.au>
In-Reply-To: <20200316103913.659d3a5e@canb.auug.org.au>
References: <20200316103913.659d3a5e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4RF4C6asXy+CYm2goqxefSy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4RF4C6asXy+CYm2goqxefSy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 16 Mar 2020 10:39:13 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the mlx5-next tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> In file included from include/linux/printk.h:331,
>                  from include/linux/kernel.h:15,
>                  from drivers/net/ethernet/mellanox/mlx5/core/mr.c:33:
> drivers/net/ethernet/mellanox/mlx5/core/mr.c: In function 'mlx5_core_crea=
te_mkey':
> include/linux/dynamic_debug.h:157:25: warning: 'key' may be used uninitia=
lized in this function [-Wmaybe-uninitialized]
>   157 |  _dynamic_func_call(fmt,__dynamic_dev_dbg,   \
>       |                         ^~~~~~~~~~~~~~~~~
> drivers/net/ethernet/mellanox/mlx5/core/mr.c:47:5: note: 'key' was declar=
ed here
>    47 |  u8 key;
>       |     ^~~
>=20
> Probably introduced by commit
>=20
>   fc6a9f86f08a ("{IB,net}/mlx5: Assign mkey variant in mlx5_ib only")

This warning now appears in the rdma tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/4RF4C6asXy+CYm2goqxefSy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5xgesACgkQAVBC80lX
0Gw/YQgAoRxC9pa50M/cNJWv3ZI9Hk7i1j2lgpe16D+mPWcF7wo1qQoY+U45EWfG
Rxcx84wGr0xZen1LEor0L42jwxYZt4+EvZU65PIZtbHMwuNqjNJTnPsYyVkZnowu
WSnOe5zjNI6DKqL5Rh5aABGLek08zccLhprP5iBmeVliuxyRqK0ThwMThzP02f28
6Wnc3V6DQM1Gppczpn3eH4q0WGWXigIW77oI/9SuZ+pSQtXPa5o2beANQY2U0Ofw
GKgtZsRXDHERwH2XyeWp42M4YUMnXXFPYItnB001Oxfx22+KRd0KkSi2IypOqscv
88F6mdht1ORR4StPgz4ApeM1bGKHaw==
=apSN
-----END PGP SIGNATURE-----

--Sig_/4RF4C6asXy+CYm2goqxefSy--
