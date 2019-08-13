Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8C08C3EE
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 23:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbfHMVrv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 17:47:51 -0400
Received: from ozlabs.org ([203.11.71.1]:42753 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726565AbfHMVrv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 17:47:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 467RCR1CFYz9sN1;
        Wed, 14 Aug 2019 07:47:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565732868;
        bh=QNIv9/6eYXhe8lrjk0V6PjDA+j0hqVyK+NifzMBwZ9g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=X0vPxBRBVx4GZvtdeNIBS5TwRzUE9VdY8PakxLLs9DQTof5g2UE0Yawy1UgZOW/+1
         co6oKswBUEvNqNhRe+vv02dphHV9rzKOVZQVL8rig0SjxVNnkONihrvd7Ezi9JJxdu
         KvnQvc3jSzA703grE1UvbcoBHeAYDRVT+DIXd2N31GrcGggT6rrLvaumz3k8JosDY7
         I+L6DuJRnlkuX1VjUFuvQCR97PkzlA2fYjz6C7heDoboivM5WNRhqSUU0/Q9gxQtRc
         wlrURbPLykVPUkNDHQd6q41Ky62hdqUNRkW/hgiQZdKo0ebvpe4IEdim9x3pG/+MdD
         z3CRHMUNqkyWA==
Date:   Wed, 14 Aug 2019 07:47:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Olof Johansson <olof@lixom.net>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: linux-next: Fixes tags need some work in the arm-soc tree
Message-ID: <20190814074730.402ec3ec@canb.auug.org.au>
In-Reply-To: <CAK8P3a2q1mShg-EQhiAFUOAET8UEMHfLJV-+HoLTaSQY+M7yBQ@mail.gmail.com>
References: <20190814002836.4b6aa14b@canb.auug.org.au>
        <CAK8P3a2q1mShg-EQhiAFUOAET8UEMHfLJV-+HoLTaSQY+M7yBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1D3ZSLx=5BUi2IVapoKt=A=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1D3ZSLx=5BUi2IVapoKt=A=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Tue, 13 Aug 2019 21:35:58 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Aug 13, 2019 at 4:28 PM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> >
> > Please do not split Fixes tags over more than one line.  Also, please
> > keep them with the rest of the other tags. =20
>=20
> Thanks for the report. How bad is this? Should I undo the merge and
> wait for an updated pull request?

Its probably ok to leave as long as lessons are learnt :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/1D3ZSLx=5BUi2IVapoKt=A=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1TL/IACgkQAVBC80lX
0GwzZwf/ZHu3Y/RLybUWFbYGivFgC09NytPbhm8+y9llOajMYD7Al1Pasg+kI1Mo
yhH9K1vQRjXybFR7l2M9F/ikcraK8C12qj1TmAMTJ6fFleMlXn6fEKhNqw1O8VMz
KcM8IY1Z23Lom8fMBhjjyGz9Wkv7r1b3mZugCUoZhsIeXKCYfcOW00RVm13RU/MP
3/uEKFHqWTSHMncKKkMPIgKCHckdiNQhS/mzck3P8aSapCBviOWg1NqJ2o18xg17
E8oglbj5WZVXZW8R6Uvf4Vo2ntaDjCVSX523je0ymMJvDju98pTURVZft20NlPPw
Vdnj8KVJ0QuSlWptoEGzS2Lt2K/rwA==
=0beZ
-----END PGP SIGNATURE-----

--Sig_/1D3ZSLx=5BUi2IVapoKt=A=--
