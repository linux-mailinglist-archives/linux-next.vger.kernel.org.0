Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C225C3410BA
	for <lists+linux-next@lfdr.de>; Fri, 19 Mar 2021 00:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhCRXRQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 19:17:16 -0400
Received: from ozlabs.org ([203.11.71.1]:46451 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230368AbhCRXRA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 Mar 2021 19:17:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F1jbD0mJVz9sVb;
        Fri, 19 Mar 2021 10:16:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616109416;
        bh=u971zd4AL+gjDq8s6KdVmGrQunn+YdaPqDpnjFJmzHk=;
        h=Date:From:To:Cc:Subject:From;
        b=c8LmudIgkaU01EI6JEpIh77a04RIV3TZDGnKQiQd6wvi0/qBGsJqnBti5c7qh5OjZ
         jNeKEiiIJmYQmm+g+OMJqA0kJrhkUAoMHnDD3EmC2rDJ91COBxULiEbuewKxmjiIR+
         GjOV9FNZ+IXEdZf9XrJ7sX6QBJH6KrhOat8XP9A3kd1LxFdiAH/johg8yP8ZOS7m+3
         x6F45r9suRd73/PJxbbJ+tJErnaQyFOZqghXw4Bi4jQ6oXL2ZiV6OMXyj986xYxYtv
         or0lMXjqEfOw7sIhr9fu/2QSh9RObd6Soc+ka/GB7UbPzdzb8O3ny15CRGLgGzbRLZ
         dgisD+jdLRZeQ==
Date:   Fri, 19 Mar 2021 10:16:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Stefan Metzmacher <metze@samba.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the block tree
Message-ID: <20210319101654.638e8e95@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PAhkMnap=lVFA0X8Bhu+UQL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PAhkMnap=lVFA0X8Bhu+UQL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  c2c6c067c050 ("io_uring: remove structures from include/linux/io_uring.h")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/PAhkMnap=lVFA0X8Bhu+UQL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBT32YACgkQAVBC80lX
0GwrSAf/e5iVy/4fJ+dSwLB2Cf2XJQHpQWz2ZqGq/eXLynjLFqRXBirzXjDgfROg
J+xm0MxiPgAwWCM6G2O65QLaLFLlczhgWDa9LxJa8BajwhApFF7FrZ1Ota2bckwp
XfvhAJ1N9DsAgBXAP4qZCcSC0JnTUgY49tOFeaC82xDCL5SSyEe/qw5YNV4zH8Lx
t4KxwFyOcLEtv26nlJ3trxdoQbHHmK9qvPHmb0w5pqL3d784QJOVV+NM/LAU2EL2
nqPgQKu9t90vdswjtcy1+HG6fUiwsOtHTopEtNFxO6fluCfapoXmGI0QpN81pnuF
cLKCULCLQPcZCLUNlD7kJezQZ/f+4g==
=Sf4x
-----END PGP SIGNATURE-----

--Sig_/PAhkMnap=lVFA0X8Bhu+UQL--
