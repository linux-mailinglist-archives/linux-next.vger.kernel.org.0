Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA7AE61E997
	for <lists+linux-next@lfdr.de>; Mon,  7 Nov 2022 04:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbiKGD0t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Nov 2022 22:26:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbiKGD0t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 6 Nov 2022 22:26:49 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F06FEF6F;
        Sun,  6 Nov 2022 19:26:47 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4N5GqQ4ngxz4x1G;
        Mon,  7 Nov 2022 14:26:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1667791602;
        bh=swEp5zGA/Yzk77gfrQSnH+5KnVOcWngrWdKzL4MWyr4=;
        h=Date:From:To:Cc:Subject:From;
        b=P/r8egMiZn1kID4OEbhctNzQlDgOWxrvFKC8DOwF9fFZAaaqEHoZjDI2o4ZulEYMu
         0IE8RYNeMizymfbK8gusyVjE6GD/3TGfh97O1G4X/byZNySOcrP5mvpPGrv8KeEz09
         +3A7/FUfHWMgjYXn4lvxTKq3ro+oQa9lBceFZTSHRW5ACA5ixuhB1FREGomGeqUWlF
         WTGf6KKi+RD7ozGj6Qvb050KgdNhaD3cE0zHpDu5twhSecH1SG2pIgaMnJJ8Hr6cTn
         Ovgy5NYIIgeuPdKB9MY9jgj03puEJtVwiT81qUCNaPY4cGijqY+cy5ixhiB1Yf/FsP
         MY5l2Ri7k30Gw==
Date:   Mon, 7 Nov 2022 14:26:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the rcu tree
Message-ID: <20221107142641.527396ea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xQq1nE+F/_o1rHlU5/bec34";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xQq1nE+F/_o1rHlU5/bec34
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rcu tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/RCU/rcubarrier.rst:205: WARNING: Literal block ends without a=
 blank line; unexpected unindent.

Introduced by commit

  21c2e3909721 ("doc: Update rcubarrier.rst")

--=20
Cheers,
Stephen Rothwell

--Sig_/xQq1nE+F/_o1rHlU5/bec34
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmNoevEACgkQAVBC80lX
0GwZQwf/dK2SYwpnnhCpFjGwTlrXc8sEOCHyzAT+bzhYC0o3e4MU4T8VJqYfx4Vk
YuyziEzLc1R3ft4pC4zLi72sUolMu7JHdBA9tiru8e5KYdH01tR2HlnzxfoQ6LAz
NxPfresJDjXgf/2CRfPNBd3eWaO9OPULbRhQeGvFL6QrYkpYaB5nzVI3ZUWvFvSt
YsTIUtECR5g/nzU+A3GC0Jhee1dYevsFsC1HIRezmtNR0ELWSU/txyc6E+NUfZzP
HIEMBoLraZKjSZaaJtO+BL5BioNs9viCMJetijcZDPP9XE9v1X4VoWiG7U9WWUxc
HYUIyZc77Ozvw2cVGwlY6mg4HrEGBg==
=enEZ
-----END PGP SIGNATURE-----

--Sig_/xQq1nE+F/_o1rHlU5/bec34--
