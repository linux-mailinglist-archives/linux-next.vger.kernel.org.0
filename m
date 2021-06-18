Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41E7E3AC401
	for <lists+linux-next@lfdr.de>; Fri, 18 Jun 2021 08:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbhFRGiA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Jun 2021 02:38:00 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:39395 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230408AbhFRGh7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Jun 2021 02:37:59 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.west.internal (Postfix) with ESMTP id A6C3BFBA;
        Fri, 18 Jun 2021 02:35:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 18 Jun 2021 02:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=Y9gLNjfKt95UZEKIkMcPtWQGaka
        y82uCknphxZrF74k=; b=PIF/krMV61gfo2CzPo2jfT1f8waXFJZuTzhqOQEhvSR
        qHmmXGp+qafit/7Q6sN22QfQrwuXJnpim6az3fZaojap0zogd9Nn/dLgAdnR4hgw
        X4oVsB9onVYSYRS4+RFsl0mM9a9TE4mGJTlMIlp0o64++iFEQ/HLtmglkE/bDM1L
        wlGR/oy/uIqGI4+i7HbO1L7dy3eZBm93t6si9/d+b0vr4uodp7+nfZ4bYANWVMPR
        1aQ3uNxmVZk/TDJBf3EBa+jzbkESm0cNXINyeFjeJBYzk4dR0JW8FiYCP2MRmuS4
        5XFOz4LJKI5h1A8Z1EFbZtjQ2lHASH2Ajx8rfo3f9Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Y9gLNj
        fKt95UZEKIkMcPtWQGakay82uCknphxZrF74k=; b=k5Jd+OcudRb69uFL3tJP6N
        qHJArQ7pqNhrlhKyoEJGv43BjEJHiCGMD4Wh7d2TG2VVyMsR4FGdmvt8EScRg36p
        oimWjxhwKCojpG+aye0tYnsrS9lPQ8GG/lbIFP/xUPfhKCEzQM9jEDW83mhZ/7/6
        5SX1ke/rucQzdQjtnZbnLb0jO8UJuYj3LpGLH/NnuZrt6QjngyeX2qNW90sNQPz2
        UtCSns/rgaRoGceRH4W6J3d7p5C5O357+8si6b+mP91l7SBSk3sheiAyRD82vz8N
        VuFkE8oJSEgi8AV8BQfJjj6ImqWMsDWX8yW4krp8Py7EOQagBggP/SzaWhJuufCw
        ==
X-ME-Sender: <xms:wz7MYD2HjqS40EycUURglBTiW9Eee8hPOzQ5baubDaIAU7hKdkqftw>
    <xme:wz7MYCF_YviO393g7bQhcCOA17VBvGVbTZdIHLuFXA1Th7MUP9XJFrBKydP-0ZO3U
    vMsbTOs8QuuyQ>
X-ME-Received: <xmr:wz7MYD4f9AexsksGLVPsZbPmC8sjQqLjzsEC0IIrlnuZV_cYIrswJ_3tYxSh3ZQzxKWey5I-HY4ea0PqhJFMKxMNg_XBhMep>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefvddguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:wz7MYI1tDo1in8ryEpoVjU-YgDuPngJJf84dEPzA1ME7yGf4J_RJjg>
    <xmx:wz7MYGEX0YXsm7H86LlbD069Nghx89gatjD_dQORZ2rZEBrjIZLB3A>
    <xmx:wz7MYJ-2WgEtYCaDtvt7AdVpY8uAtChZ5Hn8fW0wHfKUH818-eWf5g>
    <xmx:xT7MYDfXIIgUsJDjy0c0j2pCjjTradJ-PcBybT1SAut1WdVqnmYMIdsVVEU>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Jun 2021 02:35:47 -0400 (EDT)
Date:   Fri, 18 Jun 2021 08:35:45 +0200
From:   Greg KH <greg@kroah.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the usb tree with the arm-soc tree
Message-ID: <YMw+weFvPxCXbvk+@kroah.com>
References: <20210617144346.564be887@canb.auug.org.au>
 <YMt5jTLYv+DKWKdn@google.com>
 <YMuGtNTvZKHx4Rhr@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMuGtNTvZKHx4Rhr@yoga>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 17, 2021 at 12:30:28PM -0500, Bjorn Andersson wrote:
> On Thu 17 Jun 11:34 CDT 2021, Matthias Kaehlcke wrote:
> 
> > On Thu, Jun 17, 2021 at 02:43:46PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Today's linux-next merge of the usb tree got conflicts in:
> > > 
> > >   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> > >   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
> > > 
> > > between commit:
> > > 
> > >   39441f73d91a ("arm64: dts: qcom: sc7180: lazor: Simplify disabling of charger thermal zone")
> > > 
> > > from the arm-soc tree and commit:
> > > 
> > >   1da8116eb0c5 ("arm64: dts: qcom: sc7180-trogdor: Add nodes for onboard USB hub")
> > > 
> > > from the usb tree.
> > > 
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your tree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particularly
> > > complex conflicts.
> > 
> > Thanks Stephen for fixing this up for -next!
> > 
> > One option would be to revert 1da8116eb0c5 ("arm64: dts: qcom: sc7180-trogdor:
> > Add nodes for onboard USB hub") from usb-next and land it through the qcom/arm-soc
> > tree with the rest of the SC7180 device tree patches.
> > 
> > Greg/Bjorn, does the above sound like a suitable solution to you or do you
> > think it would be better to deal with the conflict in a different way?
> 
> Having the dts patch go through the Qualcomm tree instead would resolve
> the issue.
> 
> I wasn't aware that the driver code had landed yet, so I haven't merged
> the DT patch, but can do so and include it in the pull request that I'm
> preparing for 5.14.
> 
> Greg, does that sound reasonable to you?

I will revert the dts change in my tree now, along with the rest of this
specific series, as it is causing other build issues in linux-next at
the moment.  That should resolve the merge issues now.

If you want to take the dts patch through your tree now, that's fine
with me.  Or we can wait until after 5.14-rc1 is out, which might make
things easier to handle.

thanks,

greg k-h
