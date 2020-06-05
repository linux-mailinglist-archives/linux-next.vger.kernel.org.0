Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 438E21EF0EC
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 07:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725986AbgFEFjS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Jun 2020 01:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgFEFjS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Jun 2020 01:39:18 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD068C08C5C2;
        Thu,  4 Jun 2020 22:39:17 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49dWfp0GjNz9sT6;
        Fri,  5 Jun 2020 15:39:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591335554;
        bh=4RauxbUdAK0YHl4mvm9rgTTnRT8N++80Ow48FjZR1xo=;
        h=Date:From:To:Cc:Subject:From;
        b=U7YNV+RzsjnZ2Ixt7ZbYidFN3p31w5isHaYqUH2eYXA2W9h5+BI8IMpMCtXbJTPMU
         kvvcgwD9qL0BWPmwegm1FWCh8Jh9zAQtElkul3blQhQqv7aqcFb6McloZOa4653KH1
         AZM/8AVlTXox/cST2E4Y15QiVL1Xl44qHW6jVuMkm4WykC4/I3Krnghm35kwWdchDs
         cwie0VEu4QXH59IyQePHaYQoDhdNHrCRIm4iwwcK84QrQO5VmQC/tW+vmYd0ejj7s7
         6RiS6mREbFm6RN9Fm99ejVruwY0m6far8aQSrOKJ+mYA/3rrFGMFeQy40dYu4pTzh2
         2h5qpkaLiwVIw==
Date:   Fri, 5 Jun 2020 15:39:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Rich Felker <dalias@libc.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Dmitry Safonov <dima@arista.com>
Subject: linux-next: manual merge of the akpm tree with the sh tree
Message-ID: <20200605153912.5ab9b1ee@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AtfMNk6J_gRpZMDCuw8uc8/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AtfMNk6J_gRpZMDCuw8uc8/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/sh/kernel/process_64.c

between commit:

  37744feebc08 ("sh: remove sh5 support")

from the sh tree and patch:

  "kernel: rename show_stack_loglvl() =3D> show_stack()"

from the akpm tree.

I fixed it up (the former removed the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/AtfMNk6J_gRpZMDCuw8uc8/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Z2oAACgkQAVBC80lX
0GxU1Qf/bwCM5/nho5TAYhIOemWishHjsu/F1wKv4jAp46EwxG6elWjgJn6oxTTL
RlzSsXa7uUey/HxwGH8zOyEPOhcdr1+Go+cWQWIMe/Dv77aHESfAKLza9bhCsbD9
9AVLkyJQyiUN1t904vYJ8yh8QEaYFwlmbAU9K5iE66cGv+7OSxP1Q2nMItS9POcg
BN6btw7s5ptzSppp64ft1opUIwf9LIWeeOHeqKqFcZGHE5oLVxFAcnz5GPiTrBI7
963hG9BkG0R6aeiToKmfy9hhhuYxgLNciCpSMv4Y5pF4MmHchOIn7Ga0QfearOno
jbH4gqrgbMZaMgRMZ2FG99zb4dJ7kQ==
=vqyA
-----END PGP SIGNATURE-----

--Sig_/AtfMNk6J_gRpZMDCuw8uc8/--
