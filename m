Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 728BF35C565
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 13:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240650AbhDLLhU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Apr 2021 07:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237829AbhDLLhU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Apr 2021 07:37:20 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A03C061574;
        Mon, 12 Apr 2021 04:37:01 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FJmt23Wyfz9sSC;
        Mon, 12 Apr 2021 21:36:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618227419;
        bh=5Tm82joAyQGhlRVkligE/W4B7Of7AjerYJW8diN4MEA=;
        h=Date:From:To:Cc:Subject:From;
        b=d9Qt/wPwTc109NqOXowwdC81si7i/pdRFKgKJ4uXHlUVUXuX6TXSIkC6LPMxU5UP8
         N2xOH8mhxzxDCsAWNbHWGSFHmqiPpT7jmuAV8wVQt0989g3Wjd7pv7ocLTPYoiZdbJ
         N2oOgSQkH4RfvWKI7Unigbk18+o/MYM3QBkoewcQoJNSUwy9Skvd2iYUBZWyAJeLCm
         A3y5Kn5v0KXpIYsGF2ypTS0cumFDrDW24YFLR9XpGwJXOpYZLZmbwT+nGp6pRY42qT
         an5sVj+eNDra7aUAtIJVz3pH3VcE7x3r5et4rNBk/gTt4Sxgg6mWl8iwlBjh1cxV/a
         mWe17nqb8q4Cg==
Date:   Mon, 12 Apr 2021 21:36:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the usb tree
Message-ID: <20210412213655.3776e15e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oOe35JQYRW0UFf2GvQRqcgu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oOe35JQYRW0UFf2GvQRqcgu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb tree, today's linux-next build (x86_64 almodconfig
modules_install) failed like this:

depmod: ERROR: Cycle detected: usbcore -> typec -> usbcore
depmod: ERROR: Found 2 modules in dependency cycles!

Caused by commit

  63cd78617350 ("usb: Link the ports to the connectors they are attached to=
")

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/oOe35JQYRW0UFf2GvQRqcgu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB0MNcACgkQAVBC80lX
0GxLJQf/Qn84/tY2Fid1bb1Ro8nWvSiXzL9KsXZ/EiCGKCCWLBRaJ5y1ZWFwluuH
DWsV1yAhF1Gpg53gBT7DkABO7hfgkqHF6Kq2WOXjaaqMlQBvkPXIgmSaV0sAyjW3
BRMQ70/0hrAbz5jSaAJLhK9yy4J9vD0dlb8hDa/E+cS47vIZ/rg/NydbSpQ0mD05
ytSiEVFnSKs9AslVQ5ksx3uvcgDgnBsgmawFtw4B5lYosPizkZAKOjhRoXYyDbve
ugkNIoJZ5bEJD9msYMCCfag+y4haXZoCscsrG6u5+xWfDdYNf8KtthHQCEEUsXuU
7l7kBTPm2BOYMiumDF5rOpELps8dWg==
=a1iN
-----END PGP SIGNATURE-----

--Sig_/oOe35JQYRW0UFf2GvQRqcgu--
