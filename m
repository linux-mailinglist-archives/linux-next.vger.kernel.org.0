Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 015A93E40EB
	for <lists+linux-next@lfdr.de>; Mon,  9 Aug 2021 09:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbhHIHkR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Aug 2021 03:40:17 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:56113 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232094AbhHIHkQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Aug 2021 03:40:16 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id A79552B006E9;
        Mon,  9 Aug 2021 03:39:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 09 Aug 2021 03:39:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=fsl0bScebyCgyftSZKkh5Fsv2Dm
        gmxJgk8SqbFNWzGc=; b=VdKldzfdZ9YJnDWsMfMhiMlw3N9V/nZ+vMNm1g0L+c4
        XfxpgU5MoUSOpPUOxHaxENeCINP3lVMuZGcWIL0LBNX9TdEEvMCvKiSfsiDYcLN7
        uSCPsi9yzqGc17hxUjY8BSvP97mvwy0S4a8MaW/G3JWCcdtZojV7dle3sfG7LbQN
        KKYXk/tnHmMCh5psMCwO593IVsoeSGZyS7AqsCnpji3WDzlkSnmZ3EKVd3W5GoFR
        So+7Hw6k/B4tyUJG4t+Ei4E5ncsFBCZfa2RhrHIeRwron9I5I7XNbFEu1tP5KToA
        R7opcxzLXOo3YR6UQanEEgo3dfloYWeGeWfLx1FgcvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fsl0bS
        cebyCgyftSZKkh5Fsv2DmgmxJgk8SqbFNWzGc=; b=bf1O8R1xfcPM9Fc9MizKHC
        iKyxRBFvFF0vU9RzUlOhgmV6vhd63oqpEOU7I9zkyG/bea0opZ9nMvZiTicEmfea
        L+/Dyvz1FgVsnHjKinlWGlLdOGOxJxT8hq8apHoyNA4346sXrjbxAqYx6SeZRt0Z
        P3SQZkJtOmL4CDBj/UCgT6IY5MTw2yLzbQH/1UhI8eWtK/PRvNRTK0i6EDBWxl+O
        6n5yAotaFzSFe2DKy2C5aSFQFKo2u5rAYBcEw7QQ/Lx1nTi+MXHGt1N/72QP/OCc
        JOnCngaBwyVZ46WroMPVANIjV3BBaWUTbYZb8VTAJ3NqyLKHfRd5jJwzP1940xrA
        ==
X-ME-Sender: <xms:ydsQYdSl_q_T4EznDAuGz44PHPcObE1oovBRTm9TRHNXASewMzFipA>
    <xme:ydsQYWwvz7eQeyfKoTKP33WIP8xnNcEA7RkI4YBedh7aujLBfkK4kzHNWxX7cOxrG
    C9Ye1xWm0ZE1A>
X-ME-Received: <xmr:ydsQYS2Rwr73k_IY75wDyhpK1YPyYBCT1X8l6McGFzMbe5Lx9AFY6yPisF91AAuCLvxy8TJsfLUnyisfhYQ3GafjLYXus6Gz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeeigdduudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:ydsQYVCqpScmfjeIYWZ7ac8IeGFnMAKWzhZyvBoyBEHW5u5YQbUUrA>
    <xmx:ydsQYWgokVYHOUVMfaXZ_lTarPnZF5rm3CxNr9dJpof3mviKOYTuOA>
    <xmx:ydsQYZpA4jZmDFlUVlHMWrpjf2B7gzmp_Cm_2X7JInb2pTb0R_xOqw>
    <xmx:ytsQYXZlu1YWRydBED1fEi5y6hTTugQVRXgZxezUgNwd9dal4YmOLrq-TfY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Aug 2021 03:39:52 -0400 (EDT)
Date:   Mon, 9 Aug 2021 09:39:50 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: linux-next: manual merge of the phy-next tree with the usb tree
Message-ID: <YRDbxuNwX/0y7+L/@kroah.com>
References: <20210809171023.4d387ed3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809171023.4d387ed3@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 09, 2021 at 05:10:23PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the phy-next tree got a conflict in:
> 
>   Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> 
> between commit:
> 
>   e516ac5d48fe ("dt-bindings: phy: qcom,qmp-usb3-dp: Add support for SC7280")
> 
> from the usb tree and commit:
> 
>   1a00d130596f ("dt-bindings: phy: qcom,qmp-usb3-dp: Add support for sc8180x")
> 
> from the phy-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> index 20199833f144,1d49cc3d4eae..000000000000
> --- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> @@@ -14,7 -14,7 +14,8 @@@ properties
>     compatible:
>       enum:
>         - qcom,sc7180-qmp-usb3-dp-phy
>  +      - qcom,sc7280-qmp-usb3-dp-phy
> +       - qcom,sc8180x-qmp-usb3-dp-phy
>         - qcom,sdm845-qmp-usb3-dp-phy
>         - qcom,sm8250-qmp-usb3-dp-phy
>     reg:



Looks good, thanks!
