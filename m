Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1072066EE
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 00:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388033AbgFWWJ4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Jun 2020 18:09:56 -0400
Received: from ozlabs.org ([203.11.71.1]:59913 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387840AbgFWWJ4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Jun 2020 18:09:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49s0nY6J7jz9sRR;
        Wed, 24 Jun 2020 08:09:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592950194;
        bh=lTqWkWzEvGsClGboMxdSrWRtqoctWYdl9TPvvCqLfZw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PEuhjXR+BLyxsOpbpi1jHeAEjgIGK5UW4QlHzslsJUBAbEdkAVAeHkydwwVYvS+MQ
         ks5gMEC6LbTfk7hZCGOLJmYsNBn5/s8BX0+InrhhRpmren39BOY11lc4DawJQSMRGK
         aid4bm4fJE4VEd3C2Mg6oeGLUzwr5eCk89yzM4BxmHYRMoYVI5Uux+gSKW/7MY0jlG
         9pkQY0qt/Id1OBfXovQF2N3COSqAO3P/1pjHLV3qJnqSmoMlf8B4jxQmK9/yg9D+BQ
         K/4N97/uBux4tnl1yW+9kIs7GxdnD6wMOht/4x4qPkW3f/kOXOo460aqRq2Ny++hQL
         wPDTCHlDehH4Q==
Date:   Wed, 24 Jun 2020 08:09:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Switching dmaengine tree to kernel.org
Message-ID: <20200624080952.093d562c@canb.auug.org.au>
In-Reply-To: <20200623144313.GS2324254@vkoul-mobl>
References: <20200623144313.GS2324254@vkoul-mobl>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s3=nkInVYc8lAAGNaBnOH5C";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/s3=nkInVYc8lAAGNaBnOH5C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

On Tue, 23 Jun 2020 20:13:13 +0530 Vinod Koul <vkoul@kernel.org> wrote:
>
> I have switched dmaengine tree to kernel.org [1], please update your
> database to new tree which can be found at [2]
>=20
> [1]: https://lore.kernel.org/dmaengine/20200623143729.781403-1-vkoul@kern=
el.org/
> [2]: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git

OK, done.  I also renamed them from slave-dma{,-fixes} to dmaengine{,-fixes=
).

--=20
Cheers,
Stephen Rothwell

--Sig_/s3=nkInVYc8lAAGNaBnOH5C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7yfbAACgkQAVBC80lX
0GweNggAjshCfmtDZPPGM+Z8Wh0XV8CClZNIq7i66hCNt/GaF9Chl5qnJ0P9nnKv
KS504Abh9S0fGsHFnj+P6GgHxXU/g5x2VCzribtxTIhBqZ138SIb2PIRGU9hWeJ0
xBhKaGuG9iandO0ZV/MTSbCEFXkgu9k4WjK1hW2SdyotbXzGKccV6T/x/Z8rbEm0
wqG1g1xAJwgBmLmXxqYO6Ug8xKWz+EOr4zfOFctal6pYQDoK9JXaMKb83lRopQLs
NgFT2eaDC4rz5UM3TGp9/wiHVpKCzrtHLXCeIlOG0r2YJAYDfON7PTuLl7gzez6g
1bTRPGeWuZl7Sn7blHZ9/TDcE3niRg==
=GZe2
-----END PGP SIGNATURE-----

--Sig_/s3=nkInVYc8lAAGNaBnOH5C--
