Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20CCC28489F
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 10:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgJFIbJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 04:31:09 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:41133 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725891AbgJFIbJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2020 04:31:09 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id D3F9E5C0079;
        Tue,  6 Oct 2020 04:31:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 06 Oct 2020 04:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=qsxax+C8iBK04xyZ9iWj06buPMs
        EH6/hry72ZrWsnwY=; b=ng78Q+czopgIvLnzQTVa7xdPDD/FMGFf9wd0tLa+6Dc
        Ik54/9p4s4NOkjLapIkphF4wSX1O1ASiD3yLVRwjE9dZky1dN9yy06kQhFmP4m0s
        2eDtDG8664fQr6oK2NSbllhIRpY8FlYsZEQFGKY4bXxo9zKjNhUCusXzdYo7TQgK
        p3nYh1riTUtbyh20EIL6TtrsC8X1/k3oiKsK2v47jIU6oy4zEsyrvejahJodk13a
        //JX7dpGf1cnv7YAbeeUO6Eh3ScOkv5Zg/pFjnjHApRbGMlNFpOxd7cAz8V7Cye2
        bLaR6nfpUG9FEg0bh9yttKlhDJRQ/sgSueTxF6QXiiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qsxax+
        C8iBK04xyZ9iWj06buPMsEH6/hry72ZrWsnwY=; b=UF5674m+kllrRfryd3nABa
        Bylc2Iw5IXnzfUIghNbO8aUd3rtChjhYnJSTRPnX7sKRvXkZ8D/47L7NiSjP+ym7
        3U/VhPLnZjyz0dIp6Qt2aSl3iagyyJZW6SevjYPLKAgGVvKFKhITRVtgs7683I1n
        WJsck/5UWax4+/+0L9eiMDStN9gwVZSnDN1SmzarwQj7p2vP1+4CrvzLM8a/psu3
        vZVLVyOIKHbtvnDG3p85jqeoqS5p+p+b+x5g16TrRoJ4B6XJAmwdM0jPSCD1lJbc
        /jQZ6ttGTsMDYWp5VU5WS0ook5XbfE+FLTgQ/v7CGjOjLh4rkbh3TwZ+/eA3QjHA
        ==
X-ME-Sender: <xms:Sit8X5JsGA5D8-xX0tLpeE4ROy7ObemAU32q89b320FdWJlWoWUEcA>
    <xme:Sit8X1KCf-xNlfv704zMyA9SoeXiWZVEWaCwV0CSzbNySoN3o768GB3qnrth94X5k
    VK-iSgEVZyK4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeeggddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:Sit8XxuBWHj824ha-gQxhY9ukLaU7SYiQvIJGhy0XeuqIypBQNe4MQ>
    <xmx:Sit8X6amdHXkW5veGaCjy4bDaGdsbg3t45lHkG1vbTT_i1_kM2Luvw>
    <xmx:Sit8Xwbdr6EIHnpZckIv-Gmlnc7FhyBAHiy86KdmSqrUKD-DpBNjzA>
    <xmx:Syt8X4Edn0bwICKKJIDOfkYJzpmLGHctdaNmQxhv9vME7A-osqsegA>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9BDC33280065;
        Tue,  6 Oct 2020 04:31:06 -0400 (EDT)
Date:   Tue, 6 Oct 2020 10:18:22 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Rob Herring <robherring2@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the staging tree with the devicetree
 tree
Message-ID: <20201006081822.GA11962@kroah.com>
References: <20201006184944.22985fd1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201006184944.22985fd1@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 06, 2020 at 06:49:44PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> 
> between commit:
> 
>   41fb845621ea ("dt-bindings: Another round of adding missing 'additionalProperties'")
> 
> from the devicetree tree and commit:
> 
>   3b17dd220432 ("dt-bindings: iio: adc: exynos-adc: require second interrupt with touch screen")
> 
> from the staging tree.
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
> diff --cc Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> index 16d76482b4ff,37d6591ff78c..000000000000
> --- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> @@@ -107,8 -109,15 +109,17 @@@ allOf
>             items:
>               - const: adc
>   
> +   - if:
> +       required:
> +         - has-touchscreen
> +     then:
> +       properties:
> +         interrupts:
> +           minItems: 2
> +           maxItems: 2
> + 
>  +additionalProperties: false
>  +
>   examples:
>     - |
>       adc: adc@12d10000 {

Looks good to me, thanks!

greg k-h
