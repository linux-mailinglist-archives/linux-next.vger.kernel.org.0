Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F01D100C0B
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 20:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbfKRTOo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 14:14:44 -0500
Received: from foss.arm.com ([217.140.110.172]:38998 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726427AbfKRTOo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Nov 2019 14:14:44 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 492551FB;
        Mon, 18 Nov 2019 11:14:43 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD78E3F703;
        Mon, 18 Nov 2019 11:14:42 -0800 (PST)
Date:   Mon, 18 Nov 2019 19:14:40 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc-fixes
 tree
Message-ID: <20191118191440.GC43585@sirena.org.uk>
References: <20191113081035.7e7f9bc2@canb.auug.org.au>
 <20191115093410.4a7938f5@canb.auug.org.au>
 <20191118155852.GG9761@sirena.org.uk>
 <a0e6089b-b5a3-f9e3-fc2c-5b433553e154@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iFRdW5/EC4oqxDHL"
Content-Disposition: inline
In-Reply-To: <a0e6089b-b5a3-f9e3-fc2c-5b433553e154@linux.intel.com>
X-Cookie: Are we live or on tape?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2019 at 10:47:01AM -0600, Pierre-Louis Bossart wrote:
> On 11/18/19 9:58 AM, Mark Brown wrote:

> > I've reverted the commit, I was a bit disappointed that none of the
> > Intel people responded but I see you didn't CC Pierre who sent the
> > commit so he won't have seen your report - I missed that due to the CC
> > to Liam who was also in the chain.

> Sorry about that, the use of 'Fix' in the commit message might have misled
> Mark.
> If you CC: me and also CC: alsa-devel you should get an answer without
> delay. I only noticed the issue this morning with kbuild reports.

Yeah, sorry about that - like I say when I looked at the mail I saw the
CC to Liam and didn't twig that it was only to tree maintainers not to
commit authors.

--iFRdW5/EC4oqxDHL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3S7aAACgkQJNaLcl1U
h9BwxAf/e17p7s642jP6E7hud5WmF+tfxBQqnPMzbQZ7L6v/fcabcK4TDSZA86NM
WE0gLDFVIu5LbXX/U1x8niyRk2/IpSjWAgguMBxYZgsWfNFoLrLW31GM3t218i8F
fg0s+XzxlNgy3kmS0djVWV1Kh/yzSaHyKc+XtdyeLeP29SbIJ3HQAFCalLJB75Aa
rP/o5pn1KvcTPVW97LkTow1ckgIr8TLI4PIt4rxkBFV72KR41twi+VXdtAPm9R8O
tQq0HjnwygorXTNGZDfDZUtm5Go22yXDBPgagDVZI2n3qxX69Dxa5za088+abszE
alzOhXkMLP/RMU1+Iq1FrkD4E/CtvA==
=+9Eo
-----END PGP SIGNATURE-----

--iFRdW5/EC4oqxDHL--
