Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22AA05454C4
	for <lists+linux-next@lfdr.de>; Thu,  9 Jun 2022 21:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343641AbiFITUI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jun 2022 15:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242564AbiFITUE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Jun 2022 15:20:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F1131101C
        for <linux-next@vger.kernel.org>; Thu,  9 Jun 2022 12:20:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1D975B82FCA
        for <linux-next@vger.kernel.org>; Thu,  9 Jun 2022 19:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A50C34114;
        Thu,  9 Jun 2022 19:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654802400;
        bh=8mfiUxA7ZWZwXZY0xveBoGt2dtFtLFj70XnzCJaHp5U=;
        h=Date:From:To:Cc:Subject:From;
        b=Mq0CPS+kRlS/lIy27NUehyr+Mr6Z7/N/JK0d8O1v5/KuSWEWet1gbQ3PMvKfSJfeI
         F95Jy9W/VI//D8njD/CSHZnb965qMEvg2lDpLqFIRj4ouH5sj8QXe2Vi53M9Db5Pnh
         OsuwshSxPrlbv8qIIXojvxnOA2oTiOmQ56zOTGoaCVobJHqnjLjHSrK3VhxIkaood3
         9B9gr9CCiwok9tAUTlzMiGywYzd4JLOndoAYIomM5jX5CyTegMWGYaz+C0YJ9/yoEP
         f0zQHW6ZM6HI4I5aXhipgSdQfeKfk5HMv0JApD471kOghixIR9Ol8di7ErXxSOHJUc
         Gwy7fRp/toKNQ==
Received: by mercury (Postfix, from userid 1000)
        id 22A6A10605B9; Thu,  9 Jun 2022 21:19:58 +0200 (CEST)
Date:   Thu, 9 Jun 2022 21:19:58 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Please add battery-fixes tree to linux-next
Message-ID: <20220609191958.yh42to7ok5y26jbo@mercury.elektranox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nhxvlo5ceoccq4q4"
Content-Disposition: inline
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--nhxvlo5ceoccq4q4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

Could you please add my 'fixes' branch with patches for the current
merge window in addition to the existing 'for-next' branch for the
power-supply subsystem?

battery-fixes git git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git#fixes

Thanks,

-- Sebastian

--nhxvlo5ceoccq4q4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmKiR90ACgkQ2O7X88g7
+pqyYA//a1ph29JUmIklwxAx9v2jS5SzdncqNysMkJeMttRVUpSbSuAngdz0ZftJ
6sSyLGOAkIQjXAfqAAzGS0bgbUg42g8r84eQv9bcQMI+Y1I18Y0nyJqgT6Fk8qGB
rQERw+E3qf/vGrTazRwhs8Jsnbwbj3ZYPevGrRl2rnZIa1Z46ET3u6PtCFz13mZt
xW0eOAOkxKvoxZMVPKzf2TVFnl2vPmq7OjTFmBnTCP9eRDPXwmOK3T+LC/dAmfmD
K6J3h6mxyCx+feMe+laZMMzaYCwh27FW8N3GVtWNtIw8cqVPlZslJDKe9bH5NfaJ
4yWSmVShvs4kxLzeyf82x1rqoeIODVBlwwja5zVBj6V5IoKM1kGBkIQvZj479wg9
jvEHw/hGRVi3bmKcHLnUUTgoDJJJETnxd5XR0QpzLQjvQmXdENEDvoysut5qgTEF
QXD2ZWVcpCtx/qo02IxmeiKwQVE53Cjzg1a5EaxyrAGq8ix/amm1XeB5VWVKM7pe
cNvkhxZ6fVEXlIIK6Bj2HUrriostLBPpWbllRN9NfjdvgDK1EiCzYAVOrdd9hYth
yLTmRoF5oJUmE8z4C0lTpbUaiZFBt+FhOYVJaUiHQsIToaXNBXvay8i8L1il0p1r
pGoAhzFzBFl88xY6H6MRulHeCNC9U3SpyMtPxBLYVur4sztgEmo=
=CUpc
-----END PGP SIGNATURE-----

--nhxvlo5ceoccq4q4--
