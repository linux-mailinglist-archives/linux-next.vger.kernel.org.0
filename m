Return-Path: <linux-next+bounces-6213-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C64A87712
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 06:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2498E188C117
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 04:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BA1155C83;
	Mon, 14 Apr 2025 04:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="b6jymS1f"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEC54C6C;
	Mon, 14 Apr 2025 04:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744606607; cv=none; b=US4jegtmrex/fVx7inUPhrMJ+jrXBZ/Olv1mHpTn4wWkk7hh2at5IEhZM9S0mDhsEQCiJFf/HJpwpq1M6mRi5QACqaC5mNGM9DaqX7OVwlO08vY5trPgIjmjc88E4S+yWr94u5iGzTA6e77OggVywH0sxyExWr5MqsuuoyiwDGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744606607; c=relaxed/simple;
	bh=vO4jUJHwcH+m+8bC5DsW3yUMu82/5uJcsqROx6JdFqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uhmAFaIJhr4OAy9BWDz/mnQLSzL31Xi5tYfKp5+EadNs0OCljWZdSIopwLHEytyyg/kgeiiW21pkyZdh9Ai7TvGRj77t9RCCiLZUel2dcnlsaM55LUMHrbXRYRWXE9qvi3PpXlQDPqFdKltec7IqvlVE4VYZmJPUV1fJ03SIT+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=b6jymS1f; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744606601;
	bh=ucft/O37Ovs+jFJZRAT1PB1jXiJWS+RdietOi8yN0eI=;
	h=Date:From:To:Cc:Subject:From;
	b=b6jymS1fmYQkDhlabk1t2bHJw5AskOL3jKbbaS/9ioyOXK9hpTXmGbBcwNNBRd1GA
	 V6zwvAEbk6MGAau8KO+nsQu65SqyYgHjUNhZslyJE68aMJ/yU9qGznx5TRDSs/SxUV
	 a79t2eeBOzdFOcNklj7chotCnm2t2CwlUGVducI+Bk2P1Dcpeh3c01GW0B/FQ88nqv
	 iXGf4ElMmTZBrjDS3qnLg2Vu1osq5WgsaguThNH/V2v599ZxyIbpuy6XfK2Bf40A4R
	 jn8X2A0UUAYdndMQOW7CF2iHDSyv5yd7DvHRjoV1SBCIe+sOlOygjYipPaJHJZg0Rc
	 lp3IVymF6jm2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZbZkw5FzJz4x1V;
	Mon, 14 Apr 2025 14:56:40 +1000 (AEST)
Date: Mon, 14 Apr 2025 14:56:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, James Bottomley
 <James.Bottomley@HansenPartnership.com>
Cc: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>, Huan Tang
 <tanghuan@vivo.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lu Hongfei <luhongfei@vivo.com>
Subject: linux-next: manual merge of the scsi-mkp tree with the scsi-fixes
 and scsi trees
Message-ID: <20250414145639.5894a570@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.JzQ53mtP2gf2vd2NR/_UBb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.JzQ53mtP2gf2vd2NR/_UBb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got conflicts in:

  Documentation/ABI/testing/sysfs-driver-ufs
  drivers/ufs/core/ufshcd.c
  include/ufs/ufs.h

