Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 725E7E3EDD
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2019 00:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730252AbfJXWOR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Oct 2019 18:14:17 -0400
Received: from ozlabs.org ([203.11.71.1]:55243 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730134AbfJXWOR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Oct 2019 18:14:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46zhNj0zrRz9sPV;
        Fri, 25 Oct 2019 09:14:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571955253;
        bh=unMoINuP9v74vy+zeCf+u6//zhJz+EsUW+VXvnn9j44=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jL+YtCn7vFbKW40IkKjQ5pJUNsDmB28mBlIn/BS2hqjXw6uBeP9KvtYAA1ipgLUax
         5UxAJsC3pRi6xHVDbt5k6jtjRV+NDJtDvDMUxXxrBBK9zzTDJ+nKD0apy1RX3lsr/x
         fhYdJxWAkFClAIy35Xz6mS3OX1SoRhhucnTinffRxdS//P0uWEg5qaLjyGHIIQusaY
         yqWOAloEyO+Rp0nNanQfAlYGdFgGG6e6+hjdvhhf7OldnT8AM7MtijS68RxtPCrefH
         X8jjJlUV8+ZW1F0SGEMsJ5Mv+pMDXszKARGDhe8PpESYbdGVZanBZMD0deTRN0vxtC
         rYf98VpKOi6DQ==
Date:   Fri, 25 Oct 2019 09:14:12 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Daniel =?UTF-8?B?RMOtYXo=?= <daniel.diaz@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-perf-users@vger.kernel.org,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        lkft-triage@lists.linaro.org
Subject: linux-next: bad merge resolution in the tip tree (Was: Linux-next:
 20191022: perf: bpf_helpers_doc.py: not found)
Message-ID: <20191025091412.77bea416@canb.auug.org.au>
In-Reply-To: <CAEUSe79P0z4N=3TnF9ytWfemX8NqY1Mr_zt6PDgMAZQb=4ChpA@mail.gmail.com>
References: <CA+G9fYvWdkmmkrq7hvADZ-1qnUNEwRULoTPfOQDnu1aZW8cDEA@mail.gmail.com>
        <20191023024149.GA29009@leoy-ThinkPad-X240s>
        <CAEUSe79P0z4N=3TnF9ytWfemX8NqY1Mr_zt6PDgMAZQb=4ChpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rQjFlvQ/A_Sb7.IYHqDhM55";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rQjFlvQ/A_Sb7.IYHqDhM55
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Thu, 24 Oct 2019 13:05:54 -0500 Daniel D=C3=ADaz <daniel.diaz@linaro.org=
> wrote:
>
> By the way, while looking at this, we found this unresolved conflict
> in the tree:
> -----8<----------8<----------8<-----
>   $ git show 2b5d5b1927a8c
>   commit 2b5d5b1927a8c17bf3ce5b4f781c6ba11e02cadd
>   Merge: c1e45431c592 ae79d5588a04
>   Author: Ingo Molnar <mingo@kernel.org>
>   Date:   Mon Oct 21 07:13:15 2019 +0200
>=20
>       Merge branch 'perf/core'
>=20
>       Conflicts:
>               tools/perf/check-headers.sh
>=20
>   diff --cc tools/perf/check-headers.sh
>   index 499235a41162,93c46d38024e..1f73e6f7438c
>   --- a/tools/perf/check-headers.sh
>   +++ b/tools/perf/check-headers.sh
>   @@@ -28,7 -28,7 +28,11 @@@ arch/x86/include/asm/disabled-features.
>     arch/x86/include/asm/required-features.h
>     arch/x86/include/asm/cpufeatures.h
>     arch/x86/include/asm/inat_types.h
>   ++<<<<<<< HEAD
>    +arch/x86/include/asm/emulate_prefix.h
>   ++=3D=3D=3D=3D=3D=3D=3D
>   + arch/x86/include/asm/msr-index.h
>   ++>>>>>>> perf/core =20
>     arch/x86/include/uapi/asm/prctl.h
>     arch/x86/lib/x86-opcode-map.txt
>     arch/x86/tools/gen-insn-attr-x86.awk
> ----->8---------->8---------->8----- =20
>=20
> That's still on next-20191024.
>=20
> Greetings!
>=20
> Daniel D=C3=ADaz
> daniel.diaz@linaro.org

--=20
Cheers,
Stephen Rothwell

--Sig_/rQjFlvQ/A_Sb7.IYHqDhM55
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2yIjQACgkQAVBC80lX
0GxC5gf/anJx6HndU8+qLPUfGyZwQH0nsqze2ppYHbaiovBAxrUPZ3F6AFLCihdc
cakYc0X887BZNddUDPvFdF+zCQhWBnXXub1UzDZhecq7RbJWTjFD9yW/Rs1yRzYJ
O/vYDRNDtYK/qJELnpExsHmInlA630gwWifiOFInhiMJksRRpeNlCOnk1dWD5U5G
z84dLfIHJxw+ZEAGUr0DsTeFinzb8CxXzx95kz/Ggb+TWoPioq1doExBzBSDji++
QUoKKZ9+3UbTzQwCk7CdIbPmhGXfKKZoMmvLeIpcfXnybWADDZam1VyRMgss7O5O
R8CpVoRYm93iHoD/jHEcouzq5R8n1Q==
=YiY5
-----END PGP SIGNATURE-----

--Sig_/rQjFlvQ/A_Sb7.IYHqDhM55--
