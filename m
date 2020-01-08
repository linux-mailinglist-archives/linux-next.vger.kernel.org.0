Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB5DE133817
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2020 01:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgAHAj6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jan 2020 19:39:58 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41225 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725908AbgAHAj6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Jan 2020 19:39:58 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47sr4B5CnDz9sNx;
        Wed,  8 Jan 2020 11:39:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578443995;
        bh=UqP2S+uX7s1FH3hMKvu9UrcEISewRzcEsGBXCXV15Mw=;
        h=Date:From:To:Cc:Subject:From;
        b=AbXhS6f7U85LPMaY2qsPJAx65wyO92NGFK6dMXYytZiuZR2FJi8twv+2CnlZounUo
         z+fus5xRlnvY8qtpFpsqQhQv1bP4vIKCVab/AfYns2TRTKtDPi3bOGVEF9x3nF+VBa
         V+1CvegRbdA9DY22YW7R7XK1zVXzRfd0PHtnRo134dFQqjCArTZ9UzqHfM8nfYQ9+j
         j1A+qJeghiPZ40aBSAi2SPb7U04Ri230ThbYwD2J5wCC5NGv9mZ4a58OmN0dBmowOY
         4G5wfKO76IsiW9o3xGm1fXChNGeqiMCepj0XrG9jlXPlsMIiYvpWu+HOgsva0fMQv6
         sm7NL0/lPIeMw==
Date:   Wed, 8 Jan 2020 11:39:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qian Cai <cai@lca.pw>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: linux-next: Signed-off-by missing for commit in the random tree
Message-ID: <20200108113953.1a92a90f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9bgOCz9fDY3CIjJ0cQIqU9w";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9bgOCz9fDY3CIjJ0cQIqU9w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  1b710b1b10ef ("char/random: silence a lockdep splat with printk()")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/9bgOCz9fDY3CIjJ0cQIqU9w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4VJNkACgkQAVBC80lX
0Gw/3Af/SZkIzwMzlsUwOI+Ij7fmZIj2JhrBU30FQ28lV0TDVYQ/mrZL73DDYY+H
RqDcULVWHPYYkgWzLBqgHe1hve/36zopxG2YpAtqq6fQC7/QfdeufbdVEfJPZAZi
dLcke4kKsbjl6pWAHtcQ0BpongZjIAho6ohoX3FXgITK33BQdCBKWmq0wlIltedT
Ur0TbJxuNqSjTfHTX3108Nmkbs8QLJBquJoTBtd9EqWXdN8aystRA8zI05hmtUPd
m0A5ynG8iuJXFmqgUdUBsCpy+lcO6QAnQvEohw1NdszJnceFokK/nBOvP+BjZly9
Hur+gHE1om1FrT1CxnTcNqmIC6B9aQ==
=luKf
-----END PGP SIGNATURE-----

--Sig_/9bgOCz9fDY3CIjJ0cQIqU9w--
