Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E728459BC4
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 06:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbhKWFcs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 00:32:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbhKWFcr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 00:32:47 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B647C061574;
        Mon, 22 Nov 2021 21:29:40 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hyt4M0Nz0z4xbM;
        Tue, 23 Nov 2021 16:29:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637645379;
        bh=WBoY4RYGq7mK2Slf8V4rUd3p51NgZNJpYOz9FVMyGnM=;
        h=Date:From:To:Cc:Subject:From;
        b=tJ37n0KBkt2oRIlTUEecCLcqE/W5Bdw6JAV68yojfCnbvPc+ZDpXFthwSIWbfCLpR
         hKjo/wlVnrhZMxETqhHJ1Ji23u0R1kukttI8cX+W8xYltL4fi9MKhD/PS1exdHY41A
         uamE26oZqQwMLroXV7PbOUPiPs+mviYfwY7zef6GkIlxsZ5mya4z8IX+nIXp3IOBjH
         hv/BSy4ttUAlg+Z5KRd6fCAQysIteIH2ErKDcsh0UKj5phukReJdBiUzXbTGItnhIP
         exRFJOVBmMKvDu7H7Nly60cmpoafc/jqNBfYaqzcmYTVHiXeHq+zs3mS+VvHYA0wAv
         FuwZPM5OyK5Ow==
Date:   Tue, 23 Nov 2021 16:29:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Evan Quan <evan.quan@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of Linus' tree
Message-ID: <20211123162938.2bfc30a7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RWZppyrw6HV143RvxsKG2E3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RWZppyrw6HV143RvxsKG2E3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Building Linus' tree, today's linux-next build (htmldocs) produced
this warning:

drivers/gpu/drm/amd/include/amd_shared.h:103: warning: Enum value 'AMD_IP_B=
LOCK_TYPE_NUM' not described in enum 'amd_ip_block_type'

Introduced by commit

  6ee27ee27ba8 ("drm/amd/pm: avoid duplicate powergate/ungate setting")

--=20
Cheers,
Stephen Rothwell

--Sig_/RWZppyrw6HV143RvxsKG2E3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGcfEIACgkQAVBC80lX
0GxO1Af+IuDSxIIPFUcQmUNHGTMHKGR2lfBQib983fa2Ns3c99khVINUGNA3Bhw1
dJX5W2FO03lx6hOJ3k97OABpDgme5W+kYPOtFnrG2liclWs8K25iqnusjmCV08Gx
Rtuxok+sZsAgsLL6scstiPguX4/9VsN+Se1yTqijxxlmzpuZAfXFJWyBfAgU72JT
ki3mFetebluyrUBnfFw0B70kyGtbhS+Q33Wy14lEKLuBtiXRpDWSZ62GKXviVOd6
WONib9FtTi8ZwoAzPWWtwo0KipA/XWGh2g84UL6sOJUUdNB9ctcuyQy2KzzGLENY
mQYIrs1D5G8W6WJl/5l1pkCp94WstQ==
=/2sS
-----END PGP SIGNATURE-----

--Sig_/RWZppyrw6HV143RvxsKG2E3--
