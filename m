Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9A62717CA
	for <lists+linux-next@lfdr.de>; Sun, 20 Sep 2020 22:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgITUQl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Sep 2020 16:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgITUQl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 20 Sep 2020 16:16:41 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073F9C061755;
        Sun, 20 Sep 2020 13:16:40 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bvf3p6CcCz9ryj;
        Mon, 21 Sep 2020 06:16:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600632998;
        bh=6bPmeWJo+5osCDtN0ZAW64Z9hBSEE4Uq6kK0zk5FhRY=;
        h=Date:From:To:Cc:Subject:From;
        b=Yz/Dz0gkXdShxad7exmhhdocIj/Z9CKeEYhlHmgZCI8apWyd9yQn8c+Cd50qBevje
         fJgFhGeuFLH0D43hxneGyV7vM6yfxrF3LmeyMwSB9jeWQIyu3zYLGBfNDnkFfGT/Eq
         HYIMUovyqJOlQ/2YRy9uFhGCCkyonYtdYIY6M7EdM4FHCxXFL9Xl43MkshZxa+6W5M
         N7SzrcafrnvKgUBoYIFM/Lf1Etiv+ZGXMsSw+V08uEMYZSYGg0SgelyKY9wUVHz6p/
         uK98sOAjifMGAN3cgqOrS80p4I2B82WV5YLHE08L3gwkgMycLI155iv2iCWN5hfbD0
         mvve0EJ1IXSig==
Date:   Mon, 21 Sep 2020 06:16:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the leds tree
Message-ID: <20200921061638.28bb1ff3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UCNRfJA/.lMhIO4J7hG.GL5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UCNRfJA/.lMhIO4J7hG.GL5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  258a8388d0ec ("leds: ns2: use struct led_init_data when registering")
  d444232bbbdd ("leds: ns2: remove unneeded variable")
  29c44f2b51a8 ("leds: ns2: register LED immediately after parsing DT prope=
rties")
  925533c5a040 ("leds: ns2: cosmetic change: use helper variable")
  47f1fb852be2 ("leds: ns2: cosmetic change")
  a2ca4110ffc9 ("leds: ns2: cosmetic variable rename")
  2d55e2a22ef0 ("leds: ns2: cosmetic structure rename")
  51822355a756 ("leds: ns2: use devres API for getting GPIO descriptors")
  e6367d0d57cb ("leds: ns2: move parsing of one LED into separate function")
  a5c8eb177993 ("leds: ns2: support OF probing only, forget platdata")
  820a7e98dbc3 ("leds: ns2: alloc simple array instead of struct ns2_led_pr=
iv")
  5943b5ceb7f2 ("leds: ns2: use devres LED registering function")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/UCNRfJA/.lMhIO4J7hG.GL5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9nuKYACgkQAVBC80lX
0Gzo/wf+JAJtwpBJpWe3ECe63tVxocAMrUq0vEKNJmtGsKqgsDkebfsa4SFhk4nc
795yOcBrOPQkcYBgVbbSsYxnr+T75zEHWGU6wr1+MzuiK9q4uNeMXWY5tkTFjrDP
vu8SY1YsT6RFL6TU3cTic9EYGZZ8qSY5BDsrocV0BjuwnTfK2wOZMUWzSglu3Tuy
3Y7taXgaZr4gdK9sXra14QlD9SmyDt+qT01O5QOK4diL6u53PzqEelCJ70ZPFOzg
cnlDEkjXF1/ILRutHqg1AtSnkh5niIJHGxwvfhCjqOHyQl3lPEk0g3POu3h0uulo
fYN5eeHyY3FMecmToHtOABCPU1pDWw==
=MWYa
-----END PGP SIGNATURE-----

--Sig_/UCNRfJA/.lMhIO4J7hG.GL5--
