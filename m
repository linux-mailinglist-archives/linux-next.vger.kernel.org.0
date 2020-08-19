Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1642493A7
	for <lists+linux-next@lfdr.de>; Wed, 19 Aug 2020 05:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgHSDuC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Aug 2020 23:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgHSDuC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 Aug 2020 23:50:02 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E5DC061389;
        Tue, 18 Aug 2020 20:50:02 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BWYh82z2Wz9sTW;
        Wed, 19 Aug 2020 13:50:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597809000;
        bh=QJL+2c44DsUVkajykUKbmCXXNUmUUBwF0maauwUnb+Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HkmeLJwY5OArIMblS8m2fc92cdbsvtXWDLTRmOBUOpxr0MisWi32/p/A/HG/xrMLq
         gsESWCgoV2cuzYvA7hrMwniIi5oPmOCy2F1FPMhYAyrWfEr+Ob/I2gl4bfIO5YZ5dc
         BZ2tBc6WuNYgp17oGA45CXPOT8Zw0Xb3H08jOgSlhhG3PZarXQqqblUXs0cG/7Cifo
         wnCVuxhkdEp4s1nxUriyXCT/A1c9reiCBJqe8LLaOk9GTZRZvDKQfpVBXHBOIsOKXI
         GdC3Vup0tOC5HKf/pA8trfUjHXiJBfX6gNdnE3JmmLz/lemilHeYgue7QTi0f2z70b
         fVkgMmrnZ2nUg==
Date:   Wed, 19 Aug 2020 13:49:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: linux-next: build failure after merge of the mhi tree
Message-ID: <20200819134959.559a3639@canb.auug.org.au>
In-Reply-To: <20200819134800.165b78a0@canb.auug.org.au>
References: <20200819134800.165b78a0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/24pYKJYbhFlbhyKiW5NJzJu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/24pYKJYbhFlbhyKiW5NJzJu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 19 Aug 2020 13:48:00 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the mhi tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:

WARNING: modpost: missing MODULE_LICENSE() in drivers/bus/mhi/core/main.o
WARNING: modpost: missing MODULE_LICENSE() in drivers/bus/mhi/core/pm.o
WARNING: modpost: missing MODULE_LICENSE() in drivers/bus/mhi/core/boot.o
ERROR: modpost: "mhi_read_reg_field" [drivers/bus/mhi/core/boot.ko] undefin=
ed!
ERROR: modpost: "mhi_state_str" [drivers/bus/mhi/core/boot.ko] undefined!
ERROR: modpost: "mhi_read_reg" [drivers/bus/mhi/core/boot.ko] undefined!
ERROR: modpost: "mhi_ee_str" [drivers/bus/mhi/core/boot.ko] undefined!
ERROR: modpost: "mhi_write_reg_field" [drivers/bus/mhi/core/boot.ko] undefi=
ned!
ERROR: modpost: "mhi_write_reg" [drivers/bus/mhi/core/boot.ko] undefined!
ERROR: modpost: "mhi_get_exec_env" [drivers/bus/mhi/core/boot.ko] undefined!
ERROR: modpost: "mhi_set_mhi_state" [drivers/bus/mhi/core/boot.ko] undefine=
d!
ERROR: modpost: "mhi_ready_state_transition" [drivers/bus/mhi/core/boot.ko]=
 undefined!
