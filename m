Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55A981729E8
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2020 22:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729642AbgB0VGa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Feb 2020 16:06:30 -0500
Received: from ozlabs.org ([203.11.71.1]:50943 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726758AbgB0VGa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 27 Feb 2020 16:06:30 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48T4wL59ZBz9sPK;
        Fri, 28 Feb 2020 08:06:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582837587;
        bh=cCJSoF0aXpa3po0AYy6HcuH3uMIGfsycXBnKbAeZioE=;
        h=Date:From:To:Cc:Subject:From;
        b=ruAFg28GMEIXGkGML+ceF3L6cO9FboHxypHJXPls6bC0GYYGy5+wRRSpYK4vTnQWO
         quZEm8EZZ1pXXdlZ98fCe6ouWlz0WHeH4sKM221X5BVAk0JIlKEjdjVWIEE2bZc/L/
         lfVkwmsM9PCNidS5ZCAIrxKzXAfukwzLHUPN39xiX3TXxu+aW1ZeSBM5em+lsucv0w
         EORikL4YQqcCfgWPfQE7URJRooLHjTfkRIH92W30fwClDBgUhWSxLQWzrnEJm4B2Ls
         yiiS6hwZ/Tw54dwWNbYahJ82+vitff7ImfHm6kvU1eGeuInGffCmNmBADuWPSELvAd
         RnexKl11u5uVg==
Date:   Fri, 28 Feb 2020 08:06:12 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: linux-next: Fixes tag needs some work in the v4l-dvb tree
Message-ID: <20200228080612.1858eb8b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Db3Y2lSijK71uzh7RMOEW_Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Db3Y2lSijK71uzh7RMOEW_Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  ab07b1a6ac6e ("media: omap3isp: Prevent enabling CCDC when stopping strea=
ming")

Fixes tag

  Fixes: dd12ed17ce9e ("omap3isp: Don't restart CCDC if we're about to stop=
")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

Also, please keep all the commit message tags together at the end of
the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/Db3Y2lSijK71uzh7RMOEW_Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5YL0QACgkQAVBC80lX
0GwcIgf+PElZgYjvLMGb3mt0nb0Y2qYC6h+VIRjNFnVZuGfFgNsUsvV8Hu6Uc+Ea
6PKR1kCGHpf4CWOIqsj3rYtTQScqh5k9XnCxpO5u71hpE9+fPffEyHzhXmWPd5o5
G29nIWErK8pKDVvv6QR0bnVX5vRPQ1c4k9zJLpbPD9S9M/ve93hmP1tHpy3ryhT7
NAIL2BbqKJHVdtqB/9gUpDNEzUZxsYNcJgI2GUfPV8WsB7fo/OwrEOjSE+/9oY2I
epewAV5CHOq02Znn/tL8B0ccsrbhwJyS4gy+jAacCRLANZ1w/OLGYar6aodc6KwO
p2PfbAGWRAM44CnbAzs0TxAwMPLhJw==
=ULWJ
-----END PGP SIGNATURE-----

--Sig_/Db3Y2lSijK71uzh7RMOEW_Z--
