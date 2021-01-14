Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA70D2F5FA7
	for <lists+linux-next@lfdr.de>; Thu, 14 Jan 2021 12:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbhANLR0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Jan 2021 06:17:26 -0500
Received: from mx2.suse.de ([195.135.220.15]:53314 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726458AbhANLR0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Jan 2021 06:17:26 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E5D7AB7A6;
        Thu, 14 Jan 2021 11:16:43 +0000 (UTC)
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210114113107.622102e0@canb.auug.org.au>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <524351d0-506d-bd49-ab50-66316d7e5105@suse.de>
Date:   Thu, 14 Jan 2021 12:16:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114113107.622102e0@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jJL4pOPwDC6gspy7p5JwzKT8iKU9cxx8Y"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jJL4pOPwDC6gspy7p5JwzKT8iKU9cxx8Y
Content-Type: multipart/mixed; boundary="oYbDUBfhMYZhf86gzX4V6y4JZK6TwFz2I";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <524351d0-506d-bd49-ab50-66316d7e5105@suse.de>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
References: <20210114113107.622102e0@canb.auug.org.au>
In-Reply-To: <20210114113107.622102e0@canb.auug.org.au>

--oYbDUBfhMYZhf86gzX4V6y4JZK6TwFz2I
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 14.01.21 um 01:31 schrieb Stephen Rothwell:
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/gpu/drm/drm_cache.c: In function 'drm_need_swiotlb':
> drivers/gpu/drm/drm_cache.c:202:6: error: implicit declaration of funct=
ion 'mem_encrypt_active' [-Werror=3Dimplicit-function-declaration]
>    202 |  if (mem_encrypt_active())
>        |      ^~~~~~~~~~~~~~~~~~
>=20
>=20
> Caused by commit
>=20
>    3abc66706385 ("drm: Implement drm_need_swiotlb() in drm_cache.c")
>=20
> I have used the drm-misc tree from next-20210107 again for today.

Sorry for the breakage. Fixed in drm-misc-next.

Best regards
Thomas

>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--oYbDUBfhMYZhf86gzX4V6y4JZK6TwFz2I--

--jJL4pOPwDC6gspy7p5JwzKT8iKU9cxx8Y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAAKBoFAwAAAAAACgkQlh/E3EQov+Bt
zA//b9VYy7/b8sble+TS3HnmjvwcuMbp5ETrD8Ju40SU8bM+8Qb9NT6TL9FeAQro5UFKzMt1Jmci
zXK+lkNyUxUo44hoDIUTVVlvvQQqUYbtB/wMWS6FoKHODyG/jfR9JtTPzmRuSmn2gesrBmZcCGe5
0FL6UEJHH+U7Xw9Lmlxo7GSsVx6SUbDFNMz82DDoWU5lOd0Z0wMbJO/FVv5nGrlj3LuvDv+bUxf+
BOWPyseaVLGYCu6ZfSfTWjNF8sN/ZI6XIrWidRjWeBK+rQFMKTqkkZFb+QtfPQLvcHiHlPEFv5FN
bUfM65PZ4hxLWsdW6qhMSInDEqU6BwmWXph12UvX7ZvROz8xm3u/LqhGX3xNo/plmr/xFY4CkH8p
BWWrO43zVbrqK1SEj8rQkPECiXXVhu8fD493WOT/dTaZkGbhqUrokLnATUdVBlfSFDurbr30JPSb
8qAXS/40K6xNYUwpvCkSOxnvmjTH5GLGB8OjMGGhz/bEUx/mQNwIC3uRSjRioiBd+9DA9KMz3lvG
C0nnQd7i9KwQVrAs3Me/cPmzcEYQUv39vmSLxoPaCGmyxG8VX/rwdPTSZ5EBm68jisj9quvzyEJx
Kz7QoaUeG4dP6DGtezZ78rH5Yt8FyfPfCrc/YDdqApG4CojSLAPZ22aBQLLPnJM/dBwxtGVbHFt5
jqU=
=0oEf
-----END PGP SIGNATURE-----

--jJL4pOPwDC6gspy7p5JwzKT8iKU9cxx8Y--
