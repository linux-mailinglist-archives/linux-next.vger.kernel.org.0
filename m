Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B88752845C3
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 08:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbgJFGDM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 02:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbgJFGDL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2020 02:03:11 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 651D8C0613A7;
        Mon,  5 Oct 2020 23:03:11 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C56Md14Tqz9s1t;
        Tue,  6 Oct 2020 17:03:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601964189;
        bh=Q3UmaxMjqhetqY3eKRfEWuA+7Er4K6SVFxQKfg2syNI=;
        h=Date:From:To:Cc:Subject:From;
        b=eM0vent50yTDAqsA5ej+aZ+Xaa3JUVRFTtHGgdfaEBE+EKsaTfBy5JyYPU5dh4+Jd
         F8nuF0IgO8TpEUuIN5RM4HfXWvx2WYhv33BwOy2zA7D/1rSEyRNpMpUd1nc3VGr/Im
         weiw7b8auuHs3FD1EhhEPHvqohcSuwmy/jzwcP1g1DfaVOjPCDarrI6tHKrKJat5Hw
         NUFWqa8cgVBOyFdpSqTQfh4LNnd+vuOCofZtnKnp8zwQ/FIRALGfvRpiyOZ2C6rjhS
         Zhl+Tlu1iXoJtZFvTHSf16nofXMzmOMIipni/lkxNrYiR9JPeYLPpZdQK5sCMqiYR5
         TZXEk6xY0WeTQ==
Date:   Tue, 6 Oct 2020 17:03:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: linux-next: manual merge of the devicetree tree with the mfd tree
Message-ID: <20201006170308.68e4781e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XjoCBdn64DV2Y2ypT8+b32Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XjoCBdn64DV2Y2ypT8+b32Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/arm/samsung/sysreg.yaml

between commit:

  18394297562a ("dt-bindings: mfd: syscon: Merge Samsung Exynos Sysreg bind=
ings")

from the mfd tree and commit:

  41fb845621ea ("dt-bindings: Another round of adding missing 'additionalPr=
operties'")

from the devicetree tree.

I fixed it up (I just deleted the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/XjoCBdn64DV2Y2ypT8+b32Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl98CJwACgkQAVBC80lX
0GyN6AgApEJGy6paX+HeTa6cPeGFwcJU7aQIZc8HeX66qKpcUeS8UDWSNuwg7Jqd
Qu08jinNYAWql10tb3Xyx7VnzTG/tISsjTLuuBVAb6ozCjagalo7x8nxtyJlHV1E
4Pr1ULAHp+uI27o2WIiwYmjfaT8YkPAi2fV+nLTeYNMK1UiisQ22B44oBVMWAtfH
FRjM9JEq4fOpcIdiESRwZ+1O91g/NDBs8qM/fD/kZrNwzV+oL1tMjoU3wdG/E9Cg
J0oUswni65PCd+1I9w6ZpbiUuu+Mj4oXvHjPINaOeNr6jVP0eEL3hUzFUPNgd3Ea
vACGXWGCRoDm1vwNs3jdLObwf9qbEg==
=bdoA
-----END PGP SIGNATURE-----

--Sig_/XjoCBdn64DV2Y2ypT8+b32Z--
