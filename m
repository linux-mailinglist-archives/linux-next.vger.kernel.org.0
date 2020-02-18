Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 968A1162588
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2020 12:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgBRLbT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Feb 2020 06:31:19 -0500
Received: from foss.arm.com ([217.140.110.172]:50332 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726338AbgBRLbT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Feb 2020 06:31:19 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E82FC1FB;
        Tue, 18 Feb 2020 03:31:18 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 689AA3F703;
        Tue, 18 Feb 2020 03:31:18 -0800 (PST)
Date:   Tue, 18 Feb 2020 11:31:16 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>,
        patches@opensource.cirrus.com, geert@linux-m68k.org
Subject: Re: linux-next: Tree for Feb 18 (sound/soc/codecs/wm5110.c)
Message-ID: <20200218113116.GA4232@sirena.org.uk>
References: <20200218152853.67e2482a@canb.auug.org.au>
 <89ef264f-12c9-ccb0-5cdd-ee5f70a469dd@infradead.org>
 <c2273472-18af-e206-c942-fd460e0d192c@infradead.org>
 <20200218100959.GD108283@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
In-Reply-To: <20200218100959.GD108283@ediswmail.ad.cirrus.com>
X-Cookie: No alcohol, dogs or horses.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 18, 2020 at 10:09:59AM +0000, Charles Keepax wrote:

> 1) We could update the machine drivers to do an imply as well,
> like the changes to SND_SOC_ALL_CODECS. I think this will
> generally work but doesn't really feel right as you can end up with
> the machine driver built without the CODEC.

Yes, that's not helpful.

> 2) We could update the machine drivers to a depends on and make
> the CODEC symbols manually selectable. I guess this also has the
> advantages that it would be necessary for the simple card stuff
> that seems to be everyones first choice for machine drivers these
> days.

That's not good, it means people have to know exactly what CODECs and
DAIs are on their board to even see the config option.

> Mark do you have any strong feelings on this I am leaning towards
> 2?

Why not just continue adding the relevant dependencies to the machine
drivers like we've always done?

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5LywEACgkQJNaLcl1U
h9AQnAf+IcyipTOOekTpGzSP0PublqszzzDvjqI/SqswbhVz0Fb5VezH/l0EzXGp
sWyeL2oNPFybvE8Xd9LbEAI66gVLOSdF8gMWW8yjcbdYyg5XdnTpqYXh8N2yN9oR
M9i+fw5hHShLfI068Qo8lyFA79zYFy8gV9v/nAoOiDEXDZvIwVvk2/xVY4FGDSZo
W+v/vFhzwVjuTdJv27MeL/x+VSTu9iavIQK1oRGWyrQabWqcsk6+IAmGlUquCIk1
4j94Yv48rL/gZ1xGw2VeExKJjWFaRxEfIX97UTRl9nl8gt9xk5+V7E0qH3Dmj/lO
PI5UAs5PnWPsuP4IlEmz3pmmuGwvTw==
=r3LA
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
