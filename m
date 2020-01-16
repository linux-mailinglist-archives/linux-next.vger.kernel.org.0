Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76F3613D147
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 01:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729745AbgAPAye (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 19:54:34 -0500
Received: from ozlabs.org ([203.11.71.1]:59709 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726513AbgAPAye (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Jan 2020 19:54:34 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47ym1N2qQfz9s29;
        Thu, 16 Jan 2020 11:54:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579136072;
        bh=o2AsgKsbZJaumBr/M9SV/d5bV1cMc5R+N6/UvFqL6Uk=;
        h=Date:From:To:Cc:Subject:From;
        b=N/4vDNxgYK5Bt7UjF9LobfB4RJPnmb9IMM5Egr0Wnkwr+QjuA8jX2eHOSQWLNNsJW
         aoqCl+gnYt3xlrf9RzBwaFfzl+64RBOChvy3JjL08a7xdxpMuw3pGM2tbGUZMB2AnH
         hewdZGIbT2zx1UtdxD2FRZqTVdB5M4s1/I5CbiAmViLi4egeAyEYnsJ9w2QY5EM305
         oXypxBAjIil+SwZ8mGdvCaH0WqNGRlysEvV12pvKPgMaKb1gYvCihGoZrfTLfsI3Wf
         cPBb0SRvYoptmM8Qwk6emOfGwHOgqhfeCfVE6pZVAUs6T4eUmO6Q+CU9/an8pL+KJa
         BNwKqJWL1xVTw==
Date:   Thu, 16 Jan 2020 11:54:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20200116115430.74ba615a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6E78p7S6u6UVwL4eG94toUk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6E78p7S6u6UVwL4eG94toUk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

fs/io_uring.c: In function '__io_sqe_files_update':
fs/io_uring.c:5567:8: warning: cast to pointer from integer of different si=
ze [-Wint-to-pointer-cast]
 5567 |  fds =3D (__s32 __user *) up->fds;
      |        ^

Introduced by commit

  813668c6099b ("io_uring: avoid ring quiesce for fixed file set unregister=
 and update")

--=20
Cheers,
Stephen Rothwell

--Sig_/6E78p7S6u6UVwL4eG94toUk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4ftEYACgkQAVBC80lX
0GwuTAf/b0DOmOHdXaVbP3DANeiXozWvUht5f/fPmH+Vy31pbIoowrxSWPvaF3zh
DO/HJVMlQk0mCE6VpO5zkKnaE4Gp4CHVcAb2g7SiCZrP2aAIu3/Eenx5b8oSiV7D
tQNv32kkqxOyef4CCQ7UmAZE6Rvrt0vPQVrDsda6va/cHAgBma+i1wiL7Cj9DBPV
whT5RkkCNtv/GPRRy0vA/UNz0zKD+vuUURIvM8SuNVI6qB3TcXtsDPTs/KCfke7n
0yEe+OHN8Jnuhjmya2CM6z2h3hPeOxPHoAvfF+5Am8ciE3w7CZ9uucQj97C4gsIb
akEO0z8xehhEeqpl6LoKt69uac8w2Q==
=lLR6
-----END PGP SIGNATURE-----

--Sig_/6E78p7S6u6UVwL4eG94toUk--
