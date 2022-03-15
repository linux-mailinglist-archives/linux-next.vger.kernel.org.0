Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F31584D95FA
	for <lists+linux-next@lfdr.de>; Tue, 15 Mar 2022 09:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345784AbiCOIQy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Mar 2022 04:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345782AbiCOIQx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Mar 2022 04:16:53 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB69D4BFD4;
        Tue, 15 Mar 2022 01:15:41 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4KHmSD0QY4z4xvr;
        Tue, 15 Mar 2022 19:15:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1647332140;
        bh=mONG+UlY5rxH+SXgTIx9QXycu8XqaesFU2xLTtjz1dU=;
        h=Date:From:To:Cc:Subject:From;
        b=iD1LZR99sgmEmlApVmJE9DZwTpB0t4ddd4zSWHV/UpaVJmDOCTLFogluAIn4tSOBL
         rKxgLPxAE/CBLpfU2Ul5uFIbmYMMsyDNsknznikFtWrRuVhsapMWjw2hicKZ8yutDC
         /PYuzpC2XDCggwQIfOBIgdQR+hifLS8fdQd+IXDZGjm15QQAU2zlhTz53VF6cLU8Kz
         Xo3mfcgnH+ycg9OoKe+O2D+aZPdEuDsmuVj247JDeXKlz9i4jyHE5KhvDPImdncu/5
         9+m83HVW39pXxNBpF5LgTFw7g5uJmJcPJCbegLaduvv7xeX92S1+WE9HE+qOsfNWUS
         Xfu1vadW2AYMA==
Date:   Tue, 15 Mar 2022 19:15:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dan Williams <dan.j.williams@intel.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Kajol Jain <kjain@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shivaprasad G Bhat <sbhat@linux.ibm.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: linux-next: manual merge of the nvdimm tree with the powerpc tree
Message-ID: <20220315191538.323eefbb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7yT_38cpgq4K6cE.N/rQ9Gr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7yT_38cpgq4K6cE.N/rQ9Gr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nvdimm tree got a conflict in:

  arch/powerpc/platforms/pseries/papr_scm.c

between commit:

  bbbca72352bb ("powerpc/papr_scm: Implement initial support for injecting =
smart errors")

from the powerpc tree and commit:

  4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")

from the nvdimm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/platforms/pseries/papr_scm.c
index 1238b94b3cc1,4dd513d7c029..000000000000
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@@ -121,9 -124,8 +124,11 @@@ struct papr_scm_priv=20
  	/* length of the stat buffer as expected by phyp */
  	size_t stat_buffer_len;
 =20
 +	/* The bits which needs to be overridden */
 +	u64 health_bitmap_inject_mask;
 +
+ 	 /* array to have event_code and stat_id mappings */
+ 	char **nvdimm_events_map;
  };
 =20
  static int papr_scm_pmem_flush(struct nd_region *nd_region,

--Sig_/7yT_38cpgq4K6cE.N/rQ9Gr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmIwSyoACgkQAVBC80lX
0GyI+wf+L9l4xP1s6s+BeHdWb+klzvUTm1TNtwuIXUuPTakfHbJQdkqCQGErkAXM
c1DPXNCR8BHBiJP8RYiPlEADjYDmVPw+We4Q+BcaMGXrYfmWwVG48Z6zAGmDvubt
49XdW9Pb7XlfE35BYDZ6Z90FeKP4JtP3uAX2oxEIHwfs06rcnfQWiCFw/L2W8sos
Fy26F1USxOLcSedndo0/BeG45weJ1OPDq32c2EK8JRMhLFMvbShXs2wq48FX9Qyq
xSiI6Gzm5HyUfd6Y+5QTnCZLsthFgtX72IS/Jv0tF5glRUxlEjFIc9cFlNTOCkbP
3l1J6WfoB2fKHE3EsZwA3HMSVusqgA==
=+mLq
-----END PGP SIGNATURE-----

--Sig_/7yT_38cpgq4K6cE.N/rQ9Gr--
