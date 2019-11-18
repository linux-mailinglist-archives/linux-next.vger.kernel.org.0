Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8825A1008CE
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 16:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbfKRP6z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 10:58:55 -0500
Received: from foss.arm.com ([217.140.110.172]:36374 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726654AbfKRP6z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Nov 2019 10:58:55 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA4A0DA7;
        Mon, 18 Nov 2019 07:58:54 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 383F93F703;
        Mon, 18 Nov 2019 07:58:54 -0800 (PST)
Date:   Mon, 18 Nov 2019 15:58:52 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc-fixes
 tree
Message-ID: <20191118155852.GG9761@sirena.org.uk>
References: <20191113081035.7e7f9bc2@canb.auug.org.au>
 <20191115093410.4a7938f5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VACxsDaSTfeluoxK"
Content-Disposition: inline
In-Reply-To: <20191115093410.4a7938f5@canb.auug.org.au>
X-Cookie: no maintenance:
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--VACxsDaSTfeluoxK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 15, 2019 at 09:34:10AM +1100, Stephen Rothwell wrote:
> On Wed, 13 Nov 2019 08:10:35 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > Caused by commit

> >   1d3e9077307f ("ASoC: SOF: Intel: Fix CFL and CML FW nocodec binary names.")

> > I have reverted that commit for today.

> I am still reverting that commit.

I've reverted the commit, I was a bit disappointed that none of the
Intel people responded but I see you didn't CC Pierre who sent the
commit so he won't have seen your report - I missed that due to the CC
to Liam who was also in the chain.

--VACxsDaSTfeluoxK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3Sv7sACgkQJNaLcl1U
h9DHngf+Lk/nMXn9Ke2ii81Adts6Wz5RxLcXRnq8Sne4aNyn6ThYRKQFasDP2foa
GnaBqv8VpdvJnG41LpmYylfzq2I1cM2p3zNNsxwjJbCPOUbJNFIOVFYTQTUnl5jU
h10fighSuVVSqRP8TlyWvqOjivOvO9diMtMvQiaurLUz1uRsExBAWravvwvrd+Jq
KmNrB1kX/D7iOWN4WSwzXkX29cG8q9NdLlUC16Dk5Ube9RBKmBIC0b7FG3ueXFTm
tz1ppAjO1O1VqnBk8731nlZhT4f9U+xkDTL0yP5FhZdGTDQzcrER1vallW0lYcTU
Pve+ggG6HE7YykLeSrlwSX7FZ6OJaQ==
=812C
-----END PGP SIGNATURE-----

--VACxsDaSTfeluoxK--
