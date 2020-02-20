Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68CF11667EE
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2020 21:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbgBTUDo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Feb 2020 15:03:44 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:47697 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728770AbgBTUDo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Feb 2020 15:03:44 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48Nls81kbqz9sP7;
        Fri, 21 Feb 2020 07:03:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582229022;
        bh=w3Al/3GJC2MM8C9y5us7D3Ujx2FSxmrOP9Wzgz1SaIA=;
        h=Date:From:To:Cc:Subject:From;
        b=Tw2bj1ccVQpnzsdEM6rDxnB+Y7jr0bMInzpXLiFliRCjsur+ktJB3Uy6WnGTr834P
         b7vtH33ebmiXMebD5sS28Uao3zU8I7aiREIJDRuEvkQl0Jq/tRCZrjSsuUuvfcE9is
         hlkRqrHTYCINoECdgTn9sED/N2UnHhQGirEXrP0hzRnZn6+gWK9VkKZBM8pUd1iP4w
         t3vzrWJI3iulc+YdfV9WYQZ3vMTFKIXnVZN3DCPxKBHw81DMu8RTOaeZKJKAl/dBTg
         1U6oeQT1syKg/z/Vj0DQVcVmos5LsDHXDk58ZcU3LC3qjiH4sQOnEixls54on8cqMH
         X0bJ0HzwNgGwg==
Date:   Fri, 21 Feb 2020 07:03:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Borislav Petkov <bp@suse.de>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20200221070333.2c89f9c8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xp6zB4LT..g31FB8lqpF7jb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xp6zB4LT..g31FB8lqpF7jb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  4bcbd6eb7b3c ("x86/split_lock: Enable split lock detection by kernel")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/xp6zB4LT..g31FB8lqpF7jb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5O5hUACgkQAVBC80lX
0GzoJwgAoWehIbD+D8tBXFD3aV+T/F0RUWXonwACeQiR+YFJP5MbJBy6mK9cVtQK
7o3Ph1LhUL/WXxppTZlz57Ps2QrGdsBS4EyYoBmjBCLOoFUyIwMHO7GZyg2dT7Gd
X+YQQbixpT2er4bDFZtTTM9lCeb5IwYLnYpk5+B2gK1JIRuEZL35b+cwDkyXo8Ub
B2nvWwRN5A/8h9jVPjjfAiXgu8W+2v04XNi5QBEHHS8j3EAXq8Xkck7QAnavIgWm
oWko6nVuVgYL1pNC5CyGtd0ZxwfsK/6ZWq/n4G+qBfoP4at2ljMDVDZ26A6+VITL
g5gVtt/d21/MqrZpAccek3mkjRE7dQ==
=cFNd
-----END PGP SIGNATURE-----

--Sig_/xp6zB4LT..g31FB8lqpF7jb--
