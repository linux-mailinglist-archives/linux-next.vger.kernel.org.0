Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F31EA2E759A
	for <lists+linux-next@lfdr.de>; Wed, 30 Dec 2020 03:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgL3B7q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Dec 2020 20:59:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbgL3B7q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Dec 2020 20:59:46 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8045BC061799;
        Tue, 29 Dec 2020 17:59:05 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4D5Dwj6hJJz9sVM;
        Wed, 30 Dec 2020 12:59:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1609293542;
        bh=5j0RDxUsHx5KfXlsc7z/rrLF1bwFavVIRm8qCp7QDLc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tKd9kH/DbgEPXxnYsjFnF4Oxrp6YKgq1K8QOk4WVZS+TH/rnZQl5efIfdhahJajQ6
         6Qe8T1gPugfDBiLGIRlZj+cFzV8boqxQu+qdqvbzSmub2nOGdgrFziExugJNlajXrV
         UvTJejLJbRyqTaQHHBUO6NPJQiTfRaKqhJc2RxNjBAocI5VKrdJvK3IQIwomknAupB
         nxV7ODiyIkhPP5LPKkDCJE/T9D/wohWGmEqHY9/xz6rhxtJWsqK66D50SLPcm/12nC
         Q2g8vvxiRDr/k5PUif1KBfW0qz8F6SpbblCZK/xmTW7I2xLKv7M/IWM9A+0+dFGq6L
         6cpys3f7XoJQw==
Date:   Wed, 30 Dec 2020 12:59:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: stats (Was: Linux 5.11-rc1)
Message-ID: <20201230125901.19486db4@canb.auug.org.au>
In-Reply-To: <CAHk-=wg1+kf1AVzXA-RQX0zjM6t9J2Kay9xyuNqcFHWV-y5ZYw@mail.gmail.com>
References: <CAHk-=wg1+kf1AVzXA-RQX0zjM6t9J2Kay9xyuNqcFHWV-y5ZYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fCNKAy98MINyCWJkyhqUa.w";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fCNKAy98MINyCWJkyhqUa.w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

As usual, the executive friendly graph is at
http://neuling.org/linux-next-size.html :-)

(No merge commits counted, next-20201214 was the first linux-next after
the merge window opened.)

Commits in v5.11-rc1 (relative to v5.10):          12498
Commits in next-20201214:                          12038
Commits with the same SHA1:                        10988
Commits with the same patch_id:                      500 (1)
Commits with the same subject line:                   47 (1)

(1) not counting those in the lines above.

So commits in -rc1 that were in next-20201214:     11535 92%

Some breakdown of the list of extra commits (relative to next-20201214)
in -rc1:

Top ten first word of commit summary:

    135 perf
     76 drm
     49 kvm
     35 libceph
     31 clk
     27 net
     27 cifs
     26 dt-bindings
     24 tools
     23 ceph

Top ten authors:

     56 acme@redhat.com
     34 thomas.lendacky@amd.com
     34 idryomov@gmail.com
     32 tglx@linutronix.de
     31 leo.yan@linaro.org
     19 trond.myklebust@hammerspace.com
     19 peter.ujfalusi@ti.com
     16 sgarzare@redhat.com
     15 jolsa@kernel.org
     15 jlayton@kernel.org

Top ten commiters:

    158 acme@redhat.com
     88 kuba@kernel.org
     59 idryomov@gmail.com
     57 alexander.deucher@amd.com
     50 pbonzini@redhat.com
     37 axboe@kernel.dk
     36 sboyd@kernel.org
     33 tglx@linutronix.de
     30 stfrench@microsoft.com
     30 mst@redhat.com

There are also 503 commits in next-20201214 that didn't make it into
v5.11-rc1.

Top ten first word of commit summary:

     65 drm
     42 arm
     38 mm
     30 usb
     23 scsi
     23 btrfs
     14 fpga
     12 dt-bindings
     11 sparc32
     11 soc

Top ten authors:

     22 mchehab+huawei@kernel.org
     20 willy@infradead.org
     19 josef@toxicpanda.com
     16 jani.nikula@intel.com
     15 uma.shankar@intel.com
     15 akpm@linux-foundation.org
     14 rppt@kernel.org
     14 mdf@kernel.org
     13 pawell@cadence.com
     12 arnd@arndb.de

Some of Andrew's patches are fixes for other patches in his tree (and
have been merged into those).

Top ten commiters:

    121 sfr@canb.auug.org.au
     32 peter.chen@nxp.com
     28 alexandre.torgue@st.com
     23 dsterba@suse.com
     23 dhowells@redhat.com
     22 martin.petersen@oracle.com
     21 mchehab+huawei@kernel.org
     19 geert+renesas@glider.be
     18 mdf@kernel.org
     18 arnd@arndb.de

Those commits by me are from Andrew's mmotm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/fCNKAy98MINyCWJkyhqUa.w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/r3uUACgkQAVBC80lX
0GxSfgf/TZTi0bFEkWnDP9YL3PsAJBcrasND0dRfi+cIKoCcblanb7AuWfcl8ZCs
Mud6gmBIyf5sqIVKKIQjdRGBdYVEnVDPU3JXk0PLcrw4ZG7i1mxDE+xqAlaaL7ZX
KhJG1VsNlFrx5UqKE2bsw2KFjYaLcQEyZPyDpLYxGn+CC6EpJgOX/hOpGNLXqCXK
kTp2Wv5m0uMvlFgJGz6EzXlQpWXOuesESNluc2hrBhse4RahGOWDeHVBxdqv+kR9
96jmnqiQvAyzKY8QmZCGLp1JCk+2RujV4opAHILj/M7FiH5GX04IfR0JAvhCNhqy
nPGM4n6+eRJ+mBLoc3LtTLPRXfX1dQ==
=gVPZ
-----END PGP SIGNATURE-----

--Sig_/fCNKAy98MINyCWJkyhqUa.w--
