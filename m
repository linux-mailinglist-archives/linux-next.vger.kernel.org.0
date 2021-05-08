Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02657376E6D
	for <lists+linux-next@lfdr.de>; Sat,  8 May 2021 04:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbhEHCOh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 7 May 2021 22:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbhEHCOf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 7 May 2021 22:14:35 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D955C061574;
        Fri,  7 May 2021 19:13:35 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FcW7w6nY5z9sRK;
        Sat,  8 May 2021 12:13:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620440013;
        bh=tbzyelWpY5/vilZ3aU7P2W2D80K9KNwdyzH255J6UcE=;
        h=Date:From:To:Cc:Subject:From;
        b=G+qgOseQJUnYswUTwCS8gTfptDCnBbBbp+8K6Uq9KMXJ6jEDBRaAuioXFDjxwhXTC
         Byh1qw1GhPPm5PSv30peVnL8ZNLYtfbzCsa/NCIBFSWbERHBR9/84JsXYqGTKzLa3e
         eml7PynXu6KClAKPY1slfvzZ7w73DgrAGoYZc4FgNiW5NYfPCcW4zNleQkqarLY5us
         qpehXsEUfubB87DH/oKf14d9K810uw6TWA5OfaCNONLuSFQmoLDyrgZf6W2hQrtl1/
         vaei1xHaNUtO/uN0tErM3ll/QXGwa8gZSgiVIX1KVwWxRWJB+PX/bUP6EggIA/L07x
         UYV07J04nRBNw==
Date:   Sat, 8 May 2021 12:13:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     Connor Abbott <cwabbott0@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the bluetooth tree
Message-ID: <20210508121331.5c186528@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LIpzQHEyCAhT4lQx7y0ABxv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LIpzQHEyCAhT4lQx7y0ABxv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  da68ad722e54 ("Bluetooth: btqca: Don't modify firmware contents in-place")

Fixes tag

  Fixes: 83e8196 ("Bluetooth: btqca: Introduce generic QCA ROME support")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/LIpzQHEyCAhT4lQx7y0ABxv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCV88sACgkQAVBC80lX
0GzrzAf+PT1/hVMTseOWi9QPYt6EA2CUnOeXKV7kb2KMeOKALdYK0dh5hL/8Ibqb
/pPJYbID7mEUVbJoPARy6iNcqozKQLlPMCjnbgDTNXGP87Cpws7fylwJHWac/qQu
IkSGctbYyRWq2Z13SVvmbD8bwdTvee9rH+EVmd4qlvhWPdNf9yH7qa4zeLSmQQUt
j9Bf7glIATTLuXsdRV9wfhMKPoQX/fwZdMet85XBdD6HGJy5SXaeih3rxw9jqRXL
PzHfd/vz76zpwZbD0rdkbrAI3DmwNpZeTr1FQh5y+rS8sytWxMn1aRUQ7ON5X71A
iv25PKGoyHf0TlZM9uk/FdqzwbQL9w==
=NGdK
-----END PGP SIGNATURE-----

--Sig_/LIpzQHEyCAhT4lQx7y0ABxv--
