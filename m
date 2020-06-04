Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 891BF1EE441
	for <lists+linux-next@lfdr.de>; Thu,  4 Jun 2020 14:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbgFDMNe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 08:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgFDMNe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2020 08:13:34 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BDEAC08C5C0;
        Thu,  4 Jun 2020 05:13:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49d4SB0V9mz9sSc;
        Thu,  4 Jun 2020 22:13:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591272810;
        bh=OdrHvU5D6bfGWTD1L8bpTagEJWl3sX5qCOLNuYv/Ow4=;
        h=Date:From:To:Cc:Subject:From;
        b=ekbPnK56UDzuS2lL3It4R/EgzvzJxrRPeCcxQu/VYhP+O6XY3anwgtPwmWIwRcjgA
         Rgbk+PsoJzoZAJYBmpnVEqJrbNpIBeiaEZnx4RdXHxI3rIllFah+wdRpD9leg0H1IM
         ZuhyqR8DtgotC+dNfuoCx0xPDVUMq/izbK7gouM6Ixtm6AiZtyZIXz5DecLPpnPMc1
         H7QUHmVjNpslkvKpAA9kpfpKOxJNj9Ib9I//nAIJKUQlC9VgCciZqdmUVjDbt+zWC4
         BH/WeVm39KY2GoA7uk9KMnXsK0oY5FVu6UEzjLrzT0FFCtdW8XCh9xMc1Vt3QdB9Br
         Z3jysVdNL/ndw==
Date:   Thu, 4 Jun 2020 22:13:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andre Przywara <andre.przywara@arm.com>
Subject: linux-next: Fixes tag needs some work in the scmi tree
Message-ID: <20200604221328.2e6b8d98@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jB6d06ZclFyyIkt5Hhws/G4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jB6d06ZclFyyIkt5Hhws/G4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8a8cd9a91081 ("arm: dts: vexpress: Move mcc node back into motherboard no=
de")

Fixes tag

  Fixes: d9258898ad49 ("arm64: dts: arm: vexpress: Move fixed devices out o=
f bus node")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/jB6d06ZclFyyIkt5Hhws/G4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Y5WgACgkQAVBC80lX
0Gz4sgf+OjvMIWA/pyXXNbpOTq+/RNr0XLwqZCxUNhXmTnozawYS5+Snos6T+uqQ
ciK+dnG0uQthIEuYKnib0ddDI3Gczq5pWFDc0botwmx11moPNSb6F6yCjjVfWSjE
1pTHvuBAe9EJ+ReyX+2jCngLp12tFE9XZud/NSIHPJ6Is444k/jhI7zlqPXb8wcD
e0LrsM71kQzfSsMc+6Wkp+jPA/BN5XmqEBHJ9YZlcSIDHblHZPX8B01XjHW0mFfs
aaNtIX9srSEwZM/sJ5fGrEoS3SEFtMhIeOyKR9xX7SgVnfxSt7033ERVECJvTOtv
EmpqQz6jflm21uX5eMxXVTOPdflyew==
=3w7k
-----END PGP SIGNATURE-----

--Sig_/jB6d06ZclFyyIkt5Hhws/G4--
