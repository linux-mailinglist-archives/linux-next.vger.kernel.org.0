Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D58E7A5BE1
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 19:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbfIBRmU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 13:42:20 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:39881 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725988AbfIBRmT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Sep 2019 13:42:19 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 67523630;
        Mon,  2 Sep 2019 13:42:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 02 Sep 2019 13:42:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=BLQf3tO97Wi14x6M3GhiSwqq4qL
        qM/J8Uzc11uP9n8Q=; b=VSVLV5iV+BBpZ/84KJ7tAAlbdEvI5sZpIY1V2HYk0j8
        Vcr34J+NEvNcwX4ro8ZbYtnOCVXcmKM6lbpYZHWl0hk0sSV9hUjlpC1N+q6dcc/T
        kmYbCwu1KnVhvu0v3d2eU59TYOyO3K2LC/tSJhUAqLAvmh0LMEsH6txVMoT7EIrx
        n5gG4sp//GohCHRdyGbvDmBeBWAjbEZ+MqtYmDnu5O86VKPz9qMk5tKqDOq/d7Cr
        3POwhxBgNxvBPfW7UQYDUTNu3JlgKCyvAe/y1QucBEeF7sEPJnPTECzoeWtWIKQW
        mTxVVuUIgrA6yOSnslztlvkTG44V/JTnX24fQEXNclg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=BLQf3t
        O97Wi14x6M3GhiSwqq4qLqM/J8Uzc11uP9n8Q=; b=ozWWgYiWZDQ7UswvnEfEFg
        M//l0QJTTRy66pgE5yXgKnbwiaUN2isut/Tsd4hiEfWw3y44YfNfJYrBPHDJtXZ2
        ciHBXepE6lPSwjdv+zG0Y3TwUOtMsR2HDZxknLPyuWfnL1mM+BZBmo6+usafVUwi
        MXoYpwfZoPH3AC3Phosy4edwJ2sr5ijZ7FtDL5ZrqS9a0/mV/iOwYFCQQkAJJh8d
        NhwxsiekdCyWgtUgyHdgPBW7ni1JoBG1Tfw5vIdI70MbvIVThSdwBFVO/55TtXEY
        kAcTOk5yF36/QZ3qgDm9z2OUBE+oYZ2CRmxtbfL47zPh1UCUzNhAXNHRyfmG79xQ
        ==
X-ME-Sender: <xms:eFRtXT4gU8lTHmJ7EEhJjqkRxdLIM_xm5GLTD6PPMMa-qLSGjTKuRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejtddgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrd
    dutdejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhen
    ucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:eFRtXbWaDVbPGq2qMIjbQFpOY1v1qBi7Kj9C9A72-Zjn4Z-FZuCVDw>
    <xmx:eFRtXYJe2n4tPz5dXIfqdmnsCFZggnim5mxA2tGB8iO5LYh6Jv9abw>
    <xmx:eFRtXTT6oYZ1n77v7ISBhvdAa0MEgcHD52JqiAJG5qFwOUcuZUl7Jg>
    <xmx:elRtXXd2SqfiQSx6UJZFTla7j8U4mqsRSAed0_gKoeQmaCPqjG3_Cw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 334A4D60062;
        Mon,  2 Sep 2019 13:42:16 -0400 (EDT)
Date:   Mon, 2 Sep 2019 19:42:14 +0200
From:   Greg KH <greg@kroah.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Valdis Kletnieks <valdis.kletnieks@vt.edu>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>
Subject: Re: linux-next: Tree for Sep 2 (exfat)
Message-ID: <20190902174214.GA31445@kroah.com>
References: <20190902224310.208575dc@canb.auug.org.au>
 <cecc2af6-7ef6-29f6-569e-b591365e45ad@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cecc2af6-7ef6-29f6-569e-b591365e45ad@infradead.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 02, 2019 at 10:39:39AM -0700, Randy Dunlap wrote:
> On 9/2/19 5:43 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > News: I will only be doing 2 more releases before I leave for Kernel
> > Summit (there may be some reports on Thursday, but I doubt I will have
> > time to finish the full release) and then no more until Sept 30.
> > 
> > Changes since 20190830:
> > 
> 
> Hi,
> I am seeing lots of exfat build errors when CONFIG_BLOCK is not set/enabled.
> Maybe its Kconfig should also say
> 	depends on BLOCK
> ?

Yes it should, sorry, will go fix that up now...

greg k-h
