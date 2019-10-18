Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52C7BDBA77
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2019 02:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441868AbfJRANs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Oct 2019 20:13:48 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51381 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727941AbfJRANs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Oct 2019 20:13:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46vRMs67Y6z9sPl;
        Fri, 18 Oct 2019 11:13:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571357626;
        bh=12snFaB8rmDnPOpJxigp4Lb1Qpp4paHuFv7dBtqnEd8=;
        h=Date:From:To:Cc:Subject:From;
        b=m/omOlUvmitiMtCjMV5DsUxExhUyzV+Rf98Q/tlDYbMy5Fv4Jdaws2CagVmDqMm8U
         9opLXar9lVbpsXB1Qjb/4tXrDxOSIU8zrMEYzP3t0dAFZ8nYlEET1u8c8v9H5LL8p9
         WIpK1RMChOvdvl8cZ+GrE5d7DYf9cf//GXHJ8Ao2A3+Fkom5zzzOTOlHkdiYtpa9+T
         /1horLuYYlik+bHbQjNRUIM6UBwX54HJXqtolQupSMYPR8s6MZCPOmeUTkvHJtHmNX
         Uasfr9Kf77Bp84FSXLq4johhADOeylO2zsIQOcKIVidSaCSdaT4Sv/rTc7PX5GgusP
         qEn8KJGSlUwbw==
Date:   Fri, 18 Oct 2019 11:13:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Amit K Bag <amit.k.bag@intel.com>,
        Raghuram Hegde <raghuram.hegde@intel.com>,
        Chethan T N <chethan.tumkur.narayan@intel.com>
Subject: linux-next: build failure after merge of the bluetooth tree
Message-ID: <20191018111343.5a34ee33@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EDCZHYmrUaSWx1COA65IzzB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EDCZHYmrUaSWx1COA65IzzB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bluetooth tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from drivers/bluetooth/hci_ldisc.c:34:
drivers/bluetooth/btintel.h: In function 'btintel_reset_to_bootloader':
drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value, in funct=
ion returning void [-Wreturn-type]
  188 |  return -EOPNOTSUPP;
      |         ^
drivers/bluetooth/btintel.h:186:20: note: declared here
  186 | static inline void btintel_reset_to_bootloader(struct hci_dev *hdev)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  b9a2562f4918 ("Bluetooth: btusb: Trigger Intel FW download error recovery=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/EDCZHYmrUaSWx1COA65IzzB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2pA7cACgkQAVBC80lX
0GzIhQf/YSRi7+l7tuvIlcJ0F/IFpnHjhx8BG4KAcMQCeLADYo5aVdUHCNMJJOKU
i88A8NgxzTkm0ML3xfyCUKwTJMhrHIf+mrdYUn8eSe2k7SxC3DqUt4QhNa2BspE1
mpKxDnQjAkXMGqMWEiyNTFPKGrODD2BbCWEuW9AMLauwo/o77TGerqGCOJWZSMQN
gjeR0qIrzA6XE3BjxpppJc3OhL4KXAe4PYFvgGDf7BI8Q5FvDKhYl+vLw8VZxGha
ZbndAyBngo2arShuVUYFS8pJnzrVfI9Y8ij3s0aK7NKH+809TAAPG1+kk++xTOxn
MgN/Dh0qC1eKUQd6XZQmMZbldOrJew==
=9VWU
-----END PGP SIGNATURE-----

--Sig_/EDCZHYmrUaSWx1COA65IzzB--
