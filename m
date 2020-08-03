Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09C3D239F44
	for <lists+linux-next@lfdr.de>; Mon,  3 Aug 2020 07:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbgHCFpY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Aug 2020 01:45:24 -0400
Received: from ozlabs.org ([203.11.71.1]:56929 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728192AbgHCFpP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 Aug 2020 01:45:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BKn0Q5SSvz9sTb;
        Mon,  3 Aug 2020 15:45:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596433512;
        bh=tDpjafQugoz8PXByw25cUT1Os4lFSFxO6dA6wGZzsJg=;
        h=Date:From:To:Cc:Subject:From;
        b=Ctc/LeRbaibg+4wIu1oY38ziTXkT3q9svPxFz6HaA1wloDGYbPV+Qh3yMQJ3ZFG2z
         xvhKOasmDfHV4V1xoOz06yCfds1RXMGttcA8tzv7woAJmMzkW+wC1QXT8ltcphchvD
         Y619CoQOkI/52gtv51KRDHEsdF1++7bx4ucariplBr4QNSPYSVye/azNYjgCHnZHxd
         +zydeCeV4qHM/kZCQeemhM6gMrbz/Tpd6K/I3fJyZe0NS+1Jze5AqnfvG3REEh5rpR
         Oaiytd32eXgJW0DI/ZZYZK6r1NSd6XyBrwgy0SHmIspBuDDNbWW8RcJEzgVmiWhsSK
         b41daILvEEzgQ==
Date:   Mon, 3 Aug 2020 15:45:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lyude Paul <lyude@redhat.com>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20200803154509.2ee5bda4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o6_O/UmEBqs/CDc1=iM9Az/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/o6_O/UmEBqs/CDc1=iM9Az/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: modpost: "sched_setscheduler" [drivers/gpu/drm/drm.ko] undefined!

Caused by commit

  616d91b68cd5 ("sched: Remove sched_setscheduler*() EXPORTs")

interacting with commit

  5e6c2b4f9161 ("drm/vblank: Add vblank works")

from the drm tree.

I have reverted commit 616d91b68cd5 again for now.

--=20
Cheers,
Stephen Rothwell

--Sig_/o6_O/UmEBqs/CDc1=iM9Az/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8npGUACgkQAVBC80lX
0GyeJgf/bhRA8p3QX6UUiliWOXtcjf0/SMw0k0yXyeTNazAmhcYBGCpUhpE+d6xQ
7C03TqQt255zqWptg7CNTzJQWP08uadN44ftMxoVBjQnPi3p0TltXdNzfoEvYW29
x6kKhWF1ft5mH0l2vRFxv7NKCTvkjHjH4yjGmwID3z0nzehyN7Uub7sDT+HOzvpv
By8jSMnVnkpjsaEGASdry/4CNCpCeS3j4ZK1GspsuoWZEq+aH6BcS7fs5x0Ne4wN
wbK/USJgBf2yhDPiTs9dDKKt19WHns4KesL6wM73Rzs+ciSWov0Gfz9qriRHQRTf
t4HKo/01LaKNOv0BEKUbP+Qv9yzUSg==
=Ossb
-----END PGP SIGNATURE-----

--Sig_/o6_O/UmEBqs/CDc1=iM9Az/--
