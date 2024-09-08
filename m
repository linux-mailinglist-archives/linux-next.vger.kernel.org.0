Return-Path: <linux-next+bounces-3656-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD769709D0
	for <lists+linux-next@lfdr.de>; Sun,  8 Sep 2024 22:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ED1D282860
	for <lists+linux-next@lfdr.de>; Sun,  8 Sep 2024 20:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43F42B9CD;
	Sun,  8 Sep 2024 20:55:01 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2D226281
	for <linux-next@vger.kernel.org>; Sun,  8 Sep 2024 20:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725828901; cv=none; b=pAwrdqRIBBU16numM28t5Qe1VCeE1hlRfRBaHb+lkIESddw83vi24/lpK9qhlQZWYFe/esATzztegvJ9AOPZSJFnulIN/FRgIU1+0aEncq6L8/F12Q4zrrY6YRhL71aJYR7ZEv18ss/rEH2KbCkcSjBs4aWRXFow8C3KwGlsJ5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725828901; c=relaxed/simple;
	bh=zN3q3bvVxr+IRbcTF7Mt9+0mGWCJvt/L/HlTFdTrw2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loeUQMtYweyavTvFReWgpARxBMFGrDHmrHFA5ve/dZT9+K60Bh3lf+8TNFL7FF8tZnlGFH/Lorqa5vH63jabAZNebkKRIBIP9UnxWYUt8DAb/VWYjTsFYmChxjy1r78DXWwFGeVSV0JCUZwlJEIi0l+msfzjZ/K3gZ7Grk97X5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1snOvn-0002CA-Jf; Sun, 08 Sep 2024 22:54:47 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1snOvi-006Uad-Jx; Sun, 08 Sep 2024 22:54:42 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mgr@pengutronix.de>)
	id 1snOvi-00DtLg-1c;
	Sun, 08 Sep 2024 22:54:42 +0200
Date: Sun, 8 Sep 2024 22:54:42 +0200
From: Michael Grzeschik <mgr@pengutronix.de>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux USB <linux-usb@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	v9fs@lists.linux.dev, Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Luebbe <jlu@pengutronix.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] tools: usb: p9_fwd: wrap USBG shell command examples in
 literal code blocks
Message-ID: <Zt4PEp8z1rfhFZCm@pengutronix.de>
References: <20240908113423.158352-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2GlOQuJU+wYS6vhG"
Content-Disposition: inline
In-Reply-To: <20240908113423.158352-1-bagasdotme@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org


--2GlOQuJU+wYS6vhG
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks for taking care of this.

On Sun, Sep 08, 2024 at 06:34:23PM +0700, Bagas Sanjaya wrote:
>Stephen Rothwell reported htmldocs warning when merging usb tree:
>
>Documentation/filesystems/9p.rst:99: ERROR: Unexpected indentation.
>
>That's because Sphinx tries rendering p9_fwd.py output as a grid table
>instead.
>
>Wrap shell commands in "USBG Example" section in literal code blocks
>to fix above warning and to be in line with rest of commands in the doc.
>
>Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>Closes: https://lore.kernel.org/linux-next/20240905184059.0f30ff9a@canb.au=
ug.org.au/
>Fixes: 673f0c3ffc75 ("tools: usb: p9_fwd: add usb gadget packet forwarder =
script")
>Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Acked-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

>---
> Documentation/filesystems/9p.rst | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/Documentation/filesystems/9p.rst b/Documentation/filesystems/=
9p.rst
>index 2cc85f3e8659ff..514ed13a0122b0 100644
>--- a/Documentation/filesystems/9p.rst
>+++ b/Documentation/filesystems/9p.rst
>@@ -86,11 +86,11 @@ When using the usbg transport, for now there is no nat=
ive usb host
> service capable to handle the requests from the gadget driver. For
> this we have to use the extra python tool p9_fwd.py from tools/usb.
>
>-Just start the 9pfs capable network server like diod/nfs-ganesha e.g.:
>+Just start the 9pfs capable network server like diod/nfs-ganesha e.g.::
>
>         $ diod -f -n -d 0 -S -l 0.0.0.0:9999 -e $PWD
>
>-Optionaly scan your bus if there are more then one usbg gadgets to find t=
heir path:
>+Optionaly scan your bus if there are more then one usbg gadgets to find t=
heir path::
>
>         $ python $kernel_dir/tools/usb/p9_fwd.py list
>
>@@ -99,7 +99,7 @@ Optionaly scan your bus if there are more then one usbg =
gadgets to find their pa
>           2 |   67 | unknown          | unknown          | 1d6b:0109 | 2-=
1.1.2
>           2 |   68 | unknown          | unknown          | 1d6b:0109 | 2-=
1.1.3
>
>-Then start the python transport:
>+Then start the python transport::
>
>         $ python $kernel_dir/tools/usb/p9_fwd.py --path 2-1.1.2 connect -=
p 9999
>
>
>base-commit: 9c0c11bb87b09a8b7cdc21ca1090e7b36abe9d09
>--=20
>An old man doll... just what I always wanted! - Clara
>
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--2GlOQuJU+wYS6vhG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmbeDw8ACgkQC+njFXoe
LGTkwBAArdhWO1zhxAGW/ByLL4IiT1YV1Lbkg+uvEfThLHZeVp2jwg4dfko/K3yn
I1nEaIwg3cbbiU0IY93yZjXGwCULzhJxP8PeQ8o97DleU918Onphp7Wt4Vt74vag
0GG6i9mzx7J6rd9P9aW+Wcnixm7hO8lCkDNda8jrlXuNWLD/a+fz+3RdOdgj1EaC
AW1HqYRKBA/wA4fCHn8U7bjCP1cbBU67mJgopm2TxA+L82D0+l9r3l8ncb4fgmNr
mIcNwIuxmiHvKEZck/n9FKc+TW18AKG9YND+iPcLXEGNG1GCUmflR2IZgKtLXVjf
gp32r8o7c8OVy34DcJh57y3zwlL+4eYR59Bn4MGS8vaF9z907phi4OttfrpgBDU4
fKBX4Mfnxldflj0S3eeb6pXs01NLH13oI7HdIWMinTjLLmFacNYDelvlc6PFKKP6
uxLfHZ8PeVYHxVmjSurBqwXqCwzN7dMzMdSPTf5ZG+OCr5/AHMoFgpRVSgYnVKQF
UEvpg2pVgxsw0oZrB6A5xFjd1j3v7qdBeoA4hDEbYeLaBng0i7oF/8mPWXNOhRyy
vxrSEvwWvb4AmJfImiBiSsIUrUPJnL39Kz79knYOwCDwx2znfpjIrcii9gvWEXOZ
kGqPqnH9QRiZq8GPMA2GE2q3/3I6dEM1sHEawvA26lDu2Hin5R4=
=ZSZ5
-----END PGP SIGNATURE-----

--2GlOQuJU+wYS6vhG--

