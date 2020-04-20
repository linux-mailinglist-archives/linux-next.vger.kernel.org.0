Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2203A1B067B
	for <lists+linux-next@lfdr.de>; Mon, 20 Apr 2020 12:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbgDTKXb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 06:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725773AbgDTKXb (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Apr 2020 06:23:31 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B168DC061A0C;
        Mon, 20 Apr 2020 03:23:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 495N803ldTz9sR4;
        Mon, 20 Apr 2020 20:23:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587378208;
        bh=RW51r0OkqlKhCUDbjGJYm9GJoo0sKMd7YAUnHSMFkd8=;
        h=Date:From:To:Cc:Subject:From;
        b=Pe/PjJV/yxMIRxiws+KpwFOpB7fb/ovFk/lvpSIDXViJlsaKdEiKB9/LcaVg30aga
         lmJQnB7/NcVq6sFVxPikkI7ESl+KF4gtqdEQujKdydGlZYCSr6EWvPttIsSbxAFmJk
         XAnpxWsr6wtzGdwnAtzBfgDNx0cYhbDe8GCLC+H5ggMW4xshgHqWreycrJmlitxnCV
         FS1Iiq/VYiH1zwpM4ETKDi8v0L4vKFDKOkWvSTdEDCrOVwlEeqPcSGW5JFHyog1QrT
         pZVIskpK2IsHMrQf2LKjoNX7xrEmm5zOZCdhDR4je1ZErDwZj2EQhV5dLnTPds7Wqd
         0XmlwdPYA1x4Q==
Date:   Mon, 20 Apr 2020 20:23:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmerdabbelt@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "kernelci.org bot" <bot@kernelci.org>
Subject: linux-next: build failure after merge of the origin tree
Message-ID: <20200420202326.4df8f12b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_vvU2EzIkw0U9lNKvFkWxmp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_vvU2EzIkw0U9lNKvFkWxmp
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

[reported by the kernelci.org bot]

The following error occurs in Linus' tree, build (riscv allnoconfig):

arch/riscv/kernel/stacktrace.c:78:8: error: =E2=80=98sp_in_global=E2=80=99 =
undeclared (first use in this function); did you mean =E2=80=98spin_lock=E2=
=80=99?

Caused by commit

  52e7c52d2ded ("RISC-V: Stop relying on GCC's register allocator's huerist=
ics")

--=20
Cheers,
Stephen Rothwell

--Sig_/_vvU2EzIkw0U9lNKvFkWxmp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6deB4ACgkQAVBC80lX
0GwfKAf/SHkLXEAKT9DAwtWJZPsezk5P40aV8XJxFKSWjKImA+Fgc8WKnQzRPa2N
+v8k2iiA+6AIT8nplUXZEE7wtyR64zFi+U9UFB5az9yUobgkCHPUg+95Q/32tVRh
3vdW4cVgOQ3P3Lb3akXaOgo9SDM5W8WPn76IJikEl4g4f+FT9DNaT1BlymSAjRi0
rOMLGr9UcbdKRPpd3tjAnkHWLlGqhOEjIjxnB473Jv3jgn4wjhmQEE7LS9AAk3/b
sqE1CtdA/GRgdHRQc2xGJa/6p3HggTp2ew/IX9gvw8P+p9+xgV2Blo7U81U1vWa+
UORjkoKCKPNOAWYm8Uz7THbn9QL7mg==
=uJ7E
-----END PGP SIGNATURE-----

--Sig_/_vvU2EzIkw0U9lNKvFkWxmp--
