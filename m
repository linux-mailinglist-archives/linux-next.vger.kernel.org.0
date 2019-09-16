Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4AD9B3E4A
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 17:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731858AbfIPP7e (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 11:59:34 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:58424 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731829AbfIPP7e (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Sep 2019 11:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=6Goen0A9OE9gqgWT3hJoh0DRnNeOa0bFJwwrQWV3ht0=; b=Tese8/pjYYvpN4Rvt4v74p0rS
        v0oCFt9sV1YjjEBOwI0sxhs/P/Wu3NivcqKEseyp8nCoLDq1kSdUAxwzthdhcW2IKj41BaRm7jYvn
        xoGOt5ZegH2xPAnHi4wdFdGnzOkkrHsMtsM3yBI1MCWm1Qj079mG82xaIFJgcYdHGiJQ0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9tPV-00052S-EG; Mon, 16 Sep 2019 15:59:29 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 1F6D22741A0D; Mon, 16 Sep 2019 16:59:28 +0100 (BST)
Date:   Mon, 16 Sep 2019 16:59:28 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jessica Yu <jeyu@kernel.org>,
        Matthias Maennich <maennich@google.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Martijn Coenen <maco@android.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the modules tree with the
 compiler-attributes tree
Message-ID: <20190916155927.GI4352@sirena.co.uk>
References: <20190915222720.GL4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="H7G8UhBuWJ9AoGD+"
Content-Disposition: inline
In-Reply-To: <20190915222720.GL4352@sirena.co.uk>
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--H7G8UhBuWJ9AoGD+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 15, 2019 at 11:27:20PM +0100, Mark Brown wrote:

> Since this conflcit is non-trivial, it's late and there's a good chance
> I'm not going to actually finish building -next today I've just used the
> commit from the last time -next was built, 3b5be16c7e90a69c, for the
> modules tree - sorry.  I'll have another go tomorrow.  This means none
> of the changes in modules-next are in -next as they were all committed
> in the past week.

I had another look but I'm still not comfortable doing this merge in a
sensible timeframe so I punted again, sorry.  I'll probably carry on
doing this.

--H7G8UhBuWJ9AoGD+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1/sV8ACgkQJNaLcl1U
h9A8mAf+Jh44K8rTp+/29L9D52GuEB4fkLuhXGIaRQ8S5505+bIHGNQUqLEDjJRp
svlafU4r7sjJt0YlnvI3qmC7u1xKb9FAFEbpTw7skFeQrtUs+j1UEZdc3x8FRmsH
3nknSx2rma+UqsH9AIaCiutTQnphoNozTnhmznl2PS9X/yvrGafKn/DtZwvxLQJk
zOajME2MEf7pikJWmm99A3JkeMWCs90bTd8W3WmfCigXToqbmNNAlNnjot8xmUr7
tBFNmj5nGV1zs/PQ5QHXeaDtCmPcXgNJdTzbDgFrCmA4u7+iij59cw3tg/+PeT2c
lWg2ZM43GQVmFrnwHLhxLiQoTbXzDg==
=+igc
-----END PGP SIGNATURE-----

--H7G8UhBuWJ9AoGD+--
