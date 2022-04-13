Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85DF54FEBBF
	for <lists+linux-next@lfdr.de>; Wed, 13 Apr 2022 02:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiDMAHN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Apr 2022 20:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiDMAHM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Apr 2022 20:07:12 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A151DF76;
        Tue, 12 Apr 2022 17:04:53 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4KdNBV0871z4xLQ;
        Wed, 13 Apr 2022 10:04:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1649808291;
        bh=7lQG00YSg34AKkogy2Qw7IUgKJD9gWQAoWKgikf9JzA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LKGKpraDWC3yl2TfBwTh++vr+vzBx+TGAf4G/Ctj8MtiOP3aM6LJDFWJL/8FZbWAy
         DrhaOZ/xKvK+qbaSe083E5dE19KPDG+MqIsWPtoTs4K0vLc/0uAWWcjc6iPrPvU7+G
         qK7pnmQvQEta3tMqDxsRaBGmzrbAv9nwaKydlUiM0ZLaz1CLFFRO9Ze9WmYaXg/cnm
         qQXOxjw9/dPyKy1kA46YtsF+QgQswjG4XkygXDlIJgTtDZGsUONZzRbhlUI5Dt9aHe
         Xl2732PPs7+vVvQBvYVwO/vMnFsKCt9anORNmgmY27b+fxpR2mv1r2cKHrptEHNRIc
         w9qwTIyBa+jPQ==
Date:   Wed, 13 Apr 2022 10:04:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20220413100448.6f5f4de7@canb.auug.org.au>
In-Reply-To: <20220406155030.0dacf051@canb.auug.org.au>
References: <20220406155030.0dacf051@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EmSSdTRYGSuQg54z/e58xqx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EmSSdTRYGSuQg54z/e58xqx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 6 Apr 2022 15:50:30 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> include/drm/ttm/ttm_resource.h:226: warning: Function parameter or member=
 'pos' not described in 'ttm_lru_bulk_move'
>=20
> Introduced by commit
>=20
>   b0e2c9ea5afc ("drm/ttm: allow bulk moves for all domains")

This warning is now produced by the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/EmSSdTRYGSuQg54z/e58xqx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJWE6AACgkQAVBC80lX
0Gzpegf/TCMEUFcREDGz2XVAG+LUNZZeAbrXA0CuCvA0CNVH3UvHHCWOIsMo2TVT
qNEITzeT6MaDcWospiMMhWLmOyh5eiTCz53g6GFL0LPFrY9DSyVRDIjbCSjiKoJT
Zx2A4hsJANTyh5tEp8Tmvx5FtcOERaGd45r7bZqL0iI6EmrtmOvRj/kggeSHFsg1
PFCObFDUhX3kxjyarAxoHylZE9lScoDarvGTVjWNiSASBRl49YVtBi7UQeQ5NUjU
u6OT0Nk0+5RlDIOaWuz6I2AhKTlPtQ2UxIuZTDjKuf0mu0qiQjP1DG/mS/gXCUi0
KO6mdTv3ZvlmET//IZ1pxu6SoFS62Q==
=jQA3
-----END PGP SIGNATURE-----

--Sig_/EmSSdTRYGSuQg54z/e58xqx--
