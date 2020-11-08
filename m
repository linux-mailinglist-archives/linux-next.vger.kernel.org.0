Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62B802AADA6
	for <lists+linux-next@lfdr.de>; Sun,  8 Nov 2020 22:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgKHVUg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Nov 2020 16:20:36 -0500
Received: from ozlabs.org ([203.11.71.1]:35417 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727910AbgKHVUg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 8 Nov 2020 16:20:36 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CTn8x4Hd9z9sSs;
        Mon,  9 Nov 2020 08:20:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604870433;
        bh=RoY7M2fIPMo7ze9xvWqYNM13oBqrGWxID8j2Y4S75FI=;
        h=Date:From:To:Cc:Subject:From;
        b=jFNg34dL1l/AiMY7senG739fXY6LqZy2fg9ZMNkaWqnMJOOnoEmOz3sAKdpyOGX2G
         XIEJ/jjqzvvUroaoLHE62axlXvrNHVmUv5ZWo0d7OO6RnLwizVcqk1r+t0KV3UGeM4
         irBScBw6mAxsQ2Kx62XQNa/yrPHBEKS7DyZrLFAaws+vYbBAQBr/I1LD6YZRNTFk3+
         i3I7E34xNHrCEWsz9O01E4O7mzhS1H84SsMdLAPFQNWs8hTYVsen80fg1vJjw2Xi1/
         Oy7uWrIIdkkojobqs8L7FbUUU5zY21gpZ8TCMgyR5rBsCYeEhOqnnLzkf1VyRvu3hy
         nJmSVUWA/WTsQ==
Date:   Mon, 9 Nov 2020 08:20:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "J. Bruce Fields" <bfields@fieldses.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the nfsd tree
Message-ID: <20201109082032.3bf8f58d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wD/.ubd0MiGpVBb1bJ6bmMo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wD/.ubd0MiGpVBb1bJ6bmMo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  bfb5aa1685d5 ("net/sunrpc: fix useless comparison in proc_do_xprt()")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/wD/.ubd0MiGpVBb1bJ6bmMo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+oYSAACgkQAVBC80lX
0GzU9Af/ZvvQHb5z7022DBKbNH3eKUeiyfWwwCzEDok2FiH+ilY7sacZaevFHAIs
pvGqCqE3oH7XrVKCmrAYwzXvAHiRanq+7+b5vhgLyqqMzR7+lLgH/2u1MuH1KD14
8WZ71hHv1q2Q4Zyg6TFnQCCSuTi4QyOdueO4QKlZnic0cxyp07MwlR28eiEgQjSM
TH/VAdTWWYT39aGoySZjb4s2EqrQl+9iJePi7l7eFsVbJ2LM2ijc+vwV10ARBGbn
RwW/FkLabVdbqn5N5bZnTdJYunbbtlXzLQkfZtCzPGNWlonl8cU07zAJNTULyWB+
yCDKUqwzLBMfj/i9miUJgjjK1y4CRQ==
=+qVO
-----END PGP SIGNATURE-----

--Sig_/wD/.ubd0MiGpVBb1bJ6bmMo--
