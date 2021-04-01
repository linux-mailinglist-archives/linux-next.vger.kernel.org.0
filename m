Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E32CD35101D
	for <lists+linux-next@lfdr.de>; Thu,  1 Apr 2021 09:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233509AbhDAHcu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Apr 2021 03:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233258AbhDAHcj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Apr 2021 03:32:39 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEFA7C0613E6;
        Thu,  1 Apr 2021 00:32:38 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F9vz736Mtz9sVt;
        Thu,  1 Apr 2021 18:32:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617262355;
        bh=/isdsYgQkcYhkRFaRl4QlzMrWCuDpbbf/TEzX6QiOmA=;
        h=Date:From:To:Cc:Subject:From;
        b=DLLh1wlNkgBPyqdi3CzWdS2sab4Zavv5KPvNSo/JnwSfkxX9bSE5CTwKb1BkyUrd+
         RKJDI2QY5mEHXTOUelCVhPS/Cac1+c75fgXIxA23rhfjwR5Nc7ClwrGGuEhUM5dEkZ
         YxRTgDN2F1heeSNv797t5So5Bq4Xp5EQqj+Q1J/s6Cs8NLKBrT52APDj4lsB86IgBD
         0wmYGglTmslgxJFF1J6SUoT8VQcEXVigf9dEh6Shh+GYRFNGYSC/o0UMxDPQFDGpbQ
         4lCMwfXAsKeQcOahJo8SVHmRnmyMpLRWZzmQoHhFkve+eNGgu7qeP1QYehoaHXlaCw
         DzTAmw4gBYwXw==
Date:   Thu, 1 Apr 2021 18:32:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm tree
Message-ID: <20210401183234.11344d79@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q.43okiEo_Sw6Cb6WiawBC8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/q.43okiEo_Sw6Cb6WiawBC8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
these warnings:

drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Excess function param=
eter 'trampoline' description in 'intel_engine_cmd_parser'
drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter or=
 member 'jump_whitelist' not described in 'intel_engine_cmd_parser'
drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter or=
 member 'shadow_map' not described in 'intel_engine_cmd_parser'
drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter or=
 member 'batch_map' not described in 'intel_engine_cmd_parser'
drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Excess function param=
eter 'trampoline' description in 'intel_engine_cmd_parser'


Introduced by commit

  0edbb9ba1bfe ("drm/i915: Move cmd parser pinning to execbuffer")

--=20
Cheers,
Stephen Rothwell

--Sig_/q.43okiEo_Sw6Cb6WiawBC8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBldxIACgkQAVBC80lX
0Gz+VggAmz9Oe5HbO3fZk6MLggai5qWpZYwqednPMY3nK9LSTPLvvZu6WzdkCVQg
Fk4rWgLNMW42PrY//pkf6Y7aixQAAKM0ojZfjwPpSn40WAv/R5ia58Nr1LjSPU1g
yLXKZjCIx4ljGCRMRViIdoY2evqnNvGUCh4f6KJ3ykIUfP4mzc6YVGpcFsdikiI3
3WQ/CwZH8u2R2Bn18M9n9CHJZMRVt4eLdebn17VLBeLUCY3zGk2cPKTS40cFnA2Y
W46OCB/kCe3AKMgqCAiRPwu3Meyayjwk629zeDkJX1O5YpU40YGRDGZZTaWB13g4
yY5XRO7DIIk6MAI/U22hrOJ/ZIn5iw==
=mc5V
-----END PGP SIGNATURE-----

--Sig_/q.43okiEo_Sw6Cb6WiawBC8--