between commits:

  bdab40480b14 ("scsi: ufs: core: Rename ufshcd_wb_presrv_usrspc_keep_vcc_o=
n()")
  1fd2e77b8897 ("scsi: ufs: core: Add device level exception support")

from the scsi-fixes and scsi trees and commit:

  500d4b742e0c ("scsi: ufs: core: Add WB buffer resize support")

from the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/ABI/testing/sysfs-driver-ufs
index e36d2de16cbd,e7b49bc894f5..000000000000
--- a/Documentation/ABI/testing/sysfs-driver-ufs
+++ b/Documentation/ABI/testing/sysfs-driver-ufs
@@@ -1605,34 -1605,51 +1605,83 @@@ Description
 =20
  		The attribute is read/write.
 =20
 +What:		/sys/bus/platform/drivers/ufshcd/*/device_lvl_exception_count
 +What:		/sys/bus/platform/devices/*.ufs/device_lvl_exception_count
 +Date:		March 2025
 +Contact:	Bao D. Nguyen <quic_nguyenb@quicinc.com>
 +Description:
 +		This attribute is applicable to ufs devices compliant to the
 +		JEDEC specifications version 4.1 or later. The
 +		device_lvl_exception_count is a counter indicating the number of
 +		times the device level exceptions have occurred since the last
 +		time this variable is reset.  Writing a 0 value to this
 +		attribute will reset the device_lvl_exception_count.  If the
 +		device_lvl_exception_count reads a positive value, the user
 +		application should read the device_lvl_exception_id attribute to
 +		know more information about the exception.
 +
 +		The attribute is read/write.
 +
 +What:		/sys/bus/platform/drivers/ufshcd/*/device_lvl_exception_id
 +What:		/sys/bus/platform/devices/*.ufs/device_lvl_exception_id
 +Date:		March 2025
 +Contact:	Bao D. Nguyen <quic_nguyenb@quicinc.com>
 +Description:
 +		Reading the device_lvl_exception_id returns the
 +		qDeviceLevelExceptionID attribute of the ufs device JEDEC
 +		specification version 4.1. The definition of the
 +		qDeviceLevelExceptionID is the ufs device vendor specific
 +		implementation.  Refer to the device manufacturer datasheet for
 +		more information on the meaning of the qDeviceLevelExceptionID
 +		attribute value.
 +
 +		The attribute is read only.
++
+ What:		/sys/bus/platform/drivers/ufshcd/*/wb_resize_enable
+ What:		/sys/bus/platform/devices/*.ufs/wb_resize_enable
+ Date:		April 2025
+ Contact:	Huan Tang <tanghuan@vivo.com>
+ Description:
+ 		The host can enable the WriteBooster buffer resize by setting this
+ 		attribute.
+=20
+ 		=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ 		idle      There is no resize operation
+ 		decrease  Decrease WriteBooster buffer size
+ 		increase  Increase WriteBooster buffer size
+ 		=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=20
+ 		The file is write only.
+=20
+ What:		/sys/bus/platform/drivers/ufshcd/*/attributes/wb_resize_hint
+ What:		/sys/bus/platform/devices/*.ufs/attributes/wb_resize_hint
+ Date:		April 2025
+ Contact:	Huan Tang <tanghuan@vivo.com>
+ Description:
+ 		wb_resize_hint indicates hint information about which type of resize
+ 		for WriteBooster buffer is recommended by the device.
+=20
+ 		=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ 		keep       Recommend keep the buffer size
+ 		decrease   Recommend to decrease the buffer size
+ 		increase   Recommend to increase the buffer size
+ 		=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=20
+ 		The file is read only.
+=20
+ What:		/sys/bus/platform/drivers/ufshcd/*/attributes/wb_resize_status
+ What:		/sys/bus/platform/devices/*.ufs/attributes/wb_resize_status
+ Date:		April 2025
+ Contact:	Huan Tang <tanghuan@vivo.com>
+ Description:
+ 		The host can check the resize operation status of the WriteBooster
+ 		buffer by reading this attribute.
+=20
+ 		=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
+ 		idle              Resize operation is not issued
+ 		in_progress       Resize operation in progress
+ 		complete_success  Resize operation completed successfully
+ 		general_failure   Resize operation general failure
+ 		=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
+=20
+ 		The file is read only.
diff --cc drivers/ufs/core/ufshcd.c
index ca2b0aae9d11,be65fc4b5ccd..000000000000
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@@ -6105,7 -6080,22 +6102,22 @@@ int ufshcd_wb_toggle_buf_flush(struct u
  	return ret;
  }
 =20
+ int ufshcd_wb_set_resize_en(struct ufs_hba *hba, enum wb_resize_en en_mod=
e)
+ {
+ 	int ret;
+ 	u8 index;
+=20
+ 	index =3D ufshcd_wb_get_query_index(hba);
+ 	ret =3D ufshcd_query_attr_retry(hba, UPIU_QUERY_OPCODE_WRITE_ATTR,
+ 				QUERY_ATTR_IDN_WB_BUF_RESIZE_EN, index, 0, &en_mode);
+ 	if (ret)
+ 		dev_err(hba->dev, "%s: Enable WB buf resize operation failed %d\n",
+ 			__func__, ret);
+=20
+ 	return ret;
+ }
+=20
 -static bool ufshcd_wb_presrv_usrspc_keep_vcc_on(struct ufs_hba *hba,
 +static bool ufshcd_wb_curr_buff_threshold_check(struct ufs_hba *hba,
  						u32 avail_buf)
  {
  	u32 cur_buf;
diff --cc include/ufs/ufs.h
index 1c47136d8715,9188f7aa99da..000000000000
--- a/include/ufs/ufs.h
+++ b/include/ufs/ufs.h
@@@ -181,7 -181,9 +181,10 @@@ enum attr_idn=20
  	QUERY_ATTR_IDN_WB_BUFF_LIFE_TIME_EST    =3D 0x1E,
  	QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE        =3D 0x1F,
  	QUERY_ATTR_IDN_TIMESTAMP		=3D 0x30,
 +	QUERY_ATTR_IDN_DEV_LVL_EXCEPTION_ID     =3D 0x34,
+ 	QUERY_ATTR_IDN_WB_BUF_RESIZE_HINT	=3D 0x3C,
+ 	QUERY_ATTR_IDN_WB_BUF_RESIZE_EN		=3D 0x3D,
+ 	QUERY_ATTR_IDN_WB_BUF_RESIZE_STATUS	=3D 0x3E,
  };
 =20
  /* Descriptor idn for Query requests */

--Sig_/.JzQ53mtP2gf2vd2NR/_UBb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf8lYcACgkQAVBC80lX
0Gzxywf+M6WW04kVhhnExRD4xuRaoMuKW1tvDr4qX7BH39rPkTVYq7Djv0xFSWbS
GXsg+Fdm41vyVauHzmrhtxm5+HeywGdYg95oZA3nQN/zji44jR3MpTBMGBucuC7f
aCjpxPu1Dc5qiI8KJr55H/lCCLJrh9ecLU44LYteLQKeYUYBa7eE65b7btIDZ1ZC
D9OQaQxN0IbyRfQod0L061VrHwLEJbi5mettXoVyMBrS188hXlD/NqqbVhZ9CoWQ
mCna2/sQsVhGPozXJQci8tjArW8iNIV+apFcOJrI1h9BUEWggj8c/5SGVZEyPox2
jVszMhnTg8pZNbSbRg//UtMlSNCFMg==
=Y3lk
-----END PGP SIGNATURE-----

--Sig_/.JzQ53mtP2gf2vd2NR/_UBb--

