Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6B833AE2EF
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 07:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbhFUGAI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 02:00:08 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34217 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229487AbhFUGAI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Jun 2021 02:00:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G7f2T0X8Rz9s5R;
        Mon, 21 Jun 2021 15:57:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624255073;
        bh=XAAlCtxXaOdllDV4KH3BYVc1MbMs7iiZiVLY98G6+kg=;
        h=Date:From:To:Cc:Subject:From;
        b=LEGSdRkGjlrll6rxr48JY64kEEP6Gz73eHJ4rg5C255pXHxPtl6dDMgS7pAoDRCrP
         4mnydIcQ1WcgealXfF8ztND39yKRnvs+ud5lhFEubF45jGytDLrsx5JEpWT9Unr2He
         nBlkyf4lSQWZkxbVKeViuDJstIcAFySM12pnSl4JOr4ewlYMa00df8NvfL7tiuIdUK
         yCTX9xSqApJokmtghOdCBztu0Z4Cq+JxzAhWkJKKXVBwJwf/BminV2Qq+hhGHS13Hw
         LyihGYPqujhXUAqp/9d2KttH5TVnYJHUS0+ZEv23DqiPnGUWj8z8TDrwQzUi2z2ITY
         ziaDS7suHtcHQ==
Date:   Mon, 21 Jun 2021 15:57:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jassi Brar <jaswinder.singh@linaro.org>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mailbox tree
Message-ID: <20210621155752.28d0524a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zNL.RwFBlvS/2Te4LeyM7yV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zNL.RwFBlvS/2Te4LeyM7yV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mailbox tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from drivers/mailbox/mailbox-mpfs.c:19:
include/soc/microchip/mpfs.h:43:12: warning: 'mpfs_blocking_transaction' de=
fined but not used [-Wunused-function]
   43 | static int mpfs_blocking_transaction(struct mpfs_sys_controller *mp=
fs_client, void *msg,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  de5473936808 ("mbox: add polarfire soc system controller mailbox")

--=20
Cheers,
Stephen Rothwell

--Sig_/zNL.RwFBlvS/2Te4LeyM7yV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDQKmAACgkQAVBC80lX
0GynQQf/UghQ/kNknnGGvf1i6PAKwPFpQfX7sxIpiIcwoUZjaDmwjyZTwatvjdju
ij2Nyfkk+l3XQKpuBl4JEEnoCDO5R12pfmaDip0qJ5KAaNZIG6zNap328gXyB8Lt
YB8+3CWa68YZzf4c7TMfui7hHf/ZJthks8PxujvTZS2sHj3duJxOjms9XQA5WX+U
CslsROh4J6CvH+jObrsETIniSPACm7EddHIY3Ug69qRyfuT/Ni06upoWbBTU2fiY
XRaZRIiu4xtrmCgIqIRUvRNlPXygYARYjjVrTF0OzJiXnYG+Tk534ALyp5O/7ee+
N5Wqen/oxchgSYfGuZvjev0VQVhVkQ==
=ki1A
-----END PGP SIGNATURE-----

--Sig_/zNL.RwFBlvS/2Te4LeyM7yV--