ERROR: modpost: "to_mhi_pm_state_str" [drivers/bus/mhi/core/boot.ko] undefi=
ned!
ERROR: modpost: "mhi_read_reg_field" [drivers/bus/mhi/core/pm.ko] undefined!
ERROR: modpost: "mhi_deinit_free_irq" [drivers/bus/mhi/core/pm.ko] undefine=
d!
ERROR: modpost: "mhi_ring_er_db" [drivers/bus/mhi/core/pm.ko] undefined!
ERROR: modpost: "mhi_state_str" [drivers/bus/mhi/core/pm.ko] undefined!
ERROR: modpost: "mhi_read_reg" [drivers/bus/mhi/core/pm.ko] undefined!
ERROR: modpost: "mhi_fw_load_handler" [drivers/bus/mhi/core/pm.ko] undefine=
d!
ERROR: modpost: "mhi_destroy_device" [drivers/bus/mhi/core/pm.ko] undefined!
ERROR: modpost: "mhi_get_mhi_state" [drivers/bus/mhi/core/pm.ko] undefined!
ERROR: modpost: "mhi_init_irq_setup" [drivers/bus/mhi/core/pm.ko] undefined!
ERROR: modpost: "mhi_ring_cmd_db" [drivers/bus/mhi/core/pm.ko] undefined!
ERROR: modpost: "mhi_deinit_dev_ctxt" [drivers/bus/mhi/core/pm.ko] undefine=
d!
ERROR: modpost: "mhi_init_mmio" [drivers/bus/mhi/core/pm.ko] undefined!
ERROR: modpost: "mhi_write_reg_field" [drivers/bus/mhi/core/pm.ko] undefine=
d!
ERROR: modpost: "mhi_free_bhie_table" [drivers/bus/mhi/core/pm.ko] undefine=
d!
ERROR: modpost: "mhi_write_reg" [drivers/bus/mhi/core/pm.ko] undefined!
ERROR: modpost: "mhi_write_db" [drivers/bus/mhi/core/pm.ko] undefined!
ERROR: modpost: "mhi_ring_chan_db" [drivers/bus/mhi/core/pm.ko] undefined!
ERROR: modpost: "mhi_get_exec_env" [drivers/bus/mhi/core/pm.ko] undefined!
ERROR: modpost: "mhi_init_dev_ctxt" [drivers/bus/mhi/core/pm.ko] undefined!
ERROR: modpost: "to_mhi_pm_state_str" [drivers/bus/mhi/core/pm.ko] undefine=
d!
ERROR: modpost: "mhi_create_devices" [drivers/bus/mhi/core/pm.ko] undefined!
ERROR: modpost: "dev_state_tran_str" [drivers/bus/mhi/core/pm.ko] undefined!
ERROR: modpost: "mhi_tryset_pm_state" [drivers/bus/mhi/core/main.ko] undefi=
ned!
ERROR: modpost: "mhi_state_str" [drivers/bus/mhi/core/main.ko] undefined!
ERROR: modpost: "mhi_pm_m0_transition" [drivers/bus/mhi/core/main.ko] undef=
ined!
ERROR: modpost: "mhi_pm_m3_transition" [drivers/bus/mhi/core/main.ko] undef=
ined!
ERROR: modpost: "mhi_queue_state_transition" [drivers/bus/mhi/core/main.ko]=
 undefined!
