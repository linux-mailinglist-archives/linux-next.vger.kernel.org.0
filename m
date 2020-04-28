Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8EB1BBD3D
	for <lists+linux-next@lfdr.de>; Tue, 28 Apr 2020 14:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726544AbgD1MPt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 08:15:49 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:47905 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726361AbgD1MPt (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 08:15:49 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 735E05CF;
        Tue, 28 Apr 2020 08:15:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 28 Apr 2020 08:15:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=MKgnf5oZdY5J/2DP/ygrKEwrYrZ
        vo+dhsYgP9CuFCh4=; b=ND43hL9jU2568+y6FZM/24NvLgNaPSj76c17+op89yK
        bsC/nATK0W033RI/eAUVNtCyyX/X5fBlhX79hboHTWvEhHZg8s5MmnkfEKzNGasy
        bE3w7H3nKG287Z68F/3KoHxPKZBw+oN3QtlAlierfwVdQ3U/ReHNmWYyCbHSzkDt
        N2NSMz9ahxUABur+ObQm6xQFjnomdxQCSszzK+ih81hXmgq1AyuSMVNSLCpL3v6n
        TL2mH3IICEHk0VU46ktqsej6NDaQDcmHVRdDWNj3wRy/uILPu9hH0fUnJcHzHjtX
        NS8yRrkECK6Leq+DDgND6auPfcmT8+Lj7GhghHoGz5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MKgnf5
        oZdY5J/2DP/ygrKEwrYrZvo+dhsYgP9CuFCh4=; b=ZxF3R5eDt2q0cdlKU2bBEw
        6KB9qzsoPmspl2lEkuu7fd7btb+dGgTRtNTY+d1aA76PaD+8VCfGSMhNmyI+UWOH
        loAdYLtZjZLj1ww6Bm7V05QKkiF63dSlLnjRgufmSpK1jYUbDFLiYo5Sr2MeIvSD
        kJSyCCQSh3H/3coimpoM+SvVT6d+ShHkSbqerlxT1RRYJ4k/pVvgTddxphH8eURp
        yQMwKbLOltHzuOyR3hyFMAztIL3z9Ez10n+Jc1qi72/OyY5DFKhECFk+REWUxV7N
        2ELH0kzgbk5OrkmloI+Fddaasrb69q/h9BI+yr4oWhCkJaBmEbXQXiiaOupN5AHA
        ==
X-ME-Sender: <xms:cx6oXnfq7utcPguBKoQaf-Xj_kj54dHtxQ3tFX6OxhRCKCqZla6XEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedriedugdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledruddtje
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgv
    gheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:cx6oXo73uuZWVTsJD-7uGbeLL0ZV1F9sERedckweQjZMgyZvZCfJwg>
    <xmx:cx6oXs_8YcNFc50n4X_zNl8pZEZUiW7EuOZH4VO2XWhYo-P03po5Pw>
    <xmx:cx6oXiF2zCb_WqqItrYDSj-IRsYgIZxP-pwL26l6pV7lAcusvdYKQg>
    <xmx:dB6oXikNVwgN7Nt97UmAd4kp65DRyI69jZqwvtKlHMNojlbLOeJGUQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 183AF3280068;
        Tue, 28 Apr 2020 08:15:46 -0400 (EDT)
Date:   Tue, 28 Apr 2020 14:15:45 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Malcolm Priestley <tvboxspy@gmail.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Message-ID: <20200428121545.GA1234722@kroah.com>
References: <20200424151546.4dea83cb@canb.auug.org.au>
 <20200424064555.GA143960@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424064555.GA143960@kroah.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 24, 2020 at 08:45:55AM +0200, Greg KH wrote:
> On Fri, Apr 24, 2020 at 03:15:46PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the staging tree got a conflict in:
> > 
> >   drivers/staging/vt6656/main_usb.c
> > 
> > between commit:
> > 
> >   664ba5180234 ("staging: vt6656: Fix calling conditions of vnt_set_bss_mode")
> > 
> > from the staging.current tree and commit:
> > 
> >   463288b98190 ("staging: vt6556: vnt_rf_setpower convert to use ieee80211_channel.")
> > 
> > from the staging tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc drivers/staging/vt6656/main_usb.c
> > index 5f78cad3b647,3c76d3cb5bbe..000000000000
> > --- a/drivers/staging/vt6656/main_usb.c
> > +++ b/drivers/staging/vt6656/main_usb.c
> > @@@ -743,13 -740,8 +736,12 @@@ static void vnt_bss_info_changed(struc
> >   		vnt_update_pre_ed_threshold(priv, false);
> >   	}
> >   
> >  +	if (changed & (BSS_CHANGED_BASIC_RATES | BSS_CHANGED_ERP_PREAMBLE |
> >  +		       BSS_CHANGED_ERP_SLOT))
> >  +		vnt_set_bss_mode(priv);
> >  +
> > - 	if (changed & BSS_CHANGED_TXPOWER)
> > - 		vnt_rf_setpower(priv, priv->current_rate,
> > - 				conf->chandef.chan->hw_value);
> > + 	if (changed & (BSS_CHANGED_TXPOWER | BSS_CHANGED_BANDWIDTH))
> > + 		vnt_rf_setpower(priv, conf->chandef.chan);
> >   
> >   	if (changed & BSS_CHANGED_BEACON_ENABLED) {
> >   		dev_dbg(&priv->usb->dev,
> 
> 
> Thanks, that looks correct, I'll handle this when the staging.linus
> branch goes to Linus in a few days.

This should now all be resolved in my staging.next branch.

thanks,

greg k-h
