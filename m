Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A357B3EC8D5
	for <lists+linux-next@lfdr.de>; Sun, 15 Aug 2021 13:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237032AbhHOLse (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Aug 2021 07:48:34 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40509 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229597AbhHOLsd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 15 Aug 2021 07:48:33 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GnbC45vt8z9sRR;
        Sun, 15 Aug 2021 21:48:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629028082;
        bh=5xqqbQCDACat5noKc7sVDfOUl/dox4THfYZBtmAqvnk=;
        h=Date:From:To:Cc:Subject:From;
        b=g0PucV3ZN78kcYeDe7VodKe/Wywjk9YSjZdJ48cGw/on8KUNO2TxAld5FDpM6Y0+p
         kfeEPEVr64WDU7rqcwVVOIqN+qK92CsW5M/amCwF3SED1KcOHdpFvQTEmj6agsTxxO
         OIA4yTVcQXqOJuU2EIhOx66G3vM/RnLjKjOmNmoZBa/poEdOSCI1u2bGE5HG5Qd5fN
         8XojWG0Vs7y6PPhc/R5kfg1pMMWip1a75S6zSdDijU5ph3pjbkkO6x7YAJT7U80+JJ
         L40/1hfGG/LxnrfOw1w3pFGFIr+qhSCKfbVE0iOtj+Qu32wdTMPXEBI8rIm9SD8uGG
         hfTTOOZ+W77jw==
Date:   Sun, 15 Aug 2021 21:47:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Stephan Mueller <smueller@chronox.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the crypto-current tree
Message-ID: <20210815214758.058cc946@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xrCP79R3VAtTUXDDa.sLRpw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xrCP79R3VAtTUXDDa.sLRpw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  5261cdf457ce ("crypto: drbg - select SHA512")

Fixes tag

  Fixes: 9b7b94683a9b "crypto: DRBG - switch to HMAC SHA512 DRBG as default

has these problem(s):

  - Subject has leading but no trailing quotes

Please do not break Fixes tags over more than one line.  Also, it is
usual to surround the Subject with parentheses as well as quotes:

Fixes: 9b7b94683a9b ("crypto: DRBG - switch to HMAC SHA512 DRBG as default =
DRBG")

--=20
Cheers,
Stephen Rothwell

--Sig_/xrCP79R3VAtTUXDDa.sLRpw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEY/u4ACgkQAVBC80lX
0Gx6GwgAgc7rsAZrh9qki4WRS6ITpDm/TfHRqju+WDzCfTDhCj6SWUq2spEE1faT
Ekx4F6o3J/moo4cGCSGgF2gc+cB5NvVxnXZJpsUDz75mub5qk07fagiAGQDuukwf
RZ7z/79G2aoYJzzuntclfh+gFbXmhh602UFEAef8Qweni/mBDi21nilA+4BOyTf5
wTT2eG3se7b54NtJst49F4jr0zKMdWRNUU0eXbSP7w+QW99mMTCw56DedGJYjOsC
Qv0qBC96S90LQNn+isO1sE7zslP16Cm2NHOmcK4m3P96Zjc48vegzqBASuQvb4sy
j2N1VzlAW9nl6LCX8knu8WcqqBkLkw==
=85It
-----END PGP SIGNATURE-----

--Sig_/xrCP79R3VAtTUXDDa.sLRpw--
