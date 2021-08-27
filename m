Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36BDB3F95E4
	for <lists+linux-next@lfdr.de>; Fri, 27 Aug 2021 10:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbhH0IVn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Aug 2021 04:21:43 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:34793 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244530AbhH0IVm (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 27 Aug 2021 04:21:42 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 463662B0142E;
        Fri, 27 Aug 2021 04:20:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 27 Aug 2021 04:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=qPmrQKanbShS42+hXFrS7JgTioo
        HTRBUwifdJWUMxeg=; b=m8LoJh9P9rieXbPgqisf1vNYn6CAd1yEyNqzj5nlwhU
        DUNeZ3q2Ts65L17zIiIfJ8e3baBN+w52PCPa6m+pYscsRMNz2CDCm62aIO89RneA
        tM88udF6jk1IepAa8aQGTICoO+ci5Gjqh0/JUYzfXsO5R71Ft9E6xAUlLDDTovQO
        JhwxfCtvFFE0xvSI0NHlNmyCwvz9Zjtle81pzEZXefQrL2pCbUSreYtK9GppZObK
        cXI93BPC0DZLoCHZTdyqlveRLHcydj2ek/9OyUtSgX1GlYVdJEIRDhUi9ji5NFnd
        AWvnlplRURhwSnkU+E0fk/b0Mc9FYkeRJiBxMGczTwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qPmrQK
        anbShS42+hXFrS7JgTiooHTRBUwifdJWUMxeg=; b=e0ewvdV0BF2moCU5Wnb+BX
        Ct3ccd7T9a/UdlHe26ZW90ReuZePH/rMr5muxm5FknixXSmzgGzcJcKZBxLCb9UT
        K5WgeXdmqkespssjDkPN6SGDtcnJ9q2c0JiOcekagNdNX7mWRd3YRPCpQXxSKh6t
        V0EIVzsSNLBp9UciZ7ZZqqgtfSFbTACifWbcKMFmED8q8YHU/+1e3Srt64S06rMg
        xj0Jq5dYA/N2+uhvFV2e2ew1bl3OQ4VhLgWoO/KlBkUSXHpGe+Dbr2bos3IhahqM
        gof3AZ3ak8tsFR17YRCbTR3u5xY6g2EwTEE9lHrKvramDto1sEFmvsIjCV2hVlUA
        ==
X-ME-Sender: <xms:YqAoYaLO4VnUAqDGhY4xBlHyOIA29MysOk6O3BEi6k3ClvJHgiQrrw>
    <xme:YqAoYSKjGGZADAXUbCq45bqQTFl8f8WmyNjqIsOxoBxBSdnrsiXMqn1pk_IuqKT35
    BeolzycZEelSg>
X-ME-Received: <xmr:YqAoYatZxnGtcqTIhTw2H-ByYozbbcVnyvRhrIz-0sfINqCF8T949zJm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddufedgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:YqAoYfY7i96pxrHIFQ2qkiKfQ_nmfHG6Gio1OTw_iZJDlxaGxWslUg>
    <xmx:YqAoYRZQM7B8XBvUtZdOGoVIwIWZLbsP7XBMgx3l0K4Iq9YG-5a1ew>
    <xmx:YqAoYbB5-4j96y5k6EjtlQYenF2gQIdENQbWTFWv71etbQdyLsztxw>
    <xmx:Y6AoYVTLi21yxc7YPEK1_rIj8egkHi_yxtJjymPibEjlcScwJPsBx5uxkoo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Aug 2021 04:20:49 -0400 (EDT)
Date:   Fri, 27 Aug 2021 10:20:43 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: linux-next: manual merge of the phy-next tree with the usb tree
Message-ID: <YSigW8OMf2PPeauR@kroah.com>
References: <20210809171023.4d387ed3@canb.auug.org.au>
 <20210827165822.7186411f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827165822.7186411f@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 27, 2021 at 04:58:22PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 9 Aug 2021 17:10:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the phy-next tree got a conflict in:
> > 
> >   Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> > 
> > between commit:
> > 
> >   e516ac5d48fe ("dt-bindings: phy: qcom,qmp-usb3-dp: Add support for SC7280")
> > 
> > from the usb tree and commit:
> > 
> >   1a00d130596f ("dt-bindings: phy: qcom,qmp-usb3-dp: Add support for sc8180x")
> > 
> > from the phy-next tree.
> > 
> > 
> > diff --cc Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> > index 20199833f144,1d49cc3d4eae..000000000000
> > --- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> > @@@ -14,7 -14,7 +14,8 @@@ properties
> >     compatible:
> >       enum:
> >         - qcom,sc7180-qmp-usb3-dp-phy
> >  +      - qcom,sc7280-qmp-usb3-dp-phy
> > +       - qcom,sc8180x-qmp-usb3-dp-phy
> >         - qcom,sdm845-qmp-usb3-dp-phy
> >         - qcom,sm8250-qmp-usb3-dp-phy
> >     reg:
> 
> This is now a conflict between the char-misc tree and the usb tree.

Resolution looks good to me, thanks.

greg k-h
