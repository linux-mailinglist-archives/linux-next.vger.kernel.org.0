Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8513AF0F55
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2019 07:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729687AbfKFGzD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Nov 2019 01:55:03 -0500
Received: from ozlabs.org ([203.11.71.1]:34527 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729278AbfKFGzC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Nov 2019 01:55:02 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 477HN33N5rz9sP6;
        Wed,  6 Nov 2019 17:54:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573023300;
        bh=+ca69yklGxVDq5u/XqTTPDhj0GQN4B5UGmaF7EImZOA=;
        h=Date:From:To:Cc:Subject:From;
        b=nl4VnswyiB4YljQsTnk5ryd5P6oULhlkcO3bIDmnmRxtLu4ntqvmBvzP2Y0YdqA+m
         c0XIfKpCgiAnwHV2tJYvdFkD5caVgrT+Tr+S89XjQhNNRkCeB2BZretUqCPAu9f9Nt
         +G0cSA+l/GL4If4uyk9aroXC+7YHVfga63qt1C+CPMaMTCv86OAJOrECQZtJX/1zRc
         Nk6muMzbf/Hzn3Gw6p63GKfQjZksSEUU5OEabKH5WUTM+GxVEE0VZRvYOZpu7f5Ne8
         NZlBSyfR1pZN3fmhc7h21kzquaJLDLSZPnQmpgwc4emWD2Z6TXYRKwT+dqZawIoPbm
         vG4S2pDL0jRqQ==
Date:   Wed, 6 Nov 2019 17:54:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20191106175451.6bf0ab50@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SkBjReTnFJYaVZKmoRU2.5F";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SkBjReTnFJYaVZKmoRU2.5F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

lib/vsprintf.c: In function 'ptr_to_hashval':
lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variable]
  766 |  const char *str =3D sizeof(ptr) =3D=3D 8 ? "(____ptrval____)" : "(=
ptrval)";
      |              ^~~

Introduced by commit

  aea87b9b95b9 ("rss_stat: add support to detect RSS updates of external mm=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/SkBjReTnFJYaVZKmoRU2.5F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3CbjsACgkQAVBC80lX
0GwkyggAoFElSZZOFnjG/neWy6n1lKUtzTh9rT6HOWGZlaKL02sqZZzqCFTQ/1rz
jFdzFt7iZEo+kw9cb4vwRibMYfzOTaAkBLbh3YwwB8Tk9wSMHnREOdQoQuv3R52p
8QbAIlKGGqmbTUYtfJcrSFYNSewSU1R5VAtSROXh3CfNcF6X5Fhn4xsygQwVdxFz
+G5k5gNqbBIh8iltAPMSNRDJK4+/65LOeEX97cNrxKE8Mq9Fg/PIVCNcJf0uSNeE
MP0VqT4THpkbS+B1uHCRKpylRjzlil5nRL9ZA0ZRuizth7ojFB4QeJhbnQZqjq+R
S6cjja877prPlFEfZFHtc+Vb7scglg==
=8pmB
-----END PGP SIGNATURE-----

--Sig_/SkBjReTnFJYaVZKmoRU2.5F--
