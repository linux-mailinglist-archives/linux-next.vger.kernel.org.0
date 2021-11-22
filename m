Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E641D4597D6
	for <lists+linux-next@lfdr.de>; Mon, 22 Nov 2021 23:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234237AbhKVWr3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Nov 2021 17:47:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233665AbhKVWr3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Nov 2021 17:47:29 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D8DC061574;
        Mon, 22 Nov 2021 14:44:22 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hyj4h2KFYz4xZ5;
        Tue, 23 Nov 2021 09:44:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637621060;
        bh=aEexyEczcFtuMleR34uoCOA9w5RhozHySeVlu2BSEz0=;
        h=Date:From:To:Cc:Subject:From;
        b=VRzQh6eOQbvSEIex28Jt7vreHDezSGaJjkhe+3pgS5VhZwOUig15cTUzj/sFRQPRy
         HREASejaNJv66ypp82zEDNEt476ZB3OmZeRuqPPbv9OJAbNoK7/wjfM81cdMTr2vDu
         OchdmheUUKgbDxq6Hp8+WwsH9qT7uapy1f0uJEKGarYfES/dBySzW505u6dqpmvnck
         j9vskVkDu8pbGSG2LHH8ml/9ueGgmeLv7YcPjuncjkK+iZ0KW/lPUImygfOBh1Ho0m
         wynJkFpVVVbBNLkkip6wun++gASSGcux5kU1SYdIhku5Ty1BZBu7M/3np/Kds84O5Q
         qTWGEgxN9VUZg==
Date:   Tue, 23 Nov 2021 09:44:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Borislav Petkov <bp@suse.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings in Linus' tree
Message-ID: <20211123094419.08000327@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hba2lURR4Nh0/jOU0VUOl+C";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hba2lURR4Nh0/jOU0VUOl+C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Building Linus' tree, today's linux-next build (x86_64 allmodconfig)
produced these warnings:

WARNING: modpost: vmlinux.o(.text.unlikely+0x63df): Section mismatch in ref=
erence from the function prepare_command_line() to the variable .init.data:=
builtin_cmdline
The function prepare_command_line() references
the variable __initdata builtin_cmdline.
This is often because prepare_command_line lacks a __initdata=20
annotation or the annotation of builtin_cmdline is wrong.

WARNING: modpost: vmlinux.o(.text.unlikely+0x63fa): Section mismatch in ref=
erence from the function prepare_command_line() to the variable .init.data:=
builtin_cmdline
The function prepare_command_line() references
the variable __initdata builtin_cmdline.
This is often because prepare_command_line lacks a __initdata=20
annotation or the annotation of builtin_cmdline is wrong.

WARNING: modpost: vmlinux.o(.text.unlikely+0x640b): Section mismatch in ref=
erence from the function prepare_command_line() to the variable .init.data:=
boot_command_line
The function prepare_command_line() references
the variable __initdata boot_command_line.
This is often because prepare_command_line lacks a __initdata=20
annotation or the annotation of boot_command_line is wrong.

WARNING: modpost: vmlinux.o(.text.unlikely+0x6412): Section mismatch in ref=
erence from the function prepare_command_line() to the variable .init.data:=
builtin_cmdline
The function prepare_command_line() references
the variable __initdata builtin_cmdline.
This is often because prepare_command_line lacks a __initdata=20
annotation or the annotation of builtin_cmdline is wrong.

WARNING: modpost: vmlinux.o(.text.unlikely+0x6423): Section mismatch in ref=
erence from the function prepare_command_line() to the variable .init.data:=
builtin_cmdline
The function prepare_command_line() references
the variable __initdata builtin_cmdline.
This is often because prepare_command_line lacks a __initdata=20
annotation or the annotation of builtin_cmdline is wrong.

WARNING: modpost: vmlinux.o(.text.unlikely+0x6461): Section mismatch in ref=
erence from the function prepare_command_line() to the variable .init.data:=
builtin_cmdline
The function prepare_command_line() references
the variable __initdata builtin_cmdline.
This is often because prepare_command_line lacks a __initdata=20
annotation or the annotation of builtin_cmdline is wrong.

WARNING: modpost: vmlinux.o(.text.unlikely+0x6468): Section mismatch in ref=
erence from the function prepare_command_line() to the variable .init.data:=
boot_command_line
The function prepare_command_line() references
the variable __initdata boot_command_line.
This is often because prepare_command_line lacks a __initdata=20
annotation or the annotation of boot_command_line is wrong.

