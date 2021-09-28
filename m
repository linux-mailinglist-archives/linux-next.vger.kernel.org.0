Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5FB41A727
	for <lists+linux-next@lfdr.de>; Tue, 28 Sep 2021 07:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhI1Fgw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Sep 2021 01:36:52 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:45665 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234207AbhI1Fgv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Sep 2021 01:36:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HJSrY6Wctz4xZJ;
        Tue, 28 Sep 2021 15:35:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632807311;
        bh=Wx9Kve/P2GL7Gxzv2UPcFM7tV5U40h3GUyBo9PB0LzU=;
        h=Date:From:To:Cc:Subject:From;
        b=FRqOM7kXXHmbdbdLhiEhtDkt2afYbf5aLZ1E3NcJpV8+YbF35Fa7dOQ0vgC2ReFc/
         zlxzU33ttGg2JEHsY0cnRqiqzJTcOlSReRnu+p+aUBrIjUVkkzjpBA1nPzc3sl/eqa
         yXd/4mYXnptOLhaG6klj82aiSBfCqTXwU8Qov+zE/U3NNceIzr34yqIloHTDKIS3CN
         03nOJFVvqIGiPPEcDSgN0R6EfntyHMD3MtIXDdm2PESXABIptPgCS+GHG1SNwY5tl2
         4bk4kqcLlOwYpVDyEv3deUpsEGBfE2h5bFR2ipBQxQOsPTvztouBrdbZaiic/1ROL0
         q19ZjZAb9tBKw==
Date:   Tue, 28 Sep 2021 15:35:08 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Charles Keepax <ckeepax@opensource.cirrus.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20210928153508.101208f8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z6qW/.5+WE9bxcw8XnWTjDu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Z6qW/.5+WE9bxcw8XnWTjDu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

