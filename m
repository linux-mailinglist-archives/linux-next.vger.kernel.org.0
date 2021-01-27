Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85CC63058E2
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 11:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236099AbhA0KzS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 05:55:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235686AbhA0Kv5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Jan 2021 05:51:57 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBBD8C061574;
        Wed, 27 Jan 2021 02:51:16 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQgPm2Th2z9sW8;
        Wed, 27 Jan 2021 21:51:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611744672;
        bh=+ywgQaolNGmukL2yQG2H6B9aEm+Pg307wOCZdG8iSEQ=;
        h=Date:From:To:Cc:Subject:From;
        b=moDW0+gCCoXumcOxp5kHVOGZGkMp2OVYzDGJsm+kjcAXfUBFJ/Df4CK+7G/bgJKh6
         yocU8MZkB0YU+4bz4IFfoCGnqlU6EEDJsseEdkZsQWC3TasLXJQNgkLtUYRVgyJWmU
         bWMAAN14bZs8gMN6OHDXdw1QqHd6SP8sXNcD9EwTe7xCOESkW9S/nwJFc7NIkY88rJ
         6ZskwoSjW48hGofvLjjIvkOJjyMo8LK01DpBnbT+WsQ6NcoEP9bkSVk6dkK7zcPdfd
         IVI90oKixxj8GV0zXSBiGLXKX0BeqSI5X/51CvHDZNTZK9DT1occEULoDutmTIhPmB
         qhYj0HInrBSSA==
Date:   Wed, 27 Jan 2021 21:51:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the notifications tree with the pidfd
 tree
Message-ID: <20210127215101.2ed0a5ae@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7lB.CR0BkTb=8zo84RCIP_X";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7lB.CR0BkTb=8zo84RCIP_X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the notifications tree got conflicts in:

  arch/alpha/kernel/syscalls/syscall.tbl
  arch/arm/tools/syscall.tbl
  arch/arm64/include/asm/unistd32.h
  arch/ia64/kernel/syscalls/syscall.tbl
  arch/m68k/kernel/syscalls/syscall.tbl
  arch/microblaze/kernel/syscalls/syscall.tbl
  arch/mips/kernel/syscalls/syscall_n32.tbl
  arch/mips/kernel/syscalls/syscall_n64.tbl
  arch/mips/kernel/syscalls/syscall_o32.tbl
  arch/parisc/kernel/syscalls/syscall.tbl
  arch/powerpc/kernel/syscalls/syscall.tbl
  arch/s390/kernel/syscalls/syscall.tbl
  arch/sh/kernel/syscalls/syscall.tbl
  arch/sparc/kernel/syscalls/syscall.tbl
  arch/x86/entry/syscalls/syscall_32.tbl
  arch/x86/entry/syscalls/syscall_64.tbl
  arch/xtensa/kernel/syscalls/syscall.tbl
  fs/namespace.c
  include/uapi/asm-generic/unistd.h

between various commits from the pidfd tree and commit:

  0358d747f97b ("watch_queue: Implement mount topology and attribute change=
 notifications")

from the notifications tree.

Its too late at night, so I dropped the notifications tree for today
and will try to work it out tomorrow, sorry.

--=20
Cheers,
Stephen Rothwell

--Sig_/7lB.CR0BkTb=8zo84RCIP_X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmARRZUACgkQAVBC80lX
0GxrEwf/ctbBWpn7mU5k9aY30WJPdQLT89YRob8pnoW3k9gpbuBpB+FHsBYYlWzN
9U6HLrg8Ia3s5x+VZuMySmRS9cdbNMBdKEnTk0gVeNbPIZtDqObHrNDlDdmjQnHm
2r3St2mD3HTUtLaVHMO842E+5YhJ3SK0f6oe1BbsJXzu0jWsV/Lw38GbCcF9jYk7
XAHnfmKByS3pnL5Uos5Wx4jKCXC7tTwcEPuAumVpSsFt4oY7y87+ntRCkgcvxJUc
UkYxPA+A8A1wqBnOHAbwOK0PyWddg4JisSHAXzLoKj7gKGifj90GgcTenqG/H4Gt
G7K9jpodbQuRsGWBxED4gpbBCK3xxw==
=9Tps
-----END PGP SIGNATURE-----

--Sig_/7lB.CR0BkTb=8zo84RCIP_X--
