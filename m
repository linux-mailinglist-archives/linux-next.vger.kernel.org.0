Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31E01380945
	for <lists+linux-next@lfdr.de>; Fri, 14 May 2021 14:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233251AbhENMQq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 May 2021 08:16:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:59268 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233148AbhENMQK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 14 May 2021 08:16:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 98BCAABB1;
        Fri, 14 May 2021 12:14:56 +0000 (UTC)
Subject: Re: linux-next: manual merge of the drm-intel tree with the drm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        DRI <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@redhat.com>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20210317140824.0a28ffec@canb.auug.org.au>
 <20210318125241.5fdfeffd@canb.auug.org.au>
 <20210430082321.3bd9c4a5@canb.auug.org.au>
 <20210514115307.4364aff9@canb.auug.org.au>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <d88cedea-1f6c-de70-de56-083e0a378671@suse.de>
Date:   Fri, 14 May 2021 14:14:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210514115307.4364aff9@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="gQKAUoO0HdU4QPLWr4OYseKl5eAOpZfMT"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gQKAUoO0HdU4QPLWr4OYseKl5eAOpZfMT
Content-Type: multipart/mixed; boundary="9adCaDBkX0gzP5IfR7bePNMPiFhy7UkSV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Cc: Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <d88cedea-1f6c-de70-de56-083e0a378671@suse.de>
Subject: Re: linux-next: manual merge of the drm-intel tree with the drm tree
References: <20210317140824.0a28ffec@canb.auug.org.au>
 <20210318125241.5fdfeffd@canb.auug.org.au>
 <20210430082321.3bd9c4a5@canb.auug.org.au>
 <20210514115307.4364aff9@canb.auug.org.au>
In-Reply-To: <20210514115307.4364aff9@canb.auug.org.au>

--9adCaDBkX0gzP5IfR7bePNMPiFhy7UkSV
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 14.05.21 um 03:53 schrieb Stephen Rothwell:
> Hi all,
>=20
> On Fri, 30 Apr 2021 08:23:21 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>>
>> On Thu, 18 Mar 2021 12:52:41 +1100 Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
>>>
>>> On Wed, 17 Mar 2021 14:08:24 +1100 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>>>>
>>>> Today's linux-next merge of the drm-intel tree got a conflict in:
>>>>
>>>>    drivers/gpu/drm/i915/display/intel_sprite.c
>>>>
>>>> between commit:
>>>>
>>>>    92f1d09ca4ed ("drm: Switch to %p4cc format modifier")
>>>>
>>>> from the drm tree and commit:
>>>>
>>>>    46d12f911821 ("drm/i915: migrate skl planes code new file (v5)")
>>>>
>>>> from the drm-intel tree.
>>>>
>>>> I fixed it up (I used the latter version of the file and applied the=

>>>> following patch) and can carry the fix as necessary. This is now fix=
ed
>>>> as far as linux-next is concerned, but any non trivial conflicts sho=
uld
>>>> be mentioned to your upstream maintainer when your tree is submitted=20
for
>>>> merging.  You may also want to consider cooperating with the maintai=
ner
>>>> of the conflicting tree to minimise any particularly complex conflic=
ts.
>>>>
>>>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>>>> Date: Wed, 17 Mar 2021 14:05:42 +1100
>>>> Subject: [PATCH] merge fix for "drm: Switch to %p4cc format modifier=
"
>>>>
>>>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>>> ---
>>>>   drivers/gpu/drm/i915/display/skl_universal_plane.c | 6 ++----
>>>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/dr=
ivers/gpu/drm/i915/display/skl_universal_plane.c
>>>> index 1f335cb09149..45ceff436bf7 100644
>>>> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>> @@ -1120,7 +1120,6 @@ static int skl_plane_check_fb(const struct int=
el_crtc_state *crtc_state,
>>>>   	struct drm_i915_private *dev_priv =3D to_i915(plane->base.dev);
>>>>   	const struct drm_framebuffer *fb =3D plane_state->hw.fb;
>>>>   	unsigned int rotation =3D plane_state->hw.rotation;
>>>> -	struct drm_format_name_buf format_name;
>>>>  =20
>>>>   	if (!fb)
>>>>   		return 0;
>>>> @@ -1168,9 +1167,8 @@ static int skl_plane_check_fb(const struct int=
el_crtc_state *crtc_state,
>>>>   		case DRM_FORMAT_XVYU12_16161616:
>>>>   		case DRM_FORMAT_XVYU16161616:
>>>>   			drm_dbg_kms(&dev_priv->drm,
>>>> -				    "Unsupported pixel format %s for 90/270!\n",
>>>> -				    drm_get_format_name(fb->format->format,
>>>> -							&format_name));
>>>> +				    "Unsupported pixel format %p4cc for 90/270!\n",
>>>> +				    &fb->format->format);
>>>>   			return -EINVAL;
>>>>   		default:
>>>>   			break;
>>>> --=20
>>>> 2.30.0
>>>
>>> The above fix up patch now needs to be applied to the drm tree.
>>
>> I am still applying the above patch, but it applies to Linus' tree now=
=2E
>=20
> I am going to stop applying this.  You guys can apply it if you want to=

> some time.
>=20

Sorry, this got lost several times. I've applied your patch to=20
drm-misc-next now. Thanks a lot.

Best regards
Thomas


--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--9adCaDBkX0gzP5IfR7bePNMPiFhy7UkSV--

--gQKAUoO0HdU4QPLWr4OYseKl5eAOpZfMT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCeab4FAwAAAAAACgkQlh/E3EQov+Bf
sw/+LGkhDniEytcmToHBkr0NcCH9ebNFXjGxQPa7SMQsZjZnxFkDjPMLCM6Jc0B7rjV1pXpRAeTt
i7y8b0P0sHhzAd5y8Yxr6Ad/MoQ2dZaieAng09ZlHTXZhtNw+NoUjUaGFSybYIbwdmCCg6jvxc0+
zozFGONubkZH2VLoQ4s+6i/EyEU52jVje7GpJ2XXCWTT7jk5x1Pmy3Nb4zfWJNzgg9UMSASJxQPk
sgI1ilitPNbEt9yY+UnlS1sXMGYpPSGY4JlY8KcucxdKUduyFT2MoIBVbccF2ghmGx97yLNjFWPa
FZ6XIm47jp8QoQZT53dpQSyZCXqIISNDG0DD04gdYfUsds0YszSPx2SoJqIuisL5d0aQ7TemRuOr
SWJUvlluZYjBILcrcaHYb3+NWLZjcBMr4V4XyHKZfH8clLOX9NWbmWQjDK9E1tNyedwDytEsx1KP
7ulvdZ6QVUijIPsOhpMh2FgJPJQ4sQHhp4EQiGo7pS5CVth9cgpS97yrjtsIiZ0tTRBoKWybw/Ut
qeSvnLicAnW6zq/diqLK2OmM1GFpyzWVsmPQYtSS5vbXJhXjibu96yMFAavTDOSeK5WPLhG2m7Gq
Camt/HzLJd9NwAvUKZz7+7d/Av1dt/iGA4UU/xoXc7DpETfqtPuFjC2mWJgrJgQIO3rBpsqgwej3
f6w=
=ev6h
-----END PGP SIGNATURE-----

--gQKAUoO0HdU4QPLWr4OYseKl5eAOpZfMT--
