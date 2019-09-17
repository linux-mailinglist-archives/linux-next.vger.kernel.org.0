Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A502CB516D
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 17:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729407AbfIQPZs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Sep 2019 11:25:48 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:50476 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbfIQPZs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Sep 2019 11:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=w1lHkbH9kv09VzHXijbBjTNbooEI3xUl9aA5NSAqzDI=; b=nTd8Siyp8W+8Ovt/eLwZ7ZrMx
        JOY+/L6wCRl4gyzQJQ0su/txjIIJd17JspK5sQwcOUl3dXlMCprfu1lfvSjIs+Dm2PqXU2SjAyWJS
        Rbz7ybc79k/G/z1pQdgBwTc/I8/2h8UkPxwvSQHn0YKChZPxIpAqrnZLT6wTIDIrMyryk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAFMN-0008Ja-Gq; Tue, 17 Sep 2019 15:25:43 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 3DE8527428EA; Tue, 17 Sep 2019 16:25:42 +0100 (BST)
Date:   Tue, 17 Sep 2019 16:25:41 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Matthias Maennich <maennich@google.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Martijn Coenen <maco@android.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the modules tree with the
 compiler-attributes tree
Message-ID: <20190917152541.GE3524@sirena.co.uk>
References: <20190915222720.GL4352@sirena.co.uk>
 <20190916155927.GI4352@sirena.co.uk>
 <20190917151721.GB4116@linux-8ccs>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cHMo6Wbp1wrKhbfi"
Content-Disposition: inline
In-Reply-To: <20190917151721.GB4116@linux-8ccs>
X-Cookie: Know Thy User.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--cHMo6Wbp1wrKhbfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 17, 2019 at 05:17:22PM +0200, Jessica Yu wrote:
> +++ Mark Brown [16/09/19 16:59 +0100]:

> > I had another look but I'm still not comfortable doing this merge in a
> > sensible timeframe so I punted again, sorry.  I'll probably carry on
> > doing this.

> Sorry for the trouble. We are currently working out a resolution
> (https://lore.kernel.org/lkml/20190917150902.GA4116@linux-8ccs/).
> Feel free to leave it at 3b5be16c7e90a69c until this gets resolved in
> the next day or two..

OK, that's easier for me so I'll do that!

--cHMo6Wbp1wrKhbfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2A+vUACgkQJNaLcl1U
h9AkFgf+PNEVYNRWS2HUUzVCvyNb8YyCEUtEo89aGiPqgLPSzAFA0Ho88NZWW19/
MX/F0NIiPZ/1niqbd5VoHNThcrJjogG3qN5Vd3gKh4iDdW9P5C11SeDOXVSfQPxl
/Ku7tXQ8Q6+p/lWsmLxaShhO/8akdi+BdaSyAXAguR6W4ZPILZO7v9AmRzAirWJL
rPf08yBzxk2H3Pf+ZVPp+87CO4KMs07+qswVs6dByLtKgklipsznB5OVdMRy/Qvm
QzdkhLT42ci1Qtk5tTqnpAO3A+7L0mFjh+wFbI5lJxiT6w5nH28lLaf9FKg9ffPR
n3wLM5MJXjvdWuvPyrKs0nGl48QsUg==
=6NLd
-----END PGP SIGNATURE-----

--cHMo6Wbp1wrKhbfi--
