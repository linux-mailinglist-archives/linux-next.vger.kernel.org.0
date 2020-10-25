Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5E0298509
	for <lists+linux-next@lfdr.de>; Mon, 26 Oct 2020 00:43:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1420672AbgJYXnw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 25 Oct 2020 19:43:52 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34447 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1420670AbgJYXnw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 25 Oct 2020 19:43:52 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CKF0g5zh7z9s0b;
        Mon, 26 Oct 2020 10:43:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603669427;
        bh=yq9xAEUZVAHUaR8bnjtbMsYwAObveC8YBvZ9c6NadHQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ubUzI9tXuFSTXzLzn90O/ASPXSAVfpG2SzB7Thmv+o38miZdtqEOMTs40MocA01Xn
         z41Z6061ERw7eofhFqQOy1HuthmR6CmU2P8BvTMF5URhjArjpOZLXHQwy6siHSxFOZ
         5G0dOzyoRhg7Je6pbPAhiJ13k0GylO4XSx5ckI7uMG6bg3LkP45elO0dsuaAgeyxDE
         UoJ3fgQu4HzmgZAmpK7SB8jw1+k7vWr3bYO91egUjntcPsnXNki1aq+QJnyjQuBNla
         J97P2Gy5HPYum+c181WfAO8U7OVubOOwjWNUsWnujT2AXer5fMY5nzI+15YwuDtfwY
         LdNmMX9ahx/2Q==
Date:   Mon, 26 Oct 2020 10:43:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: stats
Message-ID: <20201026104345.1f819bd6@canb.auug.org.au>
In-Reply-To: <CAHk-=whcRFYSm0jj3Xh3xCyBaxCHA1ZMNO0h_gZso_WZFDUtiQ@mail.gmail.com>
References: <CAHk-=whcRFYSm0jj3Xh3xCyBaxCHA1ZMNO0h_gZso_WZFDUtiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RDZLPtvSWw0D4zSmC.dVQd6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RDZLPtvSWw0D4zSmC.dVQd6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

As usual, the executive friendly graph is at
http://neuling.org/linux-next-size.html :-)

(No merge commits counted, next-20201009 was the first linux-next after
the merge window opened.)

Commits in v5.10-rc1 (relative to v5.9):           13903
Commits in next-20201009:                          13046
Commits with the same SHA1:                        11911
Commits with the same patch_id:                      563 (1)
Commits with the same subject line:                   46 (1)

(1) not counting those in the lines above.

So commits in -rc1 that were in next-20201009:     12520 90%

Some breakdown of the list of extra commits (relative to next-20201009)
in -rc1:

Top ten first word of commit summary:

    158 kvm
    112 perf
     77 net
     53 docs
     43 io_uring
     43 drm
     32 bpf
     31 dt-bindings
     30 clk
     28 nfsd

Top ten authors:

     77 mchehab+huawei@kernel.org
     64 sean.j.christopherson@intel.com
     28 asml.silence@gmail.com
     20 bgardon@google.com
     19 axboe@kernel.dk
     18 jgross@suse.com
     17 stfrench@microsoft.com
     17 chuck.lever@oracle.com
     16 namhyung@kernel.org
     16 moshe@mellanox.com

Top ten commiters:

    165 kuba@kernel.org
    163 pbonzini@redhat.com
    113 acme@redhat.com
     81 axboe@kernel.dk
     75 mchehab+huawei@kernel.org
     43 bfields@redhat.com
     35 sboyd@kernel.org
     29 rafael.j.wysocki@intel.com
     27 stfrench@microsoft.com
     27 idryomov@gmail.com

There are also 526 commits in next-20201009 that didn't make it into
v5.10-rc1.

Top ten first word of commit summary:

     81 drm
     45 arm
     32 tools
     21 soc
     19 bus
     16 mm
     13 dt-bindings
     13 arm64
     12 rcu
      9 x86

Top ten authors:

     64 paulmck@kernel.org
     32 ray.huang@amd.com
     16 akpm@linux-foundation.org
     14 gustavoars@kernel.org
     13 tglx@linutronix.de
     13 olof@lixom.net
     12 bbhatt@codeaurora.org
     11 ysato@users.sourceforge.jp
     10 joel@jms.id.au
      9 jhubbard@nvidia.com

Some of Andrew's patches are fixes for other patches in his tree (and
have been merged into those).

Top ten commiters:

    103 paulmck@kernel.org
     83 sfr@canb.auug.org.au
     71 alexander.deucher@amd.com
     26 maxime@cerno.tech
     19 manivannan.sadhasivam@linaro.org
     17 joel@jms.id.au
     15 gregory.clement@bootlin.com
     14 ysato@users.sourceforge.jp
     14 davem@davemloft.net
     13 olof@lixom.net

Those commits by me are from Andrew's mmotm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/RDZLPtvSWw0D4zSmC.dVQd6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+WDbEACgkQAVBC80lX
0GzFZggAotZcq7rKwd8uZa8y032ipn3ol+50kmJJpfGF3vPVA91LvM9opy0T7JEl
1yh02WEFG8gWHG11L5t6K/xEatOJGXPS/3uiU5cz3zRgKdepYTZQX7Aid5xCSQkB
/6lUsilNWxQszIgpDzh+mjkBlSO27KHMcuUxyLP7ddkYfZShVXesJbdPlrn2ZduE
5IH5M9PQodLYutdfn+d5uip+nFGfzjV1PI5k6vmwaFULHO30qYws5x7Mnh1q0BI3
Nslyh9H/c8gNHcdzaZqN0LK8E6RRHVRgfs75214NmLssRpG0U25OnHRtHA/psiYC
C2yD06sFeXXDWQKBo1JOwOvs9PUU+w==
=+deb
-----END PGP SIGNATURE-----

--Sig_/RDZLPtvSWw0D4zSmC.dVQd6--
