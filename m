Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03F4B19A17A
	for <lists+linux-next@lfdr.de>; Tue, 31 Mar 2020 23:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731250AbgCaV6B (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Mar 2020 17:58:01 -0400
Received: from ozlabs.org ([203.11.71.1]:58275 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728840AbgCaV6A (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Mar 2020 17:58:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48sNVW6rPHz9sSM;
        Wed,  1 Apr 2020 08:57:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585691878;
        bh=2jTbOx6UDNCCJt7scrIlbo1YKUJvdCR9MpDmRqeyOXc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cy44Ew/gBN+Xw+PVJYzSfBaD8o7XYDwrdQG2Ru5aNa8rJ1RvmppA9Z/nqM8HrkQlD
         WcZ+ZhbSgUrWbzWa1tiVu2Gv1vn5OIj88i/GCFVFaBdsvQC4T1mkLIGDIkkSN3L+io
         ihzdHgDlpLASBlytd9ZKV1N9eohbWrTHoALHpAbBtINWQZfn2N3hBmhkkSAtjoRpa0
         hJTWKGpo+29T2Lv471RHjsjPvvyqJK37JaTMhDlODucNr1kpkZg26LqdXWz75iTgpf
         XN674BdYNhqF3zRP0ZT0R2OOGcGTpenmoB+4zHQ4yYeTZlqp/KoNn+qWg6ft1PZG5C
         4R/+9DqWSBcEg==
Date:   Wed, 1 Apr 2020 08:57:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20200401085753.617c1636@canb.auug.org.au>
In-Reply-To: <20200330134746.627dcd93@canb.auug.org.au>
References: <20200330134746.627dcd93@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DX5omHHHCR4=V+XF50fjow3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DX5omHHHCR4=V+XF50fjow3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 30 Mar 2020 13:47:46 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the tip tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> kernel/futex.c: In function 'do_futex':
> kernel/futex.c:1676:17: warning: 'oldval' may be used uninitialized in th=
is function [-Wmaybe-uninitialized]
>  1676 |   return oldval =3D=3D cmparg;
>       |          ~~~~~~~^~~~~~~~~
> kernel/futex.c:1652:6: note: 'oldval' was declared here
>  1652 |  int oldval, ret;
>       |      ^~~~~~
>=20
> Introduced by commit
>=20
>   a08971e9488d ("futex: arch_futex_atomic_op_inuser() calling conventions=
 change")
>=20
> but I don't see how it makes this difference :-(

I now get this warning from building Linus' tree :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/DX5omHHHCR4=V+XF50fjow3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6DvOEACgkQAVBC80lX
0GwRPwgAjbTwhKZtLS/8RkEUC6ICv/zAc7X7bQGdchzK8dKf2/fnPo1Sr2bsPWyj
bEjfLXoFmSgSKhuy4L2kFvjAdhj5IJVP08+stdbhPfUjuliRI5Buk7Cf8G5s8SHq
ZworVHHnHlDuGC19gbdTYKZ3Y6LHYwNv6hi5A/jTFCO9lIUSiEJiJP4C8uIVNS1q
VUzj4TTSdKMT1K/lwpcr/uSAnGhFhum91sBM13N5AV9zmSnqWZP8Oh0K5fyhaG2e
ga6l6iCxmw9sCswMBTBUN8k8mshFjwNq2PSrpthPGpdmezXeKO7l4S3cjY+CcsrE
A+QC4YKMfpm0RrQiizfaGTNdj/8d6Q==
=yUPm
-----END PGP SIGNATURE-----

--Sig_/DX5omHHHCR4=V+XF50fjow3--
