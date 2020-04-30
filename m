Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74A951BEF2A
	for <lists+linux-next@lfdr.de>; Thu, 30 Apr 2020 06:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgD3EZM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Apr 2020 00:25:12 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33971 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725280AbgD3EZM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Apr 2020 00:25:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49CMjw1yWWz9sPF;
        Thu, 30 Apr 2020 14:25:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588220710;
        bh=P5nfkovu1/OBAkOk/3QI+yZz3CFitkClgI4jvHlVaO8=;
        h=Date:From:To:Cc:Subject:From;
        b=cUhM7ATNYD3BbhYxTgNHMfWooPVRc5BR1LAmqrbU1S9x8rJK9unvfCOCdGetIGxyx
         xqNPoc4Pky7eOwID8SxlFGbSyu3qWLuzpHGj575/CoCzZ9EDb5k7u6hHHUAp8FzAZE
         ReoenjEP/dwJ2yNsoP5vd6wkPUrcZ8EhHBmwKoZA/9XUh8VR8UtGbFas1vHMZN5KCg
         gIJhem5e3D+oocbSrdJGR/DFce4JcU71/14owjH4ne3Z9y7QvX73dMTB5Sqwf3oe72
         2TYAL8wLBPG875envFHtOqrvCQPnblVfuGmUSSeqW4X7NjQyaVw5HQWR+fvmAOs5aw
         fzViEzT5/8tFg==
Date:   Thu, 30 Apr 2020 14:25:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        John Stultz <john.stultz@linaro.org>
Subject: linux-next: manual merge of the driver-core tree with the
 driver-core.current tree
Message-ID: <20200430142506.0626f8c4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ti+4=desnQ7P74nY=HmpiRo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ti+4=desnQ7P74nY=HmpiRo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  drivers/base/dd.c

between commits:

  ce68929f07de ("driver core: Revert default driver_deferred_probe_timeout =
value to 0")
  4ccc03e28ec3 ("driver core: Use dev_warn() instead of dev_WARN() for defe=
rred_probe_timeout warnings")
  35a672363ab3 ("driver core: Ensure wait_for_device_probe() waits until th=
e deferred_probe_timeout fires")

from the driver-core.current tree and commit:

  eb7fbc9fb118 ("driver core: Add missing '\n' in log messages")

from the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/base/dd.c
index 94037be7f5d7,efe6df5bff26..000000000000
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@@ -258,8 -266,8 +258,8 @@@ int driver_deferred_probe_check_state(s
  		return -ENODEV;
  	}
 =20
 -	if (!driver_deferred_probe_timeout) {
 -		dev_WARN(dev, "deferred probe timeout, ignoring dependency\n");
 +	if (!driver_deferred_probe_timeout && initcalls_done) {
- 		dev_warn(dev, "deferred probe timeout, ignoring dependency");
++		dev_warn(dev, "deferred probe timeout, ignoring dependency\n");
  		return -ETIMEDOUT;
  	}
 =20
@@@ -275,8 -283,7 +275,8 @@@ static void deferred_probe_timeout_work
  	flush_work(&deferred_probe_work);
 =20
  	list_for_each_entry_safe(private, p, &deferred_probe_pending_list, defer=
red_probe)
- 		dev_info(private->device, "deferred probe pending");
+ 		dev_info(private->device, "deferred probe pending\n");
 +	wake_up(&probe_timeout_waitqueue);
  }
  static DECLARE_DELAYED_WORK(deferred_probe_timeout_work, deferred_probe_t=
imeout_work_func);
 =20

--Sig_/ti+4=desnQ7P74nY=HmpiRo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6qUyIACgkQAVBC80lX
0GwsEwf9H2Z4fiZ1Ut98UB/ogxCjL0w5BEHPZ8t8OQYsp1v+62iqHqMW3CsjF2hS
AqdZRWl0bfoYRfdTCvD43o9Ic89Cw6sKpZQ1P75oHqkWVujH+CqcQUKQ33IoTpMK
wLiapzjC1tNbZ81AVbYYdM7sjfFfX+AqEsUdKulXBPNDqhNR1s2P9DsjsFmaLQIu
HlEWV7Eq+TanJxTLaRvM116FtlvaVb1ERHx2gl/3FtkOEeJWrGb7fBVJOVG58WE9
htWBE9L0Aed7hY3MBJTA43itH2TGzGs1UnflSmWcKjnZ7b8qKNgnGO611mr6hoQM
Wz5TJPdiCthhGBo1NWV8sLbQX+AiBw==
=XI/t
-----END PGP SIGNATURE-----

--Sig_/ti+4=desnQ7P74nY=HmpiRo--
