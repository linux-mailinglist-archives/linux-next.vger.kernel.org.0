Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B114180BE2
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 23:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgCJWxZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 18:53:25 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60615 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbgCJWxZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Mar 2020 18:53:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48cVk85wz1z9sPk;
        Wed, 11 Mar 2020 09:53:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583880802;
        bh=g6vsLSm6vNqjAHk5KAxmWZHtD6MTaTjFLSOCVDR8U7A=;
        h=Date:From:To:Cc:Subject:From;
        b=JoaMGEoUoBgLqAdhh2RVJPeM+4p9Pz2OcW6KCXrwBmCHhO50kYmQW5i2MyR6dD3ap
         Bjdl4ME8TGFC1lEgx8SaBM3h39XegOKN7oGmg+RL7Zfe6gblg2Ld4Zk4aPLGcdPyOV
         IuYHrRWewhbVLsLEJfVFpSiX/WpMJybVi6P6F+aZhqUgSl9nGGIkipJxhA3xxLTfW2
         WQZ4p5zP719iroNIRSHFcPhzcp+pklSCso1GPqqxNCjwUJFMYvonGpO3tHzXYv/OPr
         wRLNxPChRkqcr3WhcIJCs6+YxVa/jUnGesJNWpsOiKDKUaryMqaIiOnKmdlrhdyJb/
         scY6vNwPaR8iQ==
Date:   Wed, 11 Mar 2020 09:53:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>
Subject: linux-next: build failure after merge of the kbuild tree
Message-ID: <20200311095319.30e14ac0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//_6B_0x6FnHdUfJeDpNzuf3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//_6B_0x6FnHdUfJeDpNzuf3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kbuild tree, today's linux-next build (x86_64
allmodconfig) failed like this:

x86_64-linux-gnu-ld: net/core/devlink.o: in function `devlink_trap_report':
(.text+0x4e7e): undefined reference to `net_dm_hw_report'

Caused by commit

  af20db858358 ("kconfig: allow symbols implied by y to become m")

At least, reverting that commit (and commit

  d590d0a6e6fe ("kconfig: make 'imply' obey the direct dependency"))

allows the build to work.

Advice, please.  Does someone need to audit all the uses of "imply"?

--=20
Cheers,
Stephen Rothwell

--Sig_//_6B_0x6FnHdUfJeDpNzuf3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5oGl8ACgkQAVBC80lX
0GwzhAf/XWHJV7/cPQSTTmMnNT+e6bN9XecDml8w9PtMbcay1zq1HjYn9yar2ZvA
+jG0JADMMQJ9VGAE5stOKu6oMzxaUXNBKzgwLSS5OivHicc7u7SNw3w8iWqH9Gno
dVzBo6VBUCyiD5/7XOQR9IqvOGusz1noRr6GHNjlEpYvDUycLVboYcLHhESyTzFp
QjhVuTCjVN7lf2G1fzKKg5HzicIeRzGuF67CgQj2eJ/Ze3uD4qv3tPiMKU3/sbmn
3VFnXJkHgRlfdPU4k/Mm5CKhUxY0syVOVi6L6Oe0EHanzJ8T18tuKEIB/SImtgy7
h5WAeqtwRitnDRR720BdxUp4NHAToQ==
=ppUr
-----END PGP SIGNATURE-----

--Sig_//_6B_0x6FnHdUfJeDpNzuf3--