WARNING: modpost: vmlinux.o(.text.unlikely+0x6474): Section mismatch in ref=
erence from the function prepare_command_line() to the variable .init.data:=
boot_command_line
The function prepare_command_line() references
the variable __initdata boot_command_line.
This is often because prepare_command_line lacks a __initdata=20
annotation or the annotation of boot_command_line is wrong.

WARNING: modpost: vmlinux.o(.text.unlikely+0x647f): Section mismatch in ref=
erence from the function prepare_command_line() to the variable .init.data:=
boot_command_line
The function prepare_command_line() references
the variable __initdata boot_command_line.
This is often because prepare_command_line lacks a __initdata=20
annotation or the annotation of boot_command_line is wrong.

WARNING: modpost: vmlinux.o(.text.unlikely+0x6487): Section mismatch in ref=
erence from the function prepare_command_line() to the variable .init.data:=
boot_command_line
The function prepare_command_line() references
the variable __initdata boot_command_line.
This is often because prepare_command_line lacks a __initdata=20
annotation or the annotation of boot_command_line is wrong.

WARNING: modpost: vmlinux.o(.text.unlikely+0x6498): Section mismatch in ref=
erence from the function prepare_command_line() to the variable .init.data:=
boot_command_line
The function prepare_command_line() references
the variable __initdata boot_command_line.
This is often because prepare_command_line lacks a __initdata=20
annotation or the annotation of boot_command_line is wrong.

WARNING: modpost: vmlinux.o(.text.unlikely+0x649f): Section mismatch in ref=
erence from the function prepare_command_line() to the variable .init.data:=
command_line
The function prepare_command_line() references
the variable __initdata command_line.
This is often because prepare_command_line lacks a __initdata=20
annotation or the annotation of command_line is wrong.

WARNING: modpost: vmlinux.o(.text.unlikely+0x64b8): Section mismatch in ref=
erence from the function prepare_command_line() to the variable .init.data:=
command_line
The function prepare_command_line() references
the variable __initdata command_line.
This is often because prepare_command_line lacks a __initdata=20
annotation or the annotation of command_line is wrong.

WARNING: modpost: vmlinux.o(.text.unlikely+0x64c3): Section mismatch in ref=
erence from the function prepare_command_line() to the variable .init.data:=
command_line
The function prepare_command_line() references
the variable __initdata command_line.
This is often because prepare_command_line lacks a __initdata=20
annotation or the annotation of command_line is wrong.

WARNING: modpost: vmlinux.o(.text.unlikely+0x64c9): Section mismatch in ref=
erence from the function prepare_command_line() to the function .init.text:=
parse_early_param()
The function prepare_command_line() references
the function __init parse_early_param().
This is often because prepare_command_line lacks a __init=20
annotation or the annotation of parse_early_param is wrong.

WARNING: modpost: vmlinux.o(.text.unlikely+0x64d0): Section mismatch in ref=
erence from the function prepare_command_line() to the variable .init.data:=
command_line
The function prepare_command_line() references
the variable __initdata command_line.
This is often because prepare_command_line lacks a __initdata=20
annotation or the annotation of command_line is wrong.

Introduced by commit

  8d48bf8206f7 ("x86/boot: Pull up cmdline preparation and early param pars=
ing")

--=20
Cheers,
Stephen Rothwell

--Sig_/hba2lURR4Nh0/jOU0VUOl+C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGcHUMACgkQAVBC80lX
0GwWlgf/X3mzKOkDU1q/RIimX1l/z8TgSmrVfbF4MIM1maJ5otxQCs9iKdDsqn75
R2X7uHSnngV+vyHBXT9m8erKThJv6RRPpZrbNimlbAmRIHvBRU/Opn5zeNM3XrVf
VK0VQWLy2mkH1LVjg6CR8o+9zKWbO83Owzke2OGUBscsZtBnMYCJo50oVuyFtBDj
tmN/z075rw5mQ7OAEeQkeAClUR8r2oIO2OcM5lxzzc7W0skBmL4r101PotJD94YC
1k/u3O8dpWV7/osr57NpYOqPQvdl1TPzQGfceRUkZVKo80PQ0Lmim1WEWsh4YLXI
MnOV3p/xZ/SZTxP+874GyYU/FsVtDw==
=nkSw
-----END PGP SIGNATURE-----

--Sig_/hba2lURR4Nh0/jOU0VUOl+C--
