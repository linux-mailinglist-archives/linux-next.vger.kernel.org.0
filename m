Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC8E1A2BA7
	for <lists+linux-next@lfdr.de>; Wed,  8 Apr 2020 23:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgDHV7F (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Apr 2020 17:59:05 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36183 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726641AbgDHV7F (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Apr 2020 17:59:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48yJ864Fskz9sPF;
        Thu,  9 Apr 2020 07:59:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586383142;
        bh=KEfK7cT74X4cTX3x7Sy5P3vUHHH3xwN8+QeX6pWnN9U=;
        h=Date:From:To:Cc:Subject:From;
        b=TqEI5RZHLmT1covStEAncTNL9J5vzz7U/U1QoT4kSoHYRclknNYoMNtnJWLDzYy+t
         cApfWrf1nh6cL9Y1Vl4lxoC3wfk+TvulwYgriVxbga0lwbvMdT2GvFdLfYm8h4S8Qy
         esb/D7CxJ6H78R9xUTszaDNcCPDqvENXuUpAKm1TS9B+olDs4wbZbhW5FD6cyOoGpX
         /K65L6qKESuzodwAkxwxJjIpbS45CAXADXwV66CCx0PoRx+rEOeA2CVm1BM0ggAMGv
         LA6mp3Zo6T6sc3rkfXPbvYEwSnqdKtv7ABDjtmAG5bVuyMmOUmJGtCHkoXdfjum8Af
         w+92+QLcFnZQw==
Date:   Thu, 9 Apr 2020 07:59:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: Signed-off-by missing for commit in the block tree
Message-ID: <20200409075901.7d01e866@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r8MWKF8PQTYdOwHumfoTpHt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/r8MWKF8PQTYdOwHumfoTpHt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  d038dd815fc5 ("nvmet-fc: fix typo in comment")

is missing a Signed-off-by from its committer.

(Yeah, I know its a trivial patch)
--=20
Cheers,
Stephen Rothwell

--Sig_/r8MWKF8PQTYdOwHumfoTpHt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6OSSUACgkQAVBC80lX
0Gy4+gf/eskLDqcGnDkzvn+SwOEpAczZFop/fAOeBb5diZQ7yLBJvVfcqbSfo858
m2m8tL4ETTgl27fwWkSw4OcxH0MYyQwQ2zCtVG9gY6g9xy9IXObMXGRB3saxAWPA
AOWvUVByTkKL60fdHo3XQbjCmM3Qjz8f6ihotdeMUOaKO4avN0GkH+3MuODAzg0i
5/EYkLZUwEZPiYaY6eB9fWPBp3M/B8yyS9IWmuwurZVtpgRZyXCjoa7Bi7/gP275
r07A/NljolGPIokl0k0I3NDLZdq1r3yAVgBiWDM+4MBxHIuAoQxTevqg6x/nuqCv
ouNOI0LO45MzaCOFfYAtyJ1R3Cnaew==
=mwxf
-----END PGP SIGNATURE-----

--Sig_/r8MWKF8PQTYdOwHumfoTpHt--
