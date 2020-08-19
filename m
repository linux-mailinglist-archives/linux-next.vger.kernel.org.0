Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5989E24A8F0
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 00:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgHSWPL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Aug 2020 18:15:11 -0400
Received: from ozlabs.org ([203.11.71.1]:50469 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbgHSWPL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 Aug 2020 18:15:11 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BX2CJ4HS0z9sRK;
        Thu, 20 Aug 2020 08:15:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597875308;
        bh=nX2hdTvfs4aPcM/yy7/DxwQEg+DUf2RDrImd5dGnL2o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WAP2Rt5B1mO19s+zSkyJHQXTE9HuXY2L1jhSPDbDAeLa53OWh4lEZEvgN87r2mSRX
         nd/kkDteslImgkBsSv3YZ1iYQzO9L4TYdsKpHm1anhDgLEqwNMFRkVW2J+QUiRCHFb
         fQSHfT8t6KT/T5Bto7MpB3fHiiQzaqWjzW+Lg11/tipWFWbUlZdB2hsow6lgmocuBf
         YmC4YW5cL2LrbmbboDOsNvuxhjic04qx7Mtx7v+W36trAFsq9eWGCjt8L5m0lm09DJ
         NezHsnJRxfBO/1FPgGLwYIEob9mqWQoJydI4sPVpxpedE/SwLvSztAH/ep6f05n0km
         nB4i3vI/E12yw==
Date:   Thu, 20 Aug 2020 08:15:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Nishanth Menon <nm@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, <linux-next@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: Request: Add Transition TI Tree to linux-next
Message-ID: <20200820081507.04eb71a0@canb.auug.org.au>
In-Reply-To: <20200819121137.4v3rfabbrleohoc7@akan>
References: <20200819121137.4v3rfabbrleohoc7@akan>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.1_2w5Ty7Koy+qYv4=GcUea";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.1_2w5Ty7Koy+qYv4=GcUea
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 19 Aug 2020 07:11:37 -0500 Nishanth Menon <nm@ti.com> wrote:
>=20
> Could you add my ti-k3-next branch to linux-next? You can find it
> here:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux.git#ti-k3-next
>=20
> NOTE: This tree will eventually supersede Tero's tree[1] which is
> currently in linux-next.

Added from today.  I have called it ti-k3-new for now.

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

--Sig_/.1_2w5Ty7Koy+qYv4=GcUea
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl89pGsACgkQAVBC80lX
0GwDfwf9FvyV1EGUpJlpgzJ+Ok3i1cxqiUq2XkogDZlAwrFd/7I/YcpxwBtIj3AS
AuszFQhRsgeCIgPFuGU+B/O7SaCky+XrCk+yly7Ibv2B2eDEqIRw0Plj6YfPCyfc
EBWg4b8kO+SUPemIGZM8LyPzWkunEgCD9jMYoG9I6S6wZ2COuuKMRNBedj/EduSS
r20pLXWS48I4uj/MzTMLxmysG/SFCCKctugXYBaDNQRvGvmP4G1lnbbdeRAGzfHQ
8jdBt0UOfIUOgZGxGmwU1rT/3swnUO1OwwN97dKs/EM3WvSvY0xyF1Wkvz1FJ/NT
wW5Beu0CDq34qfnFpPYEQDklOSmz1g==
=3/5v
-----END PGP SIGNATURE-----

--Sig_/.1_2w5Ty7Koy+qYv4=GcUea--
