Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DAF72F2E98
	for <lists+linux-next@lfdr.de>; Tue, 12 Jan 2021 13:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731523AbhALMDb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Jan 2021 07:03:31 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39670 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727729AbhALMDb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Jan 2021 07:03:31 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 12E091F45198
Received: by earth.universe (Postfix, from userid 1000)
        id C46B83C0C94; Tue, 12 Jan 2021 13:02:46 +0100 (CET)
Date:   Tue, 12 Jan 2021 13:02:46 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Tomi Valkeinen <tomba@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCHv1] video: omapfb2: Make standard and custom DSI command
 mode panel driver mutually exclusive
Message-ID: <20210112120246.ujhjyylrlgfrfvig@earth.universe>
References: <20210108122540.657501b2@canb.auug.org.au>
 <20210108112441.14609-1-sebastian.reichel@collabora.com>
 <20210108195839.GA1429715@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iijg5xf7wxvodjnw"
Content-Disposition: inline
In-Reply-To: <20210108195839.GA1429715@ravnborg.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--iijg5xf7wxvodjnw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[replace Tomi's TI mail address with something working]

Hi,

On Fri, Jan 08, 2021 at 08:58:39PM +0100, Sam Ravnborg wrote:
> Hi Sebastian,
>=20
> On Fri, Jan 08, 2021 at 12:24:41PM +0100, Sebastian Reichel wrote:
> > Standard DRM panel driver for DSI command mode panel used by omapfb2 is=
 also
> > available now. Just like the other panels its module name clashes with =
the
> > module from drivers/video/fbdev/omap2/omapfb/displays, part of the depr=
ecated
> > omapfb2 fbdev driver. As omapfb2 can only be compiled when the omapdrm =
driver
> > is disabled, and the DRM panel drivers are useless in that case, make t=
he
> > omapfb2 panel depend on the standard DRM panels being disabled to fix
> > the name clash.
> >=20
> > Fixes: cf64148abcfd ("drm/panel: Move OMAP's DSI command mode panel dri=
ver")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
> For a backport this looks good:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks.

> But why is it it we need omapfb at all when we have omapdrm?

I think there are two reasons omapfb has not been killed yet. One
reason was missing support for manually updated DSI panels, which
have been working since 1 or 2 kernel releases now. The other reason
is some people using it in combination with an out-of-tree PowerVR
kernel driver. There is currently work going on to use a more recent
PowerVR driver based on omapdrm driven by Maemo Leste people.

> Can we sunset all or some parts of omap support in video/?
> If not, what is missing to do so.

IDK the exact status of the PowerVR work and have not been using
omapfb myself for years. I don't think there is a reason to rush
this, so my suggestion is removing it in 3 steps giving people
the chance to complain:

1. Add 'depends on EXPERT' to 'FB_OMAP2' and add deprecation notice
   referencing omapdrm in help text in 5.12
2. Add 'depends on BROKEN' in 5.13
3. Drop drivers/video/fbdev/omap2 afterwards

-- Sebastian

--iijg5xf7wxvodjnw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/9j9YACgkQ2O7X88g7
+prP1A//Vgw/MQFN4Vxba+rQpa+HIzqlPLKGsiMXfU4Xhix/+Csd+gL8u+8rWNjG
+Fx+MeNgwQPnyGXnHoi822auQ2s5XVJkRjXH5tKxmW5Emu0W+xKvZMlZ552WlJ0u
w9Y6689o+enXxXizPHM4o1fyl6K5NPBZu/9z8xjn0IkWnZU8zYMo+/fEetRGMW06
VbZvZkKynGV8kjWXhwATJx/Xk+ZU7ZvY5z+d6LP26alM5fxVhl1ODxPEo5ADPvX8
Ue8fpNzXowu+GcfHZbWlFdZlG6Vr1IsiOG/gyzWKVTR3wIyzFTBSiYBJMGIcKfI1
FtnrO6Pqrp9mxDSzW9MpaIF97+QZ84QvN98ot5BLl7FTP/NCBUk312Wv9xaWC7Du
MKZ9RzIB1rhOni/5sGOsEQkNT+77GlKfU87HwbyDzYzYBTrWkfYMOPkdmRG6RXhg
nyBgPSY4cbeA8n25j+YUV85P6k1OtTLcaosDAw22RNe8IGe7NvWvcPvzhNpXa1oa
nHMMuqVT0ZblCP35vW8HfqQ5mkhzeVE5HM6qGooddTRPZx0zEo5CbbWn0qg983ln
DV33qMVCzUpqUpwJw1TSjfZJM8ieHVcajQ7hvRWkpw/+Grr//ejCcnmht+nbSRIe
HNqAi8JOmKLHfELAMaNRpJZniA+BWGSPW27h7sRdXelW8p2dzSA=
=lu/2
-----END PGP SIGNATURE-----

--iijg5xf7wxvodjnw--
