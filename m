Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 527A42D5880
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 11:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388987AbgLJKqb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 05:46:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731564AbgLJKqX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Dec 2020 05:46:23 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A731C0613CF;
        Thu, 10 Dec 2020 02:45:41 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cs9YZ72LZz9sW8;
        Thu, 10 Dec 2020 21:45:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607597139;
        bh=SRCtUPxmDZz5N5qs3iTMAxzu7u+AEyNrFQ7TsS27s+k=;
        h=Date:From:To:Cc:Subject:From;
        b=OepISQ36brP/TLX4lmqNlzmwYx7JizdupLi203ImK+l0WZstKferpgp/VM/5Wj6sF
         kZ9j+lTm5SnNd/kAEui4IPw9dzFTj63sjdTlqGezAaE1txe9xGnidbO6S0eVSH7mN3
         AWy1NUYkCieQ3G9gLVFuN4v80repGPHfTLZqGq0a7dFDR0Wc/iV8ZkNzGb3nfF80Sg
         oyhCq0XdPkA18cORybAd5I48M4m1hzLLmBRc6X3nWxggXZg6snd4DcBhLm7v7W+Re5
         2YT2HIfW3ACVu4ohRFXSnkLCsx0CKcJW+zBViX0e6Tyvo2vpxO5V1JdwT0HFe4+Q8f
         PWgjQd1+dRAgg==
Date:   Thu, 10 Dec 2020 21:45:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the cifs tree
Message-ID: <20201210214537.229c7ad9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kacp3d.GYeLE8kuU0p6bn4e";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Kacp3d.GYeLE8kuU0p6bn4e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  7e9c48d305d5 ("cifs: remove the devname argument to cifs_compose_mount_op=
tions")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/Kacp3d.GYeLE8kuU0p6bn4e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/R/FEACgkQAVBC80lX
0GyCSAf9GWLs8eIZu+7fhvOjZ31EklST8MOrF4U3sMGXDNwbc1R4CPhSDTRaRO4c
W3VL6KcCanVOtjpcjtJoCgs8lZs/9mdb+5mxcM+7LdDz8ii/npfLwxIEeLC/n1pz
TUMmrhBKfeF9elRy8axR06NvWm1P4TWoCWLvPXaeHu70ihY6zfns9gWsXoi/+zLK
7R+mXd/xNjV3ebrtqX5qq12pcgOpfuKqMWG+nShDqffNhKBhbOHxqJDDPfoGq17H
f+Q+O9EUK+KRJvWDqDYy4hpdKZchYUt2cQUSYmZpGQBUP2hYDAX1TuYm3MpJgS7K
RQmWEoT2CvWU0OaozFGcd0bPsvdP8g==
=0BJB
-----END PGP SIGNATURE-----

--Sig_/Kacp3d.GYeLE8kuU0p6bn4e--
