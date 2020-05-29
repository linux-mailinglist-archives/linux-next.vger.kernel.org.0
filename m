Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44901E7840
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 10:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbgE2I0u (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 04:26:50 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:46749 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725355AbgE2I0t (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 May 2020 04:26:49 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 502F48A2;
        Fri, 29 May 2020 04:26:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 29 May 2020 04:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=kpO2OkI6GBMIYbELS/5ezZQ8mO9
        sz2tlsMmmlBJAQzk=; b=kfhMTVQ3I0Wn1/e7oHuIu9dGjRISAMFNLG9eYrzmtC2
        bEXWVFfxbg7jizv7lL1DUA4GTMfzi/u38wNafe41bFTYG2J2ind/Cf+r5mUhxzfA
        xTaPTANnkgc+wPBmqZqc4+Ddv/7Fx1brEwaA9nRDji7QuLV14OSOUPqG5No/kZN/
        664iPQ/J9giOQKEVZ5XQqLLeQRa+4/0/8/nzmkBDkHxxpK4sZnVoRXzfmto8iP+Z
        vs7CDr12D71UJGhggFWxm0A4SO/MDtwIFoW8rkr455e7lHlTnBy4+hUYjhF5lI1x
        chCKhrMPNQG+mcxzJcmcM4qczefMf0SkM9+1irv5E7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kpO2Ok
        I6GBMIYbELS/5ezZQ8mO9sz2tlsMmmlBJAQzk=; b=3ANcjHpOb0L9BGjSi0QTi6
        8wu95q5KBz7IOHPN1PktMwu1CeBJQn36DC3t81XybusZtwgOgmDulDJelWyz4jST
        Xxol3XXkxSGY0LU7LaEmd3ar+6cqzvkaze+/unt5xs6ij1VCcL28PqVgZcEqFVcX
        f/Ol+f+2d7ArxX+RM/0YZxAj53oZTQvLU/9OI+aznaapsGNCaRlw2yq+cMJLZSs2
        cbtxN/PfvJcxfi7rqVw3iu1OD0KI7AQK+nf3ZS4IjH6JNc5Re7WJNedQ7fUcDyp1
        rnvySLdKWQQ7tIDXx0z8FU8bvYxWYPUn8x0ntBnGrg1ZVDPGOtriTyIaWK3Hihnw
        ==
X-ME-Sender: <xms:R8fQXk9ccK5IXtSyw3NbmEabXiCQky4lMtFAkOBiofOS3X4yjiHbTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvkedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrkeelrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:R8fQXstjkBsKuUBARMgG5ShDpLG5dMeZDL7dTgCQHv1jTAzuhR3tMA>
    <xmx:R8fQXqA3p3ao3q5IjumcAM7hQm2H3GZ35ZFyIBrt1Vs0j21VvOSV1w>
    <xmx:R8fQXkfbjw3LER8chh_2qNTMBqx_XKqD5auAGoqic-b8C7s_FcSCHw>
    <xmx:R8fQXia4kWdkwKkln9aFxafX0Bwq3gt5uh_b3KhLot-j2szU_f7EVw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1C99F3061DC5;
        Fri, 29 May 2020 04:26:47 -0400 (EDT)
Date:   Fri, 29 May 2020 10:26:41 +0200
From:   Greg KH <greg@kroah.com>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: linux-next: manual merge of the usb tree with the devicetree tree
Message-ID: <20200529082641.GB847132@kroah.com>
References: <20200528162215.3a9aa663@canb.auug.org.au>
 <20200528104916.GD3115014@kroah.com>
 <CAL_JsqKYUOPFS=0rWuUL2HLNz1DdKbYULckAWnCq-0v96-1S4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKYUOPFS=0rWuUL2HLNz1DdKbYULckAWnCq-0v96-1S4g@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 28, 2020 at 08:14:36AM -0600, Rob Herring wrote:
> On Thu, May 28, 2020 at 4:49 AM Greg KH <greg@kroah.com> wrote:
> >
> > On Thu, May 28, 2020 at 04:22:15PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Today's linux-next merge of the usb tree got a conflict in:
> > >
> > >   Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > >
> > > between commit:
> > >
> > >   3828026c9ec8 ("dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings")
> > >
> > > from the devicetree tree and commits:
> > >
> > >   cd4b54e2ae1f ("dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings")
> > >
> > > from the usb tree.
> > >
> > > I fixed it up (I guessed, taking most changes from the former) and can
> > > carry the fix as necessary. This is now fixed as far as linux-next is
> > > concerned, but any non trivial conflicts should be mentioned to your
> > > upstream maintainer when your tree is submitted for merging.  You may
> > > also want to consider cooperating with the maintainer of the
> > > conflicting tree to minimise any particularly complex conflicts.
> 
> Ugg, I fixed up a warning on my side...
> 
> >
> > Sounds good,t hanks.
> 
> Greg, can you revert your copy and we can get rid of the conflict.

I can, if you also add the attached patch to your tree, as it was a
follow-on one from the original one and I had to revert it too.

thanks,

greg k-h


-------------------

From 1805cdde37c8cc90b298c3d9afbc2aa4c9890635 Mon Sep 17 00:00:00 2001
From: Sandeep Maheswaram <sanm@codeaurora.org>
Date: Wed, 1 Apr 2020 10:45:42 +0530
Subject: [PATCH] dt-bindings: usb: qcom,dwc3: Introduce interconnect
 properties for Qualcomm DWC3 driver

Add documentation for the interconnects and interconnect-names
properties for USB.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
Signed-off-by: Felipe Balbi <balbi@kernel.org>

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 17e22ff528dd..ec1ec47b51cb 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -70,6 +70,14 @@ properties:
   resets:
     maxItems: 1
 
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: usb-ddr
+      - const: apps-usb
+
   interrupts:
     items:
       - description: The interrupt that is asserted
