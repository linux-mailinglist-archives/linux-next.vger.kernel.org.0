Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5B5459703
	for <lists+linux-next@lfdr.de>; Mon, 22 Nov 2021 22:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235756AbhKVV6p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Nov 2021 16:58:45 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:48435 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232805AbhKVV6o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Nov 2021 16:58:44 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hyh0S5Xjmz4xbH;
        Tue, 23 Nov 2021 08:55:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637618136;
        bh=7DV/rETkbK8RVLTE44kOuPuy8GKpYLBiNFe+vrR6rgU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qVsT+TKHa7bSg2+Jxsed1cBkHM283KR0TDeIJxKD3WAd1kPuaJFleOv7oQ7RhyqSd
         tyV5xBWyhsix9uh8t5E0MhhrEkcw5/tCMM8fXmO2xT9W3g2zBKCFGQey6JDGg6uwxG
         RPDv+XJqutAA7QrXLf9SzCaDGG90Sr29DeX5gOSXQoKdrC7qgCzVJ4e3JDo2JSCwEt
         cPwOmpnjKyKe+ysgWd3m+HoUm6ZwBp2FySBG6j4DUxh9JQlwUpWsMbcWKQLlMoXr+G
         ebp1x9UFcpcGmHYkFZVbLRmjbu2wJVhDef5e4wejloNWW71FhlBbkUTCxVdkOPb4iW
         3WW/2mfKybnRg==
Date:   Tue, 23 Nov 2021 08:55:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Nick Terrell <terrelln@fb.com>
Cc:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Re: Zstd linux-next branches
Message-ID: <20211123085536.34327635@canb.auug.org.au>
In-Reply-To: <024447A0-35EE-4E8F-819A-675328A7A96C@fb.com>
References: <024447A0-35EE-4E8F-819A-675328A7A96C@fb.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R5=SjeQlgAWsR=GDuH5O4pC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/R5=SjeQlgAWsR=GDuH5O4pC
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Nick,

On Fri, 19 Nov 2021 18:45:47 +0000 Nick Terrell <terrelln@fb.com> wrote:
>
> Would you please add these branches to linux-next:
>=20
>   git://github.com/terrelln/linux.git zstd-next
>   git://github.com/terrelln/linux.git zstd-linus
>=20
> And remove this branch:
>=20
>   git://github.com/terrelln/linux.git zstd-1.4.10
>=20
> As I=E2=80=99ve become more familiar with the linux workflow, I=E2=80=99ve
> understood my mistake in naming the branch zstd-1.4.10.
>=20
> I know that you pointed it out to me here:
>=20
> > That sound good (or you could just call the branch zstd-next - unless
> > this is a short term tree to just do the update and not ongoing work on
> > zstd in the kernel?). =20
>=20
> But, unfortunately I missed that email until after the zstd-1.4.10
> branch was added. Sorry for adding more work for you!
>=20
> Also, I think I=E2=80=99m asking for the right thing here, but if you thi=
nk
> what I=E2=80=99m asking for doesn=E2=80=99t make sense, please let me kno=
w!

That's all good.  I have done the updates from today.

--=20
Cheers,
Stephen Rothwell <sfr@canb.auug.org.au>

--Sig_/R5=SjeQlgAWsR=GDuH5O4pC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGcEdgACgkQAVBC80lX
0GwVegf/fgmRlU5QJ1o1En5Rh7Tx8XR6azle7UWULjL7jXHmQLxUVMoOZSASIQDe
WjWiL12OlO14W/qrbixHKJmIu1RMXjkmQGedLbwlAezwaardSGHzaTluULfOdMfR
t8ZCOcRTZbpG8VSdICw1LnAXWFo20wQr9Q9RdI2UPnv5raLQLtDo43d1jNi72ahc
O2oR1swRp4VkEkH62M/VB1UsRlCVpBFrPG1RLVuPunQ5MHgrnWKiPqJ61qZMv7rn
bhpwSXPoZ/o2vJPY21fJewNEHXD0jYiG4pzZW8aO+JJVy5xzQ2PrlUaXMmq0CT8I
ZKHUA8JH32bHy+irtg58IttDLriZKQ==
=ty9b
-----END PGP SIGNATURE-----

--Sig_/R5=SjeQlgAWsR=GDuH5O4pC--
