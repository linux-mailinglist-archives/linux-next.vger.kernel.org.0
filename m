Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4773384C2
	for <lists+linux-next@lfdr.de>; Fri, 12 Mar 2021 05:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231827AbhCLEpb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Mar 2021 23:45:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231816AbhCLEpY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Mar 2021 23:45:24 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B2CCC061574;
        Thu, 11 Mar 2021 20:45:22 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DxYCL2tXpz9sPf;
        Fri, 12 Mar 2021 15:45:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615524319;
        bh=BG9ZSGEo63mBy4X7PsREa6eYeDy1m2o5V8vFv5cDZBU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qNZp4/ukobrUPMGhIfzQx+OsdKWD2WPZqsr/5LMzhO4ZdeHCJAdTBXtkFnPnEY/Gy
         DI+irW8Dj82O+GqtvcmpeTVRSWtQv7ZSbMS9NhgtX7FgDkqpu1rxOq1AGhN4xXezxm
         JMJZmfsEFsQWIcgBlMudFmbDnTWs+XJ/JSMwleeCUPQld1WtCCwn7+GeZj4ODIitpJ
         1qtUl7QD4Q2qPLYrYJvswhsAPQfwKEvX7L59BIfCLFO2kJwZkJoJWmY20iuWO9n8tD
         W/PB3L7LEioINqtJkX7yDWrpbbKaqy64pGjNZdOk1FTVA5ednhRyRDJcjLuqGrZC6t
         Mvy4h5dM/G8Pw==
Date:   Fri, 12 Mar 2021 15:45:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the hwmon-staging tree
Message-ID: <20210312154515.709299dd@canb.auug.org.au>
In-Reply-To: <27340bd8-2009-683d-ac44-b6bb51f4347e@alliedtelesis.co.nz>
References: <20210312145031.5df91293@canb.auug.org.au>
        <27340bd8-2009-683d-ac44-b6bb51f4347e@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HchIol7tz0CFffFWBDsmgXJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HchIol7tz0CFffFWBDsmgXJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Chris,

On Fri, 12 Mar 2021 04:00:45 +0000 Chris Packham <Chris.Packham@alliedteles=
is.co.nz> wrote:
>
> Easy enough to fix. Who should I send the patch to?

Guenter, since the original patch is in his tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/HchIol7tz0CFffFWBDsmgXJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBK8dsACgkQAVBC80lX
0Gw38Af+PzbOZYYvf9QZA1r0mMdIN9W5oeNFwqeOYIcL9zlciovo9oyW10zr4Cj+
rlm0etRC0R72Hf4f2KBXG7ZGAOi99n29CwZXPWh7neAK0/D1XZO376zINjk6a05D
AgALScWKTcUfNzPz+B1D9LlWiETkWFKPdosJ8S920jLb4beCtEz8lLNTxpXi7t9N
6rTxRl8vK8zifIwrprNUFO8P3QAkBzgXqE1nsZip6qZqeRsmTk0z18DlnlHTHALk
x9ej/CEatqa8oBVXggPqmigtANxU2BzbDFF06rQc7eOwI921tkBuYS4xxLcXCOAo
yTM0saSr4YWLz3GmDDl+5oaM9qnLMw==
=4Xdp
-----END PGP SIGNATURE-----

--Sig_/HchIol7tz0CFffFWBDsmgXJ--
