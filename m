Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54AD1123681
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2019 21:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbfLQUH4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Dec 2019 15:07:56 -0500
Received: from ozlabs.org ([203.11.71.1]:53849 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726967AbfLQUH4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Dec 2019 15:07:56 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47cq213YDSz9sR4;
        Wed, 18 Dec 2019 07:07:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576613273;
        bh=LDkztAi2mI+/R6SQTFXDFmEGbzB/j/IdAy/d/nXhzIE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qVuvZtje0Cz0ea0dKOZ9fu68wmgkmktzlMkuirzQQavp56H29ZKNIpQV9NR3gN0f3
         Wh9bMPLgIXy0fRaxGtA+9T9Ca7zHRzKGGIechwEC2dZlRBis21xeXU2TF8XvuRl2sI
         ula1/tRy5KjTsS6bKAeUWB9x7XMiv341DOXLGmnxYi02nftM2nw6o7f6KCS/Uh1YOE
         jM9yDJmFe9ClO+USIqLn05gVcwwg7Jx8ZLgonamW8EmRXmsnTbrZLZZZktq8f4fByH
         lhF9GgAYEv1sPiQgO0yHbxOVJFDHkl8sQXI3hI36jzE5in8wP6MzjSeIvf604DgfGI
         gPkvgd/qQwaug==
Date:   Wed, 18 Dec 2019 07:07:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>
Subject: Re: Request to add linux-kselftest kunit branch
Message-ID: <20191218070732.18b35b17@canb.auug.org.au>
In-Reply-To: <15fd4946-1f64-cb36-c74c-1126e070d93b@linuxfoundation.org>
References: <15fd4946-1f64-cb36-c74c-1126e070d93b@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GCbHFTMTXJI.eBkWTFZ5XvT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GCbHFTMTXJI.eBkWTFZ5XvT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

On Tue, 17 Dec 2019 11:21:18 -0700 Shuah Khan <skhan@linuxfoundation.org> w=
rote:
>=20
> Please add the following linux-kselftest kunit branch to linux-next.
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git=
/log/?h=3Dkunit
>=20
> Please include Brendan Higgins on the CC list for any issues on
> this branch.

I already have this included as the kunit tree:

branch test of
git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git

--=20
Cheers,
Stephen Rothwell

--Sig_/GCbHFTMTXJI.eBkWTFZ5XvT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl35NYQACgkQAVBC80lX
0GzemAf/ZrvV3cGR6c238FH/AtcHMwZEpJVS62FpruaUHF2FfTQoqfvW4Yq88Q8S
BKYjLIKt7HIsuN3U35+Omr3AlH1rUPRZm+QJYWb0psp5XK72YYtrsTUiu36Y7aCw
H0Nt11CzMxjLBEfna6RmG/iWyCy9/x/n3xQy2YUjd1taChKMKtL9xPXqL6ZIq4Yu
NiU0s3E+DPpdpGeSLgB8QVmw3iK3resMACck5pT/corhJhW6Cp13dbcxCQr3pOC2
LU8xtp6ZX/7l17MjDsdQXvhjN270JDO2agxkWPE4Z4madYktV1S5ls/TVGBX2sTE
1zCDWVKlQBrDFbUDcJjY81TkhaNo8Q==
=BCAq
-----END PGP SIGNATURE-----

--Sig_/GCbHFTMTXJI.eBkWTFZ5XvT--
