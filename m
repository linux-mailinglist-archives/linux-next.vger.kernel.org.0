Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB26156CFF
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2020 00:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgBIXHr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Feb 2020 18:07:47 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:34411 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726798AbgBIXHr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 9 Feb 2020 18:07:47 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48G4Sc6Jk3z9s29;
        Mon, 10 Feb 2020 10:07:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581289665;
        bh=M3kFIfJ1oaJs18Ixt1knTKnUd8cb+7j6jEbUgFGfofs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FWFkyrWnRZrVrbfjNujc7rCk8gO/P2+jtt48Nw/IjQmD9dP3nZyFu4W0/8p1hTA0M
         tS6ATD5qPGf5/T+Wp/1qB9jZKHkTH/8hRAhZe//4Efr6MihIxdXDLDUYRpWvY4Cjbj
         W/qlA0JP71o0eC6JUPiJcrdVdK4b+YrSkVwDPs/jFO6g7zZbXZmqzXlsg5t1QXV+3B
         2L7OPrruhk9dmk5EcxFQA+cq/GcMDEl6tRd+AxJ4audtFRByaugwEEpvaX4CpvUPnn
         cSSlo35dOzSjP6KXv+Rs+gEpKtI6sgI4QJOfXkhYwWRNW0Ry276KVCd2Yx2AA9xwZq
         xmraJ7LYHG3OQ==
Date:   Mon, 10 Feb 2020 10:07:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the keys tree
Message-ID: <20200210100743.7a6a0116@canb.auug.org.au>
In-Reply-To: <20200210100555.7497d69b@canb.auug.org.au>
References: <20200210100555.7497d69b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LF5SX.LSGDQ4.eo_0e//fFB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LF5SX.LSGDQ4.eo_0e//fFB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 10 Feb 2020 10:05:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the keys tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

kernel/watch_queue.c: In function 'post_one_notification':
kernel/watch_queue.c:89:21: error: 'struct pipe_inode_info' has no member n=
amed 'wait'
   89 |  spin_lock_irq(&pipe->wait.lock);
      |                     ^~
kernel/watch_queue.c:122:24: error: 'struct pipe_inode_info' has no member =
named 'wait'
  122 |   spin_unlock_irq(&pipe->wait.lock);
      |                        ^~
In file included from include/linux/mmzone.h:10,
                 from include/linux/gfp.h:6,
                 from include/linux/umh.h:4,
                 from include/linux/kmod.h:9,
                 from include/linux/module.h:16,
                 from kernel/watch_queue.c:11:
kernel/watch_queue.c:125:46: error: 'struct pipe_inode_info' has no member =
named 'wait'
  125 |  wake_up_interruptible_sync_poll_locked(&pipe->wait, EPOLLIN | EPOL=
LRDNORM);
      |                                              ^~
include/linux/wait.h:234:29: note: in definition of macro 'wake_up_interrup=
tible_sync_poll_locked'
  234 |  __wake_up_locked_sync_key((x), TASK_INTERRUPTIBLE, poll_to_key(m))
      |                             ^
kernel/watch_queue.c:129:23: error: 'struct pipe_inode_info' has no member =
named 'wait'
  129 |  spin_unlock_irq(&pipe->wait.lock);
      |                       ^~

> Caused by commit(s) in the keys tree interacting with commit
>=20
>   0ddad21d3e99 ("pipe: use exclusive waits when reading or writing")
>=20
> from Linus' tree.
>=20
> Given that I haven't seen a pull request for the keys tree yet, it seems
> that this work will not be in v5.6, so I have just dropped the keys tree
> for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/LF5SX.LSGDQ4.eo_0e//fFB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5AkL8ACgkQAVBC80lX
0GzM8ggAgCh12Ebu21ln/BPEbEVmkIkSR7Rf7ElhJwcu+kTEYnnQae7rlHyqs4XH
+LyI9PQFpiW/kE41bBHOcQT2+p3W9q9TyHuEXIxFWOquRxDNZkIZkqRf7xfm39OR
U02aEvci0N1FhGg0nT4reoiiTenAtAb9xAhMAGSpCp2BlN35CMq0M4c+Bgel7efe
SmNQYGMk9qh3OwQJSaNrFRJfAhq/LD5LpyMfX8ajhauJUpWLSbovCVdIJHCSITIQ
VoRU940nFw7ZnYFoPQhpTnwFPzlykqwJKzRofymAOAPRV5j336MAwQOTROQerQhl
5DSyY/E8grkdn9y1Q/2qhaHO7qTTVg==
=vhGr
-----END PGP SIGNATURE-----

--Sig_/LF5SX.LSGDQ4.eo_0e//fFB--
