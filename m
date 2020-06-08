Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1E31F1DB6
	for <lists+linux-next@lfdr.de>; Mon,  8 Jun 2020 18:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387433AbgFHQqt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Jun 2020 12:46:49 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:38217 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730619AbgFHQqs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Jun 2020 12:46:48 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 5B165473;
        Mon,  8 Jun 2020 12:46:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 08 Jun 2020 12:46:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=7MM6PT90Zf/NZ8cBbYmH0ANDgmC
        tlB3VpTpbmqswllA=; b=T9PEGIm+BcDHXd/uyY3o6voYSUf2RcUanQfDiFvhEdN
        uFrjxMY0MPGRsZssid1zmqWPz97/UFjsO7MXEr2JpcjTF5If89rCAgcUQxZw2gqb
        7FeuPjjRgsODKqGuGZL5PHxTcrYB8d5/hUlr5Uu7CcdYpo4ffARAF+vYj2D/1CFK
        Nlab8tgGXBc4IWtYgtS/qNn9TqOl3l/KQts9rQ2oTb1Ia4locmFCsWoJn5ntAvss
        HjlaIf3Qg2FBRDNwn7drs06jYK6h6xWLFUuprFyRVzt9WYbxsdkad3BnTGM0SOOd
        2ikpaxsmN660OdsgMbYPEVwQtgI19k7zIBzBSeHC+VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7MM6PT
        90Zf/NZ8cBbYmH0ANDgmCtlB3VpTpbmqswllA=; b=mpPJmd/RsCdJFOsZ+wkl+M
        B6/zAdXQKar31vFzR4yShUL7MdKGJUblAXPfxS9oQIiOHHCrySFY5q4BWCMtsckG
        mnAHtaPh00kOIWQscImty7IWrbypvXyr6XeUiccQKyrxyi+c0olAxTM/F0O2xQR5
        mJJnHxtJP8FnxlmXA7pFOukRLkS2CgGFBg06M80NyLEJDjOHj37iwZj01Md2Ivks
        bOhRkrL4ojcHA1o8TPq+eXVodrpHtCoVBxNA802E93El6PZGhOAakSrQygYtxeEH
        sQxdAO4SkFal3hGbNi2zgoAOboh9FTWOmN6jlKgr7DXJyveCTkrkeWNqoEgAqPqQ
        ==
X-ME-Sender: <xms:dGveXo6OzrsTj1K-2eyNwY5RHataK7E2Ur7OgS5ApNomfPzYimXNTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudehvddggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrkeelrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:dGveXp5i5GE3KiR0C3u91K8aBDlYwsXgmKBkhiYvW8gnKkNkB2Va-w>
    <xmx:dGveXndJ4MPvnzGz_nOZPH7u5gRm2cdEl85ld3o0j19uWIDwCsFd7A>
    <xmx:dGveXtKdFxkwjKzja03-YCrpZ9vD8ieqN4DqF-8b1NftSbiKLFuqlQ>
    <xmx:dmveXmjRwT9Wv6Dlc6JnLPjlwBbUjef6w89gr-RPugRf6NRk_r6xqA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 772D73060FE7;
        Mon,  8 Jun 2020 12:46:44 -0400 (EDT)
Date:   Mon, 8 Jun 2020 18:46:42 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Rob Herring <robherring2@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: linux-next: manual merge of the tty tree with the devicetree tree
Message-ID: <20200608164642.GA426831@kroah.com>
References: <20200602154824.263bf711@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602154824.263bf711@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 02, 2020 at 03:48:24PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tty tree got a conflict in:
> 
>   Documentation/devicetree/bindings/serial/rs485.yaml
> 
> between commit:
> 
>   9f60a65bc5e6 ("dt-bindings: Clean-up schema indentation formatting")
> 
> from the devicetree tree and commit:
> 
>   01c38ecff8b1 ("dt-bindings: serial: Add binding for rs485 bus termination GPIO")
> 
> from the tty tree.
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
> diff --cc Documentation/devicetree/bindings/serial/rs485.yaml
> index 8141e4aad530,a9ad17864889..000000000000
> --- a/Documentation/devicetree/bindings/serial/rs485.yaml
> +++ b/Documentation/devicetree/bindings/serial/rs485.yaml
> @@@ -39,6 -41,9 +39,10 @@@ properties
>       $ref: /schemas/types.yaml#/definitions/flag
>   
>     rs485-rx-during-tx:
>  -   description: enables the receiving of data even while sending data.
>  -   $ref: /schemas/types.yaml#/definitions/flag
>  +    description: enables the receiving of data even while sending data.
>  +    $ref: /schemas/types.yaml#/definitions/flag
> + 
> +   rs485-term-gpios:
> +     description: GPIO pin to enable RS485 bus termination.
> +     maxItems: 1
>  +...

This should now be resolved in Linus's tree.

thanks,

greg k-h
