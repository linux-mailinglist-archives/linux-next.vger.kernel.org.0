Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 227EA3AAFC4
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 11:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbhFQJeQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 05:34:16 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60121 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231252AbhFQJeP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Jun 2021 05:34:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G5GzV0nPNz9sTD;
        Thu, 17 Jun 2021 19:32:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623922326;
        bh=Lbion4dN5KMu4rGd7HQ3LxwsKhLlHimiT/WpDN2ZZLg=;
        h=Date:From:To:Cc:Subject:From;
        b=ime5QMIYeJPa5DJu87tzwbpkqPAFdh7Ft//pXiFd1+hH19LXXNYYID6M0EWI6DMQ7
         2TpageGWp/cNDHrx96tZU99C464KUPaULa306PcHvg7izuq5uexZWNnsbk44UNxakU
         rbr1M7PYgx8o94LlW31fEyu/3Yhz7huD6EhC4/5VekCsfvtsrVYGxL7j4AmxOyud/g
         oasxveZ7OJFYg0ReDx4LeIYk4r74Cqi4bUDL3q8WKcvu72qGUC7iXhDm60jo+0RUoX
         lAEEpb5zWAtIzCYIIkcUYT+5Qz7hcnrlOyvht6pX/Eu4I/kLZjIGzTl3AjbViu2BUG
         R0SoY4mFRJr+w==
Date:   Thu, 17 Jun 2021 19:32:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Muneendra Kumar <muneendra.kumar@broadcom.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm tree
Message-ID: <20210617193203.39f40d0d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/58cmAIv5WYX3m6FWg.lTPst";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/58cmAIv5WYX3m6FWg.lTPst
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "cgroup_get_e_css" [drivers/nvme/host/nvme-fc.ko] undefined!
ERROR: modpost: "cgroup_get_e_css" [drivers/block/loop.ko] undefined!

Caused by patch

  kernel/cgroup/cgroup.c: don't export cgroup_get_e_css twice

I am not sure what happened here, but this patch interacts with commit

  6b658c4863c1 ("scsi: cgroup: Add cgroup_get_from_id()")

from the scsi-mkp tree which adds the EXPORT_SYMBOL_GPL().

I have reverted that akpm tree patch for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/58cmAIv5WYX3m6FWg.lTPst
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDLFpMACgkQAVBC80lX
0GxZvwf+K8XWD8+Lh4Af2HY3aDgVNtZfBvgYlF16gVphKFd+Ivj6YfyHlQmSerb8
ddB4tdXcmTpZDsVEln2f6mHsHkfbqwntVW7CE0BbXRwsFe4ad3RvicEBLrPudQen
yhRDc3K+xwawvP51nIDj0LSsaTGb3Q9yJrPAZwQkKKavG7R3c0cu6pzqeaBwjfTo
FN1LOv+THOHP95TOMRidU2Yqp3edOMyisfPdlhtRzkoudPbm9DlizXU11jkNq/Z+
iXPCRYmVy1wEtzzZ+UFEWLc701tGYUhML5LntV5h3yU2KhIdbHRL9qVsSxqNHkZv
CNk144T+vyNUHwdKSHZjlRM1Fvidow==
=aLah
-----END PGP SIGNATURE-----

--Sig_/58cmAIv5WYX3m6FWg.lTPst--
