Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17DA81972A4
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 04:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728986AbgC3Crx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Mar 2020 22:47:53 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60025 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728107AbgC3Crx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 29 Mar 2020 22:47:53 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48rH1w57kRz9sP7;
        Mon, 30 Mar 2020 13:47:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585536471;
        bh=TpOtppbvh+jJ2NBvS6oKrocdp2Nf+tIqBhNtWvXHShk=;
        h=Date:From:To:Cc:Subject:From;
        b=uKub5kxICoX7nJM5GS/o+6ko+VIoGaIjknT1Dyo8qxMhayvg8z5itOjoIKfixxqIy
         HtQJRKDJcq98x/AmuFmHrIvpy+zq1rKH+RWuvwfSU4NHQanv9gckgaxzO5+ntPzYwm
         CZ4UrqYKLBeOEe0MeXWAgdiZajZCm/D+VUjHAzk/Wi/4PHQXrW2lGSW7yqGtt9qG4t
         qjJUoLQyCWmdK+ohZ6VclXX5xvFSy6kAaHibjca1/g9sJtK2GqclVMIuNwpug2q0JW
         nOWZHeojOX3JsWNmCdDm0i3fRa/07/kOLo7PVoy8wM2hO7XM/pXPZ+joYL1q1RPFTE
         vh6skdQblrRYw==
Date:   Mon, 30 Mar 2020 13:47:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20200330134746.627dcd93@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sIw9aPF8nvbDOH+4m/ixmWo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sIw9aPF8nvbDOH+4m/ixmWo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

kernel/futex.c: In function 'do_futex':
kernel/futex.c:1676:17: warning: 'oldval' may be used uninitialized in this=
 function [-Wmaybe-uninitialized]
 1676 |   return oldval =3D=3D cmparg;
      |          ~~~~~~~^~~~~~~~~
kernel/futex.c:1652:6: note: 'oldval' was declared here
 1652 |  int oldval, ret;
      |      ^~~~~~

Introduced by commit

  a08971e9488d ("futex: arch_futex_atomic_op_inuser() calling conventions c=
hange")

but I don't see how it makes this difference :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/sIw9aPF8nvbDOH+4m/ixmWo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6BXdIACgkQAVBC80lX
0Gze+Qf9F3jIksLj9UXDmiG0zldeWFHHplCXapObvVeul2IgnB6/xpaqMxWti6Bv
l+to6I0eKop0gNJ2PiNxIC1v6rXElOWreh4xmmxMx1VUTunr7weqaWqBvQx7ytDq
l3nIrnq4BE4tTYLdch6UsCRmzo2damqh3W4XBJJkosN6ZTsKHW1l6Qz32P4ihfuB
Dwvg65srVGN4b8wuTocqoRWn6ebkuU0E8Az1A7F5HAPtjaMTbRLQaHL+6zIHXi6L
aPbb5QF9px7VpJan3AHYOcnCQPtGaDCk4U0ml1Rl2eigRhiU5HjrUYSgTCl+MNvN
dyvk4lWnwuo0DSAbEpP2VWn6iT9msQ==
=n4Yi
-----END PGP SIGNATURE-----

--Sig_/sIw9aPF8nvbDOH+4m/ixmWo--
