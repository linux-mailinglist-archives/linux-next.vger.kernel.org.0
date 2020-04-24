Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E67801B6D0B
	for <lists+linux-next@lfdr.de>; Fri, 24 Apr 2020 07:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgDXFPy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Apr 2020 01:15:54 -0400
Received: from ozlabs.org ([203.11.71.1]:60245 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726051AbgDXFPx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 24 Apr 2020 01:15:53 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 497j7C3RVQz9sPF;
        Fri, 24 Apr 2020 15:15:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587705351;
        bh=pyn9GpMM98czUNFMNsamtyFr4WLnJUPocI9q+xLA9C0=;
        h=Date:From:To:Cc:Subject:From;
        b=BJ83SeOa5vUETLDH5JEJbPd303AupgvVOTBBm0JEg2UbwhTVWVP1HG7dUtvWzeuut
         AUzkUdQEnXHzy2slCxeepuDq/cMECqdHmOt+z1utRtd5CXmTPZeZdBkxa6Y14fSDgJ
         X4uas4kwsWSijzSl0nY52AieVZUAhxpeuRhIhrpIYaUhQgEKTOPLboLQ2vRN6qsTU3
         KBGvivoXhbPtLrI2dfwVo2Xzve1AfOMiidsM8hfzDsyz8wPOUyxcp+ihfq0JklT9MD
         ELKB/ro3YjxtkqgScRtmXBGaqaFuqQLeZjDS6G9ws6iWltT8MkjLfD2YrDs3H68zF5
         4Um+b5eFW0xjg==
Date:   Fri, 24 Apr 2020 15:15:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Malcolm Priestley <tvboxspy@gmail.com>
Subject: linux-next: manual merge of the staging tree with the
 staging.current tree
Message-ID: <20200424151546.4dea83cb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3e4VPnZkWlgaEO7WH1TQF7C";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3e4VPnZkWlgaEO7WH1TQF7C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/vt6656/main_usb.c

between commit:

  664ba5180234 ("staging: vt6656: Fix calling conditions of vnt_set_bss_mod=
e")

from the staging.current tree and commit:

  463288b98190 ("staging: vt6556: vnt_rf_setpower convert to use ieee80211_=
channel.")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/staging/vt6656/main_usb.c
index 5f78cad3b647,3c76d3cb5bbe..000000000000
--- a/drivers/staging/vt6656/main_usb.c
+++ b/drivers/staging/vt6656/main_usb.c
@@@ -743,13 -740,8 +736,12 @@@ static void vnt_bss_info_changed(struc
  		vnt_update_pre_ed_threshold(priv, false);
  	}
 =20
 +	if (changed & (BSS_CHANGED_BASIC_RATES | BSS_CHANGED_ERP_PREAMBLE |
 +		       BSS_CHANGED_ERP_SLOT))
 +		vnt_set_bss_mode(priv);
 +
- 	if (changed & BSS_CHANGED_TXPOWER)
- 		vnt_rf_setpower(priv, priv->current_rate,
- 				conf->chandef.chan->hw_value);
+ 	if (changed & (BSS_CHANGED_TXPOWER | BSS_CHANGED_BANDWIDTH))
+ 		vnt_rf_setpower(priv, conf->chandef.chan);
 =20
  	if (changed & BSS_CHANGED_BEACON_ENABLED) {
  		dev_dbg(&priv->usb->dev,

--Sig_/3e4VPnZkWlgaEO7WH1TQF7C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6idgIACgkQAVBC80lX
0GwSBAgAgVkyjr+TAadqJhUwmWJNMjwZRvvWVjq/MFWXZn3hwPKcyAb7aizuH9uu
2HByJdEzGgm8G5ZIpCvwd2wMB8l/y7/Qm6Q6c2XMruyesi91v4oz1RhuQKC4MUSk
D4KKbjGI/ZdINRzSpT2XQ3/l5f8divAI3NRQdDRAwmAcb0WuSk6SNnNLS0GPvGI0
/CqE7JCh6Iml34w6qRXJ3xqgAMpo/PebibHVtlt7L6SfzRnRhd3HtSsjffq3IVj8
ZWNUtqeZL5p05+Q7R0wl14CsNEl2U892Lp6u0FoNP8pJaojVQFQ8He5m4dzA/bmd
UnVzWvzlI2zl4xb7g/rEE9EGAOTgag==
=HExp
-----END PGP SIGNATURE-----

--Sig_/3e4VPnZkWlgaEO7WH1TQF7C--
