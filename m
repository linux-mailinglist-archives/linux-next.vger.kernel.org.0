Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32FBD33FFD1
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 07:43:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbhCRGnP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 02:43:15 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34851 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229802AbhCRGms (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 Mar 2021 02:42:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F1HX61MRnz9sWK;
        Thu, 18 Mar 2021 17:42:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616049767;
        bh=a90xdE5SmNtbOH4qzKKQD0uwsqfYRIhwuFxBOiiOilA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=vGyVjxEbfdA4xgwMFTp49+LaFF6+XHI5h/8uy0Gh8UF9ZfrB8QPWRGXZ1aKj3qm5N
         wadVdopdOVC9Eou0qPEdXyDoe1NTqvaGRVQDVVnx1e7g6zUbHIbS2UBbG2bQtM1F5x
         wxrq206yzIiAxXXAxxJF+mfzYETWuBcSoRJuKUOdmxZkes2cKd+X2s1vesKh9wjvFf
         qU54Eg55VcQKL90orMzWv7tR3E3fXj06KAKusO7777kOzI23Q39bEnKyBBabYUzTy5
         nJN3qTzGvd01Y5Y1mhToy4Y4mxY3DBQV8171aLgQrD0P/1YxbzdXrhLYm+CwF1wXWP
         oN8M3rI4Lz/tA==
Date:   Thu, 18 Mar 2021 17:42:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Finn Behrens <me@kloenk.de>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: linux-next: build warning after merge of the rust tree
Message-ID: <20210318174245.2dd8614a@canb.auug.org.au>
In-Reply-To: <CANiq72mbFhRLA8+azMoGLetFqXCAajhN6mrH4Nea8oxEDSm80w@mail.gmail.com>
References: <20210318172418.1438800c@canb.auug.org.au>
        <CANiq72mbFhRLA8+azMoGLetFqXCAajhN6mrH4Nea8oxEDSm80w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5pA5=bVLSVc+V7n3jOQyQTz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5pA5=bVLSVc+V7n3jOQyQTz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

On Thu, 18 Mar 2021 07:29:21 +0100 Miguel Ojeda <miguel.ojeda.sandonis@gmai=
l.com> wrote:
>
> On Thu, Mar 18, 2021 at 7:24 AM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > After merging the rust tree, today's linux-next build (htmldocs) produc=
ed
> > this warning:
> >
> > Documentation/rust/coding.rst:24: WARNING: Unexpected indentation. =20
>=20
> Ah, so docs are built in -next too? That is very nice. I'll fix it, thank=
s!

Yeah.  Not for every merge, but a couple of times during the day.

--=20
Cheers,
Stephen Rothwell

--Sig_/5pA5=bVLSVc+V7n3jOQyQTz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBS9mUACgkQAVBC80lX
0Gze+QgAjeU3RAeuMW6UvT7UGEl7So8q0jD4Kej0oYUC0gOiVQPAoPGgZ4DRpN+8
dUtXPF8Z/IyknOm2Mc+3Mtgaxn8AJWCqxw7Y3+sNOrIhIsmmC2e7KKO2Ei+/NY/F
4AtN4zFo8Tnlsh32u+jzPJHBdYjnD/MKhBUXO+aMatNfTIdb6nuKb0K8sUyuKhOv
HBlH9KW4je0NewhBeQXUxxxR7Tk2jlQDoU4d1Rp9Ojdb2u/+O+FsUk5evOWnOp2v
aSdaw+QQewvr97zj+UW3fFs9VdFtIF4HOeu5DRO/nDP0uDmqCpo9Kgfn4Ip6ZjCF
eajQDUseABK4bL0P25RiUHz2ylOUQQ==
=HAEd
-----END PGP SIGNATURE-----

--Sig_/5pA5=bVLSVc+V7n3jOQyQTz--
