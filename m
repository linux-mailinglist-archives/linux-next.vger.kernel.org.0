Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E14A2AE926
	for <lists+linux-next@lfdr.de>; Wed, 11 Nov 2020 07:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgKKGig (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Nov 2020 01:38:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgKKGif (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Nov 2020 01:38:35 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B9BBC0613D1;
        Tue, 10 Nov 2020 22:38:35 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CWFRq5x6Bz9s0b;
        Wed, 11 Nov 2020 17:38:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605076713;
        bh=ndZNSyI24FVv3tVRHIT1JgrpdsSo0wDrO66D3hx5kx4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=REb708I56i0XlX8sANnk4i/0Cz7s5L9f9TO7sWV4lZvlqgdaPbvEse+RYfsQGMr1f
         OJIBf9AROYmrGJUuluufDnxBNWtrUyDAJXes+SjJKSDKmpRazOAapMGntI7skbq2I5
         g9P5WRt2ETkSx5cguVpF54RQzKGNq+jVDzijnsmczdw9I2jUnNwk8oznO+bJoguMy0
         s53pWVEWeZDTqo9j/c1IoUx52uss30Rq6qSnf6KNCw8rzEfie36H8AQJfHohDKtilD
         25c2vNrYXhiKJimfN1CUda72SLKSnNXjNlGZUsXCmFLK+uwJdWuYBy8tzGSN5NrxIx
         kioDkKVR0B6ug==
Date:   Wed, 11 Nov 2020 17:38:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, Greg KH <greg@kroah.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: BUG: KASAN: global-out-of-bounds in soc_device_match on arm
Message-ID: <20201111173830.2c90a6e5@canb.auug.org.au>
In-Reply-To: <CA+G9fYvQ9R2i8FsQcvb7f8aYv1v1+vq_OsOtg9YEtHGRvx+zxQ@mail.gmail.com>
References: <CA+G9fYvQ9R2i8FsQcvb7f8aYv1v1+vq_OsOtg9YEtHGRvx+zxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XdPWFf_6Eh6Ie=qkhuxhI8M";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XdPWFf_6Eh6Ie=qkhuxhI8M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Naresh,

On Wed, 11 Nov 2020 11:55:46 +0530 Naresh Kamboju <naresh.kamboju@linaro.or=
g> wrote:
>
> The following kernel warning noticed on arm KASAN enabled config while
> booting on
> TI beagleboard x15 device.
>=20
> [   32.127451] BUG: KASAN: global-out-of-bounds in soc_device_match+0x64/=
0xe4
> [   32.127485] Read of size 4 at addr c21701f8 by task swapper/0/1
> [   32.127508]
> [   32.127549] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W
>   5.10.0-rc3-next-20201110 #2
> [   32.127577] Hardware name: Generic DRA74X (Flattened Device Tree)
> [   32.127604] Backtrace:
> [   32.127670] [<c199f710>] (dump_backtrace) from [<c199fb94>]
> (show_stack+0x20/0x24)
> [   32.127717]  r9:00000080 r8:c4208000 r7:c3023060 r6:40000093
> r5:00000000 r4:c3023060
> [   32.127766] [<c199fb74>] (show_stack) from [<c19a7ad0>]
> (dump_stack+0xe8/0x10c)
> [   32.127824] [<c19a79e8>] (dump_stack) from [<c05e0290>]
> (print_address_description.constprop.0+0x3c/0x4b0)
> [   32.127871]  r10:00000030 r9:c5da4010 r8:c5da4000 r7:00000000
> r6:c0fd5c20 r5:eebf33c0
> [   32.127903]  r4:c21701f8 r3:eebf33c4
> [   32.127958] [<c05e0254>] (print_address_description.constprop.0)
> from [<c05e0920>] (kasan_report+0x160/0x17c)
> [   32.128000]  r8:c5da4000 r7:00000000 r6:c0fd5c20 r5:00000001 r4:c21701=
f8
> [   32.128053] [<c05e07c0>] (kasan_report) from [<c05e0c68>]
> (__asan_load4+0x6c/0x9c)
> [   32.128093]  r7:c3c3ede0 r6:c354dea0 r5:c0fd5b88 r4:c21701f8
> [   32.128144] [<c05e0bfc>] (__asan_load4) from [<c0fd5c20>]
> (soc_device_match+0x64/0xe4)
> [   32.128197] [<c0fd5bbc>] (soc_device_match) from [<c0e2b4a8>]
> (omap8250_probe+0x628/0x75c)
> [   32.128236]  r7:b7841730 r6:c6db2c4e r5:00000001 r4:c6db2c40
> [   32.128290] [<c0e2ae80>] (omap8250_probe) from [<c0f9889c>]
> (platform_drv_probe+0x70/0xc8)
> [   32.128335]  r10:c5da4044 r9:c5da4048 r8:c34ff834 r7:c3c3e240
> r6:c34ff834 r5:00000000
> [   32.128363]  r4:c5da4010
> [   32.128413] [<c0f9882c>] (platform_drv_probe) from [<c0f94924>]
> (really_probe+0x184/0x72c)
> [   32.128452]  r7:c3c3e240 r6:00000000 r5:c3c3e1c0 r4:c5da4010
> [   32.128499] [<c0f947a0>] (really_probe) from [<c0f9515c>]
> (driver_probe_device+0xa4/0x270)
> [   32.128544]  r10:c34ff834 r9:c416fa58 r8:c379e840 r7:c5d75a00
> r6:c5da4034 r5:c37c01c0
> [   32.128572]  r4:c5da4010
> [   32.128620] [<c0f950b8>] (driver_probe_device) from [<c0f956ac>]
> (device_driver_attach+0x94/0x9c)
> [   32.128665]  r10:00000000 r9:c416fa58 r8:c0f956b4 r7:c5d75a00
> r6:c5da4034 r5:c34ff834
> [   32.128693]  r4:c5da4010
> [   32.128741] [<c0f95618>] (device_driver_attach) from [<c0f95798>]
> (__driver_attach+0xe4/0x19c)
> [   32.128780]  r7:c34ff834 r6:c5da4010 r5:c34ff834 r4:00000000
> [   32.128826] [<c0f956b4>] (__driver_attach) from [<c0f917e4>]
> (bus_for_each_dev+0x100/0x154)
> [   32.128865]  r7:c34ff834 r6:b78417a4 r5:c420bd40 r4:c5d75a34
> [   32.128910] [<c0f916e4>] (bus_for_each_dev) from [<c0f93f28>]
> (driver_attach+0x38/0x3c)
> [   32.128955]  r9:c34ff87c r8:c416fa00 r7:c3541a70 r6:c3541a20
> r5:c6db4f00 r4:c34ff834
> [   32.129001] [<c0f93ef0>] (driver_attach) from [<c0f93470>]
> (bus_add_driver+0x21c/0x2dc)
> [   32.129034]  r5:c6db4f00 r4:c34ff834
> [   32.129080] [<c0f93254>] (bus_add_driver) from [<c0f96874>]
> (driver_register+0xdc/0x1b0)
> [   32.129125]  r10:00000000 r9:c2b00468 r8:c378a0c0 r7:c2170360
> r6:c34ff838 r5:c3541a20
> [   32.129153]  r4:c34ff834
> [   32.129202] [<c0f96798>] (driver_register) from [<c0f987c8>]
> (__platform_driver_register+0x7c/0x84)
> [   32.129241]  r7:ffffc000 r6:c2bc509c r5:00000000 r4:c34ff820
> [   32.129300] [<c0f9874c>] (__platform_driver_register) from
> [<c2bc50c0>] (omap8250_platform_driver_init+0x24/0x28)
> [   32.129333]  r5:c420bf20 r4:b78417d0
> [   32.129387] [<c2bc509c>] (omap8250_platform_driver_init) from
> [<c030370c>] (do_one_initcall+0xc4/0x400)
> [   32.129437] [<c0303648>] (do_one_initcall) from [<c2b015e8>]
> (kernel_init_freeable+0x214/0x268)
> [   32.129482]  r10:c2d128a8 r9:c2b00468 r8:c2c50834 r7:c2c50854
> r6:c2a55ac8 r5:00000007
> [   32.129511]  r4:c425a700
> [   32.129563] [<c2b013d4>] (kernel_init_freeable) from [<c19bfd1c>]
> (kernel_init+0x18/0x140)
> [   32.129607]  r10:00000000 r9:00000000 r8:00000000 r7:00000000
> r6:00000000 r5:c19bfd04
> [   32.129635]  r4:00000000
> [   32.129684] [<c19bfd04>] (kernel_init) from [<c030017c>]
> (ret_from_fork+0x14/0x38)
> [   32.129715] Exception stack(0xc420bfb0 to 0xc420bff8)
> [   32.129753] bfa0:                                     00000000
> 00000000 00000000 00000000
> [   32.129798] bfc0: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [   32.129839] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [   32.129872]  r5:c19bfd04 r4:00000000
> [   32.129894]
> [   32.129917] The buggy address belongs to the variable:
> [   32.129957]  k3_soc_devices+0x38/0x1e0
> [   32.129981] The buggy address belongs to the page:
> [   32.130018] page:(ptrval) refcount:1 mapcount:0 mapping:00000000
> index:0x0 pfn:0x82170
> [   32.130051] flags: 0x1000(reserved)
> [   32.130104] raw: 00001000 eebf33c4 eebf33c4 00000000 00000000
> 00000000 ffffffff 00000001
> [   32.130133] raw: 00000000
> [   32.130159] page dumped because: kasan: bad access detected
> [   32.130182]
> [   32.130205] Memory state around the buggy address:
> [   32.130239]  c2170080: 00 00 f9 f9 f9 f9 f9 f9 00 00 00 00 00 05 f9 f9
> [   32.130272]  c2170100: f9 f9 f9 f9 00 00 00 00 00 01 f9 f9 f9 f9 f9 f9
> [   32.130306] >c2170180: 00 02 f9 f9 f9 f9 f9 f9 00 00 00 00 00 00 00 f9
> [   32.130331]                                                         ^
> [   32.130364]  c2170200: f9 f9 f9 f9 00 00 00 06 f9 f9 f9 f9 00 00 00 02
> [   32.130397]  c2170280: f9 f9 f9 f9 00 00 00 00 02 f9 f9 f9 f9 f9 f9 f9
> [   32.130422] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   32.130446] Disabling lock debugging due to kernel taint
>=20
> metadata:
>   git branch: master
>   git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git describe: next-20201110
>   make_kernelversion: 5.10.0-rc3
>   build : https://builds.tuxbuild.com/1k5bYasxkHF7omMh7mjtxjRtkMe/
>=20
> Full log:
> https://lkft.validation.linaro.org/scheduler/job/1927838#L2190
>=20
> --
> Linaro LKFT
> https://lkft.linaro.org

Presumably caused by commit

  439c7183e5b9 ("serial: 8250: 8250_omap: Disable RX interrupt after DMA en=
able")

from the tty tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/XdPWFf_6Eh6Ie=qkhuxhI8M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+rhuYACgkQAVBC80lX
0Gyouwf/asHFusOEqrub9yw9cODSzLoU2G6pzicD92CuFguWkdcV7NjWGswHKscy
VPqbRhPRKwp8Crwz7f8b6Byq6ncE+ekdVxuOhdm3DBKUdgEnh33Kwzpwf+XGqLEW
KtVoE9UEgoAYkgMg2xfyxSj/4P7zJ4hYA8iG003zw9e1zETfjQXI12cvuoemQAKe
bekGV6rmehSb2a6d4yYfL8et5VNJ5HoosxCABJgVVfE2mLUz+trs2fNCf47Y2M8b
44DjIIZYT+1wqrcsuQW87DPwStCBYHR/XMpBKmVWJDc74W7XhWl7nvODTasRblxS
MavCc6XHH+g0ELPvNkIV2D4gwlaVzQ==
=e4Qm
-----END PGP SIGNATURE-----

--Sig_/XdPWFf_6Eh6Ie=qkhuxhI8M--
