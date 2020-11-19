Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30CA32B9C43
	for <lists+linux-next@lfdr.de>; Thu, 19 Nov 2020 21:51:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgKSUuw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Nov 2020 15:50:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgKSUuw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Nov 2020 15:50:52 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6790C0613CF;
        Thu, 19 Nov 2020 12:50:51 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CcWzX2xh2z9sVH;
        Fri, 20 Nov 2020 07:50:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605819048;
        bh=ancD0vDXsDof1Nrduu4iULpz4Ohy0ZPow08RTMYCDjc=;
        h=Date:From:To:Cc:Subject:From;
        b=H12YLo3M5n4KAE3IWyeEXzzFC6d1kfW+87Q4ryvkZtHR0bt6ry5PXQnngqT0hK0fg
         0boFDuCPE1cU5Q+EFM4ms9uK1WIsG1gFhfY8knhPkRo2eNzGyUmMtg/WZ3aEDocfdJ
         dXhx3E3kMFl1e9KLqwwot8kKRXNAMkqAusSmROvdc+QizoeP7uSvy0hcYMgj3InCQk
         JJg0iX7/z7v7P37qhilVEjFD7qapKxK78TebMn0xIfRzx9ul8xFrDfmOeE/rftqe89
         yOnI89UR6Y2ZdsbgvvRkune8Xjp6mNtRQAjTisX0ZZOz22ko7uuMGH8vGboAjpiUFC
         Jf8Arc39QpaNA==
Date:   Fri, 20 Nov 2020 07:50:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dominique Martinet <asmadeus@codewreck.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the v9fs tree
Message-ID: <20201120075047.7646f817@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2PmK_7c1mTPGAUn4yEDGE/6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2PmK_7c1mTPGAUn4yEDGE/6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  5bfe97d7382b ("9p: Fix writeback fid incorrectly being attached to dentry=
")

Fixes tag

  Fixes: 6636b6dcc3db ("fs/9p: track open fids")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

Maybe you meant

Fixes: 6636b6dcc3db ("9p: add refcount to p9_fid struct")

or

Fixes: 987a64850996 ("fs/9p: track open fids")

--=20
Cheers,
Stephen Rothwell

--Sig_/2PmK_7c1mTPGAUn4yEDGE/6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+22qcACgkQAVBC80lX
0Gxe4Qf+NDseKslueXWXJoCkzj3IYlcnuldHEYoTxLDVeILFejEhnpUzQlwqHmbH
8yfey4DtowQFtmqYp7PufWo3XWls7mFqVpCtI80WydOzjAV/UniR5m2S2rz2mRso
oAhB4IRMJPmwHVPs5T764Ufx4hWvOKe6y31XYwh9wF4Re2ZdWY1SykzGSgQdmshH
cBcaRyGqUwNFhHSE7x/5kGR4XYmOdc27PE8VBzy/8LiprHcfZZKGP89riXLsw8B5
7xUdhxBQPycik9Mt+m5JwjGZA4eVjqsvKCJdyfrJqop06KXwnJhIDQghAgVeU4Cg
kkC1p5vLV9ga2igX7eZSSHUx9gv3dg==
=DjhC
-----END PGP SIGNATURE-----

--Sig_/2PmK_7c1mTPGAUn4yEDGE/6--