ERROR: modpost: "mhi_alloc_device" [drivers/bus/mhi/core/main.ko] undefined!
ERROR: modpost: "mhi_init_chan_ctxt" [drivers/bus/mhi/core/main.ko] undefin=
ed!
ERROR: modpost: "mhi_ee_str" [drivers/bus/mhi/core/main.ko] undefined!
ERROR: modpost: "mhi_deinit_chan_ctxt" [drivers/bus/mhi/core/main.ko] undef=
ined!
ERROR: modpost: "mhi_pm_sys_err_handler" [drivers/bus/mhi/core/main.ko] und=
efined!
ERROR: modpost: "mhi_pm_m1_transition" [drivers/bus/mhi/core/main.ko] undef=
ined!
ERROR: modpost: "mhi_bus_type" [drivers/bus/mhi/core/main.ko] undefined!
ERROR: modpost: "to_mhi_pm_state_str" [drivers/bus/mhi/core/main.ko] undefi=
ned!
ERROR: modpost: "mhi_read_reg_field" [drivers/bus/mhi/core/init.ko] undefin=
ed!
ERROR: modpost: "mhi_db_brstmode_disable" [drivers/bus/mhi/core/init.ko] un=
defined!
ERROR: modpost: "mhi_process_data_event_ring" [drivers/bus/mhi/core/init.ko=
] undefined!
ERROR: modpost: "mhi_db_brstmode" [drivers/bus/mhi/core/init.ko] undefined!
ERROR: modpost: "mhi_rddm_prepare" [drivers/bus/mhi/core/init.ko] undefined!
ERROR: modpost: "mhi_intvec_threaded_handler" [drivers/bus/mhi/core/init.ko=
] undefined!
ERROR: modpost: "mhi_debugfs_init" [drivers/bus/mhi/core/init.ko] undefined!
ERROR: modpost: "mhi_read_reg" [drivers/bus/mhi/core/init.ko] undefined!
ERROR: modpost: "mhi_process_ctrl_ev_ring" [drivers/bus/mhi/core/init.ko] u=
ndefined!
ERROR: modpost: "mhi_ev_task" [drivers/bus/mhi/core/init.ko] undefined!
ERROR: modpost: "mhi_map_single_use_bb" [drivers/bus/mhi/core/init.ko] unde=
fined!
ERROR: modpost: "mhi_ctrl_ev_task" [drivers/bus/mhi/core/init.ko] undefined!
ERROR: modpost: "mhi_unmap_single_use_bb" [drivers/bus/mhi/core/init.ko] un=
defined!
ERROR: modpost: "mhi_prepare_channel" [drivers/bus/mhi/core/init.ko] undefi=
ned!
ERROR: modpost: "mhi_alloc_bhie_table" [drivers/bus/mhi/core/init.ko] undef=
ined!
ERROR: modpost: "mhi_unmap_single_no_bb" [drivers/bus/mhi/core/init.ko] und=
efined!
ERROR: modpost: "mhi_write_reg_field" [drivers/bus/mhi/core/init.ko] undefi=
ned!
ERROR: modpost: "mhi_intvec_handler" [drivers/bus/mhi/core/init.ko] undefin=
ed!
ERROR: modpost: "mhi_free_bhie_table" [drivers/bus/mhi/core/init.ko] undefi=
ned!
ERROR: modpost: "mhi_debugfs_exit" [drivers/bus/mhi/core/init.ko] undefined!
ERROR: modpost: "mhi_write_reg" [drivers/bus/mhi/core/init.ko] undefined!
ERROR: modpost: "mhi_map_single_no_bb" [drivers/bus/mhi/core/init.ko] undef=
ined!
ERROR: modpost: "mhi_reset_chan" [drivers/bus/mhi/core/init.ko] undefined!
ERROR: modpost: "mhi_pm_st_worker" [drivers/bus/mhi/core/init.ko] undefined!
ERROR: modpost: "mhi_create_debugfs" [drivers/bus/mhi/core/init.ko] undefin=
ed!
ERROR: modpost: "mhi_irq_handler" [drivers/bus/mhi/core/init.ko] undefined!
ERROR: modpost: "mhi_destroy_debugfs" [drivers/bus/mhi/core/init.ko] undefi=
ned!

> I am not sure which commit(s) caused this.
>=20
> I have used the mhi tree from next-20200818 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/24pYKJYbhFlbhyKiW5NJzJu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl88oWcACgkQAVBC80lX
0GyiLAf+OCgzNhMlzcvxkqJ0JeYDv/uneda6j5cTAx79ZdQbVr/ejvqXfvKMbTQB
rm0U3UAi1WxsDATno7SzoZv62wC/L/fh0n1X7epR4gjJrcMwbDzmJZ1ltRNvp4VE
yk1yDaOBZYmw+lkInIpZfL8p0z8EAV5oOFe3FZBQg+Za+1FvSzNiiOxir0w5v87t
Lu84C1WsV9PdGGv5Vy4QbLP8Vt4zJnJcFRYVNB2ymjZZ0qAEUymRtYbmtG8D2Q55
vSVahhNdc7J5bYj+KdHlmfhkZeykTofV8IPdsfSRBgOxMRPMF1K8djlcNAC+ndLS
LZnGvVyTFXy9GCYKF3uPDqEqSYEioA==
=Clxo
-----END PGP SIGNATURE-----

--Sig_/24pYKJYbhFlbhyKiW5NJzJu--