ld: sound/soc/codecs/wm_adsp.o: in function `.wm_coeff_put':
wm_adsp.c:(.text.wm_coeff_put+0x54): undefined reference to `.cs_dsp_coeff_=
write_ctrl'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_write_ctl':
(.text.wm_adsp_write_ctl+0x60): undefined reference to `.cs_dsp_get_ctl'
ld: (.text.wm_adsp_write_ctl+0xb4): undefined reference to `.cs_dsp_coeff_w=
rite_ctrl'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_read_ctl':
(.text.wm_adsp_read_ctl+0x50): undefined reference to `.cs_dsp_get_ctl'
ld: (.text.wm_adsp_read_ctl+0xbc): undefined reference to `.cs_dsp_coeff_re=
ad_ctrl'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_coeff_get':
wm_adsp.c:(.text.wm_coeff_get+0x54): undefined reference to `.cs_dsp_coeff_=
read_ctrl'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_coeff_tlv_get':
wm_adsp.c:(.text.wm_coeff_tlv_get+0x60): undefined reference to `.cs_dsp_co=
eff_read_ctrl'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_coeff_put_acked':
wm_adsp.c:(.text.wm_coeff_put_acked+0xa4): undefined reference to `.cs_dsp_=
coeff_write_acked_control'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp1_init':
(.text.wm_adsp1_init+0x38): undefined reference to `.cs_dsp_adsp1_init'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp2_set_dspclk':
(.text.wm_adsp2_set_dspclk+0x44): undefined reference to `.cs_dsp_set_dspcl=
k'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_early_event':
(.text.wm_adsp_early_event+0xac): undefined reference to `.cs_dsp_power_dow=
n'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_event':
(.text.wm_adsp_event+0x88): undefined reference to `.cs_dsp_run'
ld: (.text.wm_adsp_event+0xb0): undefined reference to `.cs_dsp_stop'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp2_component_probe':
(.text.wm_adsp2_component_probe+0x6c): undefined reference to `.cs_dsp_init=
_debugfs'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp2_component_remove':
(.text.wm_adsp2_component_remove+0x24): undefined reference to `.cs_dsp_cle=
anup_debugfs'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp2_init':
(.text.wm_adsp2_init+0xa8): undefined reference to `.cs_dsp_adsp2_init'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_halo_init':
(.text.wm_halo_init+0xa8): undefined reference to `.cs_dsp_halo_init'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp2_remove':
(.text.wm_adsp2_remove+0x24): undefined reference to `.cs_dsp_remove'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp2_bus_error':
(.text.wm_adsp2_bus_error+0x24): undefined reference to `.cs_dsp_adsp2_bus_=
error'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_halo_bus_error':
(.text.wm_halo_bus_error+0x24): undefined reference to `.cs_dsp_halo_bus_er=
ror'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_halo_wdt_expire':
(.text.wm_halo_wdt_expire+0x24): undefined reference to `.cs_dsp_halo_wdt_e=
xpire'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp1_event':
(.text.wm_adsp1_event+0x168): undefined reference to `.cs_dsp_adsp1_power_u=
p'
ld: (.text.wm_adsp1_event+0x210): undefined reference to `.cs_dsp_adsp1_pow=
er_down'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_control_add':
wm_adsp.c:(.text.wm_adsp_control_add+0x70): undefined reference to `.cs_dsp=
_mem_region_name'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_buffer_capture_block':
wm_adsp.c:(.text.wm_adsp_buffer_capture_block+0x248): undefined reference t=
o `.cs_dsp_read_raw_data_block'
ld: wm_adsp.c:(.text.wm_adsp_buffer_capture_block+0x27c): undefined referen=
ce to `.cs_dsp_remove_padding'
ld: wm_adsp.c:(.text.wm_adsp_buffer_capture_block+0x344): undefined referen=
ce to `.cs_dsp_write_data_word'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_boot_work':
wm_adsp.c:(.text.wm_adsp_boot_work+0x108): undefined reference to `.cs_dsp_=
power_up'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_buffer_populate':
wm_adsp.c:(.text.wm_adsp_buffer_populate+0x1ac): undefined reference to `.c=
s_dsp_read_data_word'
ld: wm_adsp.c:(.text.wm_adsp_buffer_populate+0x1fc): undefined reference to=
 `.cs_dsp_read_data_word'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_buffer_parse_coeff':
wm_adsp.c:(.text.wm_adsp_buffer_parse_coeff+0x58): undefined reference to `=
.cs_dsp_coeff_read_ctrl'
ld: wm_adsp.c:(.text.wm_adsp_buffer_parse_coeff+0x2b0): undefined reference=
 to `.cs_dsp_remove_padding'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_buffer_parse_legacy':
wm_adsp.c:(.text.wm_adsp_buffer_parse_legacy+0x48): undefined reference to =
`.cs_dsp_find_alg_region'
ld: wm_adsp.c:(.text.wm_adsp_buffer_parse_legacy+0xc4): undefined reference=
 to `.cs_dsp_read_data_word'
ld: wm_adsp.c:(.text.wm_adsp_buffer_parse_legacy+0x150): undefined referenc=
e to `.cs_dsp_read_data_word'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_buffer_get_error':
wm_adsp.c:(.text.wm_adsp_buffer_get_error+0x44): undefined reference to `.c=
s_dsp_read_data_word'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_compr_trigger':
(.text.wm_adsp_compr_trigger+0x370): undefined reference to `.cs_dsp_write_=
data_word'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_buffer_update_avail':
wm_adsp.c:(.text.wm_adsp_buffer_update_avail+0x70): undefined reference to =
`.cs_dsp_read_data_word'
ld: wm_adsp.c:(.text.wm_adsp_buffer_update_avail+0x16c): undefined referenc=
e to `.cs_dsp_read_data_word'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_compr_handle_irq':
(.text.wm_adsp_compr_handle_irq+0x140): undefined reference to `.cs_dsp_rea=
d_data_word'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_compr_pointer':
(.text.wm_adsp_compr_pointer+0x3d8): undefined reference to `.cs_dsp_write_=
data_word'
ld: sound/soc/codecs/wm_adsp.o: in function `.wm_coeff_tlv_put':
wm_adsp.c:(.text.wm_coeff_tlv_put+0x100): undefined reference to `.cs_dsp_c=
oeff_write_ctrl'

Caused by commit

  f6bc909e7673 ("firmware: cs_dsp: add driver to support firmware loading o=
n Cirrus Logic DSPs")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Z6qW/.5+WE9bxcw8XnWTjDu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFSqYwACgkQAVBC80lX
0GyAvggAnxWsWol71ql0JeI2y0YccWBk1uF0FYv089Wcwlog1KPkn7tzXarlN/GG
sNjHF8k7hcyWfs7U5zm4jc3amn2/naY91L+/c/bZQghxsjRKXtMO1meNmj4tEE3s
LY2FtpCUeWEI+OX/4EcgiSS1DkA2NfbwGuEq7bk8ygRodBwk/Z1aIxr8C2S+zlWo
F5CFdVYEx5vmSFj4OQkZF6rfC+z8YHBtpnkzZ/A7iqCPtEgQ0NcyrrImimJ+/XpR
98gMd6gtv5tdviqXcVDEtj9aFxkQxMl6CvNPFG6E9WrKSEe1YwziPG5dJ/FG/lJ9
AtCJIRc+WHk5w7KLhRPzRxYyuoVz/A==
=LYkx
-----END PGP SIGNATURE-----

--Sig_/Z6qW/.5+WE9bxcw8XnWTjDu--
