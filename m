Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 136C05EB625
	for <lists+linux-next@lfdr.de>; Tue, 27 Sep 2022 02:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiI0ARJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Sep 2022 20:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiI0ARI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Sep 2022 20:17:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA873A1D40
        for <linux-next@vger.kernel.org>; Mon, 26 Sep 2022 17:17:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 71C1AB81126
        for <linux-next@vger.kernel.org>; Tue, 27 Sep 2022 00:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AD9C433D7
        for <linux-next@vger.kernel.org>; Tue, 27 Sep 2022 00:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664237825;
        bh=WxmpfaIO9RoL1IH3PcnElywj8yDfJzy0kypj3gepSAo=;
        h=Date:From:To:Subject:From;
        b=QYTVxk7njyy9VOb2Tm7uaRayKhYtX14GEuNvfoG6q49qg7SXeNN5UakR5ufVsRNDm
         WIl1pyTllXpBuoMT7Zk/jGqAQ8JOifgd2czkkmgI8QGNmANV0dwLioW6wvQabdNwXH
         dEsNb37DyE98VHpvVVOpwhQj6nGj9wQ3G7cWBWobxrbiG9wTQjNGsDH59I86GIe9oW
         2zG7q3sObmY01WMwqAQzjClVfvJLUDgMaZrXnEGWIkzYSUe/aAanw01pON0pB8dWgx
         xDSevWY3ZbM6sHYA/oDDHRqz+2Wlq5noA4TJ2wuKjObfbkx51ADThKNTfkN30cLnYx
         okV0BjNN00GOw==
Date:   Tue, 27 Sep 2022 01:17:01 +0100
From:   Mark Brown <broonie@kernel.org>
To:     linux-next@vger.kernel.org
Subject: No -next for 20220926
Message-ID: <YzJA/YJ0633g/6JM@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eNYhYavvhBCMjRP0"
Content-Disposition: inline
X-Cookie: You may be recognized soon.  Hide.
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--eNYhYavvhBCMjRP0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'm getting too tired to finish up -next today, I got almost all the way
through so tomorrow's build should run more smoothly though I did punt
on a couple of things.

Thanks,
Mark

--eNYhYavvhBCMjRP0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMyQPwACgkQJNaLcl1U
h9BIGAf+IdXo3/v9LX5Ua5fZb3zEXatqxrnWky5IwBWkT7hhsUOyp1aWStCrXOKz
rYQNsSub6oANa+HGsZHmVfWwG/aZjwa4tA+TaumGBnNniYMNQ8QXN2dwkc7INLVj
0vLRkxOMb9J9NanwrnAxJBLkTtKfBEwZAJnYaSy2uboxqTAgiGRdzdSfaJwoIUHM
zPL2jNUmoW8hUP8dgfwjnMno0hv9uAoyK3dRauQeFc+zuMXpwzyTsJLSkzgLW5Rz
DKRUYl84maFQcmyEY+SXrM41M66WBNX+xaPRCJSAZ13OhVwLP08L4qwUdDetMllW
2olkfwh5TM25qHwtSEqxnljP/kpLRA==
=eFvo
-----END PGP SIGNATURE-----

--eNYhYavvhBCMjRP0--
