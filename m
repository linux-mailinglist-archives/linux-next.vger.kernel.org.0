Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 109B1A4F25
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 08:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729332AbfIBGTk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 02:19:40 -0400
Received: from ozlabs.org ([203.11.71.1]:47913 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726230AbfIBGTk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 02:19:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46MKgD2tbGz9sDB;
        Mon,  2 Sep 2019 16:19:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567405176;
        bh=t9O5MxvNoWVtNpfW2QZR8r8y4gZ6tmv7UWmwEAS7QLY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YVfSG3XrXw6C2O9FTtqr+Y4V/rn5+AERd9/ztoAVb84o8Qx+czjFmcbSu9ZcA1DiE
         b6g1yUGyI6cNJ//sSANuWJvhJSo4WPIuJwfR2RuDLGblKvOqsfjSxnPL604CqzeWm9
         sN8BDtMFKf7UzMcmmFeSL9iO96sswOCX7RXo4Y4a/7KEIDtMT1/TIOikFA6AlQDFfT
         j2BIwDHrxi94ry9O7vGpsJGdxXFSOGYuVlGxGaNbmqxXjGBq0uTNkiwfpdywTzI8ID
         iki/iwEPpGTtKso+0TNdPrWMvmw5QsbSMPRvIrZkAj2xTvK/F+IAIZf0JC2ApklDRu
         wFnDDD4g3MOJQ==
Date:   Mon, 2 Sep 2019 16:19:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the keys tree
Message-ID: <20190902161935.78bf56f1@canb.auug.org.au>
In-Reply-To: <20190829153116.7ffc7470@canb.auug.org.au>
References: <20190829153116.7ffc7470@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+8CAegbZXPlV2cLhTG7bR4i";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+8CAegbZXPlV2cLhTG7bR4i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 29 Aug 2019 15:31:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the keys tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
>=20
> Caused by commit
>=20
>   ef9cc255c953 ("usb: Add USB subsystem notifications")
>=20
> # CONFIG_USB_NOTIFICATIONS is not set
>=20
> I have used the keys tree from next-20190828 for today.

I only realised this morning that I forgot to include the error log
(sorry):

In file included from include/linux/usb/phy.h:15,
                 from include/linux/usb/otg.h:14,
                 from include/linux/usb/tegra_usb_phy.h:21,
                 from arch/arm/mach-tegra/tegra.c:27:
include/linux/usb.h:2026:34: error: parameter 2 ('subtype') has incomplete =
type
 2026 |       enum usb_notification_type subtype,
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
include/linux/usb.h:2025:20: error: function declaration isn't a prototype =
[-Werror=3Dstrict-prototypes]
 2025 | static inline void post_usb_device_notification(const struct usb_de=
vice *udev,
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/usb.h:2029:38: error: parameter 2 ('subtype') has incomplete =
type
 2029 |           enum usb_notification_type subtype,
      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
include/linux/usb.h:2028:20: error: function declaration isn't a prototype =
[-Werror=3Dstrict-prototypes]
 2028 | static inline void post_usb_bus_notification(const struct usb_bus *=
ubus,
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~

(several more like this)

Today I have included the following fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 2 Sep 2019 16:01:59 +1000
Subject: [PATCH] usb: include watch_queue.h for needed enum

The forward declararion doesn't seem to work (at laste for the
!CONFIG_USB_NOTIFICATIONS case.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/usb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index a7d5fce46569..11438058f4fa 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -4,6 +4,7 @@
=20
 #include <linux/mod_devicetable.h>
 #include <linux/usb/ch9.h>
+#include <linux/watch_queue.h>
=20
 #define USB_MAJOR			180
 #define USB_DEVICE_MAJOR		189
@@ -26,7 +27,6 @@
 struct usb_device;
 struct usb_driver;
 struct wusb_dev;
-enum usb_notification_type;
=20
 /*------------------------------------------------------------------------=
-*/
=20
--=20
2.23.0.rc1

I then discovered that I needed to install libkeyutils-dev :-( but it
built OK after that.
--=20
Cheers,
Stephen Rothwell

--Sig_/+8CAegbZXPlV2cLhTG7bR4i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1stHcACgkQAVBC80lX
0GxhZAgAk7/hqNI8xqsPxpzKfqTcWTeOcYGutHZicZDrYUjsmfXi6rguvL1gf6zF
QooPTjCVh3U44YNMk7Xzu9ftIMYGByi/xdoaSV82mtw+NECpYysF7u3/dz3kK/yN
V7YmxixJBwc2VmY4o9pXKLSlOHlki/+jC7QOVAJsho6SqiQlSGttDZCw49wsFrji
BekgNKyKF4f8GrQb0xs2xibcxQVhFDrjcBE+NodSByvUCpIp3DWij4pxYS3XBDhg
yYsKV36TYBigfsndTTIVUVU/SGDrU6nH39A6ff4NGCjEQOJSny1WenY1UL4J/VoG
LNWAPn8coC6CKMzdjCdTI1jkdby9Xw==
=JNcQ
-----END PGP SIGNATURE-----

--Sig_/+8CAegbZXPlV2cLhTG7bR4i--
