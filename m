Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFCF321AF71
	for <lists+linux-next@lfdr.de>; Fri, 10 Jul 2020 08:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgGJGcH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jul 2020 02:32:07 -0400
Received: from ozlabs.org ([203.11.71.1]:57529 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725851AbgGJGcH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 10 Jul 2020 02:32:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B339d4SSLz9sRK;
        Fri, 10 Jul 2020 16:32:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594362725;
        bh=Xtnu2Js4JHqvlHJCaEmgieQBI4zzBqVR5vdHQT9r/lE=;
        h=Date:From:To:Cc:Subject:From;
        b=hrYkdm7tzYV7vTaNpLPqV2pIh2eXHvcFdgWnMk857fpgIT2wfzlxkCqGRyv5S+kpD
         0UfUMMBA7/cWG24TJym+Hv+qWu/NJwv90elvdS6wxzXR4u+hBO2NXKPPIoweZXw4/D
         EB0CE2mAP4xAbwn2V2VWGIzzvtzTyrdXbuN832fh8NeKyex0rcxlhZtE0y/pAxnIaY
         UiASSIODSUelZY1ypJEdByf38njPJPZfjOmoIYCidtVpC4dQer6V2r2nGjI53mu1SS
         CX0/LRqf2KPrixIY6R4iONiJEirmJGGsNeLaN3RnRHzzeqhEccZOQ6zlkFCK+Fhyzn
         NoHQQChDPfV4A==
Date:   Fri, 10 Jul 2020 16:32:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the pidfd tree
Message-ID: <20200710163204.651bb496@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/v=rd2xsHZ1ty3PHH4Xfvi1g";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/v=rd2xsHZ1ty3PHH4Xfvi1g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pidfd tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/nsfs.c: In function 'ns_ioctl':
fs/nsfs.c:195:14: warning: unused variable 'pid_struct' [-Wunused-variable]
  195 |  struct pid *pid_struct;
      |              ^~~~~~~~~~
fs/nsfs.c:194:22: warning: unused variable 'child_reaper' [-Wunused-variabl=
e]
  194 |  struct task_struct *child_reaper;
      |                      ^~~~~~~~~~~~

Introduced by commit

  a57927d2dce2 ("nsfs: add NS_GET_INIT_PID ioctl")

--=20
Cheers,
Stephen Rothwell

--Sig_/v=rd2xsHZ1ty3PHH4Xfvi1g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8IC2QACgkQAVBC80lX
0GxZnQf6AxL+KWKouB/4mt0LkvB63J79TwZoYp7ue69pIKjzlyzmSHI8mmpaLzSf
2NtYQpURLU/P3H4nHg5udqYAQHwkX8EeHSsMPFHDrMXSCdReAiQMu1dkAxjuTk0S
np6gBR0A+BbUmOaKgcke8KJkJqP5v3eQ51y42pF5XIce7Haa67gcC3fVEUo20dgv
P9bIJPQJFy+5aI6fQ+iDlQvgfzbdqyZOR0RJBoyBFKniVflw35nuo8kAQ/BvfszM
u+I+0VdC8fwEdcqLe1Pr4hmwcRiiAZjl46XXyzKzRkYQOyUQKaAsmDxk0MLoY5SX
nYnXihs3hEb0FJIt9h5OkgpT1+lRmA==
=2T7r
-----END PGP SIGNATURE-----

--Sig_/v=rd2xsHZ1ty3PHH4Xfvi1g--
