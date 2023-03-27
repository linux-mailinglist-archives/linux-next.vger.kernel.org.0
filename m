Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 623056C9963
	for <lists+linux-next@lfdr.de>; Mon, 27 Mar 2023 03:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjC0BsK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 26 Mar 2023 21:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjC0BsK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 26 Mar 2023 21:48:10 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A25010EF
        for <linux-next@vger.kernel.org>; Sun, 26 Mar 2023 18:48:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4PlG125YCjz4x1d;
        Mon, 27 Mar 2023 12:48:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1679881686;
        bh=iHjGcNbrCHPG/pJ8yBJ2eQ11QHFMaHSeInPFnwD/7q8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lL7vyBXfCIZus0gt8v6XmC4VxF/WnSClauaFTbkRzbOCCDDuyjGt2d68FnGjE61Bf
         wVNCbKeARtUhteQFHnxubJMeMjCLCpD+Zn9EtDka3HVU/q1uDg8CeKpbDIPTGIMgho
         KS2QS8X0C94wEie13HQarUe7jDNoYiRdwqyt0CdAoViLXmzZIEjuMNhpn9mm2P+j95
         IRFM5aye2e7ONYixvIcsWQMkl1sxFQbhAUmmRa+0vHg2MfBljL/Gow1gfY0npPkw5J
         zWkIi6uq9Q54eMCOl6x4NWDExk+C+yAzFIhLLff5e9JY2vTZQXWcwJy94nh+hMg5X7
         SiHFHe2EBRvJw==
Date:   Mon, 27 Mar 2023 12:48:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Eric Van Hensbergen <ericvh@kernel.org>
Cc:     v9fs-developer@lists.sourceforge.net, linux-next@vger.kernel.org
Subject: Re: Add v9fs#fixes/next branch to linux-next pending-fixes
Message-ID: <20230327124805.3ca4f3cc@canb.auug.org.au>
In-Reply-To: <ZCDsKfJ9fU6cwiZM@7e9e31583646>
References: <ZCDsKfJ9fU6cwiZM@7e9e31583646>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=5MWFchnVeAY5Sl_dFPTU8D";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=5MWFchnVeAY5Sl_dFPTU8D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Mon, 27 Mar 2023 01:06:49 +0000 Eric Van Hensbergen <ericvh@kernel.org> =
wrote:
>
> Could we get the fixes/next branch of my v9fs tree=20
> (https://git.kernel.org/pub/scm/linux/kernel/git/ericvh/v9fs.git/log/?h=
=3Dfixes/next)
> added to linux-next pending-fixes branch?  Intent is to use that for
> pending fixes that are reviewed, tested, and signed-off but intend to
> send to Linus before the next merge window.  I'll continue to use
> ericvh/for-next for features that are intended for the next merge
> window.

Added from tomorrow.

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

--Sig_/=5MWFchnVeAY5Sl_dFPTU8D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmQg9dUACgkQAVBC80lX
0Gz2Owf+MeybU3Qb8AJgxAKfmDBb1EwLmsvC4EQ3bE/wXjpOd3V5KbSKYU30ENCv
fzV7F+wlLB3AJu2g6t4GVTrV8hoQjpsfdFigOQ6zcX66fm8e+lPWlsFK3dDdOacE
j1rSThJ7Y25LJUE2ODjyK4Au9x42WVnfmqMBL87TGRC/Zm5ohvFOlUmqsqmRo003
ZGjt0LBCRYr4omxpdbcFZ1iuA5vfUJQQsPIjQIaDm4vAIakLzdnzieJon4nr85mn
fgSkPLVOCdw2sQtPvZa6POP72I5D1m2kOjSnC5x55PJ5deSW/8HPcrx4yhz5fF3x
78stklLGZEOqdzoADh8C6JOGswb81w==
=XZK1
-----END PGP SIGNATURE-----

--Sig_/=5MWFchnVeAY5Sl_dFPTU8D--
