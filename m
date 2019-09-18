Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7DDCB6249
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2019 13:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfIRLd0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Sep 2019 07:33:26 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:47660 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbfIRLd0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Sep 2019 07:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=bcGN1tHgOcZcfSU8gTTqa7QOFEiGLmlRGR0/vv9ZIqk=; b=uNpCUnuCks1kUKjwxK2vmjlI1
        kj8IKxKPMxmHpQJwnHJZP4DzOyZ5MJbyXnCh6hRQaLctnxIa2XAG7WtWo5ALSZvRvI2ieQ8Gvd6ph
        +1Glm4n5DHB7IWMakcre7ywBe23TNkYxAj4Kfqz+o65YvoKKt9cCEFNAsjWpCx4AuYch4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAYD5-0004wN-V6; Wed, 18 Sep 2019 11:33:24 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 54EC22742927; Wed, 18 Sep 2019 12:33:23 +0100 (BST)
Date:   Wed, 18 Sep 2019 12:33:23 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the mips tree with Linus' tree
Message-ID: <20190918113323.GD2596@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Content-Disposition: inline
X-Cookie: The devil finds work for idle glands.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mips tree got a conflict in:

  Documentation/index.rst

between several commits from Linus' tree and commit:

  97689a1a3fdad101d ("doc: Add doc for the Ingenic TCU hardware")

=66rom the mips tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/index.rst
index b5fd87e7dbee4,87214feda41fb..0000000000000
--- a/Documentation/index.rst
+++ b/Documentation/index.rst

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2CFgIACgkQJNaLcl1U
h9BD7wf/X2KrEjPlotVnXMoP3lrRuzhX7acOKrDUVTH8AZaaoaaqg5BeLQa6KOlL
jK+VIU8khx7MFKyDruLALrrRctxGyn5k4vrsz+95GaNoXqWwhvdat0HekuExp66I
3Q5dllS2WnTgwTrxb6H+IxkjW+FwqQbt8KgEmaWELdXgRfqkKUr1KSmqo7SGJUFb
UqTtb6Srn5lL/UtOgB+CFjZO5oKUJcRWyNo48Lxc6RyPXkr1Ti/rJD6Ufg1AV15c
D/h+B46rtNYl7f3LI1O1FmzuS+tEviIt+Ug1w452KSctz4XRMcJA6x3HA1THMEp0
BiRbFPef/U7P5nPOdDPLb0pU6grzSA==
=eWYx
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--
