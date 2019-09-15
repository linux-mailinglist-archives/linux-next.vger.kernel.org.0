Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C316AB326F
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 00:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbfIOW11 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Sep 2019 18:27:27 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:40084 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbfIOW11 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Sep 2019 18:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=cI1oeM2B+izAgKrDMv9hfQQk+wj7HnFmN2Nw9dEpHC8=; b=DKLseB5updjgpzffEWhyo+V9h
        3qRK70pOX/G01xqWE1rZRbuDh85Tv/f81omDLtP1dQIBPatBhF/GcD1UV5EnFDpscQ4MXansh8fhs
        4QRNPvD4WlauUGEETT9ufsAp3DnhAm1PignHAas4czD8na1t6tGQyIKnAsuPmKQ5xXLEE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9czK-0001VE-0Y; Sun, 15 Sep 2019 22:27:22 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 2C8BE27415FF; Sun, 15 Sep 2019 23:27:21 +0100 (BST)
Date:   Sun, 15 Sep 2019 23:27:20 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jessica Yu <jeyu@kernel.org>,
        Matthias Maennich <maennich@google.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Martijn Coenen <maco@android.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the modules tree with the
 compiler-attributes tree
Message-ID: <20190915222720.GL4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Jbyekxk18hnEXT0m"
Content-Disposition: inline
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--Jbyekxk18hnEXT0m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the modules tree got a conflict in:

  include/linux/export.h

between at least commit:

  69a94abb82eed ("export.h, genksyms: do not make genksyms calculate CRC of=
 trimmed symbols")

=66rom the compiler-attributes tree and commit:

  cb9b55d21fe06 ("module: add support for symbol namespaces.")

=66rom the modules tree.

Since this conflcit is non-trivial, it's late and there's a good chance
I'm not going to actually finish building -next today I've just used the
commit from the last time -next was built, 3b5be16c7e90a69c, for the
modules tree - sorry.  I'll have another go tomorrow.  This means none
of the changes in modules-next are in -next as they were all committed
in the past week.

--Jbyekxk18hnEXT0m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1+usgACgkQJNaLcl1U
h9CmjQf/VmEsotBAsCPskLPJfUycNPOnsxDrQvEHW3ROeMU0QZx3susrJaAmzGwo
QE8HtxX/3oKLgcb8P6FMrlRnjEBDZFepeaGJqFYrEXWs/OAR6jHyMsX9VSq19rtM
YKAJFDMZwJRmALcdyZ+9BXtxDsGzF9JLyXY9OZEVGnTSkb+rjXLNn/cOybI3f1vD
YuoMbzCPRJLhqh5PdVcaTeWDWTgTJG+UFY2oOepFMsZKlwABS149hEIVAju9YHpf
TUiRHYZCTR2QbBHVlX5jQA8ENmZgBsyglp8XrpunNSfFoE5upd2ABh9InlvcX2qJ
R0w5phoof3lmNTfXbTOV8Y+L5beNdg==
=INNs
-----END PGP SIGNATURE-----

--Jbyekxk18hnEXT0m--
