Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF16B215392
	for <lists+linux-next@lfdr.de>; Mon,  6 Jul 2020 09:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgGFHzK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jul 2020 03:55:10 -0400
Received: from ozlabs.org ([203.11.71.1]:56383 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728243AbgGFHzJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jul 2020 03:55:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B0dCH1KkYz9sRK;
        Mon,  6 Jul 2020 17:55:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594022107;
        bh=6x6iqbxGKE73eigAyosnUefVYXfwEF5mTT5WBaJq+lc=;
        h=Date:From:To:Cc:Subject:From;
        b=beItfS81Qf3tCgXYk1WNPzyqXj/sH+dT/wdY+14nesspBoiEbhM049DZQ3VBQw83u
         bt/nQpBuIseco2SYI6lN/FMk3FNrYvu0nRqkG7LhLfc+J9t0WJeT4DcsJzo9nmrmt2
         zYQKpwUDbxw/ur7ZXySqMapm2CK3RxZI0CpjstMXN/YYSW4DZTpsA2+RwEa3/kfMAQ
         BgOBzAxn2iEZomGTYMiIfHNPDy6WGm8Yd1113Mg+uxEgTjKoXlXfiS6esKiYEiaJxq
         2Wx/aqM0LQXBrbCmUA0vs1pBRPQUwvsPrDDOWeq1k637/+gYSeudyYIi30pZJa+0Z2
         Tl72Pe4/wU4VQ==
Date:   Mon, 6 Jul 2020 17:55:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: linux-next: Signed-off-by missing for commit in the dmaengine-fixes
 tree
Message-ID: <20200706175506.7d35ca3e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZnkciIYEJmVqUisa7gYmIxX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZnkciIYEJmVqUisa7gYmIxX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  09c6b5536361 ("dmaengine: fsl-edma: fix wrong tcd endianness for big-endi=
an cpu")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZnkciIYEJmVqUisa7gYmIxX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8C2NoACgkQAVBC80lX
0GzuNwf+K7vV0aHolQB6Re+DRNYte6gE9tNu6dtuzY7pW9p+wmgEwbinGN+YnPoQ
/XSWW5niR0/9QTL6h9GGH8W1+GRkxOFQFUu0DL4bxvAQSq7hgy/fAj0Xe+lgUg52
mw62WUPvUjAt9TAjUCIe4Nkg9MPoacWXhZXygFZAv4MjaxnbTIc4vLkz97ZUM9+o
IeqdAN6x3MgQESI7ytxYMZeCWBTSNs1FfmQ9rD8joNTli5gTFzgoXwKxXkCek1PO
OMei2EmU31+Lj7hlzWpCGmbT3VY6Eo97VJBgBsnE/dUTCUnUHe2LyxtkEQSBnLqx
R4+sy0npdtlWF4X4o7vU3ImsScYCPg==
=ToMu
-----END PGP SIGNATURE-----

--Sig_/ZnkciIYEJmVqUisa7gYmIxX--
