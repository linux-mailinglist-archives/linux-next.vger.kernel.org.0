Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58ED12FB14D
	for <lists+linux-next@lfdr.de>; Tue, 19 Jan 2021 07:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728747AbhASGXo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Jan 2021 01:23:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbhASGNr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Jan 2021 01:13:47 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E52DC061573;
        Mon, 18 Jan 2021 22:13:07 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DKdcc3whGz9sW0;
        Tue, 19 Jan 2021 17:13:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611036784;
        bh=n6zXTo1aw3U95TAKQee0gYIE6PdK6ZumIPHhbc/hx6Q=;
        h=Date:From:To:Cc:Subject:From;
        b=pqdRtByVqoMzgfmSya+Z1jFlPi/83fRKnr4hWMEcV6esC20qV6WkAgkQV5KUk8Tv9
         saiiU7UPQuIIABI5C8pPEb0FoaJVs11yPmPStanK5k24MfERbMXsaB1KGZc9/NcqPd
         dyrOycuYUSUzLsr+2MjrOhA7jXP0FGvArRyiRpmIIAq1H21DQEhJz22PQzjjUjDcL1
         dJdxt6q8PVSt1qj5C1imhQ9gAXR1z/kQlqg/SbtzjEJtK3olCO91dnvpwpQUVbswkA
         Kcl0bpcqAN40tWdquI1iGEdDbJ2r6KXkXWHT6zua8GElB2p4g2NklZVsElfGOgGDdH
         toGgpfYqNtmYg==
Date:   Tue, 19 Jan 2021 17:13:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the jc_docs tree
Message-ID: <20210119171303.6be1bb1f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GEfLT_.FmsAoLxxs1SHr5VP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GEfLT_.FmsAoLxxs1SHr5VP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the jc_docs tree, today's linux-next build (KCONFIG_NAME)
produced these warnings:

fs/pstore/zone.c:39: warning: expecting prototype for struct psz_head. Prot=
otype was for struct psz_buffer instead
include/linux/connector.h:122: warning: expecting prototype for cn_netlink_=
send_mult(). Prototype was for cn_netlink_send() instead
include/linux/firmware/intel/stratix10-svc-client.h:15: warning: expecting =
prototype for Service layer driver supports client names(). Prototype was f=
or SVC_CLIENT_FPGA() instead
include/linux/firmware/intel/stratix10-svc-client.h:45: warning: expecting =
prototype for in bit number(). Prototype was for SVC_STATUS_OK() instead
include/linux/firmware/intel/stratix10-svc-client.h:59: warning: expecting =
prototype for Flag bit for COMMAND_RECONFIG(). Prototype was for COMMAND_RE=
CONFIG_FLAG_PARTIAL() instead
include/linux/firmware/intel/stratix10-svc-client.h:66: warning: expecting =
prototype for Timeout settings for service clients(). Prototype was for SVC=
_RECONFIG_REQUEST_TIMEOUT_MS() instead
include/linux/firmware/intel/stratix10-svc-client.h:228: warning: expecting=
 prototype for intel_svc_done(). Prototype was for stratix10_svc_done() ins=
tead
include/linux/firmware/intel/stratix10-svc-client.h:15: warning: expecting =
prototype for Service layer driver supports client names(). Prototype was f=
or SVC_CLIENT_FPGA() instead
include/linux/firmware/intel/stratix10-svc-client.h:45: warning: expecting =
prototype for in bit number(). Prototype was for SVC_STATUS_OK() instead
include/linux/firmware/intel/stratix10-svc-client.h:59: warning: expecting =
prototype for Flag bit for COMMAND_RECONFIG(). Prototype was for COMMAND_RE=
CONFIG_FLAG_PARTIAL() instead
include/linux/firmware/intel/stratix10-svc-client.h:66: warning: expecting =
prototype for Timeout settings for service clients(). Prototype was for SVC=
_RECONFIG_REQUEST_TIMEOUT_MS() instead
include/linux/firmware/intel/stratix10-svc-client.h:228: warning: expecting=
 prototype for intel_svc_done(). Prototype was for stratix10_svc_done() ins=
tead
include/linux/firmware/intel/stratix10-svc-client.h:15: warning: expecting =
prototype for Service layer driver supports client names(). Prototype was f=
or SVC_CLIENT_FPGA() instead
include/linux/firmware/intel/stratix10-svc-client.h:45: warning: expecting =
prototype for in bit number(). Prototype was for SVC_STATUS_OK() instead
include/linux/firmware/intel/stratix10-svc-client.h:59: warning: expecting =
prototype for Flag bit for COMMAND_RECONFIG(). Prototype was for COMMAND_RE=
CONFIG_FLAG_PARTIAL() instead
include/linux/firmware/intel/stratix10-svc-client.h:66: warning: expecting =
prototype for Timeout settings for service clients(). Prototype was for SVC=
_RECONFIG_REQUEST_TIMEOUT_MS() instead
include/linux/firmware/intel/stratix10-svc-client.h:228: warning: expecting=
 prototype for intel_svc_done(). Prototype was for stratix10_svc_done() ins=
