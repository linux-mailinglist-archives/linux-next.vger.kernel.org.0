Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7277923A376
	for <lists+linux-next@lfdr.de>; Mon,  3 Aug 2020 13:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgHCLo5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Aug 2020 07:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgHCLop (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 3 Aug 2020 07:44:45 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E63DFC061757;
        Mon,  3 Aug 2020 04:44:42 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BKwz85lBdz9sTX;
        Mon,  3 Aug 2020 21:44:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596455077;
        bh=gcpvU8LYemiHsYHR84r1v7l12RPbYT5UxJdD42wefu8=;
        h=Date:From:To:Cc:Subject:From;
        b=BoX7LO2IKe/M1WYgwYtuIOkRjOIgPwqE2znroXmXds/mBitK6PqzD2QpwB+f9K/Fy
         vVUHTjKYE5iMOFS6lrQuiVRhwul7dIiviOV6YkTgX7lUfbXyOCpgi5fv930M5+j+jS
         cm0WYOQdfkIZyq9dmhWZ7DPVN7gcZtAqhK/sSgnNg2/ljq03S6i0S0PDT089y/hmlJ
         HX8gy/ZGwXBWnrA+Mai/odL2qFSVXdw2bG6wTIeYHDP2KSfpfMgn4+rhq/Pz30vc2k
         9ScFkG9B3iGA0pDdmdu03CfPuEga0zQesVdHAytjBV8Ml6rJ5n98QswvR6v4hJDPc5
         0JSr7hWta3dgg==
Date:   Mon, 3 Aug 2020 21:44:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: linux-next: panic on boot
Message-ID: <20200803214433.4c1b08cb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MEzDrBWRGeAvtsA9GqonXyg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MEzDrBWRGeAvtsA9GqonXyg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

As part of my testing of linux-next, I do a qemu boot of a powerpc
pseries_le_defconfig build.  Today it paniced after reaching user mode
(but before the console login prompt):

[    2.286787][    T1] Run /init as init process
[    2.557885][   T50] mount (50) used greatest stack depth: 10880 bytes le=
ft
[    2.574629][    T1] Kernel panic - not syncing: Attempted to kill init! =
exitcode=3D0x00000200
[    2.575079][    T1] CPU: 0 PID: 1 Comm: init Not tainted 5.8.0 #2
[    2.575421][    T1] Call Trace:
[    2.576197][    T1] [c00000007e3a3b90] [c0000000006f5de0] dump_stack+0xc=
4/0x114 (unreliable)
[    2.576450][    T1] [c00000007e3a3be0] [c000000000122318] panic+0x16c/0x=
404
[    2.576540][    T1] [c00000007e3a3c80] [c00000000012a690] do_exit+0xc70/=
0xd10
[    2.576613][    T1] [c00000007e3a3d60] [c00000000012a804] do_group_exit+=
0x64/0x110
[    2.576812][    T1] [c00000007e3a3da0] [c00000000012a8d4] sys_exit_group=
+0x24/0x30
[    2.576891][    T1] [c00000007e3a3dc0] [c000000000032cbc] system_call_ex=
ception+0x14c/0x230
[    2.576969][    T1] [c00000007e3a3e20] [c00000000000d740] system_call_co=
mmon+0xf0/0x27c

This boot is of a simple initramfs whose only purpose is to shutdown.

/init is a shell script:

#!/bin/sh
# devtmpfs does not get automounted for initramfs
/bin/mount -t devtmpfs devtmpfs /dev
exec 0</dev/console
exec 1>/dev/console
exec 2>/dev/console
exec /sbin/init $*

/sbin/init is busybox and this is the /etc/inittab

::sysinit:/bin/mount -t proc proc /proc
::sysinit:/bin/mount -o remount,rw /
::sysinit:/bin/mkdir -p /dev/pts
::sysinit:/bin/mkdir -p /dev/shm
::sysinit:/bin/mount -a
::sysinit:/bin/hostname -F /etc/hostname
::sysinit:/etc/init.d/rcS
console::respawn:/sbin/getty -L  console 0 vt100 # GENERIC_SERIAL
::shutdown:/etc/init.d/rcK
::shutdown:/sbin/swapoff -a
::shutdown:/bin/umount -a -r

and there are no init scripts.

Chritoph and Al are cc'd since we have some init stuff rewrite in the
vfs tree for the first time today.
--=20
Cheers,
Stephen Rothwell

--Sig_/MEzDrBWRGeAvtsA9GqonXyg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8n+KEACgkQAVBC80lX
0GzVzAf+JFK5CuJ8nrI4bwOqKhIGdwx4HTWd0cUyIE/Jm1+Fesqi9K5VRAh80HWx
TkcP7TYWOqHN10xXPFJStSCLkDkGHevsQDaMsvXzLWxDNKOHkidZtsuulcECOpqX
8P1I2M8z9F8oYAuwz9Ql9RgO9rZ+d+oQv/L+p2E7XySrLRg8MtgudoXJ1Z62Pk3f
aDgQUdkL2A4Xk8EcpyMX14bCv93+FBdagkwJ+u1MLf6MyNtJRh453X758tIpdhPX
Oadp+k9tJO78+IH1Zo3fxRB6V/vrtSIji/exfJeRh64hRUzvpvGx1wgJLSqUv4iJ
IlOaVdNga3pDP7oMe51AAvF59Hq9Gg==
=Li34
-----END PGP SIGNATURE-----

--Sig_/MEzDrBWRGeAvtsA9GqonXyg--
