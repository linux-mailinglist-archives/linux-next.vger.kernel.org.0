Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6D1159D1E
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2020 00:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbgBKXXN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Feb 2020 18:23:13 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44349 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727817AbgBKXXN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 11 Feb 2020 18:23:13 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48HJjV74lvz9sP7;
        Wed, 12 Feb 2020 10:23:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581463391;
        bh=bRFdwr1yIJuc3EcV6OsD8j33boY4/PcXu5Y4KzG6ok4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XU25pqpYaUos07ZmrbUdYJgzuaQgziYVXOvmCBlgYzvnFn1Ojtf4ZRIJitFKSaa9C
         Kqf3ZGQXRnngittXhqJkJCzpgDRcJZQKS+l3q/gFXETkskk0E7UglthdONFXutpTrr
         WHDIaho/iIIl+lCdALlkEY/jhqItLQgO1XpXLp4Mole7TRSfGO/R35TfsHjHBP10RS
         R1RsW2xCCvfL9RMtsQG/Mb9zx2JWOg1IZ1lEU/fmA3pWAdMIC11wd8jaCxVtrs5Yul
         XGZD4DpsuuCn8k5a9xhjhjglvdr2rYQR68IaZiAlD5K7CFhkqhqBE0HB8Gv2BsKWi5
         yPXmFEFD6y6Kg==
Date:   Wed, 12 Feb 2020 10:23:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the keys tree
Message-ID: <20200212102309.61c3fa7e@canb.auug.org.au>
In-Reply-To: <20200210100743.7a6a0116@canb.auug.org.au>
References: <20200210100555.7497d69b@canb.auug.org.au>
        <20200210100743.7a6a0116@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E/cTBMWLd7RjEmxLl0rLyEw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/E/cTBMWLd7RjEmxLl0rLyEw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 10 Feb 2020 10:07:43 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 10 Feb 2020 10:05:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the keys tree, today's linux-next build (x86_64
> > allmodconfig) failed like this: =20
>=20
> kernel/watch_queue.c: In function 'post_one_notification':
> kernel/watch_queue.c:89:21: error: 'struct pipe_inode_info' has no member=
 named 'wait'
>    89 |  spin_lock_irq(&pipe->wait.lock);
>       |                     ^~
> kernel/watch_queue.c:122:24: error: 'struct pipe_inode_info' has no membe=
r named 'wait'
>   122 |   spin_unlock_irq(&pipe->wait.lock);
>       |                        ^~
> In file included from include/linux/mmzone.h:10,
>                  from include/linux/gfp.h:6,
>                  from include/linux/umh.h:4,
>                  from include/linux/kmod.h:9,
>                  from include/linux/module.h:16,
>                  from kernel/watch_queue.c:11:
> kernel/watch_queue.c:125:46: error: 'struct pipe_inode_info' has no membe=
r named 'wait'
>   125 |  wake_up_interruptible_sync_poll_locked(&pipe->wait, EPOLLIN | EP=
OLLRDNORM);
>       |                                              ^~
> include/linux/wait.h:234:29: note: in definition of macro 'wake_up_interr=
uptible_sync_poll_locked'
>   234 |  __wake_up_locked_sync_key((x), TASK_INTERRUPTIBLE, poll_to_key(m=
))
>       |                             ^
> kernel/watch_queue.c:129:23: error: 'struct pipe_inode_info' has no membe=
r named 'wait'
>   129 |  spin_unlock_irq(&pipe->wait.lock);
>       |                       ^~
>=20
> > Caused by commit(s) in the keys tree interacting with commit
> >=20
> >   0ddad21d3e99 ("pipe: use exclusive waits when reading or writing")
> >=20
> > from Linus' tree.
> >=20
> > Given that I haven't seen a pull request for the keys tree yet, it seems
> > that this work will not be in v5.6, so I have just dropped the keys tree
> > for today. =20

=46rom today, I have just disabled CONFIG_WATCH_QUEUE instead of dropping
the keys tree completely.  Please let me know when it has been fixed up
in case I don't notice.

--=20
Cheers,
Stephen Rothwell

--Sig_/E/cTBMWLd7RjEmxLl0rLyEw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5DN10ACgkQAVBC80lX
0GycMwgAgx3N4wiuk/navM0aVqqNQPa1vV00JX25nr4b1TM8QTustgKk3z8miXGP
xiRd9t940N5uhQxhrJZDHL/sss5gViRfjlZ6g+wWSC7vRJ5R/LCW4glddExZTVmc
jW6/BdoG15cTaVjAiS/E/0GtSy3toiTMdxtK8y/PTng8m0bXg3MX+nvYPs9Rk4Ba
kAw3l6BRE83nL9+m4Tk12fsUH+aacl5IMZ4gBMDieoY3o7muTaUqCo8JvRCm11/x
qpXohFPbF5ejkxslLFtYVYZsrELxS6Wns7HLxIJQKN9F0PYeTv8JUrWLJ2Cd2bk+
E9JzgGUbvOhmYtCp0CxIt5j1ON5oaQ==
=9gIq
-----END PGP SIGNATURE-----

--Sig_/E/cTBMWLd7RjEmxLl0rLyEw--
