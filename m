Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE5B125493
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2019 22:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbfLRV0C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Dec 2019 16:26:02 -0500
Received: from ozlabs.org ([203.11.71.1]:43423 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725991AbfLRV0C (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Dec 2019 16:26:02 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47dSjg0BpLz9sNH;
        Thu, 19 Dec 2019 08:25:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576704360;
        bh=GOIYpn/ab2CPptA+x9ffjyx71HgDPJ19mxjxlTi0ve0=;
        h=Date:From:To:Cc:Subject:From;
        b=QmCIip7N4XCFSbPlYwcVfH2oeIkgRfC0YzNBDiZfV9Le/3Gv6UY5pf/6BZy+c4SHr
         SeoKEe6DrLw7YvFW14V+t4tdgbDj7wDoSFdOXlTLHg5/zdNFXptoYc8rfJmg55mWqC
         0hzoAHViS5smBRKKdqODV/qGzFM9C31JVs6LtAG+QoHsR+SQFq48huKXg0ot+MCc2U
         nJtZwN40WWITcOJvTf3MypMnjdPXchJgaG1vK6PcMUkSfAR5r4LDeiy+aguXdSKAO5
         On377RpngMcnn/RUuDRMITlAp3GWoj+uOI7BTOYJUZhj4VdbtXnLAnaXlE28vr1Cfl
         IJZcwBWDlsMwg==
Date:   Thu, 19 Dec 2019 08:25:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guchun Chen <guchun.chen@amd.com>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20191219082557.16092126@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ktdcr=UUjQSm5MpHlWZXq4U";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ktdcr=UUjQSm5MpHlWZXq4U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  caa01659028a ("drm/amdgpu: move umc offset to one new header file for Arc=
turus")

Fixes tag

  Fixes: 9686563c4c42 drm/amdgpu: Added RAS UMC error query support for Arc=
turus

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: 4cf781c24c3b ("drm/amdgpu: Added RAS UMC error query support for Arc=
turus")

Also, please keep all the tags together at the end of the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ktdcr=UUjQSm5MpHlWZXq4U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl36mWUACgkQAVBC80lX
0GzVfAf9H6WAfaQX5WeWp/V4bwhmV0z802JF5zuaL9K47JbPzesPP6GpA3TvtQ0O
ZlKNUH2DORyI0hr6WIuTmpn1SsY8EFnrKPDuyOMD6ZT9h2Ya5WmCU2dY8lQc/KXs
sD0haB5YE+qd9k9Pf9fVHkATNKLghrbYgp2utZd7+n9G97B++FbSRXZ40pJNOz1y
YT+YN9xkook9P82dNOaTi+3Q2Su7LfcifcLB01oy59xyMh5QnWBTT9Jn5+AcVw6s
rfd1x0PBo2nsMth5E6IBXZu4FBSfmjArxjzKENN8/Ou5PDKC7qzA2nFFAR9L0Vki
vWeDvtt/lP+0d1jjN2pVlmUUH7XJYQ==
=DKII
-----END PGP SIGNATURE-----

--Sig_/Ktdcr=UUjQSm5MpHlWZXq4U--
