Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 060D32F0AFC
	for <lists+linux-next@lfdr.de>; Mon, 11 Jan 2021 03:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbhAKCJi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 Jan 2021 21:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727143AbhAKCJi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 10 Jan 2021 21:09:38 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7284DC061786;
        Sun, 10 Jan 2021 18:08:57 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DDcZX44PNz9sWt;
        Mon, 11 Jan 2021 13:08:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610330935;
        bh=Olx3Cqulm7JX3feJeVkYzSp6xUqNTiT84X9zxBlBb0I=;
        h=Date:From:To:Cc:Subject:From;
        b=CDF/I0cL8dRiY/pEBY4eNcvl8UfHjbg722HA4p7mSzjGHaUlmCmEVPo/7LKlr8e3k
         NVZOPFHTQK6Drrwi8GtnMPBdB2NroeT4DhzWFgsEGGhl3S88wWg1L1sE2xRMPFNjlp
         +OY/0xfhqSTxHOWryx7acnNOUn8snwsI0dGdpkbv50JuPUS55RhLJRMDDXgZNqfCCO
         8xfD/5T+fVPCWWZ0EDIRmIkees6XolnInn8BzfpqFl15TZp4Gmb/G6fkvZpBX4rJRu
         XHHIzdfB0erLQ5n5To0VskJJcFrHHt7a/cps9RYnaiGmB23MxzZxOvED0zoWqtFHh6
         AlUQMelMkcyHQ==
Date:   Mon, 11 Jan 2021 13:08:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Matthew Gerlach <matthew.gerlach@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Moritz Fischer <mdf@kernel.org>,
        Russ Weight <russell.h.weight@intel.com>,
        Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>
Subject: linux-next: manual merge of the char-misc tree with the drivers-x86
 tree
Message-ID: <20210111130851.374bf4ea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ntWdfkIo+VtArDOy9mKh+F4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ntWdfkIo+VtArDOy9mKh+F4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got conflicts in:

  include/linux/mod_devicetable.h
  scripts/mod/devicetable-offsets.c
  scripts/mod/file2alias.c

between commit:

  eb0e90a82098 ("platform/surface: aggregator: Add dedicated bus and device=
 type")

from the drivers-x86 tree and commits:

  9326eecd9365 ("fpga: dfl: move dfl_device_id to mod_devicetable.h")
  4a224acec597 ("fpga: dfl: add dfl bus support to MODULE_DEVICE_TABLE()")

from the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/mod_devicetable.h
index 935060955152,b8dae34eca10..000000000000
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@@ -846,22 -846,28 +846,46 @@@ struct auxiliary_device_id=20
  	kernel_ulong_t driver_data;
  };
 =20
 +/* Surface System Aggregator Module */
 +
 +#define SSAM_MATCH_TARGET	0x1
 +#define SSAM_MATCH_INSTANCE	0x2
 +#define SSAM_MATCH_FUNCTION	0x4
 +
 +struct ssam_device_id {
 +	__u8 match_flags;
 +
 +	__u8 domain;
 +	__u8 category;
 +	__u8 target;
 +	__u8 instance;
 +	__u8 function;
 +
 +	kernel_ulong_t driver_data;
 +};
 +
+ /*
+  * DFL (Device Feature List)
+  *
+  * DFL defines a linked list of feature headers within the device MMIO sp=
ace to
+  * provide an extensible way of adding features. Software can walk throug=
h these
+  * predefined data structures to enumerate features. It is now used in th=
e FPGA.
+  * See Documentation/fpga/dfl.rst for more information.
+  *
+  * The dfl bus type is introduced to match the individual feature devices=
 (dfl
+  * devices) for specific dfl drivers.
+  */
+=20
+ /**
+  * struct dfl_device_id -  dfl device identifier
+  * @type: DFL FIU type of the device. See enum dfl_id_type.
+  * @feature_id: feature identifier local to its DFL FIU type.
+  * @driver_data: driver specific data.
+  */
+ struct dfl_device_id {
+ 	__u16 type;
+ 	__u16 feature_id;
+ 	kernel_ulong_t driver_data;
+ };
+=20
  #endif /* LINUX_MOD_DEVICETABLE_H */
