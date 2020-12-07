Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C902D0B50
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 08:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbgLGHtT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 02:49:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbgLGHtT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2020 02:49:19 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E26C0613D0;
        Sun,  6 Dec 2020 23:48:38 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqFmf3trSz9sVl;
        Mon,  7 Dec 2020 18:48:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607327314;
        bh=v1/uT/EAkZ4rCccEUB7lcW7rFuuW0zEjMNmXTPjH5Kg=;
        h=Date:From:To:Cc:Subject:From;
        b=tMcKVzQ9CE8iN/0sahFLXINWh1Y2SK+E8n9/gy8gwyl8f3Sd7ks5EfeedbBj+VORy
         MxLwFW7SEYvvrc6mIF64Br1xu7tBaydMwfPux2LhlY63dq48h8HU8SdWJlHPfED2Fb
         rCwxbHH3eVZBhE7D27jS/S8zBY83eIi6Eo57+sjQw5ByG7OOalRJo7lrI1g/RkN0Xi
         2bgNAMasDAhc1VJrC7GIIKQlOfhttJaCCEPjUpl1ZSkcBo6QQ0U7Fy4tyKvQf80RPy
         hev6UDkFTU6/2KEu75hswTJqb16mPpev/0mWebFziWfVIWRdPaVztSlDDkigJpTmkC
         OHJ/US4B+dRzQ==
Date:   Mon, 7 Dec 2020 18:48:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20201207184831.1c993806@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6NL+wahPRYqiDCs6Pt_.RRE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6NL+wahPRYqiDCs6Pt_.RRE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (htmldocs)
produced this warning:

kernel/trace/blktrace.c:1039: warning: Excess function parameter 'q' descri=
ption in 'blk_add_trace_rq_remap'

Introduced by commit

  a54895fa057c ("block: remove the request_queue to argument request based =
tracepoints")

--=20
Cheers,
Stephen Rothwell

--Sig_/6NL+wahPRYqiDCs6Pt_.RRE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/N3k8ACgkQAVBC80lX
0GyQrQgAgAtLnkwCVmXVPhCIfzFCu1qkdAkqDrHe3N6a4KGDmLgQFZnvEUcZHacz
ctFazxj/PNg5vsZUCTLvimvNoldXuk6zAvGNCyl3m04/IFD06cXro+tx8tOllQo0
a/b07kiZauSC8FCX8Axn2tYgxtlgGHBNabJtQ03G2GgPrQmwMnccD18P9ajyRMNA
t+ntYZ5BPlmNzpSD7RNeD5K2WHVUVomrlS7aPydZSVGybe9o8b7eGUA0w6fSa7dm
VAK3uUuk2NdAxy1X+Hd/05LUDfqLubLXh/ERIEhmt6VKoFvMPA9AvdSjC/GDh8tv
W/Goh18Uv4LWwdAa7VQi+k/knxYzSg==
=UDA9
-----END PGP SIGNATURE-----

--Sig_/6NL+wahPRYqiDCs6Pt_.RRE--
