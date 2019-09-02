Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8681FA5461
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 12:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731242AbfIBKu2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 06:50:28 -0400
Received: from ozlabs.org ([203.11.71.1]:56473 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730785AbfIBKu2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 06:50:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46MRgh0qNJz9s00;
        Mon,  2 Sep 2019 20:50:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567421424;
        bh=QE5MySbZZCiZEdG5L/eNJABS4Gc63k5VfnN8vgNiVSs=;
        h=Date:From:To:Cc:Subject:From;
        b=RR0ZCKigvY1/8MVPKYkwge4hNLaqPI1Ta+cESsA+5ZhobEyOO+1afi8NWLyBNsSQe
         H7arwruxr5xy9oSqz6ZWVAzg4mzw/DiSIYjv4KnD98SVHurpTDhGk0vtjSz18+wFDv
         luJEwUhqbMtW8y1VKaEccPjP0UW+N/ZShliP75T7JxEeRy2Yfs1drSVvuPK3xZRZVL
         eJBuI+HjQs9X+NmHO50rEI5VRTF2TXvrcOZp/v5x4r06+vF3+a1brhKBWOg4WTeWWU
         pk7rTd4F/4IYV+UHMSzEwdOKYu+n22qdGnjZ13zfPgJlm7qBrppIdNnAg/zNggH2bG
         jiZm0kp0auBLg==
Date:   Mon, 2 Sep 2019 20:50:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: build failure after merge of the hmm tree
Message-ID: <20190902205017.3eca5b70@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2akw3iYkGk2rHz__16Dk2f5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2akw3iYkGk2rHz__16Dk2f5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hmm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: "__nd_driver_register" [drivers/dax/pmem/dax_pmem_compat.ko] undefin=
ed!
ERROR: "nvdimm_namespace_common_probe" [drivers/dax/pmem/dax_pmem_core.ko] =
undefined!
ERROR: "devm_nsio_disable" [drivers/dax/pmem/dax_pmem_core.ko] undefined!
ERROR: "devm_nsio_enable" [drivers/dax/pmem/dax_pmem_core.ko] undefined!
ERROR: "nvdimm_setup_pfn" [drivers/dax/pmem/dax_pmem_core.ko] undefined!
ERROR: "to_nd_dax" [drivers/dax/pmem/dax_pmem_core.ko] undefined!
ERROR: "to_nd_region" [drivers/dax/pmem/dax_pmem_core.ko] undefined!
ERROR: "__nd_driver_register" [drivers/dax/pmem/dax_pmem.ko] undefined!
ERROR: "nvdimm_cmd_mask" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nd_blk_region_provider_data" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nd_blk_region_to_dimm" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nvdimm_bus_attribute_group" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nd_fletcher64" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nvdimm_attribute_group" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nd_blk_region_set_provider_data" [drivers/acpi/nfit/nfit.ko] undefi=
ned!
ERROR: "nvdimm_kobj" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nvdimm_pmem_region_create" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nd_cmd_in_size" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nd_region_dev" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nvdimm_bus_register" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nvdimm_to_bus" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nd_numa_attribute_group" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nvdimm_in_overwrite" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nvdimm_flush" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nd_region_acquire_lane" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nvdimm_provider_data" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nvdimm_volatile_region_create" [drivers/acpi/nfit/nfit.ko] undefine=
d!
ERROR: "devm_nvdimm_memremap" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nd_region_attribute_group" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "to_nvdimm_bus_dev" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nvdimm_name" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nd_blk_memremap_flags" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nvdimm_bus_unregister" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nd_cmd_dimm_desc" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nd_mapping_attribute_group" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nd_cmd_out_size" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nd_region_release_lane" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nd_device_attribute_group" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "to_nd_desc" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nvdimm_has_flush" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "to_nvdimm_bus" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nvdimm_bus_check_dimm_count" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "to_nd_region" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "__nvdimm_create" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "to_nvdimm" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nd_cmd_bus_desc" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nvdimm_bus_add_badrange" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nd_region_provider_data" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "to_nd_blk_region" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nvdimm_region_notify" [drivers/acpi/nfit/nfit.ko] undefined!
ERROR: "nvdimm_blk_region_create" [drivers/acpi/nfit/nfit.ko] undefined!

Caused by commit

  126470c8a58b ("libnvdimm: Enable unit test infrastructure compile checks")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/2akw3iYkGk2rHz__16Dk2f5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1s8+kACgkQAVBC80lX
0Gw5Xgf/VlpdIsbo67q5dX4B5fXtLW7KGXnCyt58f/kOcbXPQKsY4PDlJTNtDSAn
GGUD2gYFID9ZN+NGYxsZWir3N1leeY2hmgJ1XFngsNf8LSTQTV/M6zhV5T/eb6Nt
FA2FvfMSIK0J7oZkl/b7XNu/38BtEkEsY58E5YYHrsr4o9jQhyPtDbQkZYWJ5EqB
TgHbTruw7zSl3emq8pRpRv9slTCebPWAcaWENgws0wVuiycwkdBKN6iwQlJEnZ/j
Mn9niTsYuvcqDQn0BZCBuW1aWCJYOni4DneC2Up0ztfGbQXXJ1dWIilNU+4VTb8+
msw7HhqqCAgrflw8yGqx3g/AsdYiRg==
=idY6
-----END PGP SIGNATURE-----

--Sig_/2akw3iYkGk2rHz__16Dk2f5--
