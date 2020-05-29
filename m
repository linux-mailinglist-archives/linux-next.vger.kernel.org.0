Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5621E7856
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 10:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgE2I2p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 04:28:45 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:59929 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725775AbgE2I2o (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 May 2020 04:28:44 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 71A817EE;
        Fri, 29 May 2020 04:28:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 29 May 2020 04:28:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=IDO/7VtP+P7m9JLpy/1xbSd9do5
        gkCPNFtRecniB8ac=; b=cm6HZccZHihiheMoZ4Qp1TTaNv7eGQdBaXJ0E1tpQSz
        RyNKkIyYFswYcHsKJGnhndScInrtgl9P2ixqKNG1WDpp3CvSQj48bh7SrA/k3fg0
        qGC380Gul2GQi658FVDT3/3ra4g1rznwOWjzqU/CmGPrJTFoVLmcFmt5eDMof+CS
        JDFe+WY/SPZxAGjdRk3AHDo5RWtNFoaYxiOZJ9ntVSKyMq3eAePe3z+Sj493hLLq
        BGsktSlq7xViyfbVk9dQtUHg9mecvhn4tr95EXasqursZm3EBG0QA3XV6Yb2eewX
        U//5Nh3xCdK+pkQ0TaqopgXFaCunFjZUkU30lc/+OpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=IDO/7V
        tP+P7m9JLpy/1xbSd9do5gkCPNFtRecniB8ac=; b=JYMoNcLXzyk/gqQmcM6AJA
        NxT9i/FNbkkZN7cVyw5uZDVtulqMbKboMnw+cZD1yh+iE6Q988Da/VncYij747M8
        9kATkdqtOQv8+p/LjahroG3+MXf7IVGLZq7bEIaG7JvPwntl6EfW/f21Wq1Yryhw
        J5Vr2eDC26itXyavfTmwlODBNctl0YYXReSAQR3WIaaNkPPsqcW+/sRR3IPFKDB4
        koDI36+YJRypw0dbA5N9WBWMxSLyneYa9X451tMMF/WAkJEO36Se264p8gLtSiTc
        DoGQpZAIYREyYIN5KNLdcVjfC2QD85WtXn/NYIUiCLxdkHwaB9lQ3YQyyzBM8BKw
        ==
X-ME-Sender: <xms:usfQXkg1pWAP84yXT2yo_ySBvjRQX2bnuAKE9V9dCqk_M2oqBhz99Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvkedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrkeelrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:usfQXtB7jGphWbNuofCDvgkIxoAJTwZQ4z9YS3pX_6uMa2kbs_DpGw>
    <xmx:usfQXsHvLRDSoxgjuBYgWTMG_m_jmRYOC50pnRLFg0mVRBHVjwakpw>
    <xmx:usfQXlTnxdFTc8SehsdbLrjNEkvIiCAPwHELUEAN-mXhagdLDedmCg>
    <xmx:u8fQXs-PcWKDMVydh75dVV9RenSW1zzF6-Ris8vMVvfiuB2XJk6WLg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 70DD73280060;
        Fri, 29 May 2020 04:28:42 -0400 (EDT)
Date:   Fri, 29 May 2020 10:28:40 +0200
From:   Greg KH <greg@kroah.com>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: linux-next: manual merge of the usb tree with the devicetree tree
Message-ID: <20200529082840.GC847132@kroah.com>
References: <20200528162215.3a9aa663@canb.auug.org.au>
 <20200528104916.GD3115014@kroah.com>
 <CAL_JsqKYUOPFS=0rWuUL2HLNz1DdKbYULckAWnCq-0v96-1S4g@mail.gmail.com>
 <20200529082641.GB847132@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529082641.GB847132@kroah.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 29, 2020 at 10:26:41AM +0200, Greg KH wrote:
> On Thu, May 28, 2020 at 08:14:36AM -0600, Rob Herring wrote:
> > On Thu, May 28, 2020 at 4:49 AM Greg KH <greg@kroah.com> wrote:
> > >
> > > On Thu, May 28, 2020 at 04:22:15PM +1000, Stephen Rothwell wrote:
> > > > Hi all,
> > > >
> > > > Today's linux-next merge of the usb tree got a conflict in:
> > > >
> > > >   Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > > >
> > > > between commit:
> > > >
> > > >   3828026c9ec8 ("dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings")
> > > >
> > > > from the devicetree tree and commits:
> > > >
> > > >   cd4b54e2ae1f ("dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings")
> > > >
> > > > from the usb tree.
> > > >
> > > > I fixed it up (I guessed, taking most changes from the former) and can
> > > > carry the fix as necessary. This is now fixed as far as linux-next is
> > > > concerned, but any non trivial conflicts should be mentioned to your
> > > > upstream maintainer when your tree is submitted for merging.  You may
> > > > also want to consider cooperating with the maintainer of the
> > > > conflicting tree to minimise any particularly complex conflicts.
> > 
> > Ugg, I fixed up a warning on my side...
> > 
> > >
> > > Sounds good,t hanks.
> > 
> > Greg, can you revert your copy and we can get rid of the conflict.
> 
> I can, if you also add the attached patch to your tree, as it was a
> follow-on one from the original one and I had to revert it too.

Also this one as well.

---------------------

From b88035625ec9594d4554a307e820aef4b759e35f Mon Sep 17 00:00:00 2001
From: Sandeep Maheswaram <sanm@codeaurora.org>
Date: Thu, 26 Mar 2020 12:36:08 +0530
Subject: [PATCH] dt-bindings: usb: qcom,dwc3: Add compatible for SC7180

Add compatible for SC7180 in usb dwc3 bindings.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Felipe Balbi <balbi@kernel.org>

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 0f69475566c7..17e22ff528dd 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -16,6 +16,7 @@ properties:
       - enum:
           - qcom,msm8996-dwc3
           - qcom,msm8998-dwc3
+          - qcom,sc7180-dwc3
           - qcom,sdm845-dwc3
       - const: qcom,dwc3
 
