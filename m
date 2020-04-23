Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3001B571E
	for <lists+linux-next@lfdr.de>; Thu, 23 Apr 2020 10:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgDWISZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Apr 2020 04:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgDWISX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Apr 2020 04:18:23 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA6CC03C1AB;
        Thu, 23 Apr 2020 01:18:23 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4979DB04M8z9sSt;
        Thu, 23 Apr 2020 18:18:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587629899;
        bh=GPnk/vH3jAym8oL/STMwJRR8XwoTSHLMcuIwdNokFDQ=;
        h=Date:From:To:Cc:Subject:From;
        b=VPYttCQqJwtsXNhls1ZB9eaCl4pk1AWMkk0i+/V1PFwMfIeJLquO98ycx2eVdV1FG
         dyqiX6b1fG7b4LtP3DB8q3hllN72bkrWRCYZElq5aSPOZb58O8Q/uwZDGczJ+9fF4+
         P30cW6wzCbXuj6eO1kUuJzqlcmu+CThjM9XxH4zpogxO1osMStJQzWpIfbSADdmmBd
         /fbT1g3nukkhuyfKfg5FnudiENV4aXMGB+vxMn8NjwsJwITPGGkS0Q43M9TxaUq+G9
         31NX3h7HIT9Kz4DiZkmNMCfoXLLiUEmRir9ROh6ydCvUangyGF8PG6EnnsjyNo0T98
         wbe0ccc9A8tfw==
Date:   Thu, 23 Apr 2020 18:18:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20200423181815.6fb1b2ee@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T8Z3n_bI3KpHpqUVrE+a/hl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/T8Z3n_bI3KpHpqUVrE+a/hl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  7f9b34f36cf6 ("objtool: Fix off-by-one in symbol_by_offset()")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/T8Z3n_bI3KpHpqUVrE+a/hl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6hT0cACgkQAVBC80lX
0Gxaogf/UKP4/C48yYk/bVz+tv4M4wzDTImB6lM5ATLSaEK1Wh5yuoqTcQYbEU02
oQqFmCbNSd7xUYP73cwPWEEOkdMitVH9QEgxqxSCHtYfaJok5pY8F9F2EnbzqYBF
aPxKzFGc6W6m6AwSNVHDi4U3AGWC0Tvo8MvxHTj6+7p0g8EewO/9s1eAKjKU+ja+
D3Ai7bOaGQi5WKYqVFeVh7sOxjjwuV07lpLYXZsNiP3APTIQidT+3k7SgYuNQ1Xk
yV8j4CfKs2MlNT1kf6kij0oBdk0qE2/2bZpkFiqPHzm/qA8kOY6f9RhqutGBK2Va
+307P2FkBsjm9iP/1KIH2M2jS0Tzrw==
=tenC
-----END PGP SIGNATURE-----

--Sig_/T8Z3n_bI3KpHpqUVrE+a/hl--
