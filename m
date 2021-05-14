Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C380380207
	for <lists+linux-next@lfdr.de>; Fri, 14 May 2021 04:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbhENCdm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 May 2021 22:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhENCdl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 May 2021 22:33:41 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E65C2C061574;
        Thu, 13 May 2021 19:32:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FhCGt22r5z9sWk;
        Fri, 14 May 2021 12:32:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620959548;
        bh=wEsq/gNmbpD/b6nmfvJT2+euaI0BOepkB7VQ3rFAxjY=;
        h=Date:From:To:Cc:Subject:From;
        b=aNmGsa8gdZrNqPlk9M3VhRD684BHuXsX6XJlh/+RUHhSc+VmhhgW9rjPp80Rigwps
         OLITBsFtQI0t9YbO6tjPSq6hWNAjesMtXzNmfdc5khHafU2MqJmjTdbF5a7YLeXW5V
         uiE1VyeINlrAYZ9DUahSUDviYW/ct2WUxTEHbP5QRXeTaWl4SI+BayGkRvnTiotYpb
         Yl8lBw4Na80cSql1KxqOULyyE5qcGekCJW93lnzrluOA8MsN269YEbnFN+l7dgaC0z
         p5dgZHk4wgT8C/OJ400o9jHOMRZK3AIzeEXJuRiTwA7dQ8FQB6AfeORhqUOY+ExLNU
         hLHKp7HZeHNzQ==
Date:   Fri, 14 May 2021 12:32:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Scott Wood <oss@buserror.net>, Christoph Hellwig <hch@lst.de>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        1394 <linux1394-devel@lists.sourceforge.net>,
        Theodore Ts'o <tytso@mit.edu>,
        Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: linux-next: removed trees
Message-ID: <20210514123221.7c21393f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//ZBZsTOrBVa24j=4YJf1Ka2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//ZBZsTOrBVa24j=4YJf1Ka2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following tree have been removed form linux-next because they have
not been updated in more than a year.  If you want a tree reinstated,
just let me know.

fbdev
fsl
generic-ioremap
ieee1394
  this contains the single commit
	67f8e65e4fc1 firewire: net: remove set but not used variable 'guid'
random
realtek
thermal-rzhang
thermal-soc
y2038
zx2c4

--=20
Cheers,
Stephen Rothwell

--Sig_//ZBZsTOrBVa24j=4YJf1Ka2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCd4TUACgkQAVBC80lX
0GwJsQf/TLLwsZGHoWiRtnRa6CuE4kbsToeqV8skczSRsZ5OJVlirrKahGw8liUX
YXrr1mdCFlfTwBIcVB+EXfQy+AKOToJzX6u987Sdrm0OylVW65eWIEiEkWDCnrk5
f2z1HyNQwfwGrXz5Eamq5+B78Kmxgmx5OyNfjf6JaWCGGJU7MdP8AhCt01FK4yGK
GoLhVbZkswLcI26FE0It1RoKpbm/iao9iXc24hwgw0UMh8GlMJPwQ6OT6tblSBTT
828gUu/h4EgbSabMBPLZRoIiSd2pDy0Nzn9QVMyDT68jsaWxSV1jSjoviOj2vOe1
zZ3JQZdWo6uVXVSleJzWWykGR3qaYg==
=xOi6
-----END PGP SIGNATURE-----

--Sig_//ZBZsTOrBVa24j=4YJf1Ka2--
