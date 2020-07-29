Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D891623276A
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 00:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgG2WMG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 18:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgG2WMG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 18:12:06 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE4FC061794;
        Wed, 29 Jul 2020 15:12:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BH77S29d9z9sRN;
        Thu, 30 Jul 2020 08:12:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596060724;
        bh=7fKYQ0GIqxzYhLE+SptIOOonvGCwgJtP9mTrebtsbFg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YzLwV/DQrswjnJrEmhEd9FZ3LC6MZ/o3ygDPWEMzD/wctw57v1FHVykDnqfTJnN92
         MyYlUUQh7l51cj1wB383LnOiwae7sOaYpyxz81Awxcme1DZJcYLmBoogapSXcXg7Ge
         CipeOfVlUh1GMxWblWI4c8DwvKAemXn4k8k5J6INFPOketMGx4PcL8tBtiZwmLCCBQ
         SqwxTWxFmp+K0H7bqxtgMG2uRrIU6dZgzxPgI3rI/+B22mH7xOmsxFRTJ+VACQMDoQ
         CIVfoApjIXTCY6lDfM2VjylgOOY+5encRSaaGYBPnKAlr+WXx6xTVgw3SNhyNSoluk
         aMe5ED6aWp4GA==
Date:   Thu, 30 Jul 2020 08:12:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20200730081203.5358cbc3@canb.auug.org.au>
In-Reply-To: <20200730080849.70cfeeb6@canb.auug.org.au>
References: <20200730080849.70cfeeb6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5XaBg/+=/CdN4mC/oQz0gL_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5XaBg/+=/CdN4mC/oQz0gL_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[Just adding cc's]

On Thu, 30 Jul 2020 08:08:49 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> In commit
>=20
>   64d452b3560b ("nvme-loop: set ctrl state connecting after init")
>=20
> Fixes tag
>=20
>   Fixes: aa63fa6776a7 ("nvme-fabrics: allow to queue requests for live qu=
eues")
>=20
> has these problem(s):
>=20
>   - Target SHA1 does not exist
>=20
> I can't easily find what commit is meant :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/5XaBg/+=/CdN4mC/oQz0gL_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8h9DMACgkQAVBC80lX
0Gx5BQf/YkFOmshd3g2Qni1RSqUeR4GPf2E4ieAb9IoaXvdLnFD1ba5csTdFotre
AjU3rqkvwk0A9o/CvNr32nHte01TCDIaKLyzbN/5kRlw3ZrVTpSRNVR9ClE5xjd4
Vv7z/9esSFFN2VW3RvJHspoO3GcCH30zPYRN3R4gKalrsG1OnViLCdyIY1UHPkFc
SWoQG0gKEmCqmuJm3B6uhNydggLRaqfNBr99QpGNKe0ttxc0G69X1xo1TLUyBrHt
KeSLZDG9ibBeu9gkZ8upy+f1GgmZxacFVzdbNheffMx6gPHCjtvMTBDiEkCDsAB9
0CRyyeROKNEO6GpwM541FhXg7GLLKw==
=9Acc
-----END PGP SIGNATURE-----

--Sig_/5XaBg/+=/CdN4mC/oQz0gL_--
