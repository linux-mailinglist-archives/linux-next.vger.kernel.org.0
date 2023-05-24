Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4E2E70EC0C
	for <lists+linux-next@lfdr.de>; Wed, 24 May 2023 05:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239369AbjEXDq7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 May 2023 23:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239164AbjEXDqa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 May 2023 23:46:30 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B69E62;
        Tue, 23 May 2023 20:46:27 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4QQxtp0whtz4x4N;
        Wed, 24 May 2023 13:46:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1684899986;
        bh=pvOGTc7wkwlknWjNED/fUzG6lS1vFw4lpqBsqq6ofoY=;
        h=Date:From:To:Cc:Subject:From;
        b=kGf10hxrzYFzIHLey3X+MAeDfQtsmUUqQKMzkb4tqV1y61RCU4ex+R99mQhbbPUBT
         TPJcxq8NaatTnCDqJQnwQmZikWZSxuXMgeuiQbHd1ed0d8pv1pz17CSggB5vMWWOoB
         VYQZidpVMGv1oHy+yladUovTnmH5G33I6sRxFeCxOntK/eJm+ZFIrJG6FM9pMJeiHY
         /kzgO8aMlqxjgQdpBFw8E7Dxp/VpJ+9PYPMN/RZetYzSE0j2y0nTvxIQUPSsr/67Hn
         DKLJ3tbv5Ufohd4zc/Zl6wdYT2gV4wNs4KrgnGAD87TjJDPo8MNRikJ63i2MwF4wBw
         6ke+SrW1hbSNQ==
Date:   Wed, 24 May 2023 13:46:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <brauner@kernel.org>
Cc:     Jeff Layton <jlayton@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20230524134623.733082d7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GcKfzO/M+QfcB0I20Y_=MB3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GcKfzO/M+QfcB0I20Y_=MB3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (htmldocs)
produced this warning:

fs/stat.c:80: warning: Function parameter or member 'request_mask' not desc=
ribed in 'generic_fillattr'

Introduced by commit

  8fb690f6de31 ("fs: pass the request_mask to generic_fillattr")

--=20
Cheers,
Stephen Rothwell

--Sig_/GcKfzO/M+QfcB0I20Y_=MB3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmRtiI8ACgkQAVBC80lX
0GxjNwgAjNnEH8e4YWFsST54hqC2baGgxvNGA+fT83P+h1ZfnRBxxlEQmIXYssed
xBKnSfmNjFWWWzd1ImP1q+RYcaq0AfDfRaS3GmMGqNzpk5XKWpZ/ohVrHNrTiToV
BPpJV9R/575IK72U6KAeTrZEqGq5TeuBpmripXkrZ8eWBLXcgxzRHen/9JVGLEOB
hxE1BcSGqozSw0KhCh+bBeb4ORxPqUsl9aFJHXHgIyv/5e0jtTyizO8RHEGJDgMi
exnaDVC2IEqkQK4GFkcKaqpXPvp1GHJDChgz847KtS+rABy8sjpD0D8J1UnxFzlN
wUedWsBVjp4m1zfJlDfKsY2njf0okw==
=Upgk
-----END PGP SIGNATURE-----

--Sig_/GcKfzO/M+QfcB0I20Y_=MB3--
