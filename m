Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2944577095F
	for <lists+linux-next@lfdr.de>; Fri,  4 Aug 2023 22:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbjHDUHo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Aug 2023 16:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbjHDUHn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Aug 2023 16:07:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 999C110D2
        for <linux-next@vger.kernel.org>; Fri,  4 Aug 2023 13:07:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C46FB61C58
        for <linux-next@vger.kernel.org>; Fri,  4 Aug 2023 20:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2041BC433C7;
        Fri,  4 Aug 2023 20:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691179654;
        bh=jDu686gNxJ1QCh0nz68ME1FfrPBqUIs8M0R8nSQHFHA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X/3/Ori43SnZPnpGzLe9MBGVOq/1R853BSOAH/q4DuqJr5u9zW0+2H26vPhaLSdYq
         bytzwoxRkO221xK/1GnlfwfMvBH4fFLr62I2b9IY+GABHuZOucSkB6p1yHOSjXbZ9D
         bJX64tzPCpyYXfc2Spn2w5HgMoGf7vzojECHGBZsrfnf3OTIWDuJH8MStejoe9EiLf
         JBnlMP3BVKUi8rDtQlMUPuY2cvnh+lATWTsMA0uSlruMCWmobuUQooLSEgvsZMUzcf
         QieAqLYeKShAEV3esk3ZJjTmeOkeMYaYgkH7WKy4PJESRuYGNPkGL8v+uqP0j0mP58
         KEli1CfIcApJg==
Date:   Fri, 4 Aug 2023 21:07:30 +0100
From:   Mark Brown <broonie@kernel.org>
To:     "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc:     "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "Hansen, Dave" <dave.hansen@intel.com>
Subject: Re: Shadow stack branch for linux-next
Message-ID: <15e8f5d0-4c64-475c-b095-5883d5af89b7@sirena.org.uk>
References: <5339bb88079f75a1e725ece7fc562938ba193169.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UTA+1MSGceu59rtF"
Content-Disposition: inline
In-Reply-To: <5339bb88079f75a1e725ece7fc562938ba193169.camel@intel.com>
X-Cookie: I'm hungry, time to eat lunch.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--UTA+1MSGceu59rtF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 04, 2023 at 08:00:43PM +0000, Edgecombe, Rick P wrote:

> The shadow stack branch in tip has not been included in linux-next. An
> updated version is here:
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=x86/shstk

> Apologies if I'm missing some part of the process. Is there anything
> needed to make it acceptable for inclusion?

> The series hasn't changed much since the 6.4 based branch except a
> rebase and a few small patches on top. AFAIK, there is nothing gating
> submission for 6.6, so it would be nice to get it some linux-next
> exposure. Please let me know if I can do anything to facilitate this.

I think previously it was picked up in -next by virtue of being included
via the x86 part of the tip tree (which does make sense for an x86
architecture feature) - not sure how x86 and general tip processes
usually work here though.

--UTA+1MSGceu59rtF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTNWoEACgkQJNaLcl1U
h9A5mQf8COKxTOt0Qndet0kBE1xvQgOA7UWxcfBjbxc8Ezz/zafZP5HfqWBT+/7t
cVQqbbmdJSwAjoqDoJXVlgcK8FH7StgMonhVlRhhj3S1pxopl11jb8MnKkEwCBdr
R5+BSkRSC0sGeCwtHZng+covc/L83jXORaU/YeAB7bdVresmguYhRNsSVyGbKm6e
MAGvCcVf4uvxqTFa66IJ6OobbYZ+vFMLj1HQsOrbl94JClcH7n+oW0NqGYs857jM
hjtT6LfLSA6gnWCZ7Kut/uXY5CY9qb5NGdE9YSdrZmNQ/LK/gdxiOTLBNLXYi0pg
kxRl/qxhhIStP4d5oiigX4CvlIYf7g==
=6X/M
-----END PGP SIGNATURE-----

--UTA+1MSGceu59rtF--
