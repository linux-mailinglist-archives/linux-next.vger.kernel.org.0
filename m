Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0129421A3C
	for <lists+linux-next@lfdr.de>; Tue,  5 Oct 2021 00:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234876AbhJDWqp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Oct 2021 18:46:45 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:35587 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233501AbhJDWqp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Oct 2021 18:46:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HNbPy0Y1Fz4xbX;
        Tue,  5 Oct 2021 09:44:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633387494;
        bh=lDVTxhqxgT0B9k7XKWS8R+TkKhGIoWG2QL/9lQoz8j8=;
        h=Date:From:To:Cc:Subject:From;
        b=C7mK48f3ppvuEpF9ec8TkoOkht82NgimXmKku5j1tl+yB3MN4ilSnSo3wWFesBQDF
         pkM+nMzXkkFTxU0mEGh3AorARjn2zuOS+sJ3yI48WJGJousExjtLeA3RiVGHm5AGRC
         tE/rtyePPq/9jkIk4PTRwqr+agZzi9/enNODewVHALwFTvX5goUHXGwuvdNpJImYvT
         6bpYsh4jO1cxF6HNXcFg6gZpomkiwExmfKIhaslIJngEc8crab6rID4D6SXwmkL1Wp
         KWeDUSSabgKbt8xT0qfEBOPvQilikPtp2ergkVb2LkPHFAEapxb4f3zJjSWtLxbkER
         2676xmhReMeJQ==
Date:   Tue, 5 Oct 2021 09:44:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the bluetooth tree
Message-ID: <20211005094452.73d35d97@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ATpaOxfn/+aWAabf8fub55S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ATpaOxfn/+aWAabf8fub55S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  a30e5800589b ("Bluetooth: btrtl: Ask ic_info to drop firmware")
  b5e6639b07c0 ("Bluetooth: btusb: Add support for TP-Link UB500 Adapter")
  7eb342375a96 ("Bluetooth: btrsi: remove superfluous header files from btr=
si.c")
  69b299a7280f ("Bbluetooth: btusb: Add another Bluetooth part for Realtek =
8852AE")
  4dd2968805ac ("Bluetooth: btrtl: enable Realtek 8822C/8852A to support AO=
SP extension")
  0ab353c21be1 ("Bluetooth: hci_qca: enable Qualcomm WCN399x for AOSP exten=
sion")
  1e2273d93549 ("Bluetooth: Fix wrong opcode when LL privacy enabled")
  1418965a0768 ("Bluetooth: Fix Advertisement Monitor Suspend/Resume")
  b0504d6e5f5c ("Bluetooth: hci_h5: directly return hci_uart_register_devic=
e() ret-val")
  fd2c7321aa13 ("Bluetooth: hci_h5: Fix (runtime)suspend issues on RTL8723B=
S HCIs")
  1e1f7fc73cb2 ("Bluetooth: btmtkuart: fix a memleak in mtk_hci_wmt_sync")
  6c61fc02a8e5 ("Bluetooth: hci_ldisc: require CAP_NET_ADMIN to attach N_HC=
I ldisc")
  e319ae6b127d ("Bluetooth: btusb: Add gpio reset way for qca btsoc in cmd_=
timeout")
  58a65fcc82f8 ("Bluetooth: hci_uart: fix GPF in h5_recv")
  c3ab3f140bb3 ("Bluetooth: btintel: Fix incorrect out of memory check")
  941337964231 ("Bluetooth: Keep MSFT ext info throughout a hci_dev's life =
cycle")
  e6ce3bd0ce27 ("Bluetooth: btusb: Add support for IMC Networks Mediatek Ch=
ip(MT7921)")
  0484e117b6ed ("Bluetooth: btusb: Add the new support ID for Realtek RTL88=
52A")
  cd2aba0b470e ("Bluetooth: btusb: Add protocol for MediaTek bluetooth devi=
ces(MT7922)")
  eb73ede91649 ("Bluetooth: btusb: Support public address configuration for=
 MediaTek Chip.")
  5b30aeb2baae ("Bluetooth: btintel: Read boot address irrespective of cont=
roller mode")
  097012512953 ("Bluetooth: btintel: Fix boot address")
  e2d1eef236d5 ("Bluetooth: sco: Fix lock_sock() blockage by memcpy_from_ms=
g()")
  927ac8da35db ("Bluetooth: set quality report callback for Intel")
  ae7d925b5c04 ("Bluetooth: Support the quality report events")
  93fb70bc112e ("Bluetooth: refactor set_exp_feature with a feature table")
  76a56bbd810d ("Bluetooth: btintel: support link statistics telemetry even=
ts")
  0331b8e990ed ("Bluetooth: btusb: disable Intel link statistics telemetry =
events")
  81218cbee980 ("Bluetooth: mgmt: Disallow legacy MGMT_OP_READ_LOCAL_OOB_EX=
T_DATA")
  0b59e272f932 ("Bluetooth: reorganize functions from hci_sock_sendmsg()")

are missing a Signed-off-by from their committers.

One of the hazards of rebasing ...

--=20
Cheers,
Stephen Rothwell

--Sig_/ATpaOxfn/+aWAabf8fub55S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFbg+QACgkQAVBC80lX
0GwR3Af/eGPrbh+v6G8WJa4rVzJSVgy7/1F1yJDOzyUTj8Lkek3uICvaHPlY/Fgu
4CsMg/01eTX4ZbVOEQok6FuiS4qb976quBkXk4VK/BwFdgEJHO1A/JmBHY6Q4w73
r5RmKdmdl7uqcECUzN+xWqgxpwCcUuTGywVCxPdkJI2eNhn8DQ74lEzxdLF82KFJ
WqkcyhsUzmbWl4nvKVglrViPuxJqxkqLVoCSNOGNCCgLbPxewAMn5kym6WkgEKdS
E7RoM81zu4paS7eIPUNFs9SsvFuLO8RNWcgotbr49V/W9wF4SqyJnHEd5gVEyqfE
L5XyxfJG/EsqfLkLgiwMRO0PQ8XkNw==
=bY8Y
-----END PGP SIGNATURE-----

--Sig_/ATpaOxfn/+aWAabf8fub55S--
