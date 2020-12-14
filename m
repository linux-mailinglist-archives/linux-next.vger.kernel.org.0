Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 704EC2DA142
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 21:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502844AbgLNUOj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 15:14:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502869AbgLNUOY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 15:14:24 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C35F2C0613D3;
        Mon, 14 Dec 2020 12:13:43 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cvsz956r9z9sSC;
        Tue, 15 Dec 2020 07:13:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607976821;
        bh=mBhvgdqrM7jHDSAGE/enbmpxasVKKuIntz9MQbY50ZU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lLxCoErIdVvvK5JEiUzWKI3LRnS/XLTprDch3ePRyxoelr2Ju+/LX6iASJRZj5LyY
         xAKTTudjf92FbumhS4wjAMiXUPRcQgsZiUqBoG9HdYmQtPRQ+2k6CzA8A8HP9yPcft
         KUWvAWZiFO6JlddngbYkccgqd8nxPiFvPhfTqeNglU4M46fEA1Z7nrEs5xaonYud5n
         7FNhOeFmY2ODJ2rBYUPYQ5sna9KKtp9ns75kIdX0K2wvGjVVFMwdbIMAi3rtB/pcSO
         7JvbXPfSrq+Ajt+o5rwWBksI7N3JslKiPtPONCbJF9mm8ix7jDjrDKa49W39ol/m5E
         xIcZjHLpilqtw==
Date:   Tue, 15 Dec 2020 07:13:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the block tree
Message-ID: <20201215071340.7d02be6e@canb.auug.org.au>
In-Reply-To: <20201203183740.1a1054f4@canb.auug.org.au>
References: <20201203183740.1a1054f4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_lXT8XtShz9aCZIRScTiw8d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_lXT8XtShz9aCZIRScTiw8d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 3 Dec 2020 18:37:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the block tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> fs/block_dev.c:1067: warning: Excess function parameter 'whole' descripti=
on in 'bd_abort_claiming'
>=20
> Introduced by commit
>=20
>   37c3fc9abb25 ("block: simplify the block device claiming interface")

I am still getting the above warning.
--=20
Cheers,
Stephen Rothwell

--Sig_/_lXT8XtShz9aCZIRScTiw8d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Xx3QACgkQAVBC80lX
0GzpawgAnINhPh6PnkCPDgV42h0crbT3ss7HCrMuzyrTJ90ocn2Ekl0TAGMYOPHa
9ZOaQmxWkP0aO/a6fY7++lKCgoW4sOmC0Nc2cxQF+5B0geeRx8Xhn8knJgCvzVWw
BIUXSnahvFmFu8qloXX0sSME1nu9T9hsIuZYwC8YANZpEuG1c5iitKiWQur+tvYi
xYYmzIFq2B5MZAiOyVmQdTb/oZaq61bTpJXgJq8FKl6G0XRz5+udZra3y2K023gX
Q3EYCeleehW+BAQ0fAyDPq7iBFEH45WRcllQX5gThEn35QYKzHr4gOrNZqh1jVBu
nZVZzM8zXHsAx+X/vbKhZv5YzJSHzw==
=1EZB
-----END PGP SIGNATURE-----

--Sig_/_lXT8XtShz9aCZIRScTiw8d--
