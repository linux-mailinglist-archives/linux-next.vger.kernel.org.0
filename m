Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC8029D5EB
	for <lists+linux-next@lfdr.de>; Wed, 28 Oct 2020 23:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730207AbgJ1WIx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Oct 2020 18:08:53 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55631 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730181AbgJ1WIu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Oct 2020 18:08:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CLl1b4ZJpz9sTr;
        Wed, 28 Oct 2020 21:19:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603880390;
        bh=ly8VvXq3qj5Su5gYi3DqgFok0VGVx0XHu7f/J8oh+to=;
        h=Date:From:To:Cc:Subject:From;
        b=I0Oa+/SuLBvpe6/qa6ZUhvLLhGIraluGse4ryMkaUKxzB8NxMT7o2aq5iqYgs0kNV
         2pJB0gxFZekLh5Na7TdYoynVQSZHiKyMMqOX8W6TmZsxg2Qpf/2oTzMHI418Y6raTz
         EaenaLvnNsQmjH76rLjRZFmy2vJj2UfjYD1rqc0mLUlSJRf38sqFpSZRsN8tGVU4mH
         rEoNTjTHOJGOQ74hQmPsV7Lr028m+uElrgtzGyWhAN5RnbNoqA1L/M8uPQL9kqhDhp
         SQViklGmpHNQeDEW5oQ7ZZ7HeVRJuN4xndxs4R2mXc1aQ22qLiByoL4vcJA2uCoe/C
         SCojrO9FhbFzg==
Date:   Wed, 28 Oct 2020 21:19:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20201028211945.482c0e75@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9sZpOM33C=umE0a5qGSDs+6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9sZpOM33C=umE0a5qGSDs+6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f8e48a3dca06 ("lockdep: Fix preemption WARN for spurious IRQ-enable")

Fixes tag

  Fixes: 4d004099a6 ("lockdep: Fix lockdep recursion")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/9sZpOM33C=umE0a5qGSDs+6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+ZRcEACgkQAVBC80lX
0Gz7oQgAoBMUiJ7mcWvCcvE3YCA8XEU6YTcA7S/4VoZRPWVZ4CNszspBEGceUB18
oJ+Ft8cwZP5JPH+2GT5iJ9phg+9+2EE951CxlEAsMQ4Cowm0nS7kfpWBeB8GUe92
Kaj7KkDuRdunCF/CHjY4EH7o+XZ2weP0cFKykyA/q2Ttmnc4LS+h4GTLd6FL2eUS
F7GdqiNEWLnhUdrlbgCk9G6R2MiVSvyWiKwohe3gQ3A+mkBhWh8aga6qKi4FRFcO
ugmBj422UeYQz9dJxA/9e4O8fo2WBGHmkYzN/y2KpRpIQO2khEpLfYzgLCVeLdoW
qwbEA80q9izRBUSV1S6pvXXr+l2zbQ==
=IKuy
-----END PGP SIGNATURE-----

--Sig_/9sZpOM33C=umE0a5qGSDs+6--
