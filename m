Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF112C7E61
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 08:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbgK3HFv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 02:05:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgK3HFu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Nov 2020 02:05:50 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C516C0613CF;
        Sun, 29 Nov 2020 23:05:10 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ckx7g6d6Rz9sTR;
        Mon, 30 Nov 2020 18:05:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606719906;
        bh=cLNf0rgmPwC7nqFGsDIsAzmTEpNLT/6a7pNcPmuzZBY=;
        h=Date:From:To:Cc:Subject:From;
        b=fmp5Hp2T9+Hfm2PUHtaHydjmVmlNfD2ODRPRTTlLzlwPR01hAVgLQS09pOiFbnLZE
         CAFDg8wr79KWL7ru4uO+8+bsWdMmsZ8eJx673e9ZxLE4bahSZeccZ9GEnnVicswcWt
         T41Y0ej12+cMyvaAKT39dneEu7u06Z2af1XDrDhFznK7jv+KUTPAJcAgvRJSqW2Dzp
         o+PMgtQyb7U2xHddGzA82CUUFfOPvYqD07OVmeYmu3D7sJHUE3rP61+zy6agkdCp/n
         aIREBkxtyuaCWiN/W4t2qKW9T5yRoCZIe0qUrS2omgb6rcD0c9+QOvMv6HQNGqBa2E
         Pw7aZaHJyfIUw==
Date:   Mon, 30 Nov 2020 18:05:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Borislav Petkov <bp@suse.de>, Justin Ernst <justin.ernst@hpe.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the tip tree
Message-ID: <20201130180503.5c173e05@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jpA689yidw_7328zjw_W7+R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jpA689yidw_7328zjw_W7+R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (htmldocs) produced
these warnings:

Documentation/ABI/testing/sysfs-firmware-sgi_uv:2: WARNING: Unexpected inde=
ntation.
Documentation/ABI/testing/sysfs-firmware-sgi_uv:2: WARNING: Unexpected inde=
ntation.
Documentation/ABI/testing/sysfs-firmware-sgi_uv:2: WARNING: Unexpected inde=
ntation.

Introduced by commit

  7ac2f1017115 ("x86/platform/uv: Update ABI documentation of /sys/firmware=
/sgi_uv/")

--=20
Cheers,
Stephen Rothwell

--Sig_/jpA689yidw_7328zjw_W7+R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/EmZ8ACgkQAVBC80lX
0Gyybwf/b5iwP+CriYTDzgYCju9o+9FLxj9WnfdWRlE3i1Ae+ii3PFROPqfrwiYa
h6Zgw0oPXzgUJdFhxEckl4K3HW1MGey6XgVYEaU27H41qGIwHtrNu5xU5da53Sof
RzvP8AEchbsDAVOTZT+SAu8ylyT0M5nTD9lkfAHs+4pM5I9kJCQiaK8FPbpMlmF2
sEMExOmp1uRqkTKyfkJszYrO48QDvonmWZgtrp8+RysMOjSSROu2/iDEnAxwTnJ6
aQE1dBe8BkyFlmxelvV8+InMcVIg9zULx+wok/KDe4sC4+sAdVuLn8v6WGIVCgNA
Jq9qrKUlaBuTFaO/+qCfIfNkUKIQ5Q==
=EGCK
-----END PGP SIGNATURE-----

--Sig_/jpA689yidw_7328zjw_W7+R--
