Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41825361854
	for <lists+linux-next@lfdr.de>; Fri, 16 Apr 2021 05:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236523AbhDPDsz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Apr 2021 23:48:55 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34191 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234662AbhDPDsy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Apr 2021 23:48:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FM2Hc3Ggxz9sWK;
        Fri, 16 Apr 2021 13:48:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618544909;
        bh=jcHWWMyjMUodiLSx+/C3LM6HFIlSsRyRg1+sxGF04os=;
        h=Date:From:To:Cc:Subject:From;
        b=uUP2lXsbWCDvQOru9Xx3z1JM5Xu1UL17z3YXo4/EJsSZzs1WImJeEkUr/xXxA+J1g
         ZDUA52ogO03Sa8CxQUsKyWRgUBk6wguYfICXYpR1D3MhSSU2tVr+8ySyQisPioyMzF
         3nRqnJV8MuxB7aEsR/8+201D7TlQkWJtgnn1AmqPUyi7KcimsOVSBVw+wMGezjPwHn
         m81Iphgxj+yqgdvrphg71rcZcb3I1bQjq1F9EEWpLyttpYvZKP2wLREe/1MgyLhjuI
         WCS3k6m1+1f7vMtbXSthuAiS97dWe5Umfqdc5IzMx0Tz6bjUDb80O3Arvdl68yRjZm
         pfUXkGA4eE4Lw==
Date:   Fri, 16 Apr 2021 13:48:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mmc tree
Message-ID: <20210416134827.1f35b1cd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/86kXta5iqx4f+ctm/vsFH2P";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/86kXta5iqx4f+ctm/vsFH2P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mmc tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from drivers/memstick/host/r592.h:13,
                 from drivers/memstick/host/r592.c:21:
drivers/memstick/host/r592.c: In function 'r592_flush_fifo_write':
include/linux/kfifo.h:588:1: warning: ignoring return value of '__kfifo_uin=
t_must_check_helper' declared with attribute 'warn_unused_result' [-Wunused=
-result]
  588 | __kfifo_uint_must_check_helper( \
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  589 | ({ \
      | ~~~~
  590 |  typeof((fifo) + 1) __tmp =3D (fifo); \
      |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  591 |  typeof(__tmp->ptr) __buf =3D (buf); \
      |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  592 |  unsigned long __n =3D (n); \
      |  ~~~~~~~~~~~~~~~~~~~~~~~~~~
  593 |  const size_t __recsize =3D sizeof(*__tmp->rectype); \
      |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  594 |  struct __kfifo *__kfifo =3D &__tmp->kfifo; \
      |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  595 |  (__recsize) ?\
      |  ~~~~~~~~~~~~~~
  596 |  __kfifo_out_r(__kfifo, __buf, __n, __recsize) : \
      |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  597 |  __kfifo_out(__kfifo, __buf, __n); \
      |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  598 | }) \
      | ~~~~
  599 | )
      | ~
drivers/memstick/host/r592.c:367:2: note: in expansion of macro 'kfifo_out'
  367 |  kfifo_out(&dev->pio_fifo, buffer, 4);
      |  ^~~~~~~~~

Caused by commit

  4b00ed3c5072 ("memstick: r592: remove unused variable")

Please check the fixes for "simple, robot reported" warnings :-(
--=20
Cheers,
Stephen Rothwell

--Sig_/86kXta5iqx4f+ctm/vsFH2P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB5CQsACgkQAVBC80lX
0GxQ+wf9ElSbY8Df3AF0ueX/VukqyrRbGBeknXhHGRja57F39ffh2rMfvq168g+O
WFzzOuybZk3bO1x3LkXVEpINe4SbN/CDtCgLQR2YqbMc21huwOtpAvK5yUpwKbK7
Ai7xeaxCkU2vd2jA6LUk2WROOZwniLwRtRM0uT84n6XaFdngWzRVf/B2gjRVQTr4
FBCcXx7tir+BeQK9tC+iIN5LB/XmaQF0Juhz/Q5XJ9fPweM8aYwPlhEF6TEhgIsM
mE5eKlMD6NX9kfdSYhmS0iVpyQhOn17xtboQCohFbeTlC7kQuVetYs2qE0ioJmIa
7lug58EtYSFL9SNlisamyakIqFT56A==
=fpTg
-----END PGP SIGNATURE-----

--Sig_/86kXta5iqx4f+ctm/vsFH2P--
