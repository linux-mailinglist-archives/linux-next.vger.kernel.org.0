Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4A9C2877
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2019 23:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729600AbfI3VQP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Sep 2019 17:16:15 -0400
Received: from ozlabs.org ([203.11.71.1]:43317 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731050AbfI3VQP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Sep 2019 17:16:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46hwDr1Bk1z9sNF;
        Tue,  1 Oct 2019 07:16:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1569878172;
        bh=ABi3XTYRlRRy2dg9HbrG9Jm3gXd9hiGGIVOBtE75DO8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XdI8MqdUpZu5VMnuImREiFb1niTwI+X8ObObiWReuj6IwfmblmO+cVyxUl8GQ2V4S
         CziSLB0CYj8sej+0FGfOUpYiqHHbAfSOCSpumvzRPJz5al1f8GAFRI00RhPdR1pGPo
         FRav3IDYfjdN4G0zcz9JlKSDVvGtr34iOY3EoyJbNn/MCRBRHR1ZflPDKWmeAWbrAG
         YaPuSIKVKTiu8gZrS5eOptxEDbDNu7jj76evUJvqegqttMi2esT0xh8zeGDye3NdfU
         rV7fJxwo7Ja6tCzAn/LY7ePedtQ2i70u4pl+ir2XsIwbmPQnEGEgmvh4l6Dm63VX8f
         gwToUk3fmfPyw==
Date:   Tue, 1 Oct 2019 07:16:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Gao Xiang <hsiangkao@aol.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-erofs@lists.ozlabs.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-next@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miao Xie <miaoxie@huawei.com>,
        Gao Xiang <gaoxiang25@huawei.com>
Subject: Re: erofs -next tree inclusion request
Message-ID: <20191001071602.5723e33d@canb.auug.org.au>
In-Reply-To: <20190930132925.GA10677@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20190919120110.GA48697@architecture4>
        <20190919121739.GG3642@sirena.co.uk>
        <20190919122328.GA82662@architecture4>
        <20190919143722.GA5363@hsiangkao-HP-ZHAN-66-Pro-G1>
        <20190930231439.37295a14@canb.auug.org.au>
        <20190930132925.GA10677@hsiangkao-HP-ZHAN-66-Pro-G1>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8u8oJwVrtwQVPX8=Bt=VocG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8u8oJwVrtwQVPX8=Bt=VocG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Gao,

On Mon, 30 Sep 2019 21:32:22 +0800 Gao Xiang <hsiangkao@aol.com> wrote:
>=20
> I think xiang@kernel.org is preferred since it can always redirect
> to my workable email address.

OK, done.

--=20
Cheers,
Stephen Rothwell

--Sig_/8u8oJwVrtwQVPX8=Bt=VocG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2ScJIACgkQAVBC80lX
0GzPQAf+MFU2QYjTEQ5TE9srpZ+8ctwTC7tAz42SidHNa3ODU5iFRT0fWQC7liis
qL9ibdkp3aH0wEw60i4ZgyC5WLNhACh37chxD7y1OH2Tm6RQvHSjda00U5TRqziX
T/9jAKratRrjqtICZg8JbUVzz66mq8u2UTxe4ic+Ys4G0FwVbkY41IuakBtzZYwa
9GO9+HUAH0gGi3mU9B60KnCqENWG8zl6vOWaewxUBbDlrXFaGhdANfC0NKnwJva6
ZwsKj8xPykSpMruDNqIk+8vffy3Q3oKuJzeDJA7wmfPzikq5B7TQExVwP8XpIRmG
jm+Kj/RKfXSif9+TePfW1hw/1jw1vA==
=mogZ
-----END PGP SIGNATURE-----

--Sig_/8u8oJwVrtwQVPX8=Bt=VocG--
