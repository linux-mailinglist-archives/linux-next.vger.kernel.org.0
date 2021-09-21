Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 636B64133E6
	for <lists+linux-next@lfdr.de>; Tue, 21 Sep 2021 15:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbhIUNSD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Sep 2021 09:18:03 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:58617 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231658AbhIUNSC (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Sep 2021 09:18:02 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id D3A7C2B011C8;
        Tue, 21 Sep 2021 09:16:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 21 Sep 2021 09:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=dbUvDhpn7Mt/4gcNgkWBxCS/IeN
        ohTfnxMLC8i2VXcs=; b=xk3oJeZJP9Y+ML8lo9R+E6NXFCeHZ8naGeKnMzhUtpO
        5QxYOzWVc9c/wmP6ONSljEh+e3i9jKDS3WQtaSiVLDYkVTG8Iit5iJrLJraTOxuZ
        igJXkx/huutknuZqCvvdJkJkfDsk/fYxSzSOUa2TJTMgIt9Bz03OaxPQtJSMEVuU
        jCrFaUNtJtI942RmWpdy1TH1hTTqb401pkthoqVtFQiMrftYx4KrNTB58K3SOpfE
        PtMmhr/n8L2NH2zU3kLjzOIN9r0HZLb0MOrUGEpjkASEy40IWTU+4tkFKFECNOYn
        bEO9lPii8FHPxtbBSgLfZ1gpTcyVL61LnwCVH7hVtWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dbUvDh
        pn7Mt/4gcNgkWBxCS/IeNohTfnxMLC8i2VXcs=; b=fJ+NnFDeXYr539eRsBd8iM
        8HjoT9xZhVtRnPN6Ez3+WRAS0qbnq7D+nwftpxfrvz+FQ3CUFBgh8DTw4WdRFDwb
        u55gmLlBSRRgdkAuYGlxJZTmbZbuxgiIkuCNPetYdsVymGy5MimMyEj9OrTmysaE
        59s1Pae/gd4cZ4+TpSaC2PsERGqru5r8AbeieP5DNA1FejSreTimtZX0bIHKTAlX
        fBUubxtpIpFtQqV7RbiAh1plQjE/+rw5ZnLfrmRNDGC+obaCqqHhGj1732GOOUzQ
        rg5hZLstZ4Q13Z5wIW0t+kIOtKTGdIf2cJNR3dPjbuQmSkL7iW8COYC//6b4ZMmg
        ==
X-ME-Sender: <xms:LttJYbBNzksQzDKU19lBiZwf-VjA6FJD_4zBFrHV5IcaTplA3_oMeA>
    <xme:LttJYRhQ2SY0VOLIj4-b0dXVeJu4BwS_avqrCcl5M6_XoFv050fAV0EroAqoX3m2I
    4KPmjl0xHrBSw>
X-ME-Received: <xmr:LttJYWkC_WXuHVB7PaVKDlzwJymMLaZCFyynvMm-v-wRG_93Gj5AQEpGbNGGoa0cHzkXD5iBfujjtGPEvjCU5xVIOCCltVq7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeigedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:LttJYdzIk0i6InYQL6gUZwC9RrB1ndMgpJXVtVldzESKik1lP1SRnw>
    <xmx:LttJYQTyddzi1nDG_q_4TGplL7UaRmG3oi4b9aaSyUufVBQWJ2Xd8g>
    <xmx:LttJYQZAPupCVQaZIRdMF2nky8VaLyR3ZaiAXEQYvJwTk2dMDavGwA>
    <xmx:MNtJYXJlZsmlKtAnLhEanW-yyGJqMSoBhm76lZ3hCVS_yCj_Lm7sdI_OEvE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Sep 2021 09:16:30 -0400 (EDT)
Date:   Tue, 21 Sep 2021 15:16:27 +0200
From:   Greg KH <greg@kroah.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andy Gross <agross@kernel.org>,
        Baruch Siach <baruch@tkos.co.il>,
        Kathiravan T <kathirav@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the usb tree with the qcom tree
Message-ID: <YUnbK840c9L6vpAl@kroah.com>
References: <20210921123032.02cd498b@canb.auug.org.au>
 <YUnaJolAAZmhs4kU@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUnaJolAAZmhs4kU@ripper>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 21, 2021 at 06:12:06AM -0700, Bjorn Andersson wrote:
> On Mon 20 Sep 19:30 PDT 2021, Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Today's linux-next merge of the usb tree got a conflict in:
> > 
> >   arch/arm64/boot/dts/qcom/ipq6018.dtsi
> > 
> > between commit:
> > 
> >   261e8a95d9aa ("arm64: dts: qcom: ipq6018: add usb3 DT description")
> > 
> > from the qcom tree and commit:
> > 
> >   9da2c3f76164 ("arm64: qcom: ipq6018: add usb3 DT description")
> > 
> 
> Greg, this is not a USB patch, can you please drop it from your tree.

It was sent to me and says "add usb3 DT description", so how am I
supposed to know to reject it?

I'll go revert it from my tree.  {sigh}

greg k-h
