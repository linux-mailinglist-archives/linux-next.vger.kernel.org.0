Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A933CB14A
	for <lists+linux-next@lfdr.de>; Fri, 16 Jul 2021 06:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhGPEHQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Jul 2021 00:07:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:44656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229626AbhGPEHP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Jul 2021 00:07:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF4736115B;
        Fri, 16 Jul 2021 04:04:18 +0000 (UTC)
Date:   Fri, 16 Jul 2021 09:34:14 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Richard Laing <richard.laing@alliedtelesis.co.nz>
Subject: Re: linux-next: manual merge of the mhi tree with the net-next tree
Message-ID: <20210716040414.GB19827@workstation>
References: <20210716133738.0d163701@canb.auug.org.au>
 <20210716034622.GA19827@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210716034622.GA19827@workstation>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 16, 2021 at 09:16:22AM +0530, Manivannan Sadhasivam wrote:
> Hi Stephen,
> 
> On Fri, Jul 16, 2021 at 01:37:38PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the mhi tree got a conflict in:
> > 
> >   drivers/bus/mhi/pci_generic.c
> > 
> > between commit:
> > 
> >   5c2c85315948 ("bus: mhi: pci-generic: configurable network interface MRU")
> > 
> 
> Ah, this one was never submitted to "linux-arm-msm" mailing list nor to
> me. I'm surprised that networking maintainers merged this patch without
> getting an Ack from me as it touches MHI bus :/
> 
> > from the net-next tree and commit:
> > 
> >   156ffb7fb7eb ("bus: mhi: pci_generic: Apply no-op for wake using sideband wake boolean")
> > 
> > from the mhi tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> 
> This change should've been taken via immutable branch between mhi-next
> and net-next or via mhi tree. Because, we have more changes coming in for
> pci-generic driver in MHI tree.
> 
> Dave, since this patch is in your tree, what do you suggest?
> 

Btw, I do have a comment about the patch. So it shouldn't be merged as
it is.

Thanks,
Mani

> Thanks,
> Mani
> 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc drivers/bus/mhi/pci_generic.c
> > index 19413daa0917,8bc6149249e3..000000000000
> > --- a/drivers/bus/mhi/pci_generic.c
> > +++ b/drivers/bus/mhi/pci_generic.c
> > @@@ -32,7 -32,8 +32,9 @@@
> >    * @edl: emergency download mode firmware path (if any)
> >    * @bar_num: PCI base address register to use for MHI MMIO register space
> >    * @dma_data_width: DMA transfer word size (32 or 64 bits)
> >  + * @mru_default: default MRU size for MBIM network packets
> > +  * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
> > +  *		   of inband wake support (such as sdx24)
> >    */
> >   struct mhi_pci_dev_info {
> >   	const struct mhi_controller_config *config;
> > @@@ -41,7 -42,7 +43,8 @@@
> >   	const char *edl;
> >   	unsigned int bar_num;
> >   	unsigned int dma_data_width;
> >  +	unsigned int mru_default;
> > + 	bool sideband_wake;
> >   };
> >   
> >   #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> > @@@ -254,7 -256,7 +258,8 @@@ static const struct mhi_pci_dev_info mh
> >   	.config = &modem_qcom_v1_mhiv_config,
> >   	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >   	.dma_data_width = 32,
> >  +	.mru_default = 32768
> > + 	.sideband_wake = false,
> >   };
> >   
> >   static const struct mhi_pci_dev_info mhi_qcom_sdx24_info = {
> > @@@ -643,11 -686,13 +689,14 @@@ static int mhi_pci_probe(struct pci_de
> >   	mhi_cntrl->status_cb = mhi_pci_status_cb;
> >   	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
> >   	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
> > - 	mhi_cntrl->wake_get = mhi_pci_wake_get_nop;
> > - 	mhi_cntrl->wake_put = mhi_pci_wake_put_nop;
> > - 	mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
> >  +	mhi_cntrl->mru = info->mru_default;
> >   
> > + 	if (info->sideband_wake) {
> > + 		mhi_cntrl->wake_get = mhi_pci_wake_get_nop;
> > + 		mhi_cntrl->wake_put = mhi_pci_wake_put_nop;
> > + 		mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
> > + 	}
> > + 
> >   	err = mhi_pci_claim(mhi_cntrl, info->bar_num, DMA_BIT_MASK(info->dma_data_width));
> >   	if (err)
> >   		return err;
> 
> 
