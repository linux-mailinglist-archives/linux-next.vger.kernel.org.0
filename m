Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73BD02CD075
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 08:39:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbgLCHi3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 02:38:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727824AbgLCHi3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2020 02:38:29 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B5CC061A4D;
        Wed,  2 Dec 2020 23:37:48 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cmnk14Bmxz9s0b;
        Thu,  3 Dec 2020 18:37:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606981065;
        bh=+EOcsnQxc+vqRhVMEM7j8+g+/h7CmdqUmSfgMSF1uuw=;
        h=Date:From:To:Cc:Subject:From;
        b=CIqdkLuH2wxvF7+lVhaabWXMNAV2hDpRqt3AClvmWPxJv78fX0+qwpPXfj0xQLem7
         UbXThKl4sZ/xcUR2IMKGFT+nlnYK1/i+1RNUTCdorVcpuY4fIbni9pD9CBBeEWbb5C
         yOeKxTb3y6/qtNlkxfemUnlVv8IA83AjiIOrZHdh1oCj9r/toBUxkfQfewzuFyUqjt
         AjzIy0W9lctcI7r2Rd3SvaVj9Y41yBmbcwkHztuHJlxHHb7jD/zpki0IxcjYG1zkee
         GoGNxdnDRVdRX/PLrJOdyXlIYiN/rPVC+NFZdjkLKBlKwVYFPusg+HcIT9yYEzeonm
         Lr+8nihM/YSTA==
Date:   Thu, 3 Dec 2020 18:37:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20201203183740.1a1054f4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dJoK74AiVlVDhREeCdy0NdI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dJoK74AiVlVDhREeCdy0NdI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (htmldocs)
produced this warning:

fs/block_dev.c:1067: warning: Excess function parameter 'whole' description=
 in 'bd_abort_claiming'

Introduced by commit

  37c3fc9abb25 ("block: simplify the block device claiming interface")

--=20
Cheers,
Stephen Rothwell

--Sig_/dJoK74AiVlVDhREeCdy0NdI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/IlcQACgkQAVBC80lX
0GzR3wf+P4XKEAr647BIdxtQXz4rBm1mPK0PGnKJseyO3CCDVHtecyw01HO6vjAc
XqOKQXKzbzVD+r0rJ8CnV0qmpvHdLWM8zewVebEBDJ/LzPwWr0VNKTUP66xXXmV9
RIpFEoMJX70VJXyd9AbWaqR6vknNEtmNA5k0n7zxDHABIOfolFl0lIfcxtaGeUs9
iq6nuWbb1WXnLLEe6wUXAUk74+gFKo3xrY6nVDuoAVSuQyoSbOYA7ftjLW92bzjd
rt66dXdPiprPuk2GXqD6cecps1H7yVi2H+ByWbxoqq1jFywr838/lWNTgC+4gbG6
8oCXfdm/wIO1Imes0X8AzJAeNSos2g==
=2gtz
-----END PGP SIGNATURE-----

--Sig_/dJoK74AiVlVDhREeCdy0NdI--
