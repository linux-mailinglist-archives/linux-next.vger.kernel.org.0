Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5E1A42EE91
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 12:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237866AbhJOKQg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Oct 2021 06:16:36 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37355 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232942AbhJOKQb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Oct 2021 06:16:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HW2Dv6Gc2z4xbc;
        Fri, 15 Oct 2021 21:14:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634292864;
        bh=r9P18IKJABoUfS037g6WJ3WsogQ7ZEkZgs5PQbKuf8c=;
        h=Date:From:To:Cc:Subject:From;
        b=aS8fEmGwYgGZf5Sb8VRmLq58tjozKEN3NI6LLGRxvmmG203iJ69G6d+Sx3vRVcc35
         dhOBRjUpoOoo03e5PJruse2RZl+/VH7Hb7+iZ1TwQXRULAc3vTBnsD4u0sFrbtf0ZZ
         K5Xj+/udAjXnxPeJniqy6USo4WihfuFy3MSXgClopRz9k3BzZb61pPQvjhSgIWzmp9
         /rJSUwt7714+Lc7Ofojb5QrfRA/2WdaC24iZKS7g+5nvtyMWSQS7NfsQ3jNrRZ6e/h
         9n1M/4BW43eUr3cAFbqkFqW89qSgqQ8/NZBxJhlaqAYiDgW4O8aDzur1h/UTprCtWH
         79ES5Fnjw2VMQ==
Date:   Fri, 15 Oct 2021 21:14:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the spi-fixes tree
Message-ID: <20211015211423.2d8d3c0b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/szMFqjigKSyOGfI.KIC9dXG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/szMFqjigKSyOGfI.KIC9dXG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the spi-fixes tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/spi/spi.h:671: warning: Function parameter or member 'add_loc=
k' not described in 'spi_controller'

Introduced by commit

  6098475d4cb4 ("spi: Fix deadlock when adding SPI controllers on SPI buses=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/szMFqjigKSyOGfI.KIC9dXG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFpVH8ACgkQAVBC80lX
0Gzcbgf+MwQnDN4fv14b9cOzpUud3VrWQxfXrCCPib7cof5BGWWsE/N/2FvLf6ZC
MkWbXTmPLobzeBxrmBL6qaYERP8KzSOua1M8yGv9b6TxBfeXXz/exxranBbqYyf/
R3FmRJQi1j+XjFDYj6I9WhtAu6HE6tVhritpJ0c14ANC6tI9MZhBMQsS0Ng3wsU0
aqnSa2X7IbCkNmixT4rQ44W5REtlAoHsOSK74nvyvZqraT3vGYOszrnwHRirypF9
/my3i/bIyP+nhZhnDtAvljAzprVQEq2Hm10RpnN3SV7ejreDRR/PqZxYuLX71lwx
DKKeSMWkDvI45IbjnCK6YPpl/UR9fQ==
=WwpC
-----END PGP SIGNATURE-----

--Sig_/szMFqjigKSyOGfI.KIC9dXG--
