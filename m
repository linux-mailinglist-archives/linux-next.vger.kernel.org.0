Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E52F03D3112
	for <lists+linux-next@lfdr.de>; Fri, 23 Jul 2021 02:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbhGWASK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Jul 2021 20:18:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50715 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232730AbhGWASG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Jul 2021 20:18:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GW9tR0Tkfz9sT6;
        Fri, 23 Jul 2021 10:58:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1627001919;
        bh=+dP97vyhuZhjpuVAouKuLKajNZNqZ4T0IDbrYiqQba8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=iPWx/hs4ObsLbwTg21OFIyZhaDkfZmMtpHV1GpYSs2hgTTV67DQ/bbK8LrwhJGw8d
         7weBPzVGyIb7IYtcG+9QEEmYqUu9g04MTbVM5nn4w35dYJjLuAxnEshhtJtalpsV6w
         CLKaYLpP+Db6/AtBEYqXPMMrDJiXY6YzbKXAZpJih6FfqleDFSnkcPODKYWIEafHSa
         i4cdQUogQLo0tRzFdWfVn0O7WUjV53e3GdId4Lc6dq90cWTZ3RiHXbqFJJPbVevjjQ
         R35uV1StQm1ob4JsxgW7i6fXqN6Xup4KeHkIkKTICiY4chA+H1ODNOwcPj5D941ccy
         MTIi9Qv+M2tvg==
Date:   Fri, 23 Jul 2021 10:58:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Yizhuo Zhai <yzhai003@ucr.edu>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the v4l-dvb-next tree
Message-ID: <20210723105838.613c9020@canb.auug.org.au>
In-Reply-To: <CABvMjLTTtAwH7tT96TQ8THkCjTGUe-bMij449UALoyTSS94amQ@mail.gmail.com>
References: <20210723085145.1ce7ee5c@canb.auug.org.au>
        <CABvMjLTTtAwH7tT96TQ8THkCjTGUe-bMij449UALoyTSS94amQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q8SueysCyMdtFGVTfA/=dsN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/q8SueysCyMdtFGVTfA/=dsN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Yizhuo,

On Thu, 22 Jul 2021 17:38:13 -0700 Yizhuo Zhai <yzhai003@ucr.edu> wrote:
>
> Stephen:
> It seems you are not in the maintainers' mailing list, should I send a
> copy to you as well?

No, that's fine, I will get the fix via the maintainer.

--=20
Cheers,
Stephen Rothwell

--Sig_/q8SueysCyMdtFGVTfA/=dsN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD6FD4ACgkQAVBC80lX
0GyPywf+IqCmPv4PE5tN58RT8dYTsbRFRS+vSTXZ2LoWcR/UdqcpgHDsHtgY3TDT
zwH76Ez2Ib5cTe+LYTaJe8m3vX+qakBByS4J+UoQcjaNkbLfgxuh1j6O0jTPOvPz
EpBAtuGF91VGmPwvcn+1yPriSrDNco+5dY2HsCJBsGQ2xZ1CIqBs73Nbrbf9VTF9
EzLUmYvs+mx9Q/yhwSchGqZXz3l/9FLP/i0ezZG3ZlmiS/MWyDySs3h+egRwVBmW
EMn/T08lnR9w8WEml6w8nC0HEOesKibcp8QFFAS8EQ9ZECxzC77OSYRrDjTzdNsr
/S3VsMECvj+zx/v9nuCGQMx7tvJpyg==
=9X5k
-----END PGP SIGNATURE-----

--Sig_/q8SueysCyMdtFGVTfA/=dsN--
