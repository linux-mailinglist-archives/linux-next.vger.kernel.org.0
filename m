Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACDB1AB38A
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 23:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731287AbgDOVyB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Apr 2020 17:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729780AbgDOVx5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Apr 2020 17:53:57 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 248A9C061A0C;
        Wed, 15 Apr 2020 14:53:54 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 492bht5vB5z9s71;
        Thu, 16 Apr 2020 07:53:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586987631;
        bh=5L4j9dk6haAvefMZLBp0yWRPktTQgXXXfoQiVErcHQM=;
        h=Date:From:To:Cc:Subject:From;
        b=oLfX4nGnEAs5uiRnHQdzWIf1OuHXyif62vYgDJFwFGy6EBfoohk+eCslEEy0T/obG
         sHE+OKLtRCFGppi7lV0AUg6TC9r6hgMwVzJ/q5twOPtMmxaM2Y+LxHgcZfPow22X1E
         Azo2mhKGoaKmI2H/qjJp5QsIcwdYqw1GjeQQRF/y2nuFsq1rx/tgxqyF4YRPmK7EIN
         CbW7oBxBJLfxjvIaJIkUGhNMl9cqMLgY9vRjN5xpcgyWT6VTE6Edc/AQYX3m5NoUKD
         dg4sn6hsna5RLfHs8UqBpAstCysKXWh3DzyK57FzCPSkQTNPXE+AL88ziuZIDw8piN
         CbhTYBrA2giZw==
Date:   Thu, 16 Apr 2020 07:53:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Gruenbacher <agruenba@redhat.com>
Subject: linux-next: Signed-off-by missing for commit in the gfs2 tree
Message-ID: <20200416075349.22aa708c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EKdMsrUTJFzR6Uee8ZDDKog";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EKdMsrUTJFzR6Uee8ZDDKog
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  d4f40a25ec27 ("docs: filesystems: convert gfs2-glocks.txt to ReST")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/EKdMsrUTJFzR6Uee8ZDDKog
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6Xgm4ACgkQAVBC80lX
0Gx3cwgAlzXL56LXDiwL8IUvL/nlZNPyuwyO6yt73n5vjalPm3FVEElkzaw3UyTG
agqnu3bRUEhSRLsbV+oVmVAXEwCgtRb5EMWiLdygGMyHKym7hkkBLiyxJ6gZvjkE
K3oklyxH+hl/I1NmJL/h9FR+z68zBySNaL7NSCXcfuo0mSPfNEV2nNfpdGbJN8Fo
TiZrWNJjiuq6HmO9id21fDEQqoGAV2KRwm1UWe9lcD4HNv2derJO9NIXW2A770Lm
DfKmkv4WP6mAwuVJut1eXTqNae7GItcUmp/fyWuKl42nkc+VyxYKA+ezJPRtV4Vh
YsyjhAPFAOJ0ZDcwBCDgeZXt9ywQdA==
=kTi6
-----END PGP SIGNATURE-----

--Sig_/EKdMsrUTJFzR6Uee8ZDDKog--
