Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C105520E8D5
	for <lists+linux-next@lfdr.de>; Tue, 30 Jun 2020 01:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgF2WgU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Jun 2020 18:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726948AbgF2WgU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Jun 2020 18:36:20 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4D2C061755;
        Mon, 29 Jun 2020 15:36:19 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49wj5F6zRnz9sTZ;
        Tue, 30 Jun 2020 08:36:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593470178;
        bh=hOF6pITSAmBHEmL7doAt2q/yVedOLxQI67XWFCPVy7M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ipXpwJrqIQB7pHU+uK3z8sCi5VLp2LdvrKNTdQvvi2K/orKMfqo0Huy8nEK4jivsR
         xwAypyLPenzFPv9hcFyE8pqQEIXNo+rMBTXk1ZqJ7bj6zZ+yzLIRc5JLcFf/jD5GJx
         FQ7Ml8RU3rXCXllrO/DEfjd84AuzBu8x4s7fQWRZ+D2zkqVs5WhHcDp9wehqhEKCJI
         jomsXZ9T08tLBD+smJ21fDYRu60kg3nP7b99LfewVhDqviw22G4ZSYDaPY4ICClqK4
         Lu3SSjIM8tvFvdIoWZxjzrSS56fuSFK4OtXetFICx9+D2DRgY72QQgXXRadVNH0ILY
         9/wkCA7TMRUEg==
Date:   Tue, 30 Jun 2020 08:36:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Pavel Begunkov <asml.silence@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20200630083617.46d6a08b@canb.auug.org.au>
In-Reply-To: <fa5b0279-32a6-f9c6-f325-cedc2786b74a@kernel.dk>
References: <20200629080533.5f44d445@canb.auug.org.au>
        <3949fc27-da62-6e26-cf07-59d3c78e2b64@gmail.com>
        <fa5b0279-32a6-f9c6-f325-cedc2786b74a@kernel.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/39I3ihTcwi=OEJjt9IWZ7f6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/39I3ihTcwi=OEJjt9IWZ7f6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 29 Jun 2020 10:25:01 -0600 Jens Axboe <axboe@kernel.dk> wrote:
>
> On 6/29/20 10:21 AM, Pavel Begunkov wrote:
> > On 29/06/2020 01:05, Stephen Rothwell wrote: =20
> >> Hi all,
> >>
> >> In commit
> >>
> >>   8c9cb6cd9a46 ("io_uring: fix refs underflow in io_iopoll_queue()")
> >>
> >> Fixes tag
> >>
> >>   Fixes: a1d7c393c47 ("io_uring: enable READ/WRITE to use deferred com=
pletions") =20
> >=20
> > Jens, could you please fix this up after me?
> > full hash: a1d7c393c4711a9ce6c239c3ab053a50dc96505a =20
>=20
> I don't think that's a grave enough concern to rebase, it's just "missing=
" a
> single digit of the sha.

Yeah, its more of a "please fix your git config". :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/39I3ihTcwi=OEJjt9IWZ7f6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl76bOEACgkQAVBC80lX
0Gz66AgAmb2WrQ5HMSKxrf1aiLqT/AKda58dAIfRENNMsAlr/8wUd22r6zENOv2P
4AZepJyl32rBg1VSPxH86at4R35SCN47QBxf2qTnRyiFuBLnzl89K4ofdDb8EZmi
GQfkbGTQijudd0JnzPpFWYS8mbtwYLmbjiLknnh7BryYEngr/MWh3Y8wsIW68iYF
FolpLO5ysKk0fiezn8j+4aNDAbofB4Ej0oAxt4/cth4dX5k6HsKdY12H3MmU9w8I
zUd8zlAHVmVzjDALusXnhcd8J0G1o1fLzMyLkyTpsJ9k2MEnbUxFKUHRGtw9abde
4GZpBxQL9xPnpaQtxQ/bU6b69dBzrw==
=Q4ow
-----END PGP SIGNATURE-----

--Sig_/39I3ihTcwi=OEJjt9IWZ7f6--