tead
include/linux/firmware/intel/stratix10-svc-client.h:15: warning: expecting =
prototype for Service layer driver supports client names(). Prototype was f=
or SVC_CLIENT_FPGA() instead
include/linux/firmware/intel/stratix10-svc-client.h:45: warning: expecting =
prototype for in bit number(). Prototype was for SVC_STATUS_OK() instead
include/linux/firmware/intel/stratix10-svc-client.h:59: warning: expecting =
prototype for Flag bit for COMMAND_RECONFIG(). Prototype was for COMMAND_RE=
CONFIG_FLAG_PARTIAL() instead
include/linux/firmware/intel/stratix10-svc-client.h:66: warning: expecting =
prototype for Timeout settings for service clients(). Prototype was for SVC=
_RECONFIG_REQUEST_TIMEOUT_MS() instead
include/linux/firmware/intel/stratix10-svc-client.h:228: warning: expecting=
 prototype for intel_svc_done(). Prototype was for stratix10_svc_done() ins=
tead
include/linux/firmware/intel/stratix10-svc-client.h:15: warning: expecting =
prototype for Service layer driver supports client names(). Prototype was f=
or SVC_CLIENT_FPGA() instead
include/linux/firmware/intel/stratix10-svc-client.h:45: warning: expecting =
prototype for in bit number(). Prototype was for SVC_STATUS_OK() instead
include/linux/firmware/intel/stratix10-svc-client.h:59: warning: expecting =
prototype for Flag bit for COMMAND_RECONFIG(). Prototype was for COMMAND_RE=
CONFIG_FLAG_PARTIAL() instead
include/linux/firmware/intel/stratix10-svc-client.h:66: warning: expecting =
prototype for Timeout settings for service clients(). Prototype was for SVC=
_RECONFIG_REQUEST_TIMEOUT_MS() instead
include/linux/firmware/intel/stratix10-svc-client.h:228: warning: expecting=
 prototype for intel_svc_done(). Prototype was for stratix10_svc_done() ins=
tead
include/linux/memblock.h:292: warning: expecting prototype for for_each_fre=
e_mem_range_in_zone(). Prototype was for for_each_free_mem_pfn_range_in_zon=
e() instead
include/linux/memblock.h:308: warning: expecting prototype for for_each_fre=
e_mem_range_in_zone_from(). Prototype was for for_each_free_mem_pfn_range_i=
n_zone_from() instead
drivers/rapidio/rio.c:758: warning: expecting prototype for rio_unmap_inb_r=
egion(). Prototype was for rio_unmap_outb_region() instead
include/linux/w1.h:292: warning: expecting prototype for module_w1_driver()=
. Prototype was for module_w1_family() instead
drivers/rapidio/rio.c:758: warning: expecting prototype for rio_unmap_inb_r=
egion(). Prototype was for rio_unmap_outb_region() instead
fs/dcache.c:477: warning: expecting prototype for d_drop(). Prototype was f=
or ___d_drop() instead
fs/dcache.c:1014: warning: expecting prototype for d_find_alias(). Prototyp=
e was for __d_find_alias() instead
fs/inode.c:1517: warning: expecting prototype for find_inode_by_rcu(). Prot=
otype was for find_inode_by_ino_rcu() instead
fs/inode.c:1792: warning: expecting prototype for touch_atime(). Prototype =
was for atime_needs_update() instead
fs/super.c:1728: warning: expecting prototype for thaw_super(). Prototype w=
as for thaw_super_locked() instead
fs/seq_file.c:1056: warning: expecting prototype for seq_hlist_start_precpu=
(). Prototype was for seq_hlist_start_percpu() instead
drivers/parport/share.c:280: warning: expecting prototype for parport_regis=
ter_driver(). Prototype was for __parport_register_driver() instead
lib/crc7.c:66: warning: expecting prototype for crc7(). Prototype was for c=
rc7_be() instead

Exposed by commit

  52042e2db452 ("scripts: kernel-doc: validate kernel-doc markup with the a=
ctual names")

--=20
Cheers,
Stephen Rothwell

--Sig_/GEfLT_.FmsAoLxxs1SHr5VP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAGeG8ACgkQAVBC80lX
0Gzumgf+M7MyZO1uV6WTnGuMtTpVLuBfyJeQ8YxYNBuwqtEKbF2fQUN6iuBdPVdy
Sx1nUAUq4iSM8UjvTktC1fhAUoSvlXCnQPYsZmY00hZDZGM/zQRvD6FxB7phs9g7
x/fCnx6JUuPsDJD5uf1ns+Y7Fz6pV7n5V2cfUmCr0N+OQecYTOmqLmd/A95CcD2a
2uei5jpyxFR2E4IIMgxVVbS40OeXGNs5W0iyivzXNBUgBFNgg1Al9627BVHrs+a/
RVC8WCjg//CktPDp/x8yocaKO+ahbRCODKbaRh9E/bkTPWu7xiUP8vM96Upq1ze1
HKBr49CKss+ZMZPpuTFIqYw5JklXCg==
=vl3o
-----END PGP SIGNATURE-----

--Sig_/GEfLT_.FmsAoLxxs1SHr5VP--
