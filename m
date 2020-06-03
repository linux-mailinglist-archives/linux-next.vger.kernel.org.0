Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB6551ECFA6
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 14:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgFCMUb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 08:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgFCMUb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2020 08:20:31 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D16C08C5C0;
        Wed,  3 Jun 2020 05:20:31 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49cSfg2j58z9sSc;
        Wed,  3 Jun 2020 22:20:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591186827;
        bh=H+V6iaU0HMESxRIzt4bnXlZv4q6ujY7VYk571yB0tKE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kTQQxprC9x1N/P8uaveb4GcwCZdAGYOY0hcDgitGhWBkWJZ63mxMqbwiP5+ddlx/q
         zD5kMVEeENd7xBu1md+Rx3YN565X9zaPCNH7KGMLyzxu6/S3+1kqE+3bkg+sMq4q++
         BYB7TVhCQztQygp6q+zYk8SCM5iYpfmTcwSk6+GdlRvdEKrFug8lsrwoaz06SsgEqo
         aiv1kTkcMgjAiRhe4q4S7UIavmop94i0orWV1/hzZ3RqWzm3hwChJbHyNKfXeCcHbF
         qmfTBFg9CLeQdEPiQhgX+/rGejiLUuB33o//rEDp+t3ENhVO1Qxar2IQpX11I+MBS+
         KDOeBPXuZ7zRQ==
Date:   Wed, 3 Jun 2020 22:20:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     John Garry <john.garry@huawei.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: arm64 build issue and mainline crash (was Re: linux-next: Tree
 for Jun 3)
Message-ID: <20200603222026.4cf661e0@canb.auug.org.au>
In-Reply-To: <20200603221341.0705a2f9@canb.auug.org.au>
References: <20200603210603.1fcf63ed@canb.auug.org.au>
        <ba1f622a-6866-2a58-706b-045e8a0d9012@huawei.com>
        <20200603221341.0705a2f9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MPvkwTmwy/2xgGpeaQMd09u";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MPvkwTmwy/2xgGpeaQMd09u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Just resending to get past the infradead.org mail filters (hopefully).

