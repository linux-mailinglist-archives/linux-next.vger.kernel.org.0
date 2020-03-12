Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1B2E182864
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 06:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387805AbgCLF0T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 01:26:19 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47825 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387802AbgCLF0S (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Mar 2020 01:26:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48dHP25zDRz9sNg;
        Thu, 12 Mar 2020 16:26:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583990775;
        bh=J3NxTfTBNnYfk+42d00utDzX+xv3mvYH+ai44NEd8FI=;
        h=Date:From:To:Cc:Subject:From;
        b=ODkxtSlNQ2HQ2E+jO80/rZrxqaPV1e6eMTz+f4qXyFdO4LwB1LBXMbhi+80L7cidj
         PpwwmJun3/xo0jI2NjBa73fSLN1PR3XD3dCCDzgpug34FNQ87vo7CjJgp3xaPiSIY4
         cwijCluzdz5hbIoe7JcGlG4YQhh8Fsuvb04j4i30dxlF2lR7typcCXQkRuAJgUB/GE
         DPTE3qzG9hkZvpfSIGqpGM/8ARIho1KTUOJAprjaLlUAn2T72qdmNxlKM2WBzAw/ga
         V6NhTdVu9MfJBdOsXrYorusfGxZnevSg2udgsqzg4AgDpyhWItO513eOE+J6HHs57f
         IYnS9yma2bXdw==
Date:   Thu, 12 Mar 2020 16:26:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: linux-next: manual merge of the slave-dma tree with Linus' tree
Message-ID: <20200312162614.1b6b2b0e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KuEAi6yx2/LKGQjG4dq9pdN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KuEAi6yx2/LKGQjG4dq9pdN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the slave-dma tree got a conflict in:

  drivers/dma/ti/k3-udma.c

between commit:

  16cd3c670183 ("dmaengine: ti: k3-udma: Workaround for RX teardown with st=
ale data in peer")

from Linus' tree and commit:

  db8d9b4c9b30 ("dmaengine: ti: k3-udma: Implement custom dbg_summary_show =
for debugfs")

from the slave-dma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/dma/ti/k3-udma.c
index 0536866a58ce,1e6aac87302d..000000000000
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@@ -149,8 -128,19 +149,9 @@@ struct udma_dev=20
 =20
  	struct udma_chan *channels;
  	u32 psil_base;
+ 	u32 atype;
  };
 =20
 -struct udma_hwdesc {
 -	size_t cppi5_desc_size;
 -	void *cppi5_desc_vaddr;
 -	dma_addr_t cppi5_desc_paddr;
 -
 -	/* TR descriptor internal pointers */
 -	void *tr_req_base;
 -	struct cppi5_tr_resp_t *tr_resp_base;
 -};
 -
  struct udma_desc {
  	struct virt_dma_desc vd;
 =20
@@@ -3381,98 -3276,66 +3409,158 @@@ static int udma_setup_resources(struct=
=20
  	return ch_count;
  }
 =20
 +static int udma_setup_rx_flush(struct udma_dev *ud)
 +{
 +	struct udma_rx_flush *rx_flush =3D &ud->rx_flush;
 +	struct cppi5_desc_hdr_t *tr_desc;
 +	struct cppi5_tr_type1_t *tr_req;
 +	struct cppi5_host_desc_t *desc;
 +	struct device *dev =3D ud->dev;
 +	struct udma_hwdesc *hwdesc;
 +	size_t tr_size;
 +
 +	/* Allocate 1K buffer for discarded data on RX channel teardown */
 +	rx_flush->buffer_size =3D SZ_1K;
 +	rx_flush->buffer_vaddr =3D devm_kzalloc(dev, rx_flush->buffer_size,
 +					      GFP_KERNEL);
 +	if (!rx_flush->buffer_vaddr)
 +		return -ENOMEM;
 +
 +	rx_flush->buffer_paddr =3D dma_map_single(dev, rx_flush->buffer_vaddr,
 +						rx_flush->buffer_size,
 +						DMA_TO_DEVICE);
 +	if (dma_mapping_error(dev, rx_flush->buffer_paddr))
 +		return -ENOMEM;
 +
 +	/* Set up descriptor to be used for TR mode */
 +	hwdesc =3D &rx_flush->hwdescs[0];
 +	tr_size =3D sizeof(struct cppi5_tr_type1_t);
 +	hwdesc->cppi5_desc_size =3D cppi5_trdesc_calc_size(tr_size, 1);
 +	hwdesc->cppi5_desc_size =3D ALIGN(hwdesc->cppi5_desc_size,
 +					ud->desc_align);
 +
 +	hwdesc->cppi5_desc_vaddr =3D devm_kzalloc(dev, hwdesc->cppi5_desc_size,
 +						GFP_KERNEL);
 +	if (!hwdesc->cppi5_desc_vaddr)
 +		return -ENOMEM;
 +
 +	hwdesc->cppi5_desc_paddr =3D dma_map_single(dev, hwdesc->cppi5_desc_vadd=
r,
 +						  hwdesc->cppi5_desc_size,
 +						  DMA_TO_DEVICE);
 +	if (dma_mapping_error(dev, hwdesc->cppi5_desc_paddr))
 +		return -ENOMEM;
 +
 +	/* Start of the TR req records */
 +	hwdesc->tr_req_base =3D hwdesc->cppi5_desc_vaddr + tr_size;
 +	/* Start address of the TR response array */
 +	hwdesc->tr_resp_base =3D hwdesc->tr_req_base + tr_size;
 +
 +	tr_desc =3D hwdesc->cppi5_desc_vaddr;
 +	cppi5_trdesc_init(tr_desc, 1, tr_size, 0, 0);
 +	cppi5_desc_set_pktids(tr_desc, 0, CPPI5_INFO1_DESC_FLOWID_DEFAULT);
 +	cppi5_desc_set_retpolicy(tr_desc, 0, 0);
 +
 +	tr_req =3D hwdesc->tr_req_base;
 +	cppi5_tr_init(&tr_req->flags, CPPI5_TR_TYPE1, false, false,
 +		      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
 +	cppi5_tr_csf_set(&tr_req->flags, CPPI5_TR_CSF_SUPR_EVT);
 +
 +	tr_req->addr =3D rx_flush->buffer_paddr;
 +	tr_req->icnt0 =3D rx_flush->buffer_size;
 +	tr_req->icnt1 =3D 1;
 +
 +	/* Set up descriptor to be used for packet mode */
 +	hwdesc =3D &rx_flush->hwdescs[1];
 +	hwdesc->cppi5_desc_size =3D ALIGN(sizeof(struct cppi5_host_desc_t) +
 +					CPPI5_INFO0_HDESC_EPIB_SIZE +
 +					CPPI5_INFO0_HDESC_PSDATA_MAX_SIZE,
 +					ud->desc_align);
 +
 +	hwdesc->cppi5_desc_vaddr =3D devm_kzalloc(dev, hwdesc->cppi5_desc_size,
 +						GFP_KERNEL);
 +	if (!hwdesc->cppi5_desc_vaddr)
 +		return -ENOMEM;
 +
 +	hwdesc->cppi5_desc_paddr =3D dma_map_single(dev, hwdesc->cppi5_desc_vadd=
r,
 +						  hwdesc->cppi5_desc_size,
 +						  DMA_TO_DEVICE);
 +	if (dma_mapping_error(dev, hwdesc->cppi5_desc_paddr))
 +		return -ENOMEM;
 +
 +	desc =3D hwdesc->cppi5_desc_vaddr;
 +	cppi5_hdesc_init(desc, 0, 0);
 +	cppi5_desc_set_pktids(&desc->hdr, 0, CPPI5_INFO1_DESC_FLOWID_DEFAULT);
 +	cppi5_desc_set_retpolicy(&desc->hdr, 0, 0);
 +
 +	cppi5_hdesc_attach_buf(desc,
 +			       rx_flush->buffer_paddr, rx_flush->buffer_size,
 +			       rx_flush->buffer_paddr, rx_flush->buffer_size);
 +
 +	dma_sync_single_for_device(dev, hwdesc->cppi5_desc_paddr,
 +				   hwdesc->cppi5_desc_size, DMA_TO_DEVICE);
 +	return 0;
 +}
 +
+ #ifdef CONFIG_DEBUG_FS
+ static void udma_dbg_summary_show_chan(struct seq_file *s,
+ 				       struct dma_chan *chan)
+ {
+ 	struct udma_chan *uc =3D to_udma_chan(chan);
+ 	struct udma_chan_config *ucc =3D &uc->config;
+=20
+ 	seq_printf(s, " %-13s| %s", dma_chan_name(chan),
+ 		   chan->dbg_client_name ?: "in-use");
+ 	seq_printf(s, " (%s, ", dmaengine_get_direction_text(uc->config.dir));
+=20
+ 	switch (uc->config.dir) {
+ 	case DMA_MEM_TO_MEM:
+ 		seq_printf(s, "chan%d pair [0x%04x -> 0x%04x], ", uc->tchan->id,
+ 			   ucc->src_thread, ucc->dst_thread);
+ 		break;
+ 	case DMA_DEV_TO_MEM:
+ 		seq_printf(s, "rchan%d [0x%04x -> 0x%04x], ", uc->rchan->id,
+ 			   ucc->src_thread, ucc->dst_thread);
+ 		break;
+ 	case DMA_MEM_TO_DEV:
+ 		seq_printf(s, "tchan%d [0x%04x -> 0x%04x], ", uc->tchan->id,
+ 			   ucc->src_thread, ucc->dst_thread);
+ 		break;
+ 	default:
+ 		seq_printf(s, ")\n");
+ 		return;
+ 	}
+=20
+ 	if (ucc->ep_type =3D=3D PSIL_EP_NATIVE) {
+ 		seq_printf(s, "PSI-L Native");
+ 		if (ucc->metadata_size) {
+ 			seq_printf(s, "[%s", ucc->needs_epib ? " EPIB" : "");
+ 			if (ucc->psd_size)
+ 				seq_printf(s, " PSDsize:%u", ucc->psd_size);
+ 			seq_printf(s, " ]");
+ 		}
+ 	} else {
+ 		seq_printf(s, "PDMA");
+ 		if (ucc->enable_acc32 || ucc->enable_burst)
+ 			seq_printf(s, "[%s%s ]",
+ 				   ucc->enable_acc32 ? " ACC32" : "",
+ 				   ucc->enable_burst ? " BURST" : "");
+ 	}
+=20
+ 	seq_printf(s, ", %s)\n", ucc->pkt_mode ? "Packet mode" : "TR mode");
+ }
+=20
+ static void udma_dbg_summary_show(struct seq_file *s,
+ 				  struct dma_device *dma_dev)
+ {
+ 	struct dma_chan *chan;
+=20
+ 	list_for_each_entry(chan, &dma_dev->channels, device_node) {
+ 		if (chan->client_count)
+ 			udma_dbg_summary_show_chan(s, chan);
+ 	}
+ }
+ #endif /* CONFIG_DEBUG_FS */
+=20
  #define TI_UDMAC_BUSWIDTHS	(BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) | \
  				 BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) | \
  				 BIT(DMA_SLAVE_BUSWIDTH_3_BYTES) | \

--Sig_/KuEAi6yx2/LKGQjG4dq9pdN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5px/YACgkQAVBC80lX
0GxgiggAk/E0rkHCjTQkK8H2kZGlD/6twDyxiXipWdvcpYOa70rY5TDykg1rMahH
F4ehqcW1Z7I9fwnz/ZQ2Y5WXcB7WfqUqIdrnSUMjV9+JcUWdEOExaeV+slPmd0r7
MCx/5eRci2gOfwUnZ75Y0zLHlCBqlM9oBSWguZ3BimxbOpk7Fz6MzB22Hlul93hZ
F9PWhEqYjsiBWOvItccZWuejQ5Ndq1JeMD76y07aTulZbCorTFYeNDu1EL4aGDyT
8bU1D4dzypdhXVP+aCtTorajPOnmJcrtE3pdRT6vkEUU0kFbA96iGNzvxhmGHBje
uBrMeadxO5LaxBOd1f3G1SDhXzn3qw==
=klqm
-----END PGP SIGNATURE-----

--Sig_/KuEAi6yx2/LKGQjG4dq9pdN--
