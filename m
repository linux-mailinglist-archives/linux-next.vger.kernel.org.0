Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 444E6269CEB
	for <lists+linux-next@lfdr.de>; Tue, 15 Sep 2020 06:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgIOEQT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Sep 2020 00:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgIOEQS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Sep 2020 00:16:18 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11F54C06174A;
        Mon, 14 Sep 2020 21:16:18 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Br8zy4QyYz9sVB;
        Tue, 15 Sep 2020 14:16:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600143375;
        bh=1xUEsk5Wj3dbUswPqUAtUgGLbA6i2z5+Jjmrc8Xi6fo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=iyD/lMZ9yot+zr9aospjnWEMHvVzlzMN5vPN0c20R0dZxvx2hMo9NttNYSkOpk8F8
         gpboYJx1qi58JI4D3GTeuOfoibdcA9WPKsKGVWuepRKRLMdHaOsGEyTfTsmXeEB5Gc
         YkCoY5M69UvsBOxaBp5FHWxiKh9OzHtlRt6axR4Ans2owJ2vtJYepI+FRfAkAH6nVD
         aFkFIWJXuK7cXlqH8d+1XrKdQu/Afv8M0+S8H2gwYAQWLK+nKEqyfkktBpmAyLch/s
         kXimZXICpfV6fLM6ckZWb+QTtDl986SslvmuwBq8tM87KvKY2ztjQlcOmRfIXaukMd
         NyPgYAMOwFSxA==
Date:   Tue, 15 Sep 2020 14:16:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Gow <davidgow@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Patricia Alfonso <trishalfonso@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200915141613.09dba80c@canb.auug.org.au>
In-Reply-To: <CABVgOSko2FDCgEhCBD4Nm5ExEa9vLQrRiHMh+89nPYjqGjegFw@mail.gmail.com>
References: <20200914170055.45a02b55@canb.auug.org.au>
        <CABVgOSko2FDCgEhCBD4Nm5ExEa9vLQrRiHMh+89nPYjqGjegFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z2knM/TUP8H9wxwd02Y46Ya";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/z2knM/TUP8H9wxwd02Y46Ya
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, 15 Sep 2020 12:03:08 +0800 David Gow <davidgow@google.com> wrote:
>
> > drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c: In function 'common_nfc_set=
_geometry':
> > drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:514:3: warning: initializati=
on discards 'const' qualifier from pointer target type [-Wdiscarded-qualifi=
ers]
> >   514 |   nanddev_get_ecc_requirements(&chip->base);
> >       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > =20
>=20
> I was unable to reproduce this warning: it looks unrelated, so I'm
> assuming it was attributed.

Yeah, sorry, that was included by accident.

--=20
Cheers,
Stephen Rothwell

--Sig_/z2knM/TUP8H9wxwd02Y46Ya
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9gQA0ACgkQAVBC80lX
0GxqDQf/fGxucLLY3tmR4qE2OIiFf7aAcXMvI5w1rjnvS8yH4ptRBt0+Iln2ov7A
2GFZ7QcsUTmMZ7a86pjnbu/3fyOcQQc8rTXZlPI04eP0+iRXOZLbRq73vsVKENdl
6aYcCDdDn092Et5C4C0a41nYiEb4lNi1l4DKS+DBnuBHruhsKUuUrH1Lhk3DgDHt
VKbnPOgcEHtu8W6uSU3rllre9qQ+OfQ6KRsSDFY5VLH9+yVvElk1e4ZRs0ZdRfVV
80ZfZDRnou09BMMY9C8Fk1+B/cPuAObvX3rGUoFwiUv0MYribQtrVLaI6gEhjTdF
UE4QNst1BeyAc7sd1AhkrZrbql9Isg==
=OB08
-----END PGP SIGNATURE-----

--Sig_/z2knM/TUP8H9wxwd02Y46Ya--
