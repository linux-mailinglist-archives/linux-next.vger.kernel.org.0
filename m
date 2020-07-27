Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2808822E705
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 09:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgG0H4K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 03:56:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53447 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726387AbgG0H4K (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jul 2020 03:56:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFXDk1tglz9sRX;
        Mon, 27 Jul 2020 17:56:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595836566;
        bh=CM2x5n2sHCMCsv09T55g0VHcdzdciOKpgWlGXJpseUg=;
        h=Date:From:To:Cc:Subject:From;
        b=u6MW1Aa09uCdBU0WILTz5EZiEZu8krH49OSoNFK/lpFoH0kpv5YJn5abJh2YJpXx3
         kTVMiv0ZMsUzgREcuhLwAVmEyr20+crB7i5bW1WVq5REsGjsOlYQGo/HmpuskEPYza
         A5lo9aNdxEE89udidr+wmmXO/RGPVAw5bY72cti6HfZBu2Gby77KA2LanhUawozcjq
         SpRH/Cijo3+vPYA0vv3TxPBm01QggLGVdIJG3XGu5p9kxFJXA+yaB2uHjFvx9USvDI
         aE9hLrj0u+rqXQIK+3LyPykcyYYqE49WW1CAP7+KZ55WRJe4aaay4Ql6UOZIh5n6Wm
         dM6iQ5LMtOdRg==
Date:   Mon, 27 Jul 2020 17:56:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Oded Gabbay <oded.gabbay@gmail.com>
Subject: linux-next: manual merge of the char-misc tree with Linus' tree
Message-ID: <20200727175603.29b08f1e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RK+bLJ=g3992W94HtH=S+ix";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RK+bLJ=g3992W94HtH=S+ix
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/misc/habanalabs/gaudi/gaudi.c

between commit:

  e38bfd30e088 ("habanalabs: set clock gating per engine")

from Linus' tree and commits:

  0b168c8f1d21 ("habanalabs: remove rate limiters from GAUDI")
  fcc6a4e60678 ("habanalabs: Extract ECC information from FW")

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

diff --cc drivers/misc/habanalabs/gaudi/gaudi.c
index 637a9d608707,4a1a52608fc0..000000000000
--- a/drivers/misc/habanalabs/gaudi/gaudi.c
+++ b/drivers/misc/habanalabs/gaudi/gaudi.c
@@@ -1823,9 -1766,7 +1772,7 @@@ static void gaudi_init_golden_registers
 =20
  	gaudi_init_hbm_cred(hdev);
 =20
- 	gaudi_init_rate_limiter(hdev);
-=20
 -	gaudi_disable_clock_gating(hdev);
 +	hdev->asic_funcs->disable_clock_gating(hdev);
 =20
  	for (tpc_id =3D 0, tpc_offset =3D 0;
  				tpc_id < TPC_NUMBER_OF_ENGINES;
@@@ -5275,41 -5166,50 +5211,50 @@@ static int gaudi_extract_ecc_info(struc
  		hdev->asic_funcs->disable_clock_gating(hdev);
  	}
 =20
- 	switch (num_mem_regs) {
- 	case 1:
- 		dev_err(hdev->dev,
- 			"%s ECC indication: 0x%08x\n",
- 			block_name, RREG32(block_address));
- 		break;
- 	case 2:
- 		dev_err(hdev->dev,
- 			"%s ECC indication: 0x%08x 0x%08x\n",
- 			block_name,
- 			RREG32(block_address), RREG32(block_address + 4));
- 		break;
- 	case 3:
- 		dev_err(hdev->dev,
- 			"%s ECC indication: 0x%08x 0x%08x 0x%08x\n",
- 			block_name,
- 			RREG32(block_address), RREG32(block_address + 4),
- 			RREG32(block_address + 8));
- 		break;
- 	case 4:
- 		dev_err(hdev->dev,
- 			"%s ECC indication: 0x%08x 0x%08x 0x%08x 0x%08x\n",
- 			block_name,
- 			RREG32(block_address), RREG32(block_address + 4),
- 			RREG32(block_address + 8), RREG32(block_address + 0xc));
- 		break;
- 	default:
- 		break;
+ 	/* Set invalid wrapper index */
+ 	*memory_wrapper_idx =3D 0xFF;
+=20
+ 	/* Iterate through memory wrappers, a single bit must be set */
+ 	for (i =3D 0 ; i > num_mem_regs ; i++) {
+ 		err_addr +=3D i * 4;
+ 		err_word =3D RREG32(err_addr);
+ 		if (err_word) {
+ 			err_bit =3D __ffs(err_word);
+ 			*memory_wrapper_idx =3D err_bit + (32 * i);
+ 			break;
+ 		}
+ 	}
 =20
+ 	if (*memory_wrapper_idx =3D=3D 0xFF) {
+ 		dev_err(hdev->dev, "ECC error information cannot be found\n");
+ 		rc =3D -EINVAL;
+ 		goto enable_clk_gate;
  	}
 =20
- 	if (disable_clock_gating) {
+ 	WREG32(params->block_address + GAUDI_ECC_MEM_SEL_OFFSET,
+ 			*memory_wrapper_idx);
+=20
+ 	*ecc_address =3D
+ 		RREG32(params->block_address + GAUDI_ECC_ADDRESS_OFFSET);
+ 	*ecc_syndrom =3D
+ 		RREG32(params->block_address + GAUDI_ECC_SYNDROME_OFFSET);
+=20
+ 	/* Clear error indication */
+ 	reg =3D RREG32(params->block_address + GAUDI_ECC_MEM_INFO_CLR_OFFSET);
+ 	if (params->derr)
+ 		reg |=3D FIELD_PREP(GAUDI_ECC_MEM_INFO_CLR_DERR_MASK, 1);
+ 	else
+ 		reg |=3D FIELD_PREP(GAUDI_ECC_MEM_INFO_CLR_SERR_MASK, 1);
+=20
+ 	WREG32(params->block_address + GAUDI_ECC_MEM_INFO_CLR_OFFSET, reg);
+=20
+ enable_clk_gate:
+ 	if (params->disable_clock_gating) {
 -		hdev->asic_funcs->enable_clock_gating(hdev);
 +		hdev->asic_funcs->set_clock_gating(hdev);
  		mutex_unlock(&gaudi->clk_gate_mutex);
  	}
+=20
+ 	return rc;
  }
 =20
  static void gaudi_handle_qman_err_generic(struct hl_device *hdev,

--Sig_/RK+bLJ=g3992W94HtH=S+ix
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8eiJMACgkQAVBC80lX
0GyVVwf/X6ZQzB3OwVPrVHdSOqBKN7RC4jw52j6hUnMy52ABvOx+sHi1tuE/Z9tz
GX7HPO58xvlx6rSgkPWuQtB7278wX5vZveQdgFCGIW/Us3YwP5Ld1CXN0ZNwmpPa
btTxiSJoGMlH8hzBH/rUgT8pW2K/7i4bWeO5UCQCsJb6Stb5MJV/62EHT5U3cW3d
Rmt/940P0Ixsu4cezoIbYClMUE8kDNJemPt75PEfwxguWt/T3t5mQNd4w8h0vjQR
i/yb1pkP2L8Om79lQHeLt9g6PrgyauZS95uXlt6IhFqdHhMzrs4bxTnHwYmjTbC0
hBUc5prH60tbGfugFkBRomZJ35tpFw==
=NXla
-----END PGP SIGNATURE-----

--Sig_/RK+bLJ=g3992W94HtH=S+ix--
