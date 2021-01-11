Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A43A2F0D1C
	for <lists+linux-next@lfdr.de>; Mon, 11 Jan 2021 08:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbhAKHLF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Jan 2021 02:11:05 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:58103 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725536AbhAKHLF (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Jan 2021 02:11:05 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 36A5A216E;
        Mon, 11 Jan 2021 02:09:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 11 Jan 2021 02:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=TNeA/yTsR0+oK6Ng70juGZgECWI
        ptNKcAMCaYK9UAPs=; b=iFpiPHr8Hb940k+DDO1pPdW6J1h5h46J7f/zTYHgKR2
        0rcuoMtP5ZR7OvmM9s+JMxOqUC+yYUDLdTmByHxe99k04NlnnyW6ZACIG5u6LdG0
        0bIUlY51h0AOLgWyt0rKXw52ZJZ3WIiUioDdvbF34HKxHGEUdL016yelSANWFT22
        ATEopLNjsMb/Ejy6t7A0jV6qjdFgVziGgR3NQpTG3atyNQmpz1/XrY9Tedum3Sqc
        3eG5ssNjHkIgH4K6lDEyHVHtZ/cNXx0/t93ljWAoi66Wz33jX5dqCfZyTbA3vVae
        e7DlNLaaM8wFY0OWLD0/Zohnh1ec22VyzPRS0ng0h4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TNeA/y
        TsR0+oK6Ng70juGZgECWIptNKcAMCaYK9UAPs=; b=oAG+Fbf3apGjAuFBiMOKK9
        mVUURGPWTU2Q9HnqH50IM/l8cC/+rmB5WtGV3oKtInkMeqTNaycK6Q5CyXV/LZnB
        lZ+imON4KvMTw1fDbReNalWTHE3xlS0/JdU83GCfNYW0xp+uwvZcSsiUWNxvVSsQ
        DpdIjlgkszDzfX4aKC+th4A1sS7mc2kIqetVgqcGTU7tkMkipDEFhJJY6aZEw/P3
        x6mQuOhNNWju39jK9NUBATZ0Qmp1lzhm35dmB9QAyTJb5mqUFXqB+mSKFdRVG+rm
        nyXMGfbHPK+XdPdW0SnuZUIbqjnETdg8I+XeW5vz7tGfqZ8KnfP/wqZa4PJH8MOg
        ==
X-ME-Sender: <xms:xvn7X6Lqw9mfo4lHENaUpC01zt7gsQvesXuE3uvOsYcXv4AfJpk5Tw>
    <xme:xvn7XyKPhs58qvW3ltC7EYOXcIDKjUFlIcbvsnl0aj2Td-v6iCC0edMzKxDHLfldq
    EMRirdHOwY0Kw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehtddguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeek
    fedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:xvn7X6vVmzqbYkQO-wK9IXI-53NUUe5a0p6rcVMMBJ5jUG89xONKbQ>
    <xmx:xvn7X_YH2X51oHxIJ6pUPEK8FUJRG3s1Gu5pv_u9dt5DkyVCTbtVFA>
    <xmx:xvn7XxYsm-bIIfEU4Y0qkS5JO_BZEMLGZeJmeuQCrlTFgVObK8lqoA>
    <xmx:xvn7Xwzc0DFUy66lmJmlTMjYm0Wbq1giAUSo4Y35yeNuH-qWh7_xAg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1EC8C240057;
        Mon, 11 Jan 2021 02:09:58 -0500 (EST)
Date:   Mon, 11 Jan 2021 08:11:10 +0100
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Message-ID: <X/v6Dtuc1KZLbv8p@kroah.com>
References: <20210106115014.28009565@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106115014.28009565@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jan 06, 2021 at 11:50:14AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/usb/dwc3/gadget.c
> 
> between commit:
> 
>   a1383b3537a7 ("usb: dwc3: gadget: Restart DWC3 gadget when enabling pullup")
> 
> from the usb.current tree and commit:
> 
>   77adb8bdf422 ("usb: dwc3: gadget: Allow runtime suspend if UDC unbinded")
> 
> from the usb tree.
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
> diff --cc drivers/usb/dwc3/gadget.c
> index 25f654b79e48,85736dd6673b..000000000000
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@@ -2146,8 -2212,7 +2213,9 @@@ static int dwc3_gadget_pullup(struct us
>   			dwc->ev_buf->lpos = (dwc->ev_buf->lpos + count) %
>   						dwc->ev_buf->length;
>   		}
> + 		dwc->connected = false;
>  +	} else {
>  +		__dwc3_gadget_start(dwc);
>   	}
>   
>   	ret = dwc3_gadget_run_stop(dwc, is_on, false);

Thanks for this, should now be fixed up.

greg k-h
