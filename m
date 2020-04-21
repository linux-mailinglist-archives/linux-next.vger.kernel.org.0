Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D54AE1B1B8D
	for <lists+linux-next@lfdr.de>; Tue, 21 Apr 2020 04:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgDUCLf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 22:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725829AbgDUCLe (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Apr 2020 22:11:34 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 768C7C061A0E;
        Mon, 20 Apr 2020 19:11:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 495n9v52hKz9sP7;
        Tue, 21 Apr 2020 12:11:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587435092;
        bh=wOLWQwTVbg7rw74mgAEr4OU7rmhKp9+g6vkRNtSy+Tg=;
        h=Date:From:To:Cc:Subject:From;
        b=EH6goMi0f3ByuHLifjaKeaixR/SK0M3IU8MQvMK0zh6x9LeNPRscQ/A3oTcvTRwtM
         mFnnTyP7zAE3MrZMN5y78sxTeM8YbU+13d8J1P0hNOt1yTb18bBHC/n/VgcyV5srgk
         uZu+DWbNXkBXYVLGVqkeXBQqdv0vAEhKpSFn34KFWMVoeNFpaqGaxS03X9JVBJcZMD
         fbbyGcZd6nm1DoilZuejqw00xqGntmWToo1UvP3votqdci47xt9tlsLcAKOHTRyaKQ
         eBTgWp6rMEPRXwafzD+GJ6jHbLkwLkVgTZnaxTc1DzmRYobcDWn/evHl29rykgo/c6
         nP3W8et7sErlA==
Date:   Tue, 21 Apr 2020 12:11:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Karol Trzcinski <karolx.trzcinski@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20200421121130.44423958@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QRBgpKREa9gmFR3B0K60i2D";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QRBgpKREa9gmFR3B0K60i2D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from <command-line>:32:
./usr/include/sound/sof/ext_manifest.h:20:10: fatal error: sound/sof/info.h=
: No such file or directory
   20 | #include <sound/sof/info.h>
      |          ^~~~~~~~~~~~~~~~~~

Caused by commit

  9e72f13ee541 ("ASoC: SOF: ext_manifest: parse windows")

I have used the sound-asoc tree from next-20200414 again today.

--=20
Cheers,
Stephen Rothwell

--Sig_/QRBgpKREa9gmFR3B0K60i2D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6eVlIACgkQAVBC80lX
0GwOVQf9Fy3bdRlEciRi5Uo9x0WXHJYjfsvN5w0QU+R9LXti+NAuYuJ47KCEMR2B
vDwr/83768vacuIebJrcgX3yRLzblkTmS3doc+bkCJaUzGTy8BAA5kI1NS5WLjXz
eT4P4mb3VEDsQlHimXqJPsGC0QaORgrJ4X7FkFydZ+M8gbqnWJL9SC3yE+M54ZIc
SL6BqCBuKBkZDkF8seNSKupgo6es2SXvxUrGgJwaPkMv/dhgCs+IkWfFJGdvdvMH
mgd1vZazhz7PfX1PHCeRN3HVha7E5n1BRQS//a1VArl3NwJ+ivFsw3IX+f9h7dxC
Rn64AZlzq4DIizaVeChjTyTebDImeg==
=KbYX
-----END PGP SIGNATURE-----

--Sig_/QRBgpKREa9gmFR3B0K60i2D--
