Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53307202ADA
	for <lists+linux-next@lfdr.de>; Sun, 21 Jun 2020 15:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729774AbgFUNs4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Jun 2020 09:48:56 -0400
Received: from ozlabs.org ([203.11.71.1]:49559 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729649AbgFUNs4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Jun 2020 09:48:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49qYmP5wf9z9sSJ;
        Sun, 21 Jun 2020 23:48:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592747334;
        bh=Mib6ItJPMHTK83INMb8+UV7/5h18enMN1HYjADfnHaI=;
        h=Date:From:To:Cc:Subject:From;
        b=iHxsXjval0IIEKmOvQB/w9eLozT/EfPH5y6kGqa/sQbk3paLfDW65c9zU7y0/EME+
         DrL5aVhZIuNwPdYgKCLGWCrp94PgKRKAatDs9uP6JYJstLij3AViDEHhMYryP1IeNb
         ejsCwJXfZ5fUkWYROBFUEP3e27iFlRE50k8Ng+cEu834N6FTPZ+g5UbI9sjBbgoEth
         FNNdwGYT+w27NlG3o4/xHaLD41B1NC4zsoLUGvzCASM+2ULx8yXAZ8F12YdBoAkQSy
         lmQQNW+rYiw3rN8jswZD0QHtr9DXvV1lbmVwqp8VyAE2I1indKmCPCkr0KKLBTNVXV
         aw6cfHNVPQbpw==
Date:   Sun, 21 Jun 2020 23:48:51 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sargun Dhillon <sargun@sargun.me>
Subject: linux-next: build failure after merge of the kspp tree
Message-ID: <20200621234851.64cf82c7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yZCEJbQ/l9nTnvmw6tYsHo8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yZCEJbQ/l9nTnvmw6tYsHo8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp tree, today's linux-next build (x86_64 allnoconfig)
failed like this:

x86_64-linux-gnu-ld: fs/file.o: in function `__fd_install_received':
file.c:(.text+0x1010): undefined reference to `sock_from_file'
x86_64-linux-gnu-ld: file.c:(.text+0x104a): undefined reference to `sock_fr=
om_file'

Caused by commit

  d3868eea5cbc ("fs: Move __scm_install_fd() to __fd_install_received()")

I reverted these commits for today (from the breaking commit to the end
of the branch):

b29bb87cbb0a selftests/seccomp: Test SECCOMP_IOCTL_NOTIF_ADDFD
af35c3c6a9a5 seccomp: Introduce addfd ioctl to seccomp user notifier
50ca89d3a4fb fs: Expand __fd_install_received() to accept fd
f533d1758f02 pidfd: Replace open-coded partial fd_install_received()
4ab6bcc3ad3b fs: Add fd_install_received() wrapper for __fd_install_receive=
d()
d3868eea5cbc fs: Move __scm_install_fd() to __fd_install_received()

--=20
Cheers,
Stephen Rothwell

--Sig_/yZCEJbQ/l9nTnvmw6tYsHo8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7vZUMACgkQAVBC80lX
0GzTiAgAi9z+e6FFcNzXpk2NTeqOa2oZ8ZuxujlzqAYbu23+J9ofzbsEX+L8EaFh
xP5j8euVLbcxfVHxTak/Co29zK40O+C+6ANWGTDrF9Yuqj0XyjRQ0akMrZebed1+
Kfyt8c7Fp8lFC3WJPDamgtzbzaBsILLM397OF6Ku0P1Kx5E8Mi8NO/Fb6e+wAznb
GOVJRvg2aFclsVEFGkLnLU2S+kDeqvpdrpX3a9//+/RqzV9k4kpLG12OD1jgRABs
iOgZarh6izCjVsMjc9nra9KSAWyXSZd5EhpN1qHGFpFlMcefMPNqmF7LTyiEQ71w
f/PpOhJKUMTWtCxGr/lU0j+fJfMnEQ==
=ibj0
-----END PGP SIGNATURE-----

--Sig_/yZCEJbQ/l9nTnvmw6tYsHo8--