diff --cc scripts/mod/devicetable-offsets.c
index f078eeb0a961,1b14f3cde4e5..000000000000
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@@ -246,13 -246,9 +246,17 @@@ int main(void
  	DEVID(auxiliary_device_id);
  	DEVID_FIELD(auxiliary_device_id, name);
 =20
 +	DEVID(ssam_device_id);
 +	DEVID_FIELD(ssam_device_id, match_flags);
 +	DEVID_FIELD(ssam_device_id, domain);
 +	DEVID_FIELD(ssam_device_id, category);
 +	DEVID_FIELD(ssam_device_id, target);
 +	DEVID_FIELD(ssam_device_id, instance);
 +	DEVID_FIELD(ssam_device_id, function);
 +
+ 	DEVID(dfl_device_id);
+ 	DEVID_FIELD(dfl_device_id, type);
+ 	DEVID_FIELD(dfl_device_id, feature_id);
+=20
  	return 0;
  }
diff --cc scripts/mod/file2alias.c
index d21d2871387b,7ebabeb1e9c9..000000000000
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@@ -1375,28 -1375,18 +1375,40 @@@ static int do_auxiliary_entry(const cha
  	return 1;
  }
 =20
 +/*
 + * Looks like: ssam:dNcNtNiNfN
 + *
 + * N is exactly 2 digits, where each is an upper-case hex digit.
 + */
 +static int do_ssam_entry(const char *filename, void *symval, char *alias)
 +{
 +	DEF_FIELD(symval, ssam_device_id, match_flags);
 +	DEF_FIELD(symval, ssam_device_id, domain);
 +	DEF_FIELD(symval, ssam_device_id, category);
 +	DEF_FIELD(symval, ssam_device_id, target);
 +	DEF_FIELD(symval, ssam_device_id, instance);
 +	DEF_FIELD(symval, ssam_device_id, function);
 +
 +	sprintf(alias, "ssam:d%02Xc%02X", domain, category);
 +	ADD(alias, "t", match_flags & SSAM_MATCH_TARGET, target);
 +	ADD(alias, "i", match_flags & SSAM_MATCH_INSTANCE, instance);
 +	ADD(alias, "f", match_flags & SSAM_MATCH_FUNCTION, function);
 +
 +	return 1;
 +}
 +
+ /* Looks like: dfl:tNfN */
+ static int do_dfl_entry(const char *filename, void *symval, char *alias)
+ {
+ 	DEF_FIELD(symval, dfl_device_id, type);
+ 	DEF_FIELD(symval, dfl_device_id, feature_id);
+=20
+ 	sprintf(alias, "dfl:t%04Xf%04X", type, feature_id);
+=20
+ 	add_wildcard(alias);
+ 	return 1;
+ }
+=20
  /* Does namelen bytes of name exactly match the symbol? */
  static bool sym_is(const char *name, unsigned namelen, const char *symbol)
  {
@@@ -1472,7 -1462,7 +1484,8 @@@ static const struct devtable devtable[
  	{"wmi", SIZE_wmi_device_id, do_wmi_entry},
  	{"mhi", SIZE_mhi_device_id, do_mhi_entry},
  	{"auxiliary", SIZE_auxiliary_device_id, do_auxiliary_entry},
 +	{"ssam", SIZE_ssam_device_id, do_ssam_entry},
+ 	{"dfl", SIZE_dfl_device_id, do_dfl_entry},
  };
 =20
  /* Create MODULE_ALIAS() statements.

--Sig_/ntWdfkIo+VtArDOy9mKh+F4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/7szMACgkQAVBC80lX
0GzsGwf/cObJj5b8I/vAo3sGT6Lg0eGZSXRew07fwPO93lSDYkCjcYsoSzjganUg
lPzpYJ9nFCa5dBQbx9As0chH018s1C+xfqyq5r4r1bKcdHIbwIK8SvA5LRnYfoOZ
Me/XGmQD/ebIsLg5FiGzIWfRVq6Rrsx3H3+RikxTW7Gs0HV5E/C/EiIiHqcuV1x7
m4Nv6mTM2ZAFNcyg/EXbsi4H9wMSVxvN8bCBm7vJ4xnz6lucWWVtIdd4osKJYKNy
feuN4ZWOA1Dye8xjKK55xyOF/AYuv/zaTndrUci4WHx5jqvKWy68omZiSSAmcQ4g
BcLtkt0oigpzYsq6CUvLNrBr1cs05w==
=u51h
-----END PGP SIGNATURE-----

--Sig_/ntWdfkIo+VtArDOy9mKh+F4--
