Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A762045CB
	for <lists+linux-next@lfdr.de>; Tue, 23 Jun 2020 02:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731656AbgFWAhj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Jun 2020 20:37:39 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56403 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731561AbgFWAhj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 Jun 2020 20:37:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49rS6T0qbfz9sSt;
        Tue, 23 Jun 2020 10:37:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592872657;
        bh=NZqT5bS2Rh6HY0CP0buqQsJbSrojqYPVMmdLrrrsScU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gjWQI/elsOZdMHXyz52dnNsBmx51USIVGMHGeGxcyszyHPzn2kSqBd9CBZfsTlrBZ
         6L3Ucbv+pZt4xwDpaMVc8K5VjqN+F8WH1rbYMAWOXqav0JUdz9HYbfthUhEQQMab/Q
         /gg3tEgLBWOuEzzG8JNXudVU8WMXsDWKf0xMJeufrRh4mHKVyCOAESiUm12TVSeU10
         qCoyxVzkFZRTUYYdP9occweENytPToynmGZd8Gyp96sMtIMcUakndKfUy7PJ+htDCx
         k3JZ+ItYDIiClUppwWALLq+uySt/QottphhrSNHyfiv6pICSiLG7hKl+xKVw+dltae
         +CqFUAGXwdcQQ==
Date:   Tue, 23 Jun 2020 10:37:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failures after merge of the hid tree
Message-ID: <20200623103736.25f67de5@canb.auug.org.au>
In-Reply-To: <20200621140421.7f4552df@canb.auug.org.au>
References: <20200621140421.7f4552df@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r0BhmJh8XwjSmoAN4kUieic";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/r0BhmJh8XwjSmoAN4kUieic
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sun, 21 Jun 2020 14:04:21 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the hid tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> drivers/hid/intel-ish-hid/ipc/ipc.c:12:10: fatal error: client.h: No such=
 file or directory
>    12 | #include "client.h"
>       |          ^~~~~~~~~~
> drivers/hid/intel-ish-hid/ipc/pci-ish.c:22:10: fatal error: ishtp-dev.h: =
No such file or directory
>    22 | #include "ishtp-dev.h"
>       |          ^~~~~~~~~~~~~
>=20
> I don't know what caused it, but commit
>=20
>   470376737e88 ("HID: allow building hid.ko as an external module")
>=20
> did not fix it.  BTW, I build with "make O=3D...".
>=20
> I have used the hid tree from next-20200618 for today.
>=20
> BTW, the hid tree really needs cleaning up, it contains merge commits dat=
ing
> back to April 2018 :-(
>=20
> $ git rev-list --count origin/master..hid/for-next
> 301
> $ git rev-list --no-merges --count origin/master..hid/for-next
> 12

I am still getting this failure.

--=20
Cheers,
Stephen Rothwell

--Sig_/r0BhmJh8XwjSmoAN4kUieic
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7xTtAACgkQAVBC80lX
0Gx9NQf9HttFKOyGy4QqOOa7kopotlmlyjk9LD8gJTmMnWMAg5iyTQbOqM0bRCwp
ia3LydeeeO+M9bP6/+4O1qfLX4iqc+ETS8m/Av+kXePEE9abyTGzn1sxnCKuHK+P
+xgkAyxiTPgOPVYerFDwIaDKqgJ5WWO813wCIZk3z6ymik+iPBEnbJvolT3dVLJl
1DeNYc2YhBaXW8ppzkz5IGpuYrb7CAF2QdaoTdLImPgow3exw4rCp595awDzk/i1
+jETcnzQZYkDtvCI7KwF/HjQS4S/NYUzadhHAI10dNHMJOVmHgzleR6qMWR5ULBO
lJAIpiQrObSMx8zyoqOjGVHaNimoMg==
=uACl
-----END PGP SIGNATURE-----

--Sig_/r0BhmJh8XwjSmoAN4kUieic--
