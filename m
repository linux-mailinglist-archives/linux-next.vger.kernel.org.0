Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01589130D6B
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 07:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgAFGLh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 01:11:37 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:51293 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726338AbgAFGLh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jan 2020 01:11:37 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47rlWn3H0Jz9sNH;
        Mon,  6 Jan 2020 17:11:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578291093;
        bh=g1lxT9MP3tRk2ER/rIv4sQzhF+Oe/yU/AhgkuOEza/M=;
        h=Date:From:To:Cc:Subject:From;
        b=feNEIxODwdjxNueoztd1FyhGRfDcE+0B9SuDmtvbVnL37kvBpHudFMBcqKHvtyZRS
         7MGgOZxncW+iNSDZEm8IuGQ1xO6g3Ksz9vQOHl37hNlCvj1p6hA3AQuNK+KNdhve7r
         HS7/k07ZY7oX5wb/2wAHjEDW/Ojz+GDZ9Q1n+vipSJx9L/0Uq2ebR3uFi9W/Q4oekX
         6vBmCyVA05lC+ci8ThCpJkQbxaG9u1lIUbM2xZoWq9g7TAzTUPjbHNX13DOtIT36xx
         OxjEFvawxWCRjW+27iCIA2gZuTcy9SbEeggpwZ9wvmjuqXMonow9+beW442yuINdPK
         3f70sxVmpZlTw==
Date:   Mon, 6 Jan 2020 17:11:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steven Price <steven.price@arm.com>
Subject: linux-next: build warning after merge of the akpm tree
Message-ID: <20200106171132.73af561e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Wfw+rs46=LnQC+rsEH7L91p";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Wfw+rs46=LnQC+rsEH7L91p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

mm/hmm.c: In function 'hmm_vma_walk_pud':
mm/hmm.c:478:9: warning: unused variable 'pmdp' [-Wunused-variable]
  478 |  pmd_t *pmdp;
      |         ^~~~
mm/hmm.c:477:30: warning: unused variable 'next' [-Wunused-variable]
  477 |  unsigned long addr =3D start, next;
      |                              ^~~~

Introduced by commit

  cc53bfffefc3 ("mm: pagewalk: add p4d_entry() and pgd_entry()")

--=20
Cheers,
Stephen Rothwell

--Sig_/Wfw+rs46=LnQC+rsEH7L91p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4Sz5QACgkQAVBC80lX
0Gxw8gf+J6WYlUBhz93Q5nVdibLsn+HjdSOiUOJ2GYqY59gCrIkdA8TsT9C772EJ
hKg5PLua9g4OxiAsNOHWO7oD3/TN9wuolRKRAmltY3doi1NskmR5onvIbIHlNmOS
1dKJru+EyU1DSM3dQc8nAxh3fBnejv6on+ueZmbXqSis0TeQ1H28aYZ6a/aLQvqu
uH9vagY3qY4PrrQXuNVY5IXmnnYE8qKvfLYcq017P81XMm5Zuo6VnHaxiP50+RHL
ZUXB3TR05RO0UdXu7KbxIJ5/5AJN4baaJZS5lkYWU7SA2otFpJN2UZBdkW3hk1bU
c5GmJHKercVrLmFmSWk51U9/OK2QHA==
=RkSG
-----END PGP SIGNATURE-----

--Sig_/Wfw+rs46=LnQC+rsEH7L91p--
