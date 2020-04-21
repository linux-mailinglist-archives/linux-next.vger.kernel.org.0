Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA7D21B3274
	for <lists+linux-next@lfdr.de>; Wed, 22 Apr 2020 00:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgDUWF1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Apr 2020 18:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbgDUWF0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Apr 2020 18:05:26 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76016C0610D5;
        Tue, 21 Apr 2020 15:05:26 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 496HgN52Xkz9sSM;
        Wed, 22 Apr 2020 08:05:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587506723;
        bh=GK1CYGCdk6i+naXgyQ9LSnhWR1e3C0+EZY/yit/lwA8=;
        h=Date:From:To:Cc:Subject:From;
        b=tQeP9nkXWEiEP0Kv85pXxLwN3do6n30Mh66GmGeBVniIfNa2/StMU+PregPLCR8fn
         U7mu/sNaJTjK1Qy2fO5GutI2QEiuHu7ozKT4DzetnViGKqTZPChk2Cr8R9PKdMVEkd
         c4fUg8oMv/8ppELbvugy2O8s5kOoHvgtMoitv8bQPuR28gq8mVkpQlDLinGJfTn702
         t80erOvIf7uRIfLr4GtreuvPh+pzAcOVG8f6/z2OXpe4OsD0sAGW3iYna0KMl0Ryl9
         vLOCuKz6TkjATSXOorz2GnA/HO+6EIUhoM4mLL3rgoU6sPXUbSi9eIzp6XGz5nvduS
         K/Fg3/YJAczRg==
Date:   Wed, 22 Apr 2020 08:05:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Trond Myklebust <trondmy@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xiyu Yang <xiyuyang19@fudan.edu.cn>,
        Xin Tan <tanxin.ctf@gmail.com>
Subject: linux-next: Fixes tag needs some work in the nfs tree
Message-ID: <20200422080518.3c5727e0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3poIhWV55NQEb.HbpWm3hBr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3poIhWV55NQEb.HbpWm3hBr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  115677dcbc45 ("SUNRPC: Remove unreachable error condition")

Fixes tag

  Fixes: 7f554890587c ("SUNRPC: Allow addition of new transports to a

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/3poIhWV55NQEb.HbpWm3hBr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6fbh4ACgkQAVBC80lX
0GwPIAf9EeQiJCXubChuk1cbhaEnd2f25pVGttkRCivBnFpHfLgfPDqvpkmSuPbT
zD8sOPrPsrLH/gGTnxyaGiFU9ONqsEh9AmNb9u3QhOT4H1SekQYMVYtfamK4WLRk
zNa6XzJURqm1iKIG0f+kiwQerfBFmtXhUKcNjTRqf+HZagQLHTbIcsapswqMohdp
2M+g4bcEOhak+qJDziq1FjlYiliBhJogo9R7KjycYJhniV3CUYBb4jccyrl0QvYz
m2xTgDflstCoSzJr4WDqz9j3U+du/oNqw78UF+Ml7yzs9pE2gbYLxPugPOjHB3io
bckoh9J6kqPea7JEoSzxWgKIKJbwaw==
=HlZE
-----END PGP SIGNATURE-----

--Sig_/3poIhWV55NQEb.HbpWm3hBr--
