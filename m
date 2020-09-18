Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4571926F7A2
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 10:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgIRIEC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Sep 2020 04:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbgIRIEB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Sep 2020 04:04:01 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1206C06174A;
        Fri, 18 Sep 2020 01:04:01 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bt5vL1h8Fz9sRf;
        Fri, 18 Sep 2020 18:03:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600416238;
        bh=D0vBWMKUoUPz5oaDuCJEe23hA4kclVJqXs/yN0B5IMc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sahsUf6Hidwz4jlvRBGDztZ1LQYDVI4sRf1Qu/Q3bzSwIbsGKADbmXWkAdkx6nKpO
         zKg7+UaBOZUMT5IYIfbJaSsGQlYVZuEvxzN+9zaDcmpVnT5uBphLvHHya5JRFULFi8
         ES4bpwlma/g7m3RpkAivDvdfDm8V9UO8w6o/+0U3TKmUW86L59Wo6o2KNp/cbDEuVl
         6bvArJDMEOI/uBUd3ojHxtf8dfgoLg3wj7uXq6phJDQzyGJiPjsVJXSDylhLfqJybV
         j6jZ7jAmtCg/9AK33EoYyU+AEMg9gOKsNobBaoI6fWLd4r6ylcWBeGkiDaWvVOzWQW
         0MUsVSUcXqwvQ==
Date:   Fri, 18 Sep 2020 18:03:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the v4l-dvb-fixes tree
Message-ID: <20200918180357.3afadbda@canb.auug.org.au>
In-Reply-To: <20200918075230.GD3049@jagdpanzerIV.localdomain>
References: <20200918172106.4a924556@canb.auug.org.au>
        <20200918075230.GD3049@jagdpanzerIV.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WOFu_GdiJwpJW/Zvy5Nyu6z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WOFu_GdiJwpJW/Zvy5Nyu6z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

On Fri, 18 Sep 2020 16:52:30 +0900 Sergey Senozhatsky <sergey.senozhatsky@g=
mail.com> wrote:
>
> On (20/09/18 17:21), Stephen Rothwell wrote:
> > After merging the v4l-dvb-fixes tree, today's linux-next build (htmldoc=
s)
> > produced this warning:
> >=20
> > Documentation/userspace-api/media/v4l/buffer.rst:692: WARNING: The "fla=
t-table" directive is empty; content required.
> >=20
> > .. flat-table::
> >     :header-rows:  0
> >     :stub-columns: 0
> >     :widths:       3 1 4 =20
>=20
> Thanks. I think there is a patch for this already.
> Will hit linux-next soon.

Excellent, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/WOFu_GdiJwpJW/Zvy5Nyu6z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9kae0ACgkQAVBC80lX
0Gw4Ugf+LY9lUDJO0vtA8itrwISD8lp4eKQmo19lFa+o0nuAKfAOTbiwQdwGiYrE
6u/zgC/SQkTBNOqu9e0plZhJ4AB9dsKsfNQayuz/nRALOQoHou+rnkou4+cKLrpA
fKHrIGsQ0g8dEegzQ7f9RdGd66qlC4QOcNiHaRlh8p0oYoCs/zyObuTNY9xmyt7e
0IPl1U4sS/bnIxdHplT4ZPk2bvAvkjT3XQ6H/RH143FpXQCjxW6dt0YRdRjWSlTC
kHlI91Y59ETa6SZ0rvN5vH08vlt5vDsYpkjwneyuPT71cPYTEEh1NmDgOLBlqSIx
PxFdRv35LIKGcBJV0dvY3milYDx7wg==
=fWKl
-----END PGP SIGNATURE-----

--Sig_/WOFu_GdiJwpJW/Zvy5Nyu6z--
