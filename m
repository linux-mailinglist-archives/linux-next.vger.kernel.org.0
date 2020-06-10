Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7291F4B01
	for <lists+linux-next@lfdr.de>; Wed, 10 Jun 2020 03:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgFJBmi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Jun 2020 21:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgFJBmh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Jun 2020 21:42:37 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 739D2C05BD1E;
        Tue,  9 Jun 2020 18:42:37 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49hV9N4cvcz9sRW;
        Wed, 10 Jun 2020 11:42:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591753354;
        bh=k9OzmdUjrIqcTYRccUZlEpgrdhZAWYi0DaBUdmz31Fo=;
        h=Date:From:To:Cc:Subject:From;
        b=IR0BTURX+so10BdJiPFpS/wKwC/OgDQSWUaOkmwJ0IKbiQ/nVoatvjUdguHCYuuFD
         3FUWucvriLyPdIPdaLHZDa9NgmSQS24hEYsRnRCOYLgLMO4E+qCrLaLzUh+2aLd5Q6
         UT5ijLSTdAbEtlFkavQHmClY3xG3ssHXS4OBpyKpL5XTgNwxVbIbOTufw8PAh++Cvn
         Z5OP/6QbO9dcyp53GNdhAOYRYUSUDq5H5f1p4CHycgnnAbEb453pqCpK6m5pxgyw+f
         TzfKOHcHSbhqQUXpiFpliRMnBVgdF3qFNBfsAE4e0NyPKZioUSeby5nJmBpT7JsxNK
         JTmV802QYaIkw==
Date:   Wed, 10 Jun 2020 11:42:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Balbir Singh <sblbir@amazon.com>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20200610114227.672fdd24@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LrGpezqm66e6jy_WXt=gsb_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LrGpezqm66e6jy_WXt=gsb_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  Documentation/admin-guide/hw-vuln/index.rst

between commit:

  7222a1b5b874 ("x86/speculation: Add SRBDS vulnerability and mitigation do=
cumentation")

from Linus' tree and commit:

  0fcfdf55db9e ("Documentation: Add L1D flushing Documentation")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/admin-guide/hw-vuln/index.rst
index ca4dbdd9016d,35633b299d45..000000000000
--- a/Documentation/admin-guide/hw-vuln/index.rst
+++ b/Documentation/admin-guide/hw-vuln/index.rst
@@@ -14,4 -14,4 +14,5 @@@ are configurable at compile, boot or ru
     mds
     tsx_async_abort
     multihit.rst
 +   special-register-buffer-data-sampling.rst
+    l1d_flush

--Sig_/LrGpezqm66e6jy_WXt=gsb_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7gOoQACgkQAVBC80lX
0GwaBwf9Hk8O3KQrIRuamE/e5Mbm365BVUhxqd445GhUwx354QKps6FudJuGw4f8
BtCA+v3crJ/3/SSHXrPsWY68s1QSeZZ9HrEzxsVaPADBAXowHZpM3arWkKa8zKCn
SgRXxVDbW8usJpA21PE4db42PQzY+gEEbtpc7EfWzNZLiXum6+zopW2MVjo+4AeR
goXpZaLEbFc8/5/jM7dSRTi3cI9zn+4vXy8fUUWm/lVgbNkkBE42tO5pU8RuiCvj
hwyqPsB1AVSffginxwEpQuUtjBTRRYXc9yPWxKqbw4PKNqyUkfPn0nmaEjTQ/rW5
Ponr9V8XZGLnY0ccZT+MAk/+YLbovQ==
=Bv8y
-----END PGP SIGNATURE-----

--Sig_/LrGpezqm66e6jy_WXt=gsb_--
