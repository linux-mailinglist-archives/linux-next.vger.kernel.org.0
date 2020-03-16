Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F340186509
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 07:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729485AbgCPGeV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 02:34:21 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45860 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729407AbgCPGeV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Mar 2020 02:34:21 -0400
Received: by mail-wr1-f67.google.com with SMTP id t2so9601215wrx.12;
        Sun, 15 Mar 2020 23:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=k7NxWyQOWr0SwUBxYMG9c7DtM1CeQgn0vuN+gW0d0aQ=;
        b=Laf3kdYQ4yYUlsH2k9nkkWpi3JZte7GYf0PppARndx5GYXHU3HK9w57FHIaMibyZk3
         fzLlXaZpCypupLTCKfknl0LShGedMsp67DephI8/xQey7lgsocSYRa3mGmSYqixxFk1G
         lmZq51yUY/X6uMk6xdazq8IzmH1tn72Wkd6pe2I3HAA+qHrN5zYTO5Zos961x2h7H7ke
         GAZSoOJ2kY8FKg/Zeh48rjrz234v62bzLq4tx0g3iiNWgjmhpZV+dy0/WDdSSAz/jbwH
         Y0YdXaGxdrLYnpb+377vPBAJtH8y6xG0JEcINUtiA5IBo8X3+Df0RAzQrROTQeoWC25K
         ehkA==
X-Gm-Message-State: ANhLgQ230Ium+b82dNvZEkfIgpvp0eUFNqH2rToXpFpGe0jcQ9s0h+7+
        tFRVvVx3VPDt1GlccT38Tpa8p3bA
X-Google-Smtp-Source: ADFU+vtJSta5p4kj/XnAnH2DrWE+S0jblqCxEDzrbc+1Oy2Dd+4TRAZpu9yhllmvIGn/Bj3ZRY3Wuw==
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr4812016wrm.188.1584340457660;
        Sun, 15 Mar 2020 23:34:17 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id q11sm101975wrp.53.2020.03.15.23.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 23:34:16 -0700 (PDT)
Subject: Re: linux-next: manual merge of the tty tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200310144013.6df85b46@canb.auug.org.au>
From:   Jiri Slaby <jslaby@suse.cz>
Autocrypt: addr=jslaby@suse.cz; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ccc23257-233e-ca00-9fa6-596bc4b08dae@suse.cz>
Date:   Mon, 16 Mar 2020 07:34:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310144013.6df85b46@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ZVA7EKDl256spfdtSNyDhkH6Du5TPeCCM"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZVA7EKDl256spfdtSNyDhkH6Du5TPeCCM
Content-Type: multipart/mixed; boundary="1ep3e9yoQ5QiHww58iGupQyB8rkrfSScA"

--1ep3e9yoQ5QiHww58iGupQyB8rkrfSScA
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10. 03. 20, 4:40, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the tty tree got a conflict in:
>=20
>   drivers/tty/vt/selection.c
>=20
> between commits:
>=20
>   4b70dd57a15d ("vt: selection, push console lock down")
>   e8c75a30a23c ("vt: selection, push sel_lock up")
>=20
> from Linus' tree and commits:
>=20
>   9256d09f1da1 ("vt: selection, create struct from console selection gl=
obals")
>   bc80932cc25a ("vt: selection, indent switch-case properly")
>=20
> from the tty tree.
>=20
> I fixed it up (I think - see below) and can carry the fix as necessary.=

> This is now fixed as far as linux-next is concerned, but any non trivia=
l
> conflicts should be mentioned to your upstream maintainer when your tre=
e
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularl=
y
> complex conflicts.

I checked the result previously, but now I see a double lock there. Did
something change?

Anyway, vc_sel.lock cannot be taken in both set_selection_kernel and
__set_selection_kernel:

--- a/drivers/tty/vt/selection.c
+++ b/drivers/tty/vt/selection.c
@@ -219,7 +219,6 @@ static int __set_selection_kernel(struct
tiocl_selection *v, struct tty_struct *
        if (ps > pe)    /* make vc_sel.start <=3D vc_sel.end */
                swap(ps, pe);

-       mutex_lock(&vc_sel.lock);
        if (vc_sel.cons !=3D vc_cons[fg_console].d) {
                clear_selection();
                vc_sel.cons =3D vc_cons[fg_console].d;


thanks,
--=20
js
suse labs


--1ep3e9yoQ5QiHww58iGupQyB8rkrfSScA--

--ZVA7EKDl256spfdtSNyDhkH6Du5TPeCCM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE1pWBVg1LlveO4uo2vSWxBAa0cEkFAl5vHecACgkQvSWxBAa0
cEk8sQ//fC8k8tbKzYNA2RkESA++67gtJKyXy+q5biumck9PFpzukwcuopjBnpah
gj7BY/DyFuzl7KHAY9KIswn1G+P30J39lGZyCX8t3tAxxGbBw9jW+lHeWNG78uqI
lYzXxSTiSEOxz9dv7pyYvZdWuliYJZNcLoX46sBTm4dHEWacE1tU2h78USWWqOAZ
tkkLEL9UqkoPXyvEuiq9J7fLPooSldaPv1sZTzB7sIk6qf4cWN5lv2MluX3D0s8x
RiL11bB23nWA7znAgKu+nBWbPEQLOHt69bGU/PV0yU6EXT7YUXBoPXCjCUQVOm0P
3K1olhtU2KaHLHgw+vgNs+1XHJJiL1TSBj0HaVAomTYApd2vhGuveVGflsdiz6pg
ncgCOaKZ2WXExtPcrEzLfenRYV+e8P0yNC1iIoXpHpL2159Yu2Hyb06vi7ni2rUu
R37AdT2yN8wL233p4kv/ixwZgHNKlPFkosGR8msU1tEbQFIjSYomzEGAB/EeeCxi
JqHuRTARDBUh9ObVfejeqDY9Dj5J+viGDa56lCiS+azbaiuzHhExFdqzcYTCibMx
cfwFVQya4VcbtVGzZLzvsdFVNGBXJILc4D5xVHP3sehCtLrdA7gwls+r8Ugfkymt
XfpRwfR4Z0tTiOXjgaf+xlFbCx4WcwKTtttgMxkiosg0PUMA158=
=ecZ0
-----END PGP SIGNATURE-----

--ZVA7EKDl256spfdtSNyDhkH6Du5TPeCCM--
