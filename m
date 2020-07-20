Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C73602258B4
	for <lists+linux-next@lfdr.de>; Mon, 20 Jul 2020 09:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgGTHhK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jul 2020 03:37:10 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:60071 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725845AbgGTHhK (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Jul 2020 03:37:10 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 405805C0183;
        Mon, 20 Jul 2020 03:37:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 20 Jul 2020 03:37:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=MKLvLDGLNUpV5OtsE1mVDonVjan
        muQAZ3rrXEtGWN0w=; b=Ox4wlVmlsodmv0Fy2PnA7a1mv8AxSC6j0JE8RlGphc6
        gfjwM2b0ZXU1nsh4kfT6mwd+deO/es+GpIdDJAUQBkjPth8TfbYzmaba0lquNtIV
        diQJXBbEoZstJs7yNmJ4Xd88yeK6iwl26wB5x6pNDLjUkEGpM01tUCmmCEr7bMBY
        2msvd0BKm3gAFDCTxktNF3kGkVBwYYwm8m+NcMWT2iEUh1BAw7BxFnc4DJa3kWrA
        m9OcKwiWCf/hlPP+3dqJEhxrLLffEKk1im1t1HliKhi2XPp4ulnX/fSp29lx8cDl
        frUFM0EgDJcp28gIQ5zKTh7lJMctuolh1ARvXk0s57w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=MKLvLD
        GLNUpV5OtsE1mVDonVjanmuQAZ3rrXEtGWN0w=; b=c9+b5BrW15xLc83Yrd/9N9
        JVm+N0X6CbglpFtZ/hFFu3gvqsERe2ml9xKXqFTytFhxGEhn4ffH85r+lCkL/R8a
        547NeDLhgG1c90mntyYpcYXtsmTDvTxLSUeCjewRbaBlq0Qmf/Lr6ydu2z3f3Nq/
        X8mNHnd6NCr7i81AIQvq3IQloCZIcq8LnfVNTfxhYpcqtQevvraTq81DjRnrJLGS
        LrruyiKWf7LHG1YdsShAFltWqDMzCIcSMd/T+AcmvhpIsjt7I1lU3UyPnUQE20Gi
        pDvh6qo2lHIW4IC+YW0Yhd5lKVKiEmh6liGLUJQJuxnsyQcKPDqU8J4pC1569quQ
        ==
X-ME-Sender: <xms:o0kVX-1jQOibDB9KRmWA8UyFysbU14aQ0K5SUWSSM9q8dpZJK4pjSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrgedvgdduudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrkeelrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:pEkVXxGWo6kmk95GLhjzeCZi4Wq8sMwNWqVWHc6gOpYl6gr9RVrlHQ>
    <xmx:pEkVX26DhkCc5ClpNvOLpLpKSKNw-tRAemXf3kItX-xHNTC_zxSw7w>
    <xmx:pEkVX_01piUFKvJRLN0i00CvKBJ2GuuwviHt-phV5DP9a3cs040aIQ>
    <xmx:pUkVX2SNI7mNd8k-W1tkJtzKF_qxto9BYTcFU4iWGBWsAbsmpNfeOw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 972DD328005D;
        Mon, 20 Jul 2020 03:37:07 -0400 (EDT)
Date:   Mon, 20 Jul 2020 09:37:19 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: Re: linux-next: manual merge of the staging tree with Linus' tree
Message-ID: <20200720073719.GA458916@kroah.com>
References: <20200720152522.5ccfc3ef@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200720152522.5ccfc3ef@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jul 20, 2020 at 03:25:22PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/iio/magnetometer/ak8974.c
> 
> between commit:
> 
>   0187294d227d ("iio: magnetometer: ak8974: Fix runtime PM imbalance on error")
> 
> from Linus' tree and commit:
> 
>   d3be83244c7d ("iio: remove explicit IIO device parent assignment")
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
> diff --cc drivers/iio/magnetometer/ak8974.c
> index 91c39352fba2,c2260c84f7f1..000000000000
> --- a/drivers/iio/magnetometer/ak8974.c
> +++ b/drivers/iio/magnetometer/ak8974.c
> @@@ -890,10 -884,14 +890,9 @@@ static int ak8974_probe(struct i2c_clie
>   	ret = ak8974_reset(ak8974);
>   	if (ret) {
>   		dev_err(&i2c->dev, "AK8974 reset failed\n");
>  -		goto power_off;
>  +		goto disable_pm;
>   	}
>   
> - 	indio_dev->dev.parent = &i2c->dev;
>  -	pm_runtime_set_autosuspend_delay(&i2c->dev,
>  -					 AK8974_AUTOSUSPEND_DELAY);
>  -	pm_runtime_use_autosuspend(&i2c->dev);
>  -	pm_runtime_put(&i2c->dev);
>  -
>   	switch (ak8974->variant) {
>   	case AK8974_WHOAMI_VALUE_AMI306:
>   	case AK8974_WHOAMI_VALUE_AMI305:



Looks good to me, thanks, I've now done this same thing to my tree as I
have merged with v5.8-rc6.

thanks,

greg k-h
