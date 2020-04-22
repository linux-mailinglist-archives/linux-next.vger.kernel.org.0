Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B19471B3711
	for <lists+linux-next@lfdr.de>; Wed, 22 Apr 2020 08:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgDVGBS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Apr 2020 02:01:18 -0400
Received: from ozlabs.org ([203.11.71.1]:45657 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgDVGBQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Apr 2020 02:01:16 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 496VDT05CDz9sSh;
        Wed, 22 Apr 2020 16:01:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587535274;
        bh=BD838gVtavOEQyFzLC6EmshuBpJjmuEPd4cFV1Fai4U=;
        h=Date:From:To:Cc:Subject:From;
        b=dR5dyy9ytSgBXwcKnSd69BxQpoSTRj3PV8q6gIABfBow0WMCO2vzBkY1tRL/45tic
         aULRPe925sTytPnHBrGlLVK43Qvh7uu0eh09RGJPcVp4JivnI/5BTC/KgK3WpPSzTr
         IfFI8Eq+cc9l2lzKX1BTvbbufuOH2hZc+rnRipDmaCBKBkRDmK+klj2x72VxEP2tA6
         87wHKLJbJyUX/YwmTZ5fdjzWgD0muVc72xxyvgu1j/RRXsljtyqNRRZnGbdz6HdcXB
         BZZ2ans1+LvQGQDGtr7tMIjeFrrlktC1BiJqZHpe/YYVkLi97kYC16HkfJUUgDizym
         dpZ9b4mqIu8PQ==
Date:   Wed, 22 Apr 2020 16:01:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ricardo =?UTF-8?B?Q2HDsXVl?= =?UTF-8?B?bG8=?= 
        <ricardo.canuelo@collabora.com>, Orson Zhai <orson.zhai@unisoc.com>
Subject: linux-next: manual merge of the akpm-current tree with the jc_docs
 tree
Message-ID: <20200422160111.7ae3f532@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j8x8N/diik/CMBZ9J=Fp2_s";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/j8x8N/diik/CMBZ9J=Fp2_s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/printk.h

between commit:

  90c165f0de3a ("docs: pr_*() kerneldocs and basic printk docs")

from the jc_docs tree and commit:

  2023be154f91 ("dynamic_debug: add an option to enable dynamic debug for m=
odules only")

from the akpm-current tree.

I fixed it up (I just used the latter version - though the comment
for pr_debug now probably wants expanding) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/j8x8N/diik/CMBZ9J=Fp2_s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6f3acACgkQAVBC80lX
0GzCYwf+P/us2iCzd3hh5m5CXbDkHGn9WCKp2Uwx4jWcde/D1sDVyWcQaYQfuc1k
eRhB5fSE2u38SmhmZQvL3cokX9LIKFNZiaQ841HDsN2jgdTVZYVMd/5fB+K3ez5S
++/dUAOBEeOQeSTHF1zTsgsfbt1aL8Tr8UvNG9bJvKPfZopO3FrgWeZ6WzdkCSk4
brTIEaPz9RSELus5Kke6bG0nGmKTW+kGlp8otczAM4HeK83DfUrog3GQ8EP9DjdO
GHL+oBxyeqyim4IveRkzdmaEQGYb+UR4W4U0iEh87fnrTb/VuxD+yYtJbm5BcW8n
5gRQaUlbArnT9TzV+fFpJChBvwyqdg==
=aO3n
-----END PGP SIGNATURE-----

--Sig_/j8x8N/diik/CMBZ9J=Fp2_s--
