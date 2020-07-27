Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 227F122E745
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 10:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgG0IIf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 04:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbgG0IIf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 04:08:35 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB2BC0619D2;
        Mon, 27 Jul 2020 01:08:35 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFXW46K3hz9sRN;
        Mon, 27 Jul 2020 18:08:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595837313;
        bh=ZB0YfooDmJb71L7NPOII9upL0BQw1kzm26TJWFmNJvI=;
        h=Date:From:To:Cc:Subject:From;
        b=ObQ5W0T7KVZ6Ir3M3Uw2LogMkZzz0v5LK+9xQtfHDgApg/LsLpJbZRVzAyj8EyPMq
         X72EUqWLziUQ/34KjXKVbrzSLEKwPt6NIDmVcYpFz15pTZ8yz39uGQ6e/8HIt7gG2S
         KRPUrNr8scujsVTmH0fn7+6ZJRqjmKGtPamzxdzzzadLEb7g9j4zQBy3SUQoD6ciwg
         L9QCAzHOSXi/U6mLHhV3o1IqFSkOuOnOtxMWyntqi3DtbcWaPNtAStIzxW8CkEtDYs
         aUYKkKrpiA/lGYOxKeGGuWn/Azm4OeDK5dEzoQICJpj3rBJtOnIVf95kxenXMCMO7i
         I2LJ0hYEMrDGg==
Date:   Mon, 27 Jul 2020 18:08:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Oded Gabbay <oded.gabbay@gmail.com>,
        Omer Shpigelman <oshpigelman@habana.ai>
Subject: linux-next: build failure after merge of the char-misc tree
Message-ID: <20200727180831.6c356fc1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wNv+Qy3O1nb0cUhVFMrSJS_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wNv+Qy3O1nb0cUhVFMrSJS_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/misc/habanalabs/goya/goya.c:8:
drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs.h: No s=
uch file or directory
   12 | #include "habanalabs.h"
      |          ^~~~~~~~~~~~~~
In file included from drivers/misc/habanalabs/goya/goya_security.c:8:
drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs.h: No s=
uch file or directory
   12 | #include "habanalabs.h"
      |          ^~~~~~~~~~~~~~

Presumably caused by commit

  70b2f993ea4a ("habanalabs: create common folder")

I have used the char-misc tree from next-20200724 for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/wNv+Qy3O1nb0cUhVFMrSJS_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8ei4AACgkQAVBC80lX
0GwpbAf/W+vSs7w255A8tCEkIBcZiJvjLSaE1H/eeFvaEHrgwaRVpxmtFzl3eN3k
upP61pSy5fHrS5ZnlIR5hbQZpnuZvSIiw+yBSwOxQWtXuMEgoLbaPnXUNF25jq2T
P6mJ/iw22BqsvSi4sUYqDZy4So7Xp1JJQ67X5FEeRh0SWAyLeE6Lh4SZjSf58hEe
WXvMYvW4nctN3OM1l/Pc/YzjJiUaZ6r7msc1a/30i3MU/EkQdr/i+o9JFTzYlA3Y
Mty1rmQBqlz1jquwQ7MbUgDP4ugRdMcROQd74Sg029UZCDz2njZBmz3PJzUViXkN
TCBdufQdyPief3ioZCgh3wH9UqIFCQ==
=EXts
-----END PGP SIGNATURE-----

--Sig_/wNv+Qy3O1nb0cUhVFMrSJS_--
