Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 845E29C897
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 07:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfHZFIi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 01:08:38 -0400
Received: from ozlabs.org ([203.11.71.1]:43785 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727369AbfHZFIi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Aug 2019 01:08:38 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46H0QW1KcRz9sN1;
        Mon, 26 Aug 2019 15:08:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566796115;
        bh=uUIqc3Zz8Z8NdpBlRtordG87XAPX2Kxsg2y3MOaBOdg=;
        h=Date:From:To:Cc:Subject:From;
        b=HH3tj1N7cK8gW3MVU9CnUy5LWJE/Crlys9TemocIyu/+Y+T/ZuNjVRfolvhHhTnfZ
         H7BVqcF7vTIwHAprgTSMqihZG1Ur7NYBL5XUCUdpy5lLVFQT1GiVY6r7TbPEpWuUhE
         2YnBwvo1k3jpL1PhceVXXpTKTqzhAd2c6y4Q3jpb0wwPATYbGYJVZ/sPCpJ+5aAyuU
         3FTOdvjia4+uCyzPdquRJYKZz1ra+GOdZP6TATGwgLJUuK2Vfv7KE9F2YqWponsGNY
         mWNp+agjeLunoc2Mxx1P/4wt403qsv/UrMtYggF2dZZ4CntaGed99AqnaclmUSlmL6
         3O8YxWgFSvUHw==
Date:   Mon, 26 Aug 2019 15:08:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>
Subject: linux-next: manual merge of the clockevents tree with the tip tree
Message-ID: <20190826150833.2ef7d3ad@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XRG0fd/89kK7Wo4DmDd6f59";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XRG0fd/89kK7Wo4DmDd6f59
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the clockevents tree got a conflict in:

  kernel/time/posix-timers.c

between commits:

  ec8f954a40da ("posix-timers: Use a callback for cancel synchronization on=
 PREEMPT_RT")
  0bee3b601b77 ("hrtimer: Improve comments on handling priority inversion a=
gainst softirq kthread")

from the tip tree and commit:

  08a3c192c93f ("posix-timers: Prepare for PREEMPT_RT")

from the clockevents tree.

I fixed it up (I just used the tip tree version) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/XRG0fd/89kK7Wo4DmDd6f59
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1jaVEACgkQAVBC80lX
0Gx8Ugf+I+A0ANkpQtWTS/J185uKi74fmGSiHq17NBHnRN2yv5bNXlq+5Jyo14Ah
pw/5mLylc2Sy1SweJcOFiohHDQUymwJLyMTm1RT0JbhS+N69H99w68RJOkvj8Z7h
vJKOFPFCMIMyuUMzp9k9C27Txojb1kHcuUMPuk/51wfQkcUHlYhxaam4s7gcUlFL
6MXNR3wpatbePqeWHLQs8XeCueHKcKOTOVTjPP1+JriX0QCbIRf5wklK6KXgHxxL
qrqR6wO0HG7YMxLCx1BJDJdBiWaO0ARQk0tCJ6jAnbUSvFeM1/idnh5DvlhxSxLJ
KqCl+0DX2AphbVEG7CRqvqtWZQPbiw==
=saYn
-----END PGP SIGNATURE-----

--Sig_/XRG0fd/89kK7Wo4DmDd6f59--
