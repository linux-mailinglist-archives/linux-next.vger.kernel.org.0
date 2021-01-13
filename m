Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 468F82F42E9
	for <lists+linux-next@lfdr.de>; Wed, 13 Jan 2021 05:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbhAMENi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Jan 2021 23:13:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbhAMENh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Jan 2021 23:13:37 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A98AC061794;
        Tue, 12 Jan 2021 20:12:57 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DFvDl32zHz9sVR;
        Wed, 13 Jan 2021 15:12:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610511175;
        bh=rgdAz2xVd4KeXJITNeQgDGmhU9TkBTzPoVa8qyu7HGI=;
        h=Date:From:To:Cc:Subject:From;
        b=jEcUjjfb5dhvs8+ab6HRL/ipo+ennj25p7Tnhd20sxWWP5/9JXr4xeec9H2fkgEc/
         PXnT+J+yDL/fpppMz5YVQV82miQBe9s+Ar4pHISwyDc2YTBUBZuBbbXYVqk/3GelAF
         ZSiznmT2bRqiSRmrGEDbanGf85hhOmMrOBalXN3z9B31aOoFy5sS4T9qKAfp2U2nO+
         H8vHGX2aoLt7sz5xDxpQv2r3SNJSDVQGZlX5yc3yVdQoaxL0g8w6iSVav+l7/hVvFo
         4l3DT8ugYEPpZs9leC3ejnAqK2ge4P5MyzmACvCx41vx6BtA/Bfnn2yZ6feqknLFuV
         9D7ePhHKXVh+g==
Date:   Wed, 13 Jan 2021 15:12:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the jc_docs tree
Message-ID: <20210113151254.74b9a295@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hBzNQkHVmB=y/.r18puw+nc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hBzNQkHVmB=y/.r18puw+nc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the jc_docs tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/translations/zh_CN/mips/booting.rst:5: WARNING: undefined lab=
el: booting (if the link has no caption the label must precede a section he=
ader)

Introduced by commit

  7fd3954b0c52 ("doc/zh_CN: add mips booting.rst translation")

--=20
Cheers,
Stephen Rothwell

--Sig_/hBzNQkHVmB=y/.r18puw+nc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/+c0YACgkQAVBC80lX
0GzI4Af+JF+czX5XcmHkIBA8bblgokzHDxK7Td745RFrsi33vMGohOBf9oBUJEw7
AuRHPrJ+lLSZAiK/xpEPZINVYbFSU+tSoBshz4VWEMXuypP/YzqaKeK3id55+bNl
Ndg+IrReLLELz9+IlCsHHvwnmsN88l/qe120tSKPN3JECa3hN02lCJV1ThaGfwgg
KYY6ZE2xExxbpUCyr6AECU8uj9WJ7UWemwmmeMk6jRu8f/UBccuuuYkI3ASLPg9O
kENtHmr8nLRh71uFC+SSEQHvgLIjZbIkDjg6BvZAmBTItArwwuuzoM42bRgm9LG6
pZjtH3Dl+Ke2bXrHdveaz4349BPVsQ==
=EHzP
-----END PGP SIGNATURE-----

--Sig_/hBzNQkHVmB=y/.r18puw+nc--
