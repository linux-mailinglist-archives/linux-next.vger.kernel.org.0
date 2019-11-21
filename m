Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F65F10495C
	for <lists+linux-next@lfdr.de>; Thu, 21 Nov 2019 04:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbfKUD2i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Nov 2019 22:28:38 -0500
Received: from ozlabs.org ([203.11.71.1]:55439 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725819AbfKUD2i (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Nov 2019 22:28:38 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47JQ4x62H0z9sNx;
        Thu, 21 Nov 2019 14:28:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574306915;
        bh=Mvq90HaeaI0x9DRfRjhhop6y3CYj6tXKi2H4KwQK4jQ=;
        h=Date:From:To:Cc:Subject:From;
        b=HgFJWqMuaMVmRcsjKRSyNDBekV/0M7aoKlC15Vx4Gq5rcW8pMsHO9Xe+w/MQUcZgQ
         YdM8UhalBEJ903R9BKeaFJ5AyeOqCX0k8uXw3ttrt9OlBmIb5MY86txhwGFWa4TTqr
         6eP09ff50DaYCUGJI+TfpSJ9ShNhi5HQomDiRrcRc/8Wxd9X+jM/DgHhZYiqGlJ4TX
         hVLo7tm3zaCq2oQOzgBWL+B4q3nG9Gp7QyJDvCfPycwXej+qV4orBGfCpWuy5lWDDD
         k8p4As6Ae0VSB2D7BNVCc71JNlx0J9a4RdtUvq0UjtB50sLQ2rkkRSrs3PrpSp1qmQ
         ttz22/ySJdegg==
Date:   Thu, 21 Nov 2019 14:28:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "J. Bruce Fields" <bfields@fieldses.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chuck Lever <chuck.lever@oracle.com>
Subject: linux-next: manual merge of the tip tree with the nfsd tree
Message-ID: <20191121142833.2c9ffd62@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/244Syx9z7RddCIKTXoxFf7G";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/244Syx9z7RddCIKTXoxFf7G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  include/trace/events/rpcrdma.h

between commit:

  832b2cb95543 ("svcrdma: Improve DMA mapping trace points")

from the nfsd tree and commit:

  60fdad00827c ("ftrace: Rework event_create_dir()")

from the tip tree.

I fixed it up (I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/244Syx9z7RddCIKTXoxFf7G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3WBGEACgkQAVBC80lX
0Gxg/gf9FuUbl7pHHEJhCN5peXYPr5XMRqlu34WmdrYdS0nbtwX+wxz/TVs8rq4I
mqXPv7UNNSLhhQszinnd8ul8RJ884t3u7MNnE6oLbrHMdi89vNEchZuvo4sCsJpM
1oqz/5bsYyd0C/gE1d7c7jXWptJ1Gfu+MWwT4+Hr34XlFLZ+wJFILz4td+mmsNz+
tWFbPnthyV5AknC8X4o5o3/CDwmrPT57MYgT6osg5TaRvaUS8GyQ9XxmYmj408Ic
xENtwavJvWmjGbcVyWnSmTzgX4xdP3u+k0xMmqlQ2t8ZGWBkPP9DdpG7YpU0RTQV
4xxOkynbotQldvSx9QvGqmX9dMyv9Q==
=JM1c
-----END PGP SIGNATURE-----

--Sig_/244Syx9z7RddCIKTXoxFf7G--
