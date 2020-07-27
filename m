Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2859522EC7B
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 14:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728484AbgG0Mqb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 08:46:31 -0400
Received: from ozlabs.org ([203.11.71.1]:34313 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728387AbgG0Mq3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jul 2020 08:46:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFfgl5N6pz9sRW;
        Mon, 27 Jul 2020 22:46:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595853987;
        bh=z9rdvwOF6uXrEEHNg+TarJ4QGqVBruerZKTchw/2sqs=;
        h=Date:From:To:Cc:Subject:From;
        b=Vc60w6ReJvLWCbKWo3jwjNl8hn6/N9Afm3jxW8Er+eOy868pD19jv7wtklNnBvVPg
         qGUp0pGey9Gmwrtk2CYQU8dXRPPT1+k5NB+pcT2JxgHZUzfyNjxn0XxnX3k341esPb
         0SzucaSUWLu60FPYP9r1C0sjNaR91sZItdh8gen77A4TvS8hfKAu2pTC10pJ8eObfi
         95Et2j0nOhGAUfNkKnIM4fOrLf8YXVgAQ4wxbGYd7+3FWvOJ+wSj008dqwUefteFN2
         iK+H7fhiYQ9JOaJqoyhrz/N8mI7tWNinOLWfhvEMa44EDRMl+1izajNZZL3lF2cXGu
         BdD9WYg/mtYug==
Date:   Mon, 27 Jul 2020 22:46:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the akpm tree with the fsinfo tree
Message-ID: <20200727224626.463ffeaf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+n6mSv4+B3O64+e2m+UyXow";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+n6mSv4+B3O64+e2m+UyXow
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The notificiations tree has been rebased to remove a new syscall and
the fsinfo tree rebased on top of that, so the syscall numbers have all
changed again :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/+n6mSv4+B3O64+e2m+UyXow
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8ezKIACgkQAVBC80lX
0GyOPAf+LP3r4a9kb3ESOw+ZN7NEbf59fKgeQ7aWApfy0ohv1uBuwwFaamsagvn0
HLr/fv22tG5ovxMm9Im55mZo/IxnakX7Bhf8fZZ/vxhIcksqCJG38QymDIZ/UffL
8vbIKPwFC4XdGgmf1P3UouxomvT84YKBY7Ci+USB+1l1vkvU7f7BTP4H+fMJj+bE
tlvQs8QTJHiQUwnKslRRUoZuSjT2OsEiImvQgtaL/65yipRRe0LaFJpexh3lSYiS
CYTr8A4GleXxOxuKTvPGd5yODntWBAavbyiZVYCeE4/CJQO8kxUHObZmGhzMBodt
rPfqilgSjoVtq3FMYlzpfXnXspwDqg==
=SgGv
-----END PGP SIGNATURE-----

--Sig_/+n6mSv4+B3O64+e2m+UyXow--