On Wed, 3 Jun 2020 22:13:41 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi John,
>=20
> On Wed, 3 Jun 2020 12:45:18 +0100 John Garry <john.garry@huawei.com> wrot=
e:
> >
> > On 03/06/2020 12:06, Stephen Rothwell wrote:
> >=20
> > JFYI, I am finding the vanilla defconfig build broken for arm64:
> >=20
> > LD      vmlinux.o=20
> > =20
> >=20
> > /home/john/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin/aarch6=
4-linux-gnu-ld:=20
> > cannot find ./drivers/firmware/efi/libstub/lib.abuilt-in.a: No such fil=
e=20
> > or directory
> > make[1]: *** [vmlinux] Error 1=20
> > =20
> >=20
> > make: *** [__sub-make] Error 2=20
> > =20
> >=20
> > john@htsatcamb-server:~/linux-next$
> >=20
> > In addition, the reason I was testing this was because Linus' master=20
> > (d6f9469a03d8 Merge tag 'erofs-for-5.8-rc1' of=20
> > git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs) was crashing:
> >=20
> > [ 5.368948] loop: module loaded
> > [ 5.372113] Unable to handle kernel paging request at virtual address=20
> > fffff9ffcfec4000
> > [ 5.380067] Mem abort info:
> > [ 5.382865]ESR =3D 0x96000044
> > [ 5.385927]EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > [ 5.391260]SET =3D 0, FnV =3D 0
> > [ 5.394319]EA =3D 0, S1PTW =3D 0
> > [ 5.397467] Data abort info:
> > [ 5.400354]ISV =3D 0, ISS =3D 0x00000044
> > [ 5.404203]CM =3D 0, WnR =3D 1
> > [ 5.407178] swapper pgtable: 4k pages, 48-bit VAs, pgdp=3D000000002f3f1=
000
> > [ 5.413909] [fffff9ffcfec4000] pgd=3D0000000000000000
> > [ 5.418807] Internal error: Oops: 96000044 [#1] PREEMPT SMP
> > [ 5.424399] Modules linked in:
> > [ 5.427462] CPU: 11 PID: 1 Comm: swapper/0 Not tainted=20
> > 5.7.0-05047-gd6f9469a03d8 #388
> > [ 5.435325] Hardware name: Huawei Taishan 2280 /D05, BIOS Hisilicon D05=
=20
> > IT21 Nemo 2.0 RC0 04/18/2018
> > [ 5.444499] pstate: 40000005 (nZcv daif -PAN -UAO BTYPE=3D--)
> > [ 5.450098] pc : __memset+0x16c/0x1c0
> > [ 5.453770] lr : pcpu_alloc+0x1a0/0x668
> > [ 5.457615] sp : ffff800011d3bbd0
> > [ 5.460936] x29: ffff800011d3bbd0 x28: ffff001fb5495180
> > [ 5.466267] x27: 0000000000000001 x26: 0000000000000100
> > [ 5.471597] x25: 0000000000000001 x24: 0000000000000001
> > [ 5.476928] x23: ffff80001135e9a0 x22: ffff80001196a200
> > [ 5.482259] x21: ffff80001196a360 x20: 0000000000000000
> > [ 5.487590] x19: 0000000000000000 x18: fffffe107e6fdb08
> > [ 5.492920] x17: 000000000000003f x16: 0000000000000000
> > [ 5.498251] x15: ffff001ffbffee00 x14: 0000000000000002
> > [ 5.503581] x13: 0000000000000000 x12: 000000000000003f
> > [ 5.508912] x11: 0000000000000040 x10: 0000000000000040
> > [ 5.514243] x9 : 0000000000000000 x8 : fffff9ffcfec4000
> > [ 5.519573] x7 : 0000000000000000 x6 : 000000000000003f
> > [ 5.524904] x5 : 0000000000000040 x4 : 0000000000000000
> > [ 5.530234] x3 : 0000000000000004 x2 : 00000000000000c0
> > [ 5.535565] x1 : 0000000000000000 x0 : fffff9ffcfec4000
> > [ 5.540896] Call trace:
> > [ 5.543344]  __memset+0x16c/0x1c0
> > [ 5.546666]  __alloc_percpu+0x14/0x1c
> > [ 5.550338]  alloc_workqueue+0x164/0x42c
> > [ 5.554273]  init+0x24/0xa4
> > [ 5.557071]  do_one_initcall+0x50/0x194
> > [ 5.560917]  kernel_init_freeable+0x1e4/0x250
> > [ 5.565288]  kernel_init+0x10/0x104
> > [ 5.568785]  ret_from_fork+0x10/0x18
> > [ 5.572372] Code: 91010108 54ffff4a 8b040108 cb050042 (d50b7428)
> > [ 5.578568] ---[ end trace 63c299bbe9b8ea9e ]---
> > [ 5.583205] Kernel panic - not syncing: Attempted to kill init!=20
> > exitcode=3D0x0000000b
> > [ 5.590903] SMP: stopping secondary CPUs
> > [ 5.594846] Kernel Offset: 0xf0000 from 0xffff800010000000
> > [ 5.600350] PHYS_OFFSET: 0x0
> > [ 5.603235] CPU features: 0x240022,20806008
> > [ 5.607430] Memory Limit: none
> > [ 5.610500] ---[ end Kernel panic - not syncing: Attempted to kill init=
!=20
> > exitcode=3D0x0000000b ]---
> >=20
> > I'll check that when I get a chance. Maybe all just transient. =20
>=20
> Yeah, I forgot to add a patch to make arm64 build again (it will be in
> linux-next tomorrow).  If you want to apply it to your tree, here is
> what I was given:
>=20
> diff --git a/Makefile b/Makefile
> index f80c4ff93ec9..fbb4b95ae648 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1074,7 +1074,7 @@ build-dirs        :=3D $(vmlinux-dirs)
>  clean-dirs     :=3D $(vmlinux-alldirs)
>=20
>  # Externally visible symbols (used by link-vmlinux.sh)
> -KBUILD_VMLINUX_OBJS :=3D $(head-y) $(addsuffix built-in.a, $(core-y))
> +KBUILD_VMLINUX_OBJS :=3D $(head-y) $(patsubst %/,%/built-in.a, $(core-y))
>  KBUILD_VMLINUX_OBJS +=3D $(addsuffix built-in.a, $(filter %/, $(libs-y)))
>  ifdef CONFIG_MODULES
>  KBUILD_VMLINUX_OBJS +=3D $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))

--=20
Cheers,
Stephen Rothwell

--Sig_/MPvkwTmwy/2xgGpeaQMd09u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7XlYoACgkQAVBC80lX
0Gyd/gf9F7hFS36W6I1KODqb00yNH4cSRFtkyh+ldzFSocsGRCqgJGDLtUzhEWud
6XzLYmkDUiAFaoRxpM/RYq1fterEAiEMyMDyN4PibU+/Ley/tCq7SWifbxx+dBw5
fLkv5StesCelg58xZcQG3Jw6BOUXSxkhf4ySmb0UipeKfKVfr5itD07SQ/w1eEa9
kDe2DnPkQw4FGKs5ArGpjZOX8zKPxJKRuXoSPpaj89DJH2bj6jewrO8rQ/2AAzI4
9bjwtmsXEDnre/0fOC4KFToX+r2mHHWW2lgB7WKQHW5vEh71lvrJVE3aHieLYiXy
G7fEluPOoz57eFw2S62Krqko6bYtNw==
=/LW2
-----END PGP SIGNATURE-----

--Sig_/MPvkwTmwy/2xgGpeaQMd09u--
