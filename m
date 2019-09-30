Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89F75C2198
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2019 15:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731035AbfI3NOp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Sep 2019 09:14:45 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40481 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726314AbfI3NOp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Sep 2019 09:14:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46hjYD40R3z9s00;
        Mon, 30 Sep 2019 23:14:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1569849281;
        bh=yB8msfNke7AKbMgQjP8+jH3mdOiOuN7lBcpyNctMOGM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NEp7JEfPp+ZCKm3b1wUG1W5cDXxF93TLx+8rDqmS1codPvwARVOaN5DDyLWXiAWrT
         o12pGswJV12lybG9A5PePDDDIR2fPAl7F09ibZWZACvPFBtFvAn4PQwTfJOPgo8tWY
         CXjKdi6Va718Tss9OgtXhRy3hNoQACFJkCpDJmN5Bn+hzfqnnx2kizGRKo1oq+is80
         TJNtsnJKcdevQNm8+vuLa88L/GH2yGCPhFCc2HGyIx5stL4EfSpDw9JHedHJD+ijXm
         NzwPlhuE6Wm5pssKmAhflV57KawO7MNd6Osf8D7ufqr5ujJuD3afccXd8zx279b2n4
         gx6NjSrgQFG2A==
Date:   Mon, 30 Sep 2019 23:14:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Gao Xiang <hsiangkao@aol.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-erofs@lists.ozlabs.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-next@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miao Xie <miaoxie@huawei.com>,
        Gao Xiang <gaoxiang25@huawei.com>
Subject: Re: erofs -next tree inclusion request
Message-ID: <20190930231439.37295a14@canb.auug.org.au>
In-Reply-To: <20190919143722.GA5363@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20190919120110.GA48697@architecture4>
        <20190919121739.GG3642@sirena.co.uk>
        <20190919122328.GA82662@architecture4>
        <20190919143722.GA5363@hsiangkao-HP-ZHAN-66-Pro-G1>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cNqd5/Q_VFmQ_+f+Dt5kCcN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cNqd5/Q_VFmQ_+f+Dt5kCcN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Gao,

On Thu, 19 Sep 2019 22:37:22 +0800 Gao Xiang <hsiangkao@aol.com> wrote:
>
> The fixes only -fixes branch is
> git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git fixes

I have added this from tomorrow (sorry for the drop out today).

Which address(es) should I use as your contact address(es)?

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/cNqd5/Q_VFmQ_+f+Dt5kCcN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2R/78ACgkQAVBC80lX
0GzWAgf/dMM/gcid6gsfajlbbFg/vesZzJ4G8ToYTWy5U4m8IfuJwh8wDyuJcyYl
U9sDmYSt5aW/uo4S/ZyOJjAEqf3+1aZIDpV0Xkmj9gVBMhDFzNVb8fYZev5qECrb
xsJ3Ef3+jSYer4pHGxP+fOhoxIiTMqNAUFvKLAMl4C0jluB+Tt1yKYDGI7+aYYBY
dMl3CcynSJUJei7hHVxwT8mi+FSKcjRIR+ykwui+UmSn4KuhBUStWk1TnnUxXZak
1IEvGtUFXIQETFpn6SeRaPlhOmLP0fogWuvYEF+To9LBsUjwnF6CBkf/z51AIkeO
+WXrSZIo8DIuyzc5cEoEvoBTjJXcnQ==
=Voot
-----END PGP SIGNATURE-----

--Sig_/cNqd5/Q_VFmQ_+f+Dt5kCcN--
